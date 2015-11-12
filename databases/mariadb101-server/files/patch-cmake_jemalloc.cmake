--- cmake/jemalloc.cmake.orig	2015-10-15 17:43:36.000000000 +0200
+++ cmake/jemalloc.cmake	2015-10-20 13:21:41.875704694 +0200
@@ -14,7 +14,7 @@ ENDMACRO()
 MACRO(JEMALLOC_TRY_DYNAMIC)
   SET(libname jemalloc)
   SET(what system)
-  CHECK_LIBRARY_EXISTS(${libname} malloc_stats_print "" HAVE_DYNAMIC_JEMALLOC)
+  CHECK_LIBRARY_EXISTS(c malloc_stats_print "" HAVE_DYNAMIC_JEMALLOC)
 ENDMACRO()
 
 MACRO (CHECK_JEMALLOC)
@@ -37,8 +37,8 @@ MACRO (CHECK_JEMALLOC)
 
   IF (libname)
     IF (HAVE_DYNAMIC_JEMALLOC OR HAVE_STATIC_JEMALLOC)
-      SET(LIBJEMALLOC ${libname})
-      SET(MALLOC_LIBRARY "${what} jemalloc")
+      SET(LIBJEMALLOC c)
+      SET(MALLOC_LIBRARY "system jemalloc")
     ELSEIF (NOT WITH_JEMALLOC STREQUAL "auto")
       MESSAGE(FATAL_ERROR "${libname} is not found")
     ENDIF()