# Tesseract OCR
if(COMMAND pkg_check_modules)
  pkg_check_modules(Tesseract tesseract lept OpenCL)
endif()
if(NOT Tesseract_FOUND)
  find_path(Tesseract_INCLUDE_DIR tesseract/baseapi.h
    HINTS
    /usr/local/include)

  find_library(Tesseract_LIBRARY NAMES tesseract
    HINTS
    /usr/local/lib)

  find_library(Lept_LIBRARY NAMES lept
    HINTS
    /usr/local/lib)
    
  find_library(OpenCL_LIBRARY NAMES OpenCL
    HINTS
    /usr/local/lib)  

  if(Tesseract_INCLUDE_DIR AND Tesseract_LIBRARY AND Lept_LIBRARY)
    set(Tesseract_INCLUDE_DIRS ${Tesseract_INCLUDE_DIR})
    set(Tesseract_LIBRARIES ${Tesseract_LIBRARY} ${Lept_LIBRARY} ${OpenCL_LIBRARY})
    set(Tesseract_FOUND 1)
  endif()
endif()
