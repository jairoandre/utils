#include <fstream>
#include <sstream>
#include <iostream>
#include <vector>

void split(const std::string &s, char delim, std::vector<float> &elems) {
  std::stringstream ss(s);
  std::string item;
  while(std::getline(ss, item, delim)) {
    elems.push_back(::atof(item.c_str()));
  }
}

int main(int argc, char* argv[])
{
  char* filename;
  if (argc < 2) {
      std::cerr << "Uso: " << argv[0] << " <arquivo>." << std::endl;
      return 1;
  } else {
    std::ifstream inputFile;

    filename = argv[1];
    inputFile.open(filename);

    std::string line;
    while (std::getline(inputFile, line)) {
      std::cout << line << std::endl;
    }

    return 0;
  }
}