[build-menu]
FT_00_LB=_Compile
FT_00_CM=gcc -std=c2x -Wall -Wconversion -Werror -Wextra -Wpedantic -Wwrite-strings -O2 -c "%f"
FT_00_WD=
FT_01_LB=Const_ruire
FT_01_CM=gcc -std=c2x -Wall -Wconversion -Werror -Wextra -Wpedantic -Wwrite-strings -O2 -o "%e" "%f"
FT_01_WD=

EX_00_LB=_Exécuter
EX_00_CM="./%e"
EX_00_WD=

FT_02_LB=_Lint
FT_02_CM=
FT_02_WD=

[keywords]
primary=and and_eq _Alignas _Alignof _Atomic auto bitand bitor _Bool bool char char16_t char32_t cnd_t _Complex complex const constraint_handler_t deprecated div_t double double_t EOF enum errno_t extern fallthrough false fenv_t fexcept_t FILE float float_t _Generic _Imaginary imaginary imaxdiv_t inline int int8_t int16_t int32_t int64_t int_fast8_t int_fast16_t int_fast32_t int_fast64_t int_least8_t int_least16_t int_least32_t int_least64_t intmax_t intptr_t ldiv_t lldiv_t long max_align_t maybe_unused mbstate_t mxt_t nodiscard _Noreturn not not_eq NULL or or_eq ptrdiff_t register restrict rsize_t short sig_atomic_t signed size_t static struct thrd_start_t thrd_t _Thread_local tm true tss_dtor_t tss_t typedef uint8_t uint16_t uint32_t uint64_t uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t uint_least8_t uint_least16_t uint_least32_t uint_least64_t uintmax_t uintptr_t union unsigned void volatile wchar_t wctrans_t wctype_t WEOF wint_t xor xor_eq
secondary=asm break case compl continue default do else for goto if return sizeof _Static_assert switch while
