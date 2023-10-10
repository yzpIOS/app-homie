
// socket连接超时
const SOCKET_CONNECT_TIMEOUT = 3000;

// 客户端发送心跳的间格，单位秒
const int CLIENT_BEAT_RATE = 5;
// 发送心跳的最大次数, 超过这个次数就认为是断开
const int CLIENT_MAX_BEAT_TIME = 3;

// socket没有回应的最大时间，认为socket是断开
const SOCKET_NOT_RESPONSE_TIME = 10 * 1000;

// 客户间与unity的协义范围
const FLUTTER_UINITY_START = 10000;
const FLUTTER_UINITY_END = 20000;
