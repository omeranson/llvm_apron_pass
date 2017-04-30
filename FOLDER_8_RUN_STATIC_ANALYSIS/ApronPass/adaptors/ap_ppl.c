
#include <Adaptor.h>
#include <ap_ppl.h>

ap_manager_t * create_manager() {
	return ap_ppl_poly_manager_alloc(true);
}

