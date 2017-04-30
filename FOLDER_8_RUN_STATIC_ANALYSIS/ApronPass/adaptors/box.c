#include <stdlib.h>

#include <Adaptor.h>
#include <box.h>

static void set_algorithm(ap_manager_t * manager) {
	char * algo_str = getenv("BOX_ALGORITHM");
	if (!algo_str) {
		return;
	}
	int algorithm = atoi(algo_str);
	ap_funopt_t funopt = ap_manager_get_funopt(
			manager, AP_FUNID_MEET_TCONS_ARRAY);
	funopt.algorithm = algorithm;
	ap_manager_set_funopt(manager, AP_FUNID_MEET_TCONS_ARRAY, &funopt);
}

ap_manager_t * create_manager() {
	ap_manager_t * result = box_manager_alloc();
	set_algorithm(result);
	return result;
}

