
#include <Adaptor.h>
#include <ap_ppl.h>

ap_manager_t * create_manager() {
	ap_manager_t * manager = ap_ppl_poly_manager_alloc(true);
	for (int i=0; i<AP_EXC_SIZE; i++) {
		ap_manager_set_abort_if_exception(manager, (ap_exc_t)i, true);
	}
	return manager;
}

