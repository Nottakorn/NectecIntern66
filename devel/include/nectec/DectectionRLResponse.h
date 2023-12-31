// Generated by gencpp from file nectec/DectectionRLResponse.msg
// DO NOT EDIT!


#ifndef NECTEC_MESSAGE_DECTECTIONRLRESPONSE_H
#define NECTEC_MESSAGE_DECTECTIONRLRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace nectec
{
template <class ContainerAllocator>
struct DectectionRLResponse_
{
  typedef DectectionRLResponse_<ContainerAllocator> Type;

  DectectionRLResponse_()
    : type()
    , symbol()
    , success(false)  {
    }
  DectectionRLResponse_(const ContainerAllocator& _alloc)
    : type(_alloc)
    , symbol(_alloc)
    , success(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _type_type;
  _type_type type;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _symbol_type;
  _symbol_type symbol;

   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::nectec::DectectionRLResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nectec::DectectionRLResponse_<ContainerAllocator> const> ConstPtr;

}; // struct DectectionRLResponse_

typedef ::nectec::DectectionRLResponse_<std::allocator<void> > DectectionRLResponse;

typedef boost::shared_ptr< ::nectec::DectectionRLResponse > DectectionRLResponsePtr;
typedef boost::shared_ptr< ::nectec::DectectionRLResponse const> DectectionRLResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nectec::DectectionRLResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nectec::DectectionRLResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nectec::DectectionRLResponse_<ContainerAllocator1> & lhs, const ::nectec::DectectionRLResponse_<ContainerAllocator2> & rhs)
{
  return lhs.type == rhs.type &&
    lhs.symbol == rhs.symbol &&
    lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nectec::DectectionRLResponse_<ContainerAllocator1> & lhs, const ::nectec::DectectionRLResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nectec

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nectec::DectectionRLResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nectec::DectectionRLResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nectec::DectectionRLResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nectec::DectectionRLResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nectec::DectectionRLResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nectec::DectectionRLResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nectec::DectectionRLResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9d3ac493f6c86d8e2bb954ef0fe24df9";
  }

  static const char* value(const ::nectec::DectectionRLResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9d3ac493f6c86d8eULL;
  static const uint64_t static_value2 = 0x2bb954ef0fe24df9ULL;
};

template<class ContainerAllocator>
struct DataType< ::nectec::DectectionRLResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nectec/DectectionRLResponse";
  }

  static const char* value(const ::nectec::DectectionRLResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nectec::DectectionRLResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string type\n"
"string symbol\n"
"bool success\n"
;
  }

  static const char* value(const ::nectec::DectectionRLResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nectec::DectectionRLResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.type);
      stream.next(m.symbol);
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DectectionRLResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nectec::DectectionRLResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nectec::DectectionRLResponse_<ContainerAllocator>& v)
  {
    s << indent << "type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.type);
    s << indent << "symbol: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.symbol);
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NECTEC_MESSAGE_DECTECTIONRLRESPONSE_H
