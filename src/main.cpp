#include <iostream>

extern "C" {
    #include "libavcodec/avcodec.h"
    #include "libavformat/avformat.h"
    #include "libavdevice/avdevice.h"
    #include "libavutil/avutil.h"
    #include "libavfilter/avfilter.h"
}

using namespace std;

int main() {
    avdevice_register_all();
    // AVFormatContext *pFormatCtx = avformat_alloc_context();
	// AVDictionary *options = NULL;
	// av_dict_set(&options, "list_devices", "true", 0);
	// const AVInputFormat *iformat = av_find_input_format("dshow");
	// cout << "=============Device Info================="<< endl;
	// avformat_open_input(&pFormatCtx, "video=dummy", iformat, &options);
    // cout << "========================================="<< endl;
    cin.get();
    return 0;
}