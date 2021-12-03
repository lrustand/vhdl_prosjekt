#include <map>

#define INT(x) x-'A'

std::map<char, char> plugboard {
    {INT('A'), INT('F')},
    {INT('B'), INT('K')},
    {INT('C'), INT('S')},
    {INT('D'), INT('J')},
    {INT('E'), INT('E')},
    {INT('F'), INT('A')},
    {INT('G'), INT('T')},
    {INT('H'), INT('H')},
    {INT('I'), INT('Z')},
    {INT('J'), INT('D')},
    {INT('K'), INT('B')},
    {INT('L'), INT('L')},
    {INT('M'), INT('M')},
    {INT('N'), INT('Y')},
    {INT('O'), INT('V')},
    {INT('P'), INT('Q')},
    {INT('Q'), INT('P')},
    {INT('R'), INT('R')},
    {INT('S'), INT('C')},
    {INT('T'), INT('G')},
    {INT('U'), INT('X')},
    {INT('V'), INT('O')},
    {INT('W'), INT('W')},
    {INT('X'), INT('U')},
    {INT('Y'), INT('N')},
    {INT('Z'), INT('I')}
};
