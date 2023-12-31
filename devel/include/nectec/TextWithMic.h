// Generated by gencpp from file nectec/TextWithMic.msg
// DO NOT EDIT!


#ifndef NECTEC_MESSAGE_TEXTWITHMIC_H
#define NECTEC_MESSAGE_TEXTWITHMIC_H


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
struct TextWithMic_
{
  typedef TextWithMic_<ContainerAllocator> Type;

  TextWithMic_()
    : mic()  {
    }
  TextWithMic_(const ContainerAllocator& _alloc)
    : mic(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _mic_type;
  _mic_type mic;





  typedef boost::shared_ptr< ::nectec::TextWithMic_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nectec::TextWithMic_<ContainerAllocator> const> ConstPtr;

}; // struct TextWithMic_

typedef ::nectec::TextWithMic_<std::allocator<void> > TextWithMic;

typedef boost::shared_ptr< ::nectec::TextWithMic > TextWithMicPtr;
typedef boost::shared_ptr< ::nectec::TextWithMic const> TextWithMicConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nectec::TextWithMic_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nectec::TextWithMic_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nectec::TextWithMic_<ContainerAllocator1> & lhs, const ::nectec::TextWithMic_<ContainerAllocator2> & rhs)
{
  return lhs.mic == rhs.mic;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nectec::TextWithMic_<ContainerAllocator1> & lhs, const ::nectec::TextWithMic_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nectec

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nectec::TextWithMic_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nectec::TextWithMic_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nectec::TextWithMic_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nectec::TextWithMic_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nectec::TextWithMic_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nectec::TextWithMic_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nectec::TextWithMic_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5c60854cf88203241207ee392c3dd59c";
  }

  static const char* value(const ::nectec::TextWithMic_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5c60854cf8820324ULL;
  static const uint64_t static_value2 = 0x1207ee392c3dd59cULL;
};

template<class ContainerAllocator>
struct DataType< ::nectec::TextWithMic_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nectec/TextWithMic";
  }

  static const char* value(const ::nectec::TextWithMic_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nectec::TextWithMic_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string mic\n"
;
  }

  static const char* value(const ::nectec::TextWithMic_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nectec::TextWithMic_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mic);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TextWithMic_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nectec::TextWithMic_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nectec::TextWithMic_<ContainerAllocator>& v)
  {
    s << indent << "mic: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.mic);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NECTEC_MESSAGE_TEXTWITHMIC_H
