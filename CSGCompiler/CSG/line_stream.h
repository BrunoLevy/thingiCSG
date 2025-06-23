
#ifndef CSG_LINE_STREAM
#define CSG_LINE_STREAM

#include <CSG/common.h>
#include <cstring>
#include <stdio.h>

/**
 * \file geogram/basic/line_stream.h
 * \brief Utility class to read a file line per line and parsing
 *  fields from each line
 */

namespace CSG {

    /**
     * \brief Reads an ASCII file line per line
     * \details LineInput reads an ASCII file line by line and splits
     * the line into a list of white space separated fields that can be
     * accessed individually or converted to numeric values.
     *
     * Functions field_as_int() and field_as_double() throw exceptions when
     * they cannot convert a field to a integer or floating point value, so
     * it is safe to wrap the LineNumber usage in a try / catch block as
     * follows:
     *
     * \code
     * try {
     *     LineInput in(filename);
     *     while( !in.eof() && in.get_line() ) {
     *         in.get_fields();
     *         double d = in.field_as_double(2);
     *     }
     * }
     * catch(const std::logic_error& ex) {
     *     std::cerr << "Got an error: " << ex.what() << std::endl;
     * }
     * \endcode
     */
    class CSG_API LineInput {
    public:
    /**
     * \brief Creates a new line reader from a file
     * \details This open the file \p filename for reading and prepares to
     * read it line by line. If the file could not be opened, OK() will
     * return false;
     * \param[in] filename the name of the file to read
     */
    LineInput(const std::string& filename);

    /**
     * \brief Destroys the line reader
     * \details This closes the current input file.
     */
    ~LineInput();

    /**
     * \brief Checks if the line reader is ready to read.
     */
    bool OK() const {
        return ok_;
    }

    /**
     * \brief Checks if line reader has reached the end of the input stream
     * \retval true if the stream is at end
     * \retval false otherwise
     */
    bool eof() const {
        return feof(F_) ? true : false;
    }

    /**
     * \brief Reads a new line
     * \details Reads a new line from the input stream. Function
     * get_fields() must be called if you need to access to individual
     * fields in the line with field() and its typed variants.
     * \retval true if a line could be read
     * \retval false otherwise.
     */
    bool get_line();

    /**
     * \brief Gets the number of fields in the current line
     * \details Function get_fields() must be called once after get_line()
     * before calling this function, otherwise the result is undefined.
     * \return the number of fields in the current line
     */
    index_t nb_fields() const {
        return index_t(field_.size());
    }

    /**
     * \brief Returns the current line number
     * \details If no line has been read so far, line_number() returns 0.
     */
    size_t line_number() const {
        return line_num_;
    }

    /**
     * \brief Gets a line field as a modifiable string
     * \details The function returns the field at index \p i. Function
     * get_fields() must be called once after get_line() before calling
     * this function, otherwise the result is undefined.
     * \param[in] i the index of the field
     * \return the modifiable pointer to field string at index \p i
     */
    char* field(index_t i) {
        csg_assert(i < nb_fields());
        return field_[i];
    }

    /**
     * \brief Gets a line field as a non-modifiable string
     * \details The function returns the field at index \p i. Function
     * get_fields() must be called once after get_line() before calling
     * this function, otherwise the result is undefined.
     * \param[in] i the index of the field
     * \return the const pointer to field string at index \p i
     */
    const char* field(index_t i) const {
        csg_assert(i < nb_fields());
        return field_[i];
    }

    /**
     * \brief Gets a line field as an integer.
     * \details The function returns the field at index \p i converted to
     * an integer. Function get_fields() must be called once after
     * get_line() before calling this function, otherwise the result is
     * undefined.
     * \param[in] i the index of the field
     * \return the integer value of the field at index \p i
     * \exception std::logic_error if the field cannot be converted to an
     * integer value
     */
    int field_as_int(index_t i) const {
        int result = 0;
        if(!String::from_string(field(i), result)) {
            conversion_error(i, "integer");
        }
        return result;
    }

    /**
     * \brief Gets a line field as an unsigned integer.
     * \details The function returns the field at index \p i converted to
     * an unsigned integer. Function get_fields() must be called once after
     * get_line() before calling this function, otherwise the result is
     * undefined.
     * \param[in] i the index of the field
     * \return the unsigned integer value of the field at index \p i
     * \exception std::logic_error if the field cannot be converted to an
     * unsigned integer value
     */
    index_t field_as_uint(index_t i) const {
        index_t result = 0;
        if(!String::from_string(field(i), result)) {
            conversion_error(i, "unsigned integer");
        }
        return result;
    }

    /**
     * \brief Gets a line field as a double.
     * \details The function returns the field at index \p i converted to
     * a double. Function get_fields() must be called once after
     * get_line() before calling this function, otherwise the result is
     * undefined.
     * \param[in] i the index of the field
     * \return the floating point value of the field at index \p i
     * \exception std::logic_error if the field cannot be converted to a
     * floating point value
     */
    double field_as_double(index_t i) const {
        double result = 0;
        if(!String::from_string(field(i), result)) {
            conversion_error(i, "floating point");
        }
        return result;
    }

    /**
     * \brief Compares a field with a string.
     * \details The function compares the field at index \p i with string
     * \p s and returns \c true if they are equal. Function get_fields()
     * must be called once after get_line() before calling this function,
     * otherwise the result is undefined.
     * \param[in] i the index of the field
     * \param[in] s the string to compare the field to
     * \retval true if field at index \p i equals string \p s
     * \retval false otherwise
     */
    bool field_matches(index_t i, const char* s) const {
        return strcmp(field(i), s) == 0;
    }

    /**
     * \brief Splits the current line into fields.
     * \details The function uses \p separators to split the
     * current line into individual fields that can be accessed
     * by field() and its typed variants.
     * \param[in] separators a string that contains all
     *  the characters considered as separators.
     * \see field()
     */
    void get_fields(const char* separators = " \t\r\n");

    /**
     * \brief Gets the current line.
     * \details If get_fields() was called, then an end-of-string
     *  marker '\0' is present at the end of the first field.
     * \return a const pointer to the internal buffer that stores
     *  the current line
     */
    const char* current_line() const {
        return line_;
    }

    private:
    /**
     * \brief Throws a conversion error.
     * \details This function is called by field_as_int() and
     * field_as_double() when the field \p index cannot be converted to
     * the desired type \p type.
     * \param[in] index index of the erroneous field.
     * \param[in] type the expected type.
     */
    [[noreturn]] void conversion_error(
        index_t index, const char* type
    ) const;

    /**
     * \brief Defines the maximum size of a line
     */
    static constexpr index_t MAX_LINE_LEN = 65535;

    FILE* F_;
    std::string file_name_;
    size_t line_num_;
    char line_[MAX_LINE_LEN];
    std::vector<char*> field_;
    bool ok_;
    };
}

#endif
