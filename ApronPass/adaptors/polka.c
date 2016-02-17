
#include <Adaptor.h>
#include <pk.h>

ap_manager_t * create_manager() {
	return pk_manager_alloc(true);
}

