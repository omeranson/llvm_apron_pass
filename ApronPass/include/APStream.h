#ifndef AP_STREAM_H
#define AP_STREAM_H

#include <stdio.h>
#include <utility>

#include <ap_abstract1.h>
#include <ap_environment.h>
#include <ap_interval.h>

extern ap_manager_t * apron_manager;

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

template <class stream>
inline stream & operator<<(stream & ro, ap_scalar_t & scalar)
{
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_scalar_fprint(bufferfp, &scalar);
	fclose(bufferfp);
	ro << buffer;
	return ro;
}

template <class stream>
inline stream & operator<<(stream & s, ap_environment_t * environment) {
	int env_size = environment->intdim;
	for (int cnt = 0; cnt < env_size; cnt++) {
		ap_var_t var = ap_environment_var_of_dim(environment, cnt);
		if (cnt != 0) {
			s << ", ";
		}
		s << (char*)var;
	}
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, std::pair<ap_manager_t*, const ap_abstract1_t*> value) {
	ap_manager_t* manager = value.first;
	const ap_abstract1_t* abst1 = value.second;
	ap_abstract1_t copy = ap_abstract1_copy(manager, (ap_abstract1_t*)abst1);
	ap_abstract1_canonicalize(manager, &copy);
	ap_environment_t * env = ap_abstract1_environment(manager, &copy);
	if (ap_abstract1_is_top(manager, &copy)) {
		s << "Top. Variables: " << env << "\n";
	} else if (ap_abstract1_is_bottom(manager, &copy)) {
		s << "Bottom. Variables: " << env << "\n";
	} else {
		ap_abstract1_minimize(manager, &copy);
		char * buffer;
		size_t size;
		FILE * bufferfp = open_memstream(&buffer, &size);
		ap_abstract1_fprint(bufferfp, manager, &copy);
		fclose(bufferfp);
		s << buffer << "Variables: " << env << "\n";
	}
	ap_abstract1_clear(manager, &copy);
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, const ap_abstract1_t* value) {
	s << std::make_pair(apron_manager, value);
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, ap_texpr1_t * texpr) {
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_texpr1_fprint(bufferfp, texpr);
	fclose(bufferfp);
	s << buffer;
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, ap_texpr1_t & texpr) {
	return (s << &texpr);
}


template <class stream>
inline stream & operator<<(stream & s, ap_tcons1_t * tcons) {
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_tcons1_fprint(bufferfp, tcons);
	fclose(bufferfp);
	s << buffer;
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, ap_tcons1_t & tcons) {
	return (s << &tcons);
}

template <class stream>
inline stream & operator<<(stream & s, ap_tcons1_array_t * tcons) {
	char * buffer;
	size_t size;
	FILE * bufferfp = open_memstream(&buffer, &size);
	ap_tcons1_array_fprint(bufferfp, tcons);
	fclose(bufferfp);
	s << buffer;
	return s;
}

template <class stream>
inline stream & operator<<(stream & s, ap_tcons1_array_t & tcons) {
	return (s << &tcons);
}

#endif // AP_STREAM_H
