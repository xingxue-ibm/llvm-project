set(LLVM_LINK_COMPONENTS
  AllTargetsAsmParsers
  AllTargetsDescs
  AllTargetsInfos
  FrontendOpenMP
  support
  )

# Needed by LLVM's CMake checks because this file defines multiple targets.
set(LLVM_OPTIONAL_SOURCES ClangTidyMain.cpp ClangTidyToolMain.cpp)

add_clang_library(clangTidyMain
  ClangTidyMain.cpp

  LINK_LIBS
  clangTidy
  ${ALL_CLANG_TIDY_CHECKS}

  DEPENDS
  omp_gen
  ClangDriverOptions
  )

clang_target_link_libraries(clangTidyMain
  PRIVATE
  clangAST
  clangASTMatchers
  clangBasic
  clangTooling
  clangToolingCore
  )

# Support plugins.
if(CLANG_PLUGIN_SUPPORT)
  set(support_plugins SUPPORT_PLUGINS)
  set(export_symbols EXPORT_SYMBOLS_FOR_PLUGINS)
endif()

add_clang_tool(clang-tidy
  ClangTidyToolMain.cpp

  DEPENDS
  clang-resource-headers
  ${support_plugins}
  ${export_symbols}
  )
clang_target_link_libraries(clang-tidy
  PRIVATE
  clangAST
  clangASTMatchers
  clangBasic
  clangTooling
  clangToolingCore
  )
target_link_libraries(clang-tidy
  PRIVATE
  clangTidy
  clangTidyMain
  ${ALL_CLANG_TIDY_CHECKS}
  )

install(PROGRAMS clang-tidy-diff.py
  DESTINATION "${CMAKE_INSTALL_DATADIR}/clang"
  COMPONENT clang-tidy)
install(PROGRAMS run-clang-tidy.py
  DESTINATION "${CMAKE_INSTALL_BINDIR}"
  COMPONENT clang-tidy
  RENAME run-clang-tidy)
