//
//  Generated code. Do not modify.
//  source: ErrorCode.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode Ok = ErrorCode._(0, _omitEnumNames ? '' : 'Ok');
  static const ErrorCode Unknown_INTERNAL_ERROR = ErrorCode._(1, _omitEnumNames ? '' : 'Unknown_INTERNAL_ERROR');
  static const ErrorCode INVALID_REQUEST_PARAMS = ErrorCode._(2, _omitEnumNames ? '' : 'INVALID_REQUEST_PARAMS');
  static const ErrorCode CONNECTION_TIMED_OUT = ErrorCode._(3, _omitEnumNames ? '' : 'CONNECTION_TIMED_OUT');
  static const ErrorCode SERVER_CONNECT_FAILED = ErrorCode._(4, _omitEnumNames ? '' : 'SERVER_CONNECT_FAILED');
  static const ErrorCode SUSPECTED_SENSITIVE_WORD = ErrorCode._(5, _omitEnumNames ? '' : 'SUSPECTED_SENSITIVE_WORD');
  static const ErrorCode MEDIA_VIOLATION = ErrorCode._(6, _omitEnumNames ? '' : 'MEDIA_VIOLATION');
  static const ErrorCode NOT_CONNECTION_CACHE = ErrorCode._(7, _omitEnumNames ? '' : 'NOT_CONNECTION_CACHE');
  static const ErrorCode RouterNotFound = ErrorCode._(10, _omitEnumNames ? '' : 'RouterNotFound');
  static const ErrorCode NETWORK_ANOMALY = ErrorCode._(16, _omitEnumNames ? '' : 'NETWORK_ANOMALY');
  static const ErrorCode Success = ErrorCode._(200, _omitEnumNames ? '' : 'Success');
  static const ErrorCode NEED_BUY_PRODUCT = ErrorCode._(10001, _omitEnumNames ? '' : 'NEED_BUY_PRODUCT');
  static const ErrorCode REPEAT_PURCHASE = ErrorCode._(10002, _omitEnumNames ? '' : 'REPEAT_PURCHASE');
  static const ErrorCode ON_SELL_NOT_ALLOW_MODIFY = ErrorCode._(10003, _omitEnumNames ? '' : 'ON_SELL_NOT_ALLOW_MODIFY');
  static const ErrorCode REPEAT_PRODUCT_IN_WAREHOUSE = ErrorCode._(10004, _omitEnumNames ? '' : 'REPEAT_PRODUCT_IN_WAREHOUSE');
  static const ErrorCode PRODUCT_NOT_EXISTS = ErrorCode._(10005, _omitEnumNames ? '' : 'PRODUCT_NOT_EXISTS');
  static const ErrorCode PRODUCT_NOT_IN_BACKPACK = ErrorCode._(10006, _omitEnumNames ? '' : 'PRODUCT_NOT_IN_BACKPACK');
  static const ErrorCode GIVE_COUNT_MORE_THAN_BACKPACK = ErrorCode._(10007, _omitEnumNames ? '' : 'GIVE_COUNT_MORE_THAN_BACKPACK');
  static const ErrorCode GENDER_MISMATCH = ErrorCode._(10008, _omitEnumNames ? '' : 'GENDER_MISMATCH');
  static const ErrorCode PRODUCT_POSITION_NOT_EXIST = ErrorCode._(10009, _omitEnumNames ? '' : 'PRODUCT_POSITION_NOT_EXIST');
  static const ErrorCode USE_COUNT_MORE_THAN_BACKPACK = ErrorCode._(10010, _omitEnumNames ? '' : 'USE_COUNT_MORE_THAN_BACKPACK');
  static const ErrorCode LACK_BALANCE = ErrorCode._(11001, _omitEnumNames ? '' : 'LACK_BALANCE');
  static const ErrorCode RECORD_NUMBER_NOT_EXIST = ErrorCode._(11002, _omitEnumNames ? '' : 'RECORD_NUMBER_NOT_EXIST');
  static const ErrorCode ORDER_HAS_BEEN_REFUND = ErrorCode._(11003, _omitEnumNames ? '' : 'ORDER_HAS_BEEN_REFUND');
  static const ErrorCode PAY_TYPE_IS_NOT_EXIST = ErrorCode._(11004, _omitEnumNames ? '' : 'PAY_TYPE_IS_NOT_EXIST');
  static const ErrorCode RECHARGE_RECORD_IS_NOT_EXISTS = ErrorCode._(11005, _omitEnumNames ? '' : 'RECHARGE_RECORD_IS_NOT_EXISTS');
  static const ErrorCode VERIFICATION_CODE = ErrorCode._(12001, _omitEnumNames ? '' : 'VERIFICATION_CODE');
  static const ErrorCode LOGIN_FAILED = ErrorCode._(12002, _omitEnumNames ? '' : 'LOGIN_FAILED');
  static const ErrorCode REGISTER_FAILED = ErrorCode._(12003, _omitEnumNames ? '' : 'REGISTER_FAILED');
  static const ErrorCode AUTHORIZATION_FAILED = ErrorCode._(12004, _omitEnumNames ? '' : 'AUTHORIZATION_FAILED');
  static const ErrorCode UID_NOT_FOUND = ErrorCode._(12005, _omitEnumNames ? '' : 'UID_NOT_FOUND');
  static const ErrorCode USER_IS_BANNED = ErrorCode._(12006, _omitEnumNames ? '' : 'USER_IS_BANNED');
  static const ErrorCode OLD_PASSWORD_INVALID = ErrorCode._(12007, _omitEnumNames ? '' : 'OLD_PASSWORD_INVALID');
  static const ErrorCode VERIFICATION_CODE_MORE_THAN_COUNT = ErrorCode._(12008, _omitEnumNames ? '' : 'VERIFICATION_CODE_MORE_THAN_COUNT');
  static const ErrorCode SEND_VERIFICATION_CODE_FREQUENT = ErrorCode._(12009, _omitEnumNames ? '' : 'SEND_VERIFICATION_CODE_FREQUENT');
  static const ErrorCode PHONE_NUMBER_FORMAT_WRONG = ErrorCode._(12010, _omitEnumNames ? '' : 'PHONE_NUMBER_FORMAT_WRONG');
  static const ErrorCode REPEAT_LOGIN_IN = ErrorCode._(12011, _omitEnumNames ? '' : 'REPEAT_LOGIN_IN');
  static const ErrorCode NOT_BIND_WECHAT = ErrorCode._(12012, _omitEnumNames ? '' : 'NOT_BIND_WECHAT');
  static const ErrorCode WECHAT_BIND_OTHER_USER = ErrorCode._(12013, _omitEnumNames ? '' : 'WECHAT_BIND_OTHER_USER');
  static const ErrorCode USER_BIND_OTHER_WECHAT = ErrorCode._(12014, _omitEnumNames ? '' : 'USER_BIND_OTHER_WECHAT');
  static const ErrorCode USER_ACCOUNT_NOT_EXISTS = ErrorCode._(12015, _omitEnumNames ? '' : 'USER_ACCOUNT_NOT_EXISTS');
  static const ErrorCode ACCOUNT_OR_PASSWORD_FAIL = ErrorCode._(12016, _omitEnumNames ? '' : 'ACCOUNT_OR_PASSWORD_FAIL');
  static const ErrorCode NOT_SET_PASSWORD = ErrorCode._(12017, _omitEnumNames ? '' : 'NOT_SET_PASSWORD');
  static const ErrorCode PHONE_BIND_OTHER_USER = ErrorCode._(12018, _omitEnumNames ? '' : 'PHONE_BIND_OTHER_USER');
  static const ErrorCode USER_CARD_NO_NOT_FOUND = ErrorCode._(12019, _omitEnumNames ? '' : 'USER_CARD_NO_NOT_FOUND');
  static const ErrorCode ACCOUNT_LOGIN_USED = ErrorCode._(12020, _omitEnumNames ? '' : 'ACCOUNT_LOGIN_USED');
  static const ErrorCode BAD_USERNAME_FORMAT = ErrorCode._(13001, _omitEnumNames ? '' : 'BAD_USERNAME_FORMAT');
  static const ErrorCode BAD_PUBLIC_ID_FORMAT = ErrorCode._(13002, _omitEnumNames ? '' : 'BAD_PUBLIC_ID_FORMAT');
  static const ErrorCode PUBLIC_ID_CONFLICT = ErrorCode._(13003, _omitEnumNames ? '' : 'PUBLIC_ID_CONFLICT');
  static const ErrorCode NOT_SET_USER_PROFILE = ErrorCode._(13004, _omitEnumNames ? '' : 'NOT_SET_USER_PROFILE');
  static const ErrorCode PICTURE_TOO_BIG = ErrorCode._(13005, _omitEnumNames ? '' : 'PICTURE_TOO_BIG');
  static const ErrorCode REAL_NAME_FAIL = ErrorCode._(13006, _omitEnumNames ? '' : 'REAL_NAME_FAIL');
  static const ErrorCode BIZ_TOKEN_IS_NOT_EXISTS = ErrorCode._(13007, _omitEnumNames ? '' : 'BIZ_TOKEN_IS_NOT_EXISTS');
  static const ErrorCode USER_NAME_MORE_THAN_MAX_LEN = ErrorCode._(13008, _omitEnumNames ? '' : 'USER_NAME_MORE_THAN_MAX_LEN');
  static const ErrorCode USER_NAME_IS_EXIST = ErrorCode._(13009, _omitEnumNames ? '' : 'USER_NAME_IS_EXIST');
  static const ErrorCode BIZ_FAIL_NOT_VERIFIED = ErrorCode._(13010, _omitEnumNames ? '' : 'BIZ_FAIL_NOT_VERIFIED');
  static const ErrorCode REAL_NAME_OTHER_USER = ErrorCode._(13011, _omitEnumNames ? '' : 'REAL_NAME_OTHER_USER');
  static const ErrorCode GIFT_NOT_EXIST = ErrorCode._(14001, _omitEnumNames ? '' : 'GIFT_NOT_EXIST');
  static const ErrorCode USER_GIFT_RECORD_NOT_EXIST = ErrorCode._(14002, _omitEnumNames ? '' : 'USER_GIFT_RECORD_NOT_EXIST');
  static const ErrorCode GIVE_COUNT_MORE_THAN_OWNS_COUNT = ErrorCode._(14003, _omitEnumNames ? '' : 'GIVE_COUNT_MORE_THAN_OWNS_COUNT');
  static const ErrorCode GIFT_NOT_IN_BACKPACK = ErrorCode._(14004, _omitEnumNames ? '' : 'GIFT_NOT_IN_BACKPACK');
  static const ErrorCode USE_COUNT_MORE_THAN_OWNS_COUNT = ErrorCode._(14005, _omitEnumNames ? '' : 'USE_COUNT_MORE_THAN_OWNS_COUNT');
  static const ErrorCode BLIND_BOX_LOTTERY_FAIL = ErrorCode._(14006, _omitEnumNames ? '' : 'BLIND_BOX_LOTTERY_FAIL');
  static const ErrorCode MEDIA_CONTENT_EMPTY = ErrorCode._(15001, _omitEnumNames ? '' : 'MEDIA_CONTENT_EMPTY');
  static const ErrorCode TOPIC_IS_EXISTS = ErrorCode._(15002, _omitEnumNames ? '' : 'TOPIC_IS_EXISTS');
  static const ErrorCode HAVE_BEEN_LIKED = ErrorCode._(15003, _omitEnumNames ? '' : 'HAVE_BEEN_LIKED');
  static const ErrorCode UNLIKED = ErrorCode._(15004, _omitEnumNames ? '' : 'UNLIKED');
  static const ErrorCode COMMENT_NOT_EXIST = ErrorCode._(15005, _omitEnumNames ? '' : 'COMMENT_NOT_EXIST');
  static const ErrorCode DYNAMIC_NOT_EXIST = ErrorCode._(15006, _omitEnumNames ? '' : 'DYNAMIC_NOT_EXIST');
  static const ErrorCode HAVE_BEEN_COLLECTED = ErrorCode._(15007, _omitEnumNames ? '' : 'HAVE_BEEN_COLLECTED');
  static const ErrorCode UNCOLLECTED = ErrorCode._(15008, _omitEnumNames ? '' : 'UNCOLLECTED');
  static const ErrorCode NOT_DELETE_COMMENT_AUTH = ErrorCode._(15009, _omitEnumNames ? '' : 'NOT_DELETE_COMMENT_AUTH');
  static const ErrorCode ROOM_ERROR = ErrorCode._(16000, _omitEnumNames ? '' : 'ROOM_ERROR');
  static const ErrorCode ROOM_NOT_EXIST = ErrorCode._(16001, _omitEnumNames ? '' : 'ROOM_NOT_EXIST');
  static const ErrorCode ROOM_NAME_NOT_EXIST = ErrorCode._(16002, _omitEnumNames ? '' : 'ROOM_NAME_NOT_EXIST');
  static const ErrorCode ROOM_TYPE_NOT_FOUND = ErrorCode._(16003, _omitEnumNames ? '' : 'ROOM_TYPE_NOT_FOUND');
  static const ErrorCode ROOM_NOT_FOUND = ErrorCode._(16004, _omitEnumNames ? '' : 'ROOM_NOT_FOUND');
  static const ErrorCode ROOM_NO_PERMISSION = ErrorCode._(16005, _omitEnumNames ? '' : 'ROOM_NO_PERMISSION');
  static const ErrorCode ROOM_BAN_LIVE = ErrorCode._(16006, _omitEnumNames ? '' : 'ROOM_BAN_LIVE');
  static const ErrorCode ROOM_START_LIVE_EXECUTING = ErrorCode._(16007, _omitEnumNames ? '' : 'ROOM_START_LIVE_EXECUTING');
  static const ErrorCode ROOM_NOT_PERMISSION = ErrorCode._(16008, _omitEnumNames ? '' : 'ROOM_NOT_PERMISSION');
  static const ErrorCode ROOM_PASSWORD_NOT_PERMISSION = ErrorCode._(16009, _omitEnumNames ? '' : 'ROOM_PASSWORD_NOT_PERMISSION');
  static const ErrorCode ROOM_NAME_TOO_LENGTH = ErrorCode._(16010, _omitEnumNames ? '' : 'ROOM_NAME_TOO_LENGTH');
  static const ErrorCode ROOM_IMAGE_NOT_FOUND = ErrorCode._(16011, _omitEnumNames ? '' : 'ROOM_IMAGE_NOT_FOUND');
  static const ErrorCode ROOM_UP_ING = ErrorCode._(16012, _omitEnumNames ? '' : 'ROOM_UP_ING');
  static const ErrorCode ROOM_UID_BLACK = ErrorCode._(16013, _omitEnumNames ? '' : 'ROOM_UID_BLACK');
  static const ErrorCode ROOM_USER_NOT_ONLINE = ErrorCode._(16014, _omitEnumNames ? '' : 'ROOM_USER_NOT_ONLINE');
  static const ErrorCode ROOM_MESSAGE_NOT_EXIST = ErrorCode._(16015, _omitEnumNames ? '' : 'ROOM_MESSAGE_NOT_EXIST');
  static const ErrorCode ROOM_UID_UP_ING = ErrorCode._(16016, _omitEnumNames ? '' : 'ROOM_UID_UP_ING');
  static const ErrorCode ROOM_LIVE_STOP = ErrorCode._(16017, _omitEnumNames ? '' : 'ROOM_LIVE_STOP');
  static const ErrorCode ROOM_UNABLE_BLACK = ErrorCode._(16018, _omitEnumNames ? '' : 'ROOM_UNABLE_BLACK');
  static const ErrorCode ROOM_BAN_CHAT = ErrorCode._(16019, _omitEnumNames ? '' : 'ROOM_BAN_CHAT');
  static const ErrorCode ROOM_NOT_STOP_PERMISSION = ErrorCode._(16020, _omitEnumNames ? '' : 'ROOM_NOT_STOP_PERMISSION');
  static const ErrorCode ROOM_INIT_FAIL = ErrorCode._(16021, _omitEnumNames ? '' : 'ROOM_INIT_FAIL');
  static const ErrorCode ROOM_MIKE_NOT_EXIST = ErrorCode._(16101, _omitEnumNames ? '' : 'ROOM_MIKE_NOT_EXIST');
  static const ErrorCode ROOM_MIKE_NOT_FOUND = ErrorCode._(16102, _omitEnumNames ? '' : 'ROOM_MIKE_NOT_FOUND');
  static const ErrorCode ROOM_START_MIKE_EXECUTING = ErrorCode._(16103, _omitEnumNames ? '' : 'ROOM_START_MIKE_EXECUTING');
  static const ErrorCode ROOM_MIKE_IN_USE = ErrorCode._(16104, _omitEnumNames ? '' : 'ROOM_MIKE_IN_USE');
  static const ErrorCode ROOM_MIKE_BAN_USE = ErrorCode._(16105, _omitEnumNames ? '' : 'ROOM_MIKE_BAN_USE');
  static const ErrorCode ROOM_SCENE_NOT_EXIST = ErrorCode._(16201, _omitEnumNames ? '' : 'ROOM_SCENE_NOT_EXIST');
  static const ErrorCode NOT_FACE_REAL_NAME = ErrorCode._(16202, _omitEnumNames ? '' : 'NOT_FACE_REAL_NAME');
  static const ErrorCode ROOM_ANCHOR_NOT_FOUND = ErrorCode._(16203, _omitEnumNames ? '' : 'ROOM_ANCHOR_NOT_FOUND');
  static const ErrorCode ROOM_SCENE_NOT_FOUND = ErrorCode._(16204, _omitEnumNames ? '' : 'ROOM_SCENE_NOT_FOUND');
  static const ErrorCode ROOM_NOT_BELONG_GUILD_TYPE = ErrorCode._(16205, _omitEnumNames ? '' : 'ROOM_NOT_BELONG_GUILD_TYPE');
  static const ErrorCode GUILD_NOT_EXIST = ErrorCode._(16300, _omitEnumNames ? '' : 'GUILD_NOT_EXIST');
  static const ErrorCode GUILD_IS_EXIST = ErrorCode._(16301, _omitEnumNames ? '' : 'GUILD_IS_EXIST');
  static const ErrorCode GUILD_NOT_FOUND = ErrorCode._(16302, _omitEnumNames ? '' : 'GUILD_NOT_FOUND');
  static const ErrorCode GUILD_NOT_JOIN_USER = ErrorCode._(16303, _omitEnumNames ? '' : 'GUILD_NOT_JOIN_USER');
  static const ErrorCode GUILD_ANCHOR_IS_EXIST = ErrorCode._(16304, _omitEnumNames ? '' : 'GUILD_ANCHOR_IS_EXIST');
  static const ErrorCode GUILD_ANCHOR_NOT_EXIST = ErrorCode._(16305, _omitEnumNames ? '' : 'GUILD_ANCHOR_NOT_EXIST');
  static const ErrorCode GUILD_LEDGER_RATIO_FAILED = ErrorCode._(16306, _omitEnumNames ? '' : 'GUILD_LEDGER_RATIO_FAILED');
  static const ErrorCode PK_ROOM_NOT_FOUND = ErrorCode._(16500, _omitEnumNames ? '' : 'PK_ROOM_NOT_FOUND');
  static const ErrorCode PK_ROOM_INVITE_EXIST = ErrorCode._(16501, _omitEnumNames ? '' : 'PK_ROOM_INVITE_EXIST');
  static const ErrorCode PK_ROOM_EXECUTING = ErrorCode._(16502, _omitEnumNames ? '' : 'PK_ROOM_EXECUTING');
  static const ErrorCode PK_ROOM_INVITING = ErrorCode._(16503, _omitEnumNames ? '' : 'PK_ROOM_INVITING');
  static const ErrorCode PK_ROOM_INVITE_EXPIRE = ErrorCode._(16504, _omitEnumNames ? '' : 'PK_ROOM_INVITE_EXPIRE');
  static const ErrorCode PK_ROOM_USER_NOT_ALLOWED_BATTLE_SWITCH = ErrorCode._(16505, _omitEnumNames ? '' : 'PK_ROOM_USER_NOT_ALLOWED_BATTLE_SWITCH');
  static const ErrorCode PK_ROOM_NOT_COMBATANT = ErrorCode._(16506, _omitEnumNames ? '' : 'PK_ROOM_NOT_COMBATANT');
  static const ErrorCode PK_ROOM_FINISH = ErrorCode._(16507, _omitEnumNames ? '' : 'PK_ROOM_FINISH');
  static const ErrorCode ROOM_COLLECT_IS_EXIST = ErrorCode._(16400, _omitEnumNames ? '' : 'ROOM_COLLECT_IS_EXIST');
  static const ErrorCode FEEDBACK_ERROR = ErrorCode._(17000, _omitEnumNames ? '' : 'FEEDBACK_ERROR');
  static const ErrorCode REPORT_TYPE_NOT_EXIST = ErrorCode._(17001, _omitEnumNames ? '' : 'REPORT_TYPE_NOT_EXIST');
  static const ErrorCode USER_NAME_OR_PASSWORD_ERROR = ErrorCode._(18001, _omitEnumNames ? '' : 'USER_NAME_OR_PASSWORD_ERROR');
  static const ErrorCode USER_NOT_AUTH = ErrorCode._(18002, _omitEnumNames ? '' : 'USER_NOT_AUTH');
  static const ErrorCode ADVERT_BANNER_ERROR = ErrorCode._(19000, _omitEnumNames ? '' : 'ADVERT_BANNER_ERROR');
  static const ErrorCode CONFIG_TYPE_EXISTS = ErrorCode._(20001, _omitEnumNames ? '' : 'CONFIG_TYPE_EXISTS');
  static const ErrorCode CONFIG_TYPE_NOT_EXISTS = ErrorCode._(20002, _omitEnumNames ? '' : 'CONFIG_TYPE_NOT_EXISTS');
  static const ErrorCode WITHDRAW_CASH_RECORD_NOT_EXISTS = ErrorCode._(20003, _omitEnumNames ? '' : 'WITHDRAW_CASH_RECORD_NOT_EXISTS');
  static const ErrorCode USER_ACCOUNT_RECORD_NOT_EXIST = ErrorCode._(20004, _omitEnumNames ? '' : 'USER_ACCOUNT_RECORD_NOT_EXIST');
  static const ErrorCode USER_NOT_BIND_BANK_CARD = ErrorCode._(20005, _omitEnumNames ? '' : 'USER_NOT_BIND_BANK_CARD');
  static const ErrorCode USER_NAME_NOT_EQ_BANK_ACCOUNT_NAME = ErrorCode._(20006, _omitEnumNames ? '' : 'USER_NAME_NOT_EQ_BANK_ACCOUNT_NAME');
  static const ErrorCode USER_INSP_FREES_FAIL = ErrorCode._(20007, _omitEnumNames ? '' : 'USER_INSP_FREES_FAIL');
  static const ErrorCode USER_DALONG_BANK_ORDER_FAIL = ErrorCode._(20008, _omitEnumNames ? '' : 'USER_DALONG_BANK_ORDER_FAIL');
  static const ErrorCode BANK_ORDER_STATUS_NOT_FOUND = ErrorCode._(20009, _omitEnumNames ? '' : 'BANK_ORDER_STATUS_NOT_FOUND');
  static const ErrorCode WITHDRAW_CASH_LESS_THAN_ZERO = ErrorCode._(20010, _omitEnumNames ? '' : 'WITHDRAW_CASH_LESS_THAN_ZERO');
  static const ErrorCode FINE_AMOUNT_LESS_THAN_ZERO = ErrorCode._(20011, _omitEnumNames ? '' : 'FINE_AMOUNT_LESS_THAN_ZERO');
  static const ErrorCode WITHDRAW_CASH_IS_TOO_SMALL = ErrorCode._(20012, _omitEnumNames ? '' : 'WITHDRAW_CASH_IS_TOO_SMALL');
  static const ErrorCode CONFIGURE_ERROR = ErrorCode._(21000, _omitEnumNames ? '' : 'CONFIGURE_ERROR');
  static const ErrorCode LOTTERY_ACTIVITY_NOT_EXISTS = ErrorCode._(22001, _omitEnumNames ? '' : 'LOTTERY_ACTIVITY_NOT_EXISTS');
  static const ErrorCode LOTTERY_POOL_NOT_EXISTS = ErrorCode._(22002, _omitEnumNames ? '' : 'LOTTERY_POOL_NOT_EXISTS');
  static const ErrorCode PRIZE_POOL_PRIZE_NOT_EXISTS = ErrorCode._(22003, _omitEnumNames ? '' : 'PRIZE_POOL_PRIZE_NOT_EXISTS');
  static const ErrorCode LACK_LOTTERY_MEDIUM = ErrorCode._(22004, _omitEnumNames ? '' : 'LACK_LOTTERY_MEDIUM');
  static const ErrorCode PRIZE_POOL_IS_EMPTY = ErrorCode._(22005, _omitEnumNames ? '' : 'PRIZE_POOL_IS_EMPTY');
  static const ErrorCode PRIZE_NOT_EXISTS = ErrorCode._(22006, _omitEnumNames ? '' : 'PRIZE_NOT_EXISTS');
  static const ErrorCode LOTTERY_TOO_OFTER = ErrorCode._(22007, _omitEnumNames ? '' : 'LOTTERY_TOO_OFTER');
  static const ErrorCode INSUFFICIENT_ACCUMULATED_AAY = ErrorCode._(22100, _omitEnumNames ? '' : 'INSUFFICIENT_ACCUMULATED_AAY');
  static const ErrorCode CONTAINER_ERROR = ErrorCode._(23000, _omitEnumNames ? '' : 'CONTAINER_ERROR');
  static const ErrorCode CONTAINER_NOT_FOUND = ErrorCode._(23001, _omitEnumNames ? '' : 'CONTAINER_NOT_FOUND');
  static const ErrorCode WECHAT_CODE_NOT_FOUND = ErrorCode._(24001, _omitEnumNames ? '' : 'WECHAT_CODE_NOT_FOUND');
  static const ErrorCode USER_NOT_REAL_NAME = ErrorCode._(99001, _omitEnumNames ? '' : 'USER_NOT_REAL_NAME');
  static const ErrorCode ACCOUNT_NAME_MISMATCH_REAL_NAME = ErrorCode._(99002, _omitEnumNames ? '' : 'ACCOUNT_NAME_MISMATCH_REAL_NAME');
  static const ErrorCode OVER_THE_LIMIT = ErrorCode._(25001, _omitEnumNames ? '' : 'OVER_THE_LIMIT');
  static const ErrorCode RANDOM_BUFF_GIFT_IS_EMPTY = ErrorCode._(26001, _omitEnumNames ? '' : 'RANDOM_BUFF_GIFT_IS_EMPTY');

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
    NETWORK_ANOMALY,
    Success,
    NEED_BUY_PRODUCT,
    REPEAT_PURCHASE,
    ON_SELL_NOT_ALLOW_MODIFY,
    REPEAT_PRODUCT_IN_WAREHOUSE,
    PRODUCT_NOT_EXISTS,
    PRODUCT_NOT_IN_BACKPACK,
    GIVE_COUNT_MORE_THAN_BACKPACK,
    GENDER_MISMATCH,
    PRODUCT_POSITION_NOT_EXIST,
    USE_COUNT_MORE_THAN_BACKPACK,
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
    ACCOUNT_LOGIN_USED,
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
    USE_COUNT_MORE_THAN_OWNS_COUNT,
    BLIND_BOX_LOTTERY_FAIL,
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
    ROOM_UP_ING,
    ROOM_UID_BLACK,
    ROOM_USER_NOT_ONLINE,
    ROOM_MESSAGE_NOT_EXIST,
    ROOM_UID_UP_ING,
    ROOM_LIVE_STOP,
    ROOM_UNABLE_BLACK,
    ROOM_BAN_CHAT,
    ROOM_NOT_STOP_PERMISSION,
    ROOM_INIT_FAIL,
    ROOM_MIKE_NOT_EXIST,
    ROOM_MIKE_NOT_FOUND,
    ROOM_START_MIKE_EXECUTING,
    ROOM_MIKE_IN_USE,
    ROOM_MIKE_BAN_USE,
    ROOM_SCENE_NOT_EXIST,
    NOT_FACE_REAL_NAME,
    ROOM_ANCHOR_NOT_FOUND,
    ROOM_SCENE_NOT_FOUND,
    ROOM_NOT_BELONG_GUILD_TYPE,
    GUILD_NOT_EXIST,
    GUILD_IS_EXIST,
    GUILD_NOT_FOUND,
    GUILD_NOT_JOIN_USER,
    GUILD_ANCHOR_IS_EXIST,
    GUILD_ANCHOR_NOT_EXIST,
    GUILD_LEDGER_RATIO_FAILED,
    PK_ROOM_NOT_FOUND,
    PK_ROOM_INVITE_EXIST,
    PK_ROOM_EXECUTING,
    PK_ROOM_INVITING,
    PK_ROOM_INVITE_EXPIRE,
    PK_ROOM_USER_NOT_ALLOWED_BATTLE_SWITCH,
    PK_ROOM_NOT_COMBATANT,
    PK_ROOM_FINISH,
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
    WITHDRAW_CASH_LESS_THAN_ZERO,
    FINE_AMOUNT_LESS_THAN_ZERO,
    WITHDRAW_CASH_IS_TOO_SMALL,
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
    RANDOM_BUFF_GIFT_IS_EMPTY,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ErrorCode? valueOf($core.int value) => _byValue[value];

  const ErrorCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
