#ifndef CSG_DEFS
#define CSG_DEFS

#if (defined(NDEBUG) || defined(GEOGRAM_PSM)) && !defined(GEOGRAM_PSM_DEBUG)
#undef GEO_DEBUG
#undef GEO_PARANOID
#else
#define GEO_DEBUG
#define GEO_PARANOID
#endif

// =============================== LINUX defines ===========================

#if defined(__ANDROID__)
#define GEO_OS_ANDROID
#endif

#if defined(__linux__)

#define GEO_OS_LINUX
#define GEO_OS_UNIX

#ifndef GEO_OS_ANDROID
#define GEO_OS_X11
#endif

#if defined(_OPENMP)
#  define GEO_OPENMP
#endif

#if defined(__INTEL_COMPILER)
#  define GEO_COMPILER_INTEL
#elif defined(__clang__)
#  define GEO_COMPILER_CLANG
#elif defined(__GNUC__)
#  define GEO_COMPILER_GCC
#else
#  error "Unsupported compiler"
#endif

// The following works on GCC and ICC
#if defined(__x86_64)
#  define GEO_ARCH_64
#  define GEO_PROCESSOR_X86
#else
#  define GEO_ARCH_32
#endif

// =============================== WINDOWS defines =========================

#elif defined(_WIN32) || defined(_WIN64)

#define GEO_OS_WINDOWS
#define GEO_PROCESSOR_X86

#if defined(_OPENMP)
#  define GEO_OPENMP
#endif

#if defined(_MSC_VER)
#  define GEO_COMPILER_MSVC
#elif defined(__MINGW32__) || defined(__MINGW64__)
#  define GEO_COMPILER_MINGW
#endif

#if defined(_WIN64)
#  define GEO_ARCH_64
#else
#  define GEO_ARCH_32
#endif

// =============================== APPLE defines ===========================

#elif defined(__APPLE__)

#define GEO_OS_APPLE
#define GEO_OS_UNIX

#if defined(_OPENMP)
#  define GEO_OPENMP
#endif

#if defined(__clang__)
#  define GEO_COMPILER_CLANG
#elif defined(__GNUC__)
#  define GEO_COMPILER_GCC
#else
#  error "Unsupported compiler"
#endif

#if defined(__x86_64) || defined(__ppc64__) || defined(__arm64__) || defined(__aarch64__) || (defined(__riscv) && __riscv_xlen == 64) || defined(__loongarch_lp64)
#  define GEO_ARCH_64
#else
#  define GEO_ARCH_32
#endif

// =============================== Emscripten defines  ======================

#elif defined(__EMSCRIPTEN__)

#define GEO_OS_UNIX
#define GEO_OS_LINUX
#define GEO_OS_EMSCRIPTEN
#define GEO_ARCH_64
#define GEO_COMPILER_EMSCRIPTEN
#define GEO_COMPILER_CLANG

// =============================== Unsupported =============================
#else
#error "Unsupported operating system"
#endif

#if defined(GEO_COMPILER_GCC)   ||              \
    defined(GEO_COMPILER_CLANG) ||              \
    defined(GEO_COMPILER_MINGW) ||              \
    defined(GEO_COMPILER_EMSCRIPTEN)
#define GEO_COMPILER_GCC_FAMILY
#endif

#ifdef DOXYGEN_ONLY
// Keep doxygen happy
#define GEO_OS_WINDOWS
#define GEO_OS_APPLE
#define GEO_OS_ANDROID
#define GEO_ARCH_32
#define GEO_COMPILER_INTEL
#define GEO_COMPILER_MSVC
#endif


#endif
