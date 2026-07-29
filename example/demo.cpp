#include <iostream>
#include <string>

#include "session.h"

int main() {
  Session* session = new Session("127.0.0.1", 6667, "root", "root");
  session->open(false);

  std::cout << "setStorageGroup: root.sg1\n" << std::endl;

  try {
    // 修改时序库默认存储组  存储路径
    session->setStorageGroup("root.sg1");
  } catch (IoTDBException& e) {
  }

  delete session;
  return 0;
}