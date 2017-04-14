#ifndef AP_STREAM_H
#define AP_STREAM_H

//#include <ostream>
//
//#include <llvm/Support/raw_ostream.h>

template <class stream>
inline stream & operator<<(stream & s, ap_interval_t & interval) {
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_interval_fprint(bufferfp, &interval);
	fclose(bufferfp);
	s << buffer;
	return s;
}

//inline llvm::raw_ostream & operator<<(llvm::raw_ostream & s, ap_interval_t & interval) {
//	char * buffer;
//	size_t size;
//	FILE * bufferfp = open_memstream(&buffer, &size);
//	ap_interval_fprint(bufferfp, &interval);
//	fclose(bufferfp);
//	s << buffer;
//	return s;
//}
//
//inline std::ostream & operator<<(std::ostream & s, ap_interval_t & interval) {
//	char * buffer;
//	size_t size;
//	FILE * bufferfp = open_memstream(&buffer, &size);
//	ap_interval_fprint(bufferfp, &interval);
//	fclose(bufferfp);
//	s << buffer;
//	return s;
//}

#endif // AP_STREAM_H
