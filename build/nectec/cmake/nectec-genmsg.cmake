# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "nectec: 2 messages, 1 services")

set(MSG_I_FLAGS "-Inectec:/home/asus/Nectec_ws/src/nectec/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(nectec_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg" NAME_WE)
add_custom_target(_nectec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nectec" "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg" ""
)

get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg" NAME_WE)
add_custom_target(_nectec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nectec" "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg" ""
)

get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv" NAME_WE)
add_custom_target(_nectec_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nectec" "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nectec
)
_generate_msg_cpp(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nectec
)

### Generating Services
_generate_srv_cpp(nectec
  "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nectec
)

### Generating Module File
_generate_module_cpp(nectec
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nectec
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(nectec_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(nectec_generate_messages nectec_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg" NAME_WE)
add_dependencies(nectec_generate_messages_cpp _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg" NAME_WE)
add_dependencies(nectec_generate_messages_cpp _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv" NAME_WE)
add_dependencies(nectec_generate_messages_cpp _nectec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nectec_gencpp)
add_dependencies(nectec_gencpp nectec_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nectec_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nectec
)
_generate_msg_eus(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nectec
)

### Generating Services
_generate_srv_eus(nectec
  "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nectec
)

### Generating Module File
_generate_module_eus(nectec
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nectec
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(nectec_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(nectec_generate_messages nectec_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg" NAME_WE)
add_dependencies(nectec_generate_messages_eus _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg" NAME_WE)
add_dependencies(nectec_generate_messages_eus _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv" NAME_WE)
add_dependencies(nectec_generate_messages_eus _nectec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nectec_geneus)
add_dependencies(nectec_geneus nectec_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nectec_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nectec
)
_generate_msg_lisp(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nectec
)

### Generating Services
_generate_srv_lisp(nectec
  "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nectec
)

### Generating Module File
_generate_module_lisp(nectec
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nectec
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(nectec_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(nectec_generate_messages nectec_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg" NAME_WE)
add_dependencies(nectec_generate_messages_lisp _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg" NAME_WE)
add_dependencies(nectec_generate_messages_lisp _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv" NAME_WE)
add_dependencies(nectec_generate_messages_lisp _nectec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nectec_genlisp)
add_dependencies(nectec_genlisp nectec_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nectec_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nectec
)
_generate_msg_nodejs(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nectec
)

### Generating Services
_generate_srv_nodejs(nectec
  "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nectec
)

### Generating Module File
_generate_module_nodejs(nectec
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nectec
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(nectec_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(nectec_generate_messages nectec_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg" NAME_WE)
add_dependencies(nectec_generate_messages_nodejs _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg" NAME_WE)
add_dependencies(nectec_generate_messages_nodejs _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv" NAME_WE)
add_dependencies(nectec_generate_messages_nodejs _nectec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nectec_gennodejs)
add_dependencies(nectec_gennodejs nectec_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nectec_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nectec
)
_generate_msg_py(nectec
  "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nectec
)

### Generating Services
_generate_srv_py(nectec
  "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nectec
)

### Generating Module File
_generate_module_py(nectec
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nectec
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(nectec_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(nectec_generate_messages nectec_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/TextWithMic.msg" NAME_WE)
add_dependencies(nectec_generate_messages_py _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/msg/Handdection.msg" NAME_WE)
add_dependencies(nectec_generate_messages_py _nectec_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/asus/Nectec_ws/src/nectec/srv/DectectionRL.srv" NAME_WE)
add_dependencies(nectec_generate_messages_py _nectec_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nectec_genpy)
add_dependencies(nectec_genpy nectec_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nectec_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nectec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nectec
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(nectec_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nectec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nectec
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(nectec_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nectec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nectec
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(nectec_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nectec)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nectec
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(nectec_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nectec)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nectec\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nectec
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(nectec_generate_messages_py std_msgs_generate_messages_py)
endif()
