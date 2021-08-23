// Fabian Nino
// CPSC 140
// Assignment 1
// 2021-08-22
// falenire@csu.fullerton.edu

// Greeting program using assembly

#include <iostream>

extern "C" char* hello();


int main(int argc, char* argv[]) {
    std::cout
        << "Welcome to this friendly ‘Hello’ program created by Jerry Long.\n";

    char * username = hello();

    std::cout 
        << "Stay away from viruses " << username << ".\n"
        << "Bye. The integer zero will now be returned to the operating system.";
    
    std::cout << "\n";
    return 0;
}