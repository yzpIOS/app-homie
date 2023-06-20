///
//  Generated code. Do not modify.
//  source: ErrorCode.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode Ok = ErrorCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Ok');
  static const ErrorCode Unknown_INTERNAL_ERROR = ErrorCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Unknown_INTERNAL_ERROR');
  static const ErrorCode INVALID_REQUEST_PARAMS = ErrorCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID_REQUEST_PARAMS');
  static const ErrorCode CONNECTION_TIMED_OUT = ErrorCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONNECTION_TIMED_OUT');
  static const ErrorCode SERVER_CONNECT_FAILED = ErrorCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SERVER_CONNECT_FAILED');
  static const ErrorCode SUSPECTED_SENSITIVE_WORD = ErrorCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUSPECTED_SENSITIVE_WORD');
  static const ErrorCode MEDIA_VIOLATION = ErrorCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MEDIA_VIOLATION');
  static const ErrorCode NOT_CONNECTION_CACHE = ErrorCode._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_CONNECTION_CACHE');
  static const ErrorCode RouterNotFound = ErrorCode._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RouterNotFound');
  static const ErrorCode NEED_BUY_PRODUCT = ErrorCode._(10001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEED_BUY_PRODUCT');
  static const ErrorCode REPEAT_PURCHASE = ErrorCode._(10002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPEAT_PURCHASE');
  static const ErrorCode ON_SELL_NOT_ALLOW_MODIFY = ErrorCode._(10003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ON_SELL_NOT_ALLOW_MODIFY');
  static const ErrorCode REPEAT_PRODUCT_IN_WAREHOUSE = ErrorCode._(10004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPEAT_PRODUCT_IN_WAREHOUSE');
  static const ErrorCode PRODUCT_NOT_EXISTS = ErrorCode._(10005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRODUCT_NOT_EXISTS');
  static const ErrorCode PRODUCT_NOT_IN_BACKPACK = ErrorCode._(10006, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRODUCT_NOT_IN_BACKPACK');
  static const ErrorCode GIVE_COUNT_MORE_THAN_BACKPACK = ErrorCode._(10007, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIVE_COUNT_MORE_THAN_BACKPACK');
  static const ErrorCode GENDER_MISMATCH = ErrorCode._(10008, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENDER_MISMATCH');
  static const ErrorCode PRODUCT_POSITION_NOT_EXIST = ErrorCode._(10009, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRODUCT_POSITION_NOT_EXIST');
  static const ErrorCode LACK_BALANCE = ErrorCode._(11001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LACK_BALANCE');
  static const ErrorCode RECORD_NUMBER_NOT_EXIST = ErrorCode._(11002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECORD_NUMBER_NOT_EXIST');
  static const ErrorCode ORDER_HAS_BEEN_REFUND = ErrorCode._(11003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORDER_HAS_BEEN_REFUND');
  static const ErrorCode PAY_TYPE_IS_NOT_EXIST = ErrorCode._(11004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAY_TYPE_IS_NOT_EXIST');
  static const ErrorCode RECHARGE_RECORD_IS_NOT_EXISTS = ErrorCode._(11005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECHARGE_RECORD_IS_NOT_EXISTS');
  static const ErrorCode VERIFICATION_CODE = ErrorCode._(12001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFICATION_CODE');
  static const ErrorCode LOGIN_FAILED = ErrorCode._(12002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOGIN_FAILED');
  static const ErrorCode REGISTER_FAILED = ErrorCode._(12003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGISTER_FAILED');
  static const ErrorCode AUTHORIZATION_FAILED = ErrorCode._(12004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTHORIZATION_FAILED');
  static const ErrorCode UID_NOT_FOUND = ErrorCode._(12005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UID_NOT_FOUND');
  static const ErrorCode USER_IS_BANNED = ErrorCode._(12006, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_IS_BANNED');
  static const ErrorCode OLD_PASSWORD_INVALID = ErrorCode._(12007, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OLD_PASSWORD_INVALID');
  static const ErrorCode VERIFICATION_CODE_MORE_THAN_COUNT = ErrorCode._(12008, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFICATION_CODE_MORE_THAN_COUNT');
  static const ErrorCode SEND_VERIFICATION_CODE_FREQUENT = ErrorCode._(12009, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEND_VERIFICATION_CODE_FREQUENT');
  static const ErrorCode PHONE_NUMBER_FORMAT_WRONG = ErrorCode._(12010, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHONE_NUMBER_FORMAT_WRONG');
  static const ErrorCode REPEAT_LOGIN_IN = ErrorCode._(12011, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPEAT_LOGIN_IN');
  static const ErrorCode NOT_BIND_WECHAT = ErrorCode._(12012, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_BIND_WECHAT');
  static const ErrorCode WECHAT_BIND_OTHER_USER = ErrorCode._(12013, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WECHAT_BIND_OTHER_USER');
  static const ErrorCode USER_BIND_OTHER_WECHAT = ErrorCode._(12014, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_BIND_OTHER_WECHAT');
  static const ErrorCode USER_ACCOUNT_NOT_EXISTS = ErrorCode._(12015, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_ACCOUNT_NOT_EXISTS');
  static const ErrorCode ACCOUNT_OR_PASSWORD_FAIL = ErrorCode._(12016, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCOUNT_OR_PASSWORD_FAIL');
  static const ErrorCode NOT_SET_PASSWORD = ErrorCode._(12017, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_SET_PASSWORD');
  static const ErrorCode PHONE_BIND_OTHER_USER = ErrorCode._(12018, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHONE_BIND_OTHER_USER');
  static const ErrorCode USER_CARD_NO_NOT_FOUND = ErrorCode._(12019, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_CARD_NO_NOT_FOUND');
  static const ErrorCode BAD_USERNAME_FORMAT = ErrorCode._(13001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BAD_USERNAME_FORMAT');
  static const ErrorCode BAD_PUBLIC_ID_FORMAT = ErrorCode._(13002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BAD_PUBLIC_ID_FORMAT');
  static const ErrorCode PUBLIC_ID_CONFLICT = ErrorCode._(13003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUBLIC_ID_CONFLICT');
  static const ErrorCode NOT_SET_USER_PROFILE = ErrorCode._(13004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_SET_USER_PROFILE');
  static const ErrorCode PICTURE_TOO_BIG = ErrorCode._(13005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PICTURE_TOO_BIG');
  static const ErrorCode REAL_NAME_FAIL = ErrorCode._(13006, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REAL_NAME_FAIL');
  static const ErrorCode BIZ_TOKEN_IS_NOT_EXISTS = ErrorCode._(13007, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_TOKEN_IS_NOT_EXISTS');
  static const ErrorCode USER_NAME_MORE_THAN_MAX_LEN = ErrorCode._(13008, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_NAME_MORE_THAN_MAX_LEN');
  static const ErrorCode USER_NAME_IS_EXIST = ErrorCode._(13009, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_NAME_IS_EXIST');
  static const ErrorCode BIZ_FAIL_NOT_VERIFIED = ErrorCode._(13010, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_FAIL_NOT_VERIFIED');
  static const ErrorCode REAL_NAME_OTHER_USER = ErrorCode._(13011, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REAL_NAME_OTHER_USER');
  static const ErrorCode GIFT_NOT_EXIST = ErrorCode._(14001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIFT_NOT_EXIST');
  static const ErrorCode USER_GIFT_RECORD_NOT_EXIST = ErrorCode._(14002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_GIFT_RECORD_NOT_EXIST');
  static const ErrorCode GIVE_COUNT_MORE_THAN_OWNS_COUNT = ErrorCode._(14003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIVE_COUNT_MORE_THAN_OWNS_COUNT');
  static const ErrorCode GIFT_NOT_IN_BACKPACK = ErrorCode._(14004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIFT_NOT_IN_BACKPACK');
  static const ErrorCode MEDIA_CONTENT_EMPTY = ErrorCode._(15001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MEDIA_CONTENT_EMPTY');
  static const ErrorCode TOPIC_IS_EXISTS = ErrorCode._(15002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TOPIC_IS_EXISTS');
  static const ErrorCode HAVE_BEEN_LIKED = ErrorCode._(15003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HAVE_BEEN_LIKED');
  static const ErrorCode UNLIKED = ErrorCode._(15004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNLIKED');
  static const ErrorCode COMMENT_NOT_EXIST = ErrorCode._(15005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMENT_NOT_EXIST');
  static const ErrorCode DYNAMIC_NOT_EXIST = ErrorCode._(15006, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DYNAMIC_NOT_EXIST');
  static const ErrorCode HAVE_BEEN_COLLECTED = ErrorCode._(15007, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HAVE_BEEN_COLLECTED');
  static const ErrorCode UNCOLLECTED = ErrorCode._(15008, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNCOLLECTED');
  static const ErrorCode NOT_DELETE_COMMENT_AUTH = ErrorCode._(15009, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_DELETE_COMMENT_AUTH');
  static const ErrorCode ROOM_ERROR = ErrorCode._(16000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_ERROR');
  static const ErrorCode ROOM_NOT_EXIST = ErrorCode._(16001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_NOT_EXIST');
  static const ErrorCode ROOM_NAME_NOT_EXIST = ErrorCode._(16002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_NAME_NOT_EXIST');
  static const ErrorCode ROOM_TYPE_NOT_FOUND = ErrorCode._(16003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_TYPE_NOT_FOUND');
  static const ErrorCode ROOM_NOT_FOUND = ErrorCode._(16004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_NOT_FOUND');
  static const ErrorCode ROOM_NO_PERMISSION = ErrorCode._(16005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_NO_PERMISSION');
  static const ErrorCode ROOM_BAN_LIVE = ErrorCode._(16006, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_BAN_LIVE');
  static const ErrorCode ROOM_START_LIVE_EXECUTING = ErrorCode._(16007, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_START_LIVE_EXECUTING');
  static const ErrorCode ROOM_NOT_PERMISSION = ErrorCode._(16008, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_NOT_PERMISSION');
  static const ErrorCode ROOM_PASSWORD_NOT_PERMISSION = ErrorCode._(16009, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_PASSWORD_NOT_PERMISSION');
  static const ErrorCode ROOM_NAME_TOO_LENGTH = ErrorCode._(16010, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_NAME_TOO_LENGTH');
  static const ErrorCode ROOM_IMAGE_NOT_FOUND = ErrorCode._(16011, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_IMAGE_NOT_FOUND');
  static const ErrorCode ROOM_USER_LIVE_ING = ErrorCode._(16012, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_USER_LIVE_ING');
  static const ErrorCode ROOM_MIKE_NOT_EXIST = ErrorCode._(16101, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_MIKE_NOT_EXIST');
  static const ErrorCode ROOM_MIKE_NOT_FOUND = ErrorCode._(16102, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_MIKE_NOT_FOUND');
  static const ErrorCode ROOM_START_MIKE_EXECUTING = ErrorCode._(16103, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_START_MIKE_EXECUTING');
  static const ErrorCode ROOM_SCENE_NOT_EXIST = ErrorCode._(16201, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_SCENE_NOT_EXIST');
  static const ErrorCode NOT_FACE_REAL_NAME = ErrorCode._(16202, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_FACE_REAL_NAME');
  static const ErrorCode ROOM_ANCHOR_NOT_FOUND = ErrorCode._(16203, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_ANCHOR_NOT_FOUND');
  static const ErrorCode ROOM_SCENE_NOT_FOUND = ErrorCode._(16204, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_SCENE_NOT_FOUND');
  static const ErrorCode GUILD_NOT_EXIST = ErrorCode._(16300, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GUILD_NOT_EXIST');
  static const ErrorCode GUILD_IS_EXIST = ErrorCode._(16301, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GUILD_IS_EXIST');
  static const ErrorCode GUILD_NOT_FOUND = ErrorCode._(16302, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GUILD_NOT_FOUND');
  static const ErrorCode GUILD_NOT_JOIN_USER = ErrorCode._(16303, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GUILD_NOT_JOIN_USER');
  static const ErrorCode ROOM_COLLECT_IS_EXIST = ErrorCode._(16400, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOM_COLLECT_IS_EXIST');
  static const ErrorCode FEEDBACK_ERROR = ErrorCode._(17000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FEEDBACK_ERROR');
  static const ErrorCode REPORT_TYPE_NOT_EXIST = ErrorCode._(17001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPORT_TYPE_NOT_EXIST');
  static const ErrorCode USER_NAME_OR_PASSWORD_ERROR = ErrorCode._(18001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const ErrorCode USER_NOT_AUTH = ErrorCode._(18002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_NOT_AUTH');
  static const ErrorCode ADVERT_BANNER_ERROR = ErrorCode._(19000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ADVERT_BANNER_ERROR');
  static const ErrorCode CONFIG_TYPE_EXISTS = ErrorCode._(20001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIG_TYPE_EXISTS');
  static const ErrorCode CONFIG_TYPE_NOT_EXISTS = ErrorCode._(20002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIG_TYPE_NOT_EXISTS');
  static const ErrorCode WITHDRAW_CASH_RECORD_NOT_EXISTS = ErrorCode._(20003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WITHDRAW_CASH_RECORD_NOT_EXISTS');
  static const ErrorCode USER_ACCOUNT_RECORD_NOT_EXIST = ErrorCode._(20004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_ACCOUNT_RECORD_NOT_EXIST');
  static const ErrorCode USER_NOT_BIND_BANK_CARD = ErrorCode._(20005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_NOT_BIND_BANK_CARD');
  static const ErrorCode USER_NAME_NOT_EQ_BANK_ACCOUNT_NAME = ErrorCode._(20006, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_NAME_NOT_EQ_BANK_ACCOUNT_NAME');
  static const ErrorCode USER_INSP_FREES_FAIL = ErrorCode._(20007, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_INSP_FREES_FAIL');
  static const ErrorCode USER_DALONG_BANK_ORDER_FAIL = ErrorCode._(20008, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_DALONG_BANK_ORDER_FAIL');
  static const ErrorCode BANK_ORDER_STATUS_NOT_FOUND = ErrorCode._(20009, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BANK_ORDER_STATUS_NOT_FOUND');
  static const ErrorCode CONFIGURE_ERROR = ErrorCode._(21000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURE_ERROR');
  static const ErrorCode LOTTERY_ACTIVITY_NOT_EXISTS = ErrorCode._(22001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOTTERY_ACTIVITY_NOT_EXISTS');
  static const ErrorCode LOTTERY_POOL_NOT_EXISTS = ErrorCode._(22002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOTTERY_POOL_NOT_EXISTS');
  static const ErrorCode PRIZE_POOL_PRIZE_NOT_EXISTS = ErrorCode._(22003, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIZE_POOL_PRIZE_NOT_EXISTS');
  static const ErrorCode LACK_LOTTERY_MEDIUM = ErrorCode._(22004, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LACK_LOTTERY_MEDIUM');
  static const ErrorCode PRIZE_POOL_IS_EMPTY = ErrorCode._(22005, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIZE_POOL_IS_EMPTY');
  static const ErrorCode PRIZE_NOT_EXISTS = ErrorCode._(22006, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIZE_NOT_EXISTS');
  static const ErrorCode LOTTERY_TOO_OFTER = ErrorCode._(22007, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOTTERY_TOO_OFTER');
  static const ErrorCode INSUFFICIENT_ACCUMULATED_AAY = ErrorCode._(22100, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INSUFFICIENT_ACCUMULATED_AAY');
  static const ErrorCode CONTAINER_ERROR = ErrorCode._(23000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONTAINER_ERROR');
  static const ErrorCode CONTAINER_NOT_FOUND = ErrorCode._(23001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONTAINER_NOT_FOUND');
  static const ErrorCode WECHAT_CODE_NOT_FOUND = ErrorCode._(24001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WECHAT_CODE_NOT_FOUND');
  static const ErrorCode USER_NOT_REAL_NAME = ErrorCode._(99001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_NOT_REAL_NAME');
  static const ErrorCode ACCOUNT_NAME_MISMATCH_REAL_NAME = ErrorCode._(99002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCOUNT_NAME_MISMATCH_REAL_NAME');
  static const ErrorCode OVER_THE_LIMIT = ErrorCode._(25001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OVER_THE_LIMIT');

  static const $core.List<ErrorCode> values = <ErrorCode> [
    Ok,
    Unknown_INTERNAL_ERROR,
    INVALID_REQUEST_PARAMS,
    CONNECTION_TIMED_OUT,
    SERVER_CONNECT_FAILED,
    SUSPECTED_SENSITIVE_WORD,
    MEDIA_VIOLATION,
    NOT_CONNECTION_CACHE,
    RouterNotFound,
    NEED_BUY_PRODUCT,
    REPEAT_PURCHASE,
    ON_SELL_NOT_ALLOW_MODIFY,
    REPEAT_PRODUCT_IN_WAREHOUSE,
    PRODUCT_NOT_EXISTS,
    PRODUCT_NOT_IN_BACKPACK,
    GIVE_COUNT_MORE_THAN_BACKPACK,
    GENDER_MISMATCH,
    PRODUCT_POSITION_NOT_EXIST,
    LACK_BALANCE,
    RECORD_NUMBER_NOT_EXIST,
    ORDER_HAS_BEEN_REFUND,
    PAY_TYPE_IS_NOT_EXIST,
    RECHARGE_RECORD_IS_NOT_EXISTS,
    VERIFICATION_CODE,
    LOGIN_FAILED,
    REGISTER_FAILED,
    AUTHORIZATION_FAILED,
    UID_NOT_FOUND,
    USER_IS_BANNED,
    OLD_PASSWORD_INVALID,
    VERIFICATION_CODE_MORE_THAN_COUNT,
    SEND_VERIFICATION_CODE_FREQUENT,
    PHONE_NUMBER_FORMAT_WRONG,
    REPEAT_LOGIN_IN,
    NOT_BIND_WECHAT,
    WECHAT_BIND_OTHER_USER,
    USER_BIND_OTHER_WECHAT,
    USER_ACCOUNT_NOT_EXISTS,
    ACCOUNT_OR_PASSWORD_FAIL,
    NOT_SET_PASSWORD,
    PHONE_BIND_OTHER_USER,
    USER_CARD_NO_NOT_FOUND,
    BAD_USERNAME_FORMAT,
    BAD_PUBLIC_ID_FORMAT,
    PUBLIC_ID_CONFLICT,
    NOT_SET_USER_PROFILE,
    PICTURE_TOO_BIG,
    REAL_NAME_FAIL,
    BIZ_TOKEN_IS_NOT_EXISTS,
    USER_NAME_MORE_THAN_MAX_LEN,
    USER_NAME_IS_EXIST,
    BIZ_FAIL_NOT_VERIFIED,
    REAL_NAME_OTHER_USER,
    GIFT_NOT_EXIST,
    USER_GIFT_RECORD_NOT_EXIST,
    GIVE_COUNT_MORE_THAN_OWNS_COUNT,
    GIFT_NOT_IN_BACKPACK,
    MEDIA_CONTENT_EMPTY,
    TOPIC_IS_EXISTS,
    HAVE_BEEN_LIKED,
    UNLIKED,
    COMMENT_NOT_EXIST,
    DYNAMIC_NOT_EXIST,
    HAVE_BEEN_COLLECTED,
    UNCOLLECTED,
    NOT_DELETE_COMMENT_AUTH,
    ROOM_ERROR,
    ROOM_NOT_EXIST,
    ROOM_NAME_NOT_EXIST,
    ROOM_TYPE_NOT_FOUND,
    ROOM_NOT_FOUND,
    ROOM_NO_PERMISSION,
    ROOM_BAN_LIVE,
    ROOM_START_LIVE_EXECUTING,
    ROOM_NOT_PERMISSION,
    ROOM_PASSWORD_NOT_PERMISSION,
    ROOM_NAME_TOO_LENGTH,
    ROOM_IMAGE_NOT_FOUND,
    ROOM_USER_LIVE_ING,
    ROOM_MIKE_NOT_EXIST,
    ROOM_MIKE_NOT_FOUND,
    ROOM_START_MIKE_EXECUTING,
    ROOM_SCENE_NOT_EXIST,
    NOT_FACE_REAL_NAME,
    ROOM_ANCHOR_NOT_FOUND,
    ROOM_SCENE_NOT_FOUND,
    GUILD_NOT_EXIST,
    GUILD_IS_EXIST,
    GUILD_NOT_FOUND,
    GUILD_NOT_JOIN_USER,
    ROOM_COLLECT_IS_EXIST,
    FEEDBACK_ERROR,
    REPORT_TYPE_NOT_EXIST,
    USER_NAME_OR_PASSWORD_ERROR,
    USER_NOT_AUTH,
    ADVERT_BANNER_ERROR,
    CONFIG_TYPE_EXISTS,
    CONFIG_TYPE_NOT_EXISTS,
    WITHDRAW_CASH_RECORD_NOT_EXISTS,
    USER_ACCOUNT_RECORD_NOT_EXIST,
    USER_NOT_BIND_BANK_CARD,
    USER_NAME_NOT_EQ_BANK_ACCOUNT_NAME,
    USER_INSP_FREES_FAIL,
    USER_DALONG_BANK_ORDER_FAIL,
    BANK_ORDER_STATUS_NOT_FOUND,
    CONFIGURE_ERROR,
    LOTTERY_ACTIVITY_NOT_EXISTS,
    LOTTERY_POOL_NOT_EXISTS,
    PRIZE_POOL_PRIZE_NOT_EXISTS,
    LACK_LOTTERY_MEDIUM,
    PRIZE_POOL_IS_EMPTY,
    PRIZE_NOT_EXISTS,
    LOTTERY_TOO_OFTER,
    INSUFFICIENT_ACCUMULATED_AAY,
    CONTAINER_ERROR,
    CONTAINER_NOT_FOUND,
    WECHAT_CODE_NOT_FOUND,
    USER_NOT_REAL_NAME,
    ACCOUNT_NAME_MISMATCH_REAL_NAME,
    OVER_THE_LIMIT,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._($core.int v, $core.String n) : super(v, n);
}

