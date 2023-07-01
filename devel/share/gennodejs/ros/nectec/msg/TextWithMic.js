// Auto-generated. Do not edit!

// (in-package nectec.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TextWithMic {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mic = null;
    }
    else {
      if (initObj.hasOwnProperty('mic')) {
        this.mic = initObj.mic
      }
      else {
        this.mic = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TextWithMic
    // Serialize message field [mic]
    bufferOffset = _serializer.string(obj.mic, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TextWithMic
    let len;
    let data = new TextWithMic(null);
    // Deserialize message field [mic]
    data.mic = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.mic);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nectec/TextWithMic';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5c60854cf88203241207ee392c3dd59c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string mic
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TextWithMic(null);
    if (msg.mic !== undefined) {
      resolved.mic = msg.mic;
    }
    else {
      resolved.mic = ''
    }

    return resolved;
    }
};

module.exports = TextWithMic;
