
#include <CSG/line_stream.h>
#include <ctype.h>

namespace CSG {

    LineInput::LineInput(const std::string& filename) :
        file_name_(filename),
        line_num_(0)
    {
        F_ = fopen(filename.c_str(), "r");
        ok_ = (F_ != nullptr);
        line_[0] = '\0';
    }

    LineInput::~LineInput() {
        if(F_ != nullptr) {
            fclose(F_);
            F_ = nullptr;
        }
    }

    bool LineInput::get_line() {
        if(F_ == nullptr) {
            return false;
        }
        line_[0] = '\0';
        // Skip the empty lines
        while(!isprint(line_[0]) && line_[0] != '\t') {
            ++line_num_;
            if(fgets(line_, MAX_LINE_LEN, F_) == nullptr) {
                return false;
            }
        }
        // If the line ends with a backslash, append
        // the next line to the current line.
        bool check_multiline = true;
        size_t total_length = MAX_LINE_LEN;
        char* ptr = line_;
        while(check_multiline) {
            size_t L = strlen(ptr);
            total_length -= size_t(L);
            ptr = ptr + L - 2;
            if(*ptr == '\\' && total_length > 0) {
                *ptr = ' ';
                ptr++;
                if(fgets(ptr, int(total_length), F_) == nullptr) {
                    return false;
                }
                ++line_num_;
            } else {
                check_multiline = false;
            }
        }
        if(total_length < 0) {
            Logger::err("LineInput")
                << "MultiLine longer than "
                << MAX_LINE_LEN << " bytes" << std::endl;
        }
        return true;
    }

#if 1
#ifdef GEO_OS_WINDOWS
#define safe_strtok strtok_s
#else
#define safe_strtok strtok_r
#endif

    void LineInput::get_fields(const char* separators) {
        field_.resize(0);
        char* context = nullptr;
        char* tok = safe_strtok(line_, separators, &context);
        while(tok != nullptr) {
            field_.push_back(tok);
            tok = safe_strtok(nullptr, separators, &context);
        }
    }

#else
    void LineInput::get_fields(const char* separators) {
        field_.resize(0);
        char* tok = strtok(line_, separators);
        while(tok != nullptr) {
            field_.push_back(tok);
            tok = strtok(nullptr, separators);
        }
    }

#endif

    void LineInput::conversion_error(index_t index, const char* type) const {
        std::ostringstream out;
        out << "Line " << line_num_
            << ": field #" << index
            << " is not a valid " << type << " value: " << field(index);
        throw std::logic_error(out.str());
    }
}
