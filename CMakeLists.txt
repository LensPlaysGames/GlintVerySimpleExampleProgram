# Yes, you will need to change this to wherever you have LCC installed.
set(
  LCC_PATH
  "~/Programming/play/LensorCompilerCollection"
  CACHE FILEPATH
  "Path to the Lensor Compiler Collection (LCC) on your system.
If you don't have LCC yet, you can get it as part of the Glint Standard Library at https://github.com/LensPlaysGames/GlintStandardLibrary"
)

if(NOT EXISTS ${LCC_PATH})
  message(
    FATAL_ERROR
    "LCC_PATH does not exist; you probably need to set this CMake option to wherever you have LCC installed.
If you don't have LCC yet, you can get it as part of the Glint Standard Library at https://github.com/LensPlaysGames/GlintStandardLibrary
LCC_PATH: ${LCC_PATH}"
  )
endif()

list(APPEND CMAKE_MODULE_PATH "${LCC_PATH}/cmake")

cmake_minimum_required(VERSION 3.14)
project(GlintVerySimpleLexer LANGUAGES C Glint)

add_executable(
  lexer
  src/main.g
)

target_link_directories(
  lexer
  PUBLIC
  .
)
# libgstd.a is the Glint Standard Library.
# Clone and build it at https://github.com/LensPlaysGames/GlintStandardLibrary.
# Once built, just copy the library into this directory so it's easy to find.
target_link_libraries(
  lexer
  PUBLIC
  libgstd.a
)
