//
//  main.cpp
//  json
//
//  Created by 余纪柱 on 2022/8/12.
//

#include <iostream>
#include <stdlib.h>
#include <vector>

using namespace std;
int main(int argc, const char * argv[])
{
    vector<string> argvs;
    for(int i=0;i<argc;++i)
    {
        cout << "参数" << i<<":\n\t" << argv[i] << endl;
        argvs.push_back(argv[i]);
    }
    if(argc == 2)
    {
        int r = system(("sh "+argvs[1]).c_str());
        cout << r << endl;
    }
    return 0;
}
