# LocateOPENCASCADE
# This module defines
# OPENCASCADE_LIBRARY
# OPENCASCADE_FOUND, if false, do not try to link to OPENCASCADE
# OPENCASCADE_INCLUDE_DIR, where to find the headers
#
# $OPENCASCADE_DIR is an environment variable that would
# correspond to the ./configure --prefix=$OPENCASCADE_DIR
# used in building OPENCASCADE.

FIND_PATH(OPENCASCADE_INCLUDE_DIR BRepMesh.hxx
  PATHS
    ${OPENCASCADE_DIR}
    $ENV{OPENCASCADE_DIR}
    ~/Library/Frameworks
    /Library/Frameworks
    /usr/local
    /usr
    /sw # Fink
    /opt/local # DarwinPorts
    /opt/csw # Blastwave
    /opt
    /usr/freeware
  PATH_SUFFIXES
    opencascade
    inc
    include
    inc/cascade
    include/cascade
)

MACRO(FIND_OPENCASCADE_LIBRARY MYLIBRARY MYLIBRARYNAME)

    FIND_LIBRARY("${MYLIBRARY}"
        NAMES "${MYLIBRARYNAME}"
        PATHS
        $ENV{OPENCASCADE_DIR}/lib}
        $ENV{OPENCASCADE_LIB}
        ${OPENCASCADE_DIR}/lib
        $ENV{OPENCASCADE_DIR}/lib
        ${OPENCASCADE_DIR}/lib/
        ~/Library/Frameworks
        /Library/Frameworks
        /usr/local/lib
        /usr/lib
        /sw/lib
        /opt/local/lib
        /opt/csw/lib
        /opt/lib
        /usr/freeware/lib64
        )

        MESSAGE("#Foundlibrary " ${${MYLIBRARY}})

ENDMACRO()


# Find release (optimized) libs
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKVRML_LIBRARY TKVrml)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSTL_LIBRARY TKStl)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKBREP_LIBRARY TKBRep)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKIGES_LIBRARY TKIGES)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSHHEALING_LIBRARY TKShHealing)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSTEP_LIBRARY TKSTEP)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSTEP209_LIBRARY TKSTEP209)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSTEPATTR_LIBRARY TKSTEPAttr)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSTEPBASE_LIBRARY TKSTEPBase)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKXSBASE_LIBRARY TKXSBase)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSHAPESCHEMA_LIBRARY TKShapeSchema)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKBO_LIBRARY TKBO)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_FWOSPLUGIN_LIBRARY FWOSPlugin)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_PTKERNEL_LIBRARY PTKernel)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKBOOL_LIBRARY TKBool)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKCAF_LIBRARY TKCAF)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKCDF_LIBRARY TKCDF)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKERNEL_LIBRARY TKernel)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKFEAT_LIBRARY TKFeat)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKFILLET_LIBRARY TKFillet)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKG2D_LIBRARY TKG2d)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKG3d_LIBRARY TKG3D)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKGEOMALGO_LIBRARY TKGeomAlgo)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKGEOMBASE_LIBRARY TKGeomBase)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKHLR_LIBRARY TKHLR)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKMATH_LIBRARY TKMath)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKOFFSET_LIBRARY TKOffset)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKPCAF_LIBRARY TKPCAF)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKPRIM_LIBRARY TKPrim)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKPSHAPE_LIBRARY TKPShape)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKSERVICE_LIBRARY TKService)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKTOPALGO_LIBRARY TKTopAlgo)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKMESH_LIBRARY TKMesh)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKV3D_LIBRARY TKV3d)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKXCAF_LIBRARY TKXCAF)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKXDEIGES_LIBRARY TKXDEIGES)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKXLCAF_LIBRARY TKXLCAF)
FIND_OPENCASCADE_LIBRARY(OPENCASCADE_TKLCAF_LIBRARY TKLCAF)


SET(OPENCASCADE_LIBRARY ${OPENCASCADE_LIBRARY}
#    ${OPENCASCADE_TKBREP_LIBRARY}
#    ${OPENCASCADE_TKIGES_LIBRARY}
#    ${OPENCASCADE_TKSHHEALING_LIBRARY}
#    ${OPENCASCADE_TKSTEP_LIBRARY}
#    ${OPENCASCADE_TKSTEP209_LIBRARY}
#    ${OPENCASCADE_TKSTEPATTR_LIBRARY}
#    ${OPENCASCADE_TKSTEPBASE_LIBRARY}
#    ${OPENCASCADE_TKXSBASE_LIBRARY}
#    ${OPENCASCADE_TKBO_LIBRARY}
#    ${OPENCASCADE_TKBOOL_LIBRARY}
#    ${OPENCASCADE_TKCAF_LIBRARY}
#    ${OPENCASCADE_TKCDF_LIBRARY}
#    ${OPENCASCADE_TKERNEL_LIBRARY}
#    ${OPENCASCADE_TKFEAT_LIBRARY}
#    ${OPENCASCADE_TKFILLET_LIBRARY}
#    ${OPENCASCADE_TKG2D_LIBRARY}
#    ${OPENCASCADE_TKGEOMALGO_LIBRARY}
#    ${OPENCASCADE_TKGEOMBASE_LIBRARY}
#    ${OPENCASCADE_TKHLR_LIBRARY}
#    ${OPENCASCADE_TKMATH_LIBRARY}
#    ${OPENCASCADE_TKOFFSET_LIBRARY}
#    ${OPENCASCADE_TKPRIM_LIBRARY}
#    ${OPENCASCADE_TKSERVICE_LIBRARY}
#    ${OPENCASCADE_TKTOPALGO_LIBRARY}
#    ${OPENCASCADE_TKMESH_LIBRARY}
#    ${OPENCASCADE_TKV3D_LIBRARY}
#    ${OPENCASCADE_TKXCAF_LIBRARY}
    ${OPENCASCADE_TKXDEIGES_LIBRARY}
#    ${OPENCASCADE_TKLCAF_LIBRARY}
)

SET(OPENCASCADE_FOUND "NO")
IF(OPENCASCADE_LIBRARY AND OPENCASCADE_INCLUDE_DIR)
    SET(OPENCASCADE_FOUND "YES")
ENDIF(OPENCASCADE_LIBRARY AND OPENCASCADE_INCLUDE_DIR)

IF(OPENCASCADE_INCLUDE_DIR)
    SET(OPENCASCADE_FOUND "YES")
ENDIF(OPENCASCADE_INCLUDE_DIR)