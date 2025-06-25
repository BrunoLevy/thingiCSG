#ifndef CSG_B_STREAM
#define CSG_B_STREAM

#include <CSG/common.h>

#include <iostream>
#include <fstream>
#include <string>
#include <cstdint>

/**
 * \file CSG/b_stream.h
 * \brief Provides classes for reading and writing binary data
 */

namespace CSG {

    namespace Numeric {
        /**
         * \brief Limits helper class that extends std::numeric_limits
         * \details LimitsHelper extends std::numeric_limits to provide
         * additional information about numeric types \p T.
         * Template parameter \p is_numeric receives the value \c
         * std::numeric_limits<T>::is_specialized which is \c true for all
         * numeric types and \c false for the other types. The template is
         * specialized for \p is_numeric == \c true to define additional
         * information. For non-numeric types, the default template does not
         * define anything.
         * \tparam T an object type
         * \tparam is_numeric is true if type \p T is a numeric type, false
         * otherwise.
         */
        template <class T, bool is_numeric>
        struct LimitsHelper : std::numeric_limits<T> {
        };

        /**
         * \brief Specialization of LimitsHelper for numeric types
         * \details This specialization defines the following values:
         * - size - the size of the numeric type in bytes
         * - numbits - the size of the numeric type in bits
         * \tparam T a numeric type
         */
        template <class T>
        struct LimitsHelper<T, true> : std::numeric_limits<T> {
            /** The size of the numeric type in bytes */
            static const size_t size = sizeof(T);
            /** The size of the numeric type in bits */
            static const size_t numbits = 8 * sizeof(T);
        };

        /**
         * \brief Extends std::numeric_limits with additional information
         * \details Limits provides additional information about numeric types
         * that are not available in std::numeric_limits:
         * - size: the size of the numeric type in bytes
         * - numbits: the size of the numeric type in bits
         * These types are defined in the helper class LimitsHelper for
         * numeric types only. They are not defined for non-numeric types.
         */
        template <class T>
        struct Limits :
            LimitsHelper<T, std::numeric_limits<T>::is_specialized> {
        };
    }


    /**
     * \brief Binary stream base class
     * \details
     * A characteristic of processors named endian corresponds to the
     * way they store numbers. A little endian processor stores
     * less significant bytes first, and a big endian processor
     * stores most significant bytes first.
     *
     * Most Unix machines are big endian, except those having
     * a DEC Alpha processor. Intel processors are little endian.
     * This causes portability problems for binary files to be
     * exchanged between machines of the two types. The classes
     * BinaryInputStream and BinaryOutputStream make it possible
     * to deal with this problem.
     *
     * We have not used XDR because XDR assumes that the external
     * format is always big endian, which would have prevented us
     * to read files from PC softwares (such as 3DS binary files).
     */
    class CSG_API BinaryStream {
    public:
    /** Constant to use to specify little-endian streams */
    static const int CSG_LITTLE_ENDIAN = 0;

    /** Constant to use to specify big-endian streams */
    static const int CSG_BIG_ENDIAN = 1;

    /**
     * \brief Sets the stream endianness
     * \details This affects how the integer and floating point values
     * will be stored in the stream.
     * \param[in] stream_endian the endianness of the stream:
     * - CSG_LITTLE_ENDIAN makes the stream little-endian
     * - CSG_BIG_ENDIAN makes the stream big-endian
     */
    void set_stream_endian(int stream_endian);

    /**
     * \brief Gets the stream endianness
     * \return \c CSG_LITTLE_ENDIAN if the stream is little-endian,
     * \c CSG_BIG_ENDIAN if the stream is big-endian.
     */
    inline int stream_endian() const {
        return stream_endian_;
    }

    /**
     * \brief Gets the current architecture's endianness
     * \return \c CSG_LITTLE_ENDIAN if the architecture is little-endian,
     * \c CSG_BIG_ENDIAN if the architecture is big-endian.
     */
    inline int machine_endian() const {
        return machine_endian_;
    }

    /**
     * \brief Checks support for record markers
     * \see set_has_record_markers().
     */
    inline bool has_record_markers() const {
        return has_record_markers_;
    }

    /**
     * \brief Enables/disables support for record markers
     * \details
     * Some FORTRAN files have their records surrounded by two
     * integers and some not. This function enables BinaryStream
     * to read such FORTRAN files. Default value is true.
     */
    inline void set_has_record_markers(bool b) {
        has_record_markers_ = b;
    }

    protected:
    /**
     * \brief Base constructor
     * \details This constructor initializes the base class common to
     * BinaryInputStream and BinaryOutputStream. It sets the stream
     * endianness and detects the current architecture's endianness
     * \param[in] stream_endian the endianness of the stream:
     * - CSG_LITTLE_ENDIAN makes the stream little-endian
     * - CSG_BIG_ENDIAN makes the stream big-endian (the default)
     */
    BinaryStream(int stream_endian = CSG_BIG_ENDIAN);

    /**
     * \brief Detects the current architecture's endianness.
     */
    void detect_machine_endian();

    /**
     * \brief Size selector
     * \details This is used to overload low-level read() and write()
     * functions according to the size of the elements to read/write
     */
    template <size_t N>
    struct ItemSize {
    };

    protected:
    /** True if stream needs swapping */
    bool swapped_;

    private:
    int machine_endian_;
    int stream_endian_;
    bool has_record_markers_;
    };

    /************************************************************************/

    /**
     * \brief Binary input file
     * \details
     * This class enables binary files to be read, while taking
     * into account Endian problems (see BinaryStream).
     */
    class CSG_API BinaryInputStream : public BinaryStream {
    public:
        /**
         * \brief Creates a new binary input stream
         * \details This prepares the stream to read data from file \p
         * file_name. Data is supposed to be stored with the given endianness
         * \p stream_endian.
         * \param[in] file_name path to the file to read
         * \param[in] stream_endian the endianness of the stream:
         * - CSG_LITTLE_ENDIAN makes the stream little-endian
         * - CSG_BIG_ENDIAN makes the stream big-endian (the default)
         */
        BinaryInputStream(
            const std::string& file_name, int stream_endian = CSG_BIG_ENDIAN
        );

        /**
         * \brief Creates a new binary input stream
         * \details This prepares the BinaryInputStream to read data from
         * std::istream \p input. Data will be stored with the given endianness
         * \p stream_endian.
         * \param[in] input the input stream to read from
         * \param[in] stream_endian the endianness of the stream:
         * - CSG_LITTLE_ENDIAN makes the stream little-endian
         * - CSG_BIG_ENDIAN makes the stream big-endian (the default)
         */
        BinaryInputStream(
            std::istream& input, int stream_endian = CSG_BIG_ENDIAN
        );

        /**
         * \brief Deletes the input stream
         * \details This closes any associated std::istream and closes any
         * associated file.
         */
        ~BinaryInputStream();

        /**
         * \brief Gets the status of the stream
         * \retval true if the stream is valid
         * \retval false if an error occurred
         */
        bool OK() const;

        /**
         * \brief Checks if there are more bytes to read
         * \retval true if the stream is not at end-of-file
         * \retval false otherwise
         */
        bool more() const;

        /**
         * \brief Reads a single element
         * \details Reads an element of type \p T from the stream and stores
         * it in \p x. Type \p T must be a numeric type, other types are not
         * supported.
         * \param[in] x a reference to a element of type T
         * \tparam T the type of the element to read. This must be a numeric
         * type
         * \return a reference to this stream
         */
        template <class T>
            inline BinaryInputStream& operator>> (T& x) {
            return read(
                (char*) &x, 1,
                ItemSize<Numeric::Limits<T>::size>()
            );
        }

        /**
         * \brief Reads opaque data
         * \details Reads \p n bytes from the stream and stores them in the
         * byte array \p ptr. Bytes read from the stream are stored without
         * conversion in the array \p ptr.
         * \param[in] ptr an array of bytes
         * \param[in] n number of bytes to read
         * \return a reference to this stream
         */
        inline BinaryInputStream& read_opaque_data(void* ptr, size_t n) {
            input_->read((char*) ptr, (std::streamsize) n);
            return *this;
        }

        /**
         * \brief Reads opaque data
         * \details Reads \p n elements of \p size bytes from the stream and
         * stores them in the byte array \p ptr. Bytes read from the stream
         * are stored without conversion in the array \p ptr.
         * \param[in] ptr an array of bytes
         * \param[in] size size of the elements to read
         * \param[in] n number of elements to read
         * \return a reference to this stream
         */
        inline BinaryInputStream& read_opaque_data(
            void* ptr, size_t size, size_t n
        ) {
            return read_opaque_data(ptr, size * n);
        }

        /**
         * \brief Reads an array of elements
         * \details Reads \p n elements of type \p T from the stream and
         * stores them in array pointed to by \p data. The array must be large
         * enough to receive \p n elements. Type \p T must be a numeric type,
         * other types are not supported.
         * \param[in] data an array of at least \p n elements of type \p T.
         * \param[in] n number of items to read
         * \tparam T the type of the elements to read
         * \return a reference to this stream
         */
        template <class T>
            inline BinaryInputStream& read_array(T* data, size_t n) {
            return read(
                (char*) data, n,
                ItemSize<Numeric::Limits<T>::size>()
            );
        }

        /**
         * \brief Starts reading a data record
         * \details
         * FORTRAN data files are structured into records,
         * bounded by two integers indicating the size of
         * the record. These two functions enable these integers
         * to be read, and to use them as a validity check. If
         * they differ, subsequent calls to OK() return false.
         * Note that if set_had_record_markers() has been called
         * with false, the records are supposed to be continuously
         * written in the file (without markers).
         */
        void begin_record();

        /**
         * \brief Stops reading a data record
         * \details This verifies that the record data is properly enclosed
         * with the same marker, that is: the marker at the current stream
         * position matches the marker found at the beginning of the record
         * (see begin_record()).
         */
        void end_record();

        /**
         * \brief Reads an array of elements in a record
         * \details Reads \p n elements of type \p T enclosed in a data record
         * from the stream and stores them in array pointed to by \p data. The
         * array must be large enough to receive \p n elements. Type \p T must
         * be a numeric type, other types are not supported.
         * \param[in] data an array of at least \p n elements of type \p T.
         * \param[in] n number of items to read
         * \return a reference to this stream
         */
        template <class T>
            inline BinaryInputStream& read_record(T* data, size_t n) {
            begin_record();
            read(
                (char*) data, n,
                ItemSize<Numeric::Limits<T>::size>()
            );
            end_record();
            return *this;
        }

        /**
         * \brief Gets the position in the input sequence
         * \return The absolute position in the stream
         */
        std::streamoff tell() const {
            return input_->tellg();
        }

        /**
         * \brief Sets the position in input sequence
         * \param[in] pos the new absolute position in the stream
         */
        void seek(std::streamoff pos) {
            input_->seekg(pos);
        }

        /**
         * \brief Sets the position in input sequence
         * \param[in] off offset value, relative to the \p dir  parameter
         * \param[in] dir the direction in which to seek:
         * - ios_base::beg - beginning of the stream
         * - ios_base::cur - current position in the stream
         * - ios_base::end - end of the stream
         */
        void seek(std::streamoff off, std::ios_base::seekdir dir) {
            input_->seekg(off, dir);
        }

    protected:
        /**
         * \brief Reads an array of elements of size 1
         * \param[in] data an array of elements of size 1
         * \param[in] n the number of elements to read
         * \return a reference to this stream
         */
        inline BinaryInputStream& read(char* data, size_t n, ItemSize<1>) {
            return read_opaque_data(data, n);
        }

        /**
         * \brief Reads an array of elements of size 2
         * \param[in] data an array of elements of size 2
         * \param[in] n the number of elements to read
         * \return a reference to this stream
         */
        BinaryInputStream& read(char* data, size_t n, ItemSize<2>);

        /**
         * \brief Reads an array of elements of size 4
         * \param[in] data an array of elements of size 4
         * \param[in] n the number of elements to read
         * \return a reference to this stream
         */
        BinaryInputStream& read(char* data, size_t n, ItemSize<4>);

        /**
         * \brief Reads an array of elements of size 8
         * \param[in] data an array of elements of size 8
         * \param[in] n the number of elements to read
         * \return a reference to this stream
         */
        BinaryInputStream& read(char* data, size_t n, ItemSize<8>);

    private:
        std::istream* input_;
        bool owns_input_;
        /** No pb encountered when reading the last record */
        bool record_OK_;
        /** Sentry integer preceding the current record */
        uint32_t count1_;
        /** Sentry integer following the current record */
        uint32_t count2_;
        /** Number of read records */
        int32_t record_count_;
    };

    /************************************************************************/

    /**
     * \brief Binary output file
     * \details
     * Enables binary files to be written, while taking
     * into account endian problems.
     */
    class CSG_API BinaryOutputStream : public BinaryStream {
    public:
        /**
         * \brief Creates a new binary output stream
         * \details This prepares the stream to write data to file \p
         * file_name. Data will be stored with the given endianness
         * \p stream_endian.
         * \param[in] file_name path to the file to write
         * \param[in] stream_endian the endianness of the stream:
         * - CSG_LITTLE_ENDIAN makes the stream little-endian
         * - CSG_BIG_ENDIAN makes the stream big-endian (the default)
         */
        BinaryOutputStream(
            const std::string& file_name, int stream_endian = CSG_BIG_ENDIAN
        );

        /**
         * \brief Creates a new binary output stream
         * \details This prepares the BinaryOutputStream to write data to
         * std::ostream \p output. Data will be stored with the given
         * endianness \p stream_endian.
         * \param[in] output the output stream to write to
         * \param[in] stream_endian the endianness of the stream:
         * - CSG_LITTLE_ENDIAN makes the stream little-endian
         * - CSG_BIG_ENDIAN makes the stream big-endian (the default)
         */
        BinaryOutputStream(
            std::ostream& output, int stream_endian = CSG_BIG_ENDIAN
        );

        /**
         * \brief Deletes the output stream
         * \details This closes any associated std::ostream and closes any
         * associated file.
         */
        ~BinaryOutputStream();

        /**
         * \brief Gets the status of the stream
         * \retval true if the stream is valid
         * \retval false if an error occurred
         */
        bool OK() const;

        /**
         * \brief Writes a single element
         * \param[in] x an element of type \p T which must be a numeric type,
         * other types are not supported.
         * \tparam T the type of the elements to read.
         * \return a reference to this stream
         */
        template <class T>
            inline BinaryOutputStream& operator<< (T x) {
            return write(
                (const char*) &x, 1,
                ItemSize<Numeric::Limits<T>::size>()
            );
        }

        /**
         * \brief Writes opaque data
         * \details Writes \p size bytes from the byte array \p ptr.
         * \param[in] ptr an array of bytes
         * \param[in] size number of bytes to write
         * \return a reference to this stream
         */
        inline BinaryOutputStream& write_opaque_data(
            const void* ptr, size_t size
        ) {
            output_->write((const char*) ptr, (std::streamsize) size);
            count_ += size;
            return *this;
        }

        /**
         * \brief Writes opaque data
         * \details Writes \p n elements of \p size bytes from the byte array
         * \p ptr.
         * \param[in] ptr an array of bytes
         * \param[in] size size of the elements to write
         * \param[in] n number of elements to write
         * \return a reference to this stream
         */
        inline BinaryOutputStream& write_opaque_data(
            const void* ptr, size_t size, size_t n
        ) {
            return write_opaque_data(ptr, size * n);
        }

        /**
         * \brief Writes an array of elements
         * \details Writes the first \p n elements of the array pointed
         * to by \p data to the stream. Elements are of type \p T which must
         * be a numeric type, other types are not supported.
         * \param[in] data an array of at least \p n elements of type \p T.
         * \param[in] n number of elements to write
         * \tparam T the type of the elements to read.
         * \return a reference to this stream
         */
        template <class T>
            inline BinaryOutputStream& write_array(const T* data, size_t n) {
            return write(
                (const char*) data, n,
                ItemSize<Numeric::Limits<T>::size>()
            );
        }

        /**
         * \brief Starts writing a data record
         * \details
         * FORTRAN data files are structured into records,
         * bounded by two integers indicating the size of
         * the record. These two functions enable these integers
         * to be read, and to use them as a validity check. If
         * they differ, subsequent calls to OK() return false.
         * Note that if set_had_record_markers() has been called
         * with false, the records are supposed to be continuously
         * written in the file (without markers).
         */
        void begin_record();

        /**
         * \brief Stops writing a data record
         * \details This encloses the data written between begin_record() and
         * end_record() with a marker equal to the current position in the
         * output stream.
         */
        void end_record();

        /**
         * \brief Writes an array of elements in a record
         * \details Writes a record containing the first \p n elements
         * of the array pointed to by \p data to the stream. Elements are of
         * type \p T which must be a numeric type, other types are not
         * supported.
         * \param[in] data an array of at least \p n elements of type \p T.
         * \param[in] n number of items to write
         * \tparam T the type of the elements to read.
         * \return a reference to this stream
         */
        template <class T>
            BinaryOutputStream& write_record(const T* data, size_t n) {
            begin_record();
            write(
                (const char*) data, n,
                ItemSize<Numeric::Limits<T>::size>()
            );
            end_record();
            return *this;
        }

    protected:
        /**
         * \brief Writes an array of elements of size 1
         * \param[in] data an array of elements of size 1
         * \param[in] n the number of elements to write
         * \return a reference to this stream
         */
        BinaryOutputStream& write(const char* data, size_t n, ItemSize<1>) {
            return write_opaque_data(data, n);
        }

        /**
         * \brief Writes an array of elements of size 2
         * \param[in] data an array of elements of size 2
         * \param[in] n the number of elements to write
         * \return a reference to this stream
         */
        BinaryOutputStream& write(const char* data, size_t n, ItemSize<2>);

        /**
         * \brief Writes an array of elements of size 4
         * \param[in] data an array of elements of size 4
         * \param[in] n the number of elements to write
         * \return a reference to this stream
         */
        BinaryOutputStream& write(const char* data, size_t n, ItemSize<4>);

        /**
         * \brief Writes an array of elements of size 8
         * \param[in] data an array of elements of size 8
         * \param[in] n the number of elements to write
         * \return a reference to this stream
         */
        BinaryOutputStream& write(const char* data, size_t n, ItemSize<8>);

    private:
        /**
         * \brief Writes a record marker
         * \param[in] value the value of the marker
         */
        void write_marker(uint32_t value);

        std::ostream* output_;
        bool owns_output_;
        /** Size of the current record */
        size_t count_;
        /**
         * Position of the current record relative to the
         * beginning of the file. This is used to write count_
         * at that location when end_record() is called.
         */
        std::streamoff pos_;
    };

    /************************************************************************/
}

#endif
