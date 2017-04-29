; ModuleID = 'socket.o.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.qstr = type { %union.anon.0, i8* }
%union.anon.0 = type { i64 }
%struct.vfsmount = type { %struct.dentry*, %struct.super_block*, i32 }
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [32 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i64, i8*, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.95 }
%struct.seqcount = type { i32 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i64, %union.anon.86, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.spinlock, i16, i32, i64, i64, %struct.mutex, i64, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.87, i64, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.file_operations*, %struct.file_lock*, %struct.address_space, %struct.list_head, %union.anon.92, i32, i32, %struct.hlist_head, i8* }
%struct.kuid_t = type { i32 }
%struct.kgid_t = type { i32 }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.nameidata*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, void (%struct.dentry*, %struct.nameidata*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.vfsmount*, %struct.dentry*, %struct.kstat*)*, i32 (%struct.dentry*, i8*, i8*, i64, i32)*, i64 (%struct.dentry*, i8*, i8*, i64)*, i64 (%struct.dentry*, i8*, i64)*, i32 (%struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16, i32*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, i32 (%struct.dentry*, %struct.file*, %struct.cred*)*, [40 x i8] }
%struct.nameidata = type opaque
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.file* }
%struct.file = type { %union.anon, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, %struct.atomic64_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space* }
%union.anon = type { %struct.callback_head }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%struct.atomic64_t = type { i64 }
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.rwlock_t = type { %struct.qrwlock }
%struct.qrwlock = type { %struct.atomic_t, %struct.arch_spinlock }
%struct.arch_spinlock = type { %union.anon.2 }
%union.anon.2 = type { i16 }
%struct.pid = type { %struct.atomic_t, i32, [3 x %struct.hlist_head], %struct.callback_head, [1 x %struct.upid] }
%struct.upid = type { i32, %struct.pid_namespace*, %struct.hlist_node }
%struct.pid_namespace = type { %struct.kref, [128 x %struct.pidmap], %struct.callback_head, i32, i32, %struct.task_struct*, %struct.kmem_cache*, i32, %struct.pid_namespace*, %struct.vfsmount*, %struct.dentry*, %struct.dentry*, %struct.bsd_acct_struct*, %struct.user_namespace*, %struct.work_struct, %struct.kgid_t, i32, i32, %struct.ns_common }
%struct.kref = type { %struct.atomic_t }
%struct.pidmap = type { %struct.atomic_t, i8* }
%struct.task_struct = type { i64, i8*, %struct.atomic_t, i32, i32, %struct.llist_node, i32, %struct.task_struct*, i64, i64, i32, i32, i32, i32, i32, i32, %struct.sched_class*, %struct.sched_entity, %struct.sched_rt_entity, %struct.task_group*, %struct.sched_dl_entity, i32, i32, i32, %struct.cpumask, %struct.sched_info, %struct.list_head, %struct.plist_node, %struct.rb_node, %struct.mm_struct*, %struct.mm_struct*, i32, [4 x %struct.vm_area_struct*], %struct.task_rss_stat, i32, i32, i32, i32, i32, i32, i8, i64, i32, i32, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, [3 x %struct.pid_link], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i64, i64, i64, i64, i64, %struct.cputime, i64, i64, i64, i64, i64, i64, %struct.task_cputime, [3 x %struct.list_head], %struct.cred*, %struct.cred*, [16 x i8], i32, i32, %struct.sysv_sem, %struct.sysv_shm, %struct.thread_struct, %struct.fs_struct*, %struct.files_struct*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i64, i64, i32 (i8*)*, i8*, %struct.sigset_t*, %struct.callback_head*, %struct.audit_context*, %struct.kuid_t, i32, %struct.seccomp, i32, i32, %struct.spinlock, %struct.raw_spinlock, %struct.rb_root, %struct.rb_node*, %struct.rt_mutex_waiter*, i8*, %struct.bio_list*, %struct.blk_plug*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, i64, %struct.siginfo*, %struct.task_io_accounting, i64, i64, i64, %struct.nodemask_t, %struct.seqcount, i32, i32, %struct.css_set*, %struct.list_head, %struct.robust_list_head*, %struct.compat_robust_list_head*, %struct.list_head, %struct.futex_pi_state*, [2 x %struct.perf_event_context*], %struct.mutex, %struct.list_head, %struct.mempolicy*, i16, i16, %struct.callback_head, %struct.pipe_inode_info*, %struct.page_frag, %struct.task_delay_info*, i32, i32, i64, i64, i64, i64, i64 }
%struct.llist_node = type { %struct.llist_node* }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64, %struct.sched_statistics, i32, %struct.sched_entity*, %struct.cfs_rq*, %struct.cfs_rq*, %struct.sched_avg }
%struct.load_weight = type { i64, i32 }
%struct.sched_statistics = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.cfs_rq = type opaque
%struct.sched_avg = type { i32, i32, i64, i64, i64 }
%struct.sched_rt_entity = type { %struct.list_head, i64, i64, i32, %struct.sched_rt_entity* }
%struct.task_group = type opaque
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i32, i32, i32, i32, i32, %struct.hrtimer }
%struct.hrtimer = type { %struct.timerqueue_node, %union.ktime, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i64, i32, i8*, [16 x i8] }
%struct.timerqueue_node = type { %struct.rb_node, %union.ktime }
%union.ktime = type { i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.timerqueue_head, %union.ktime, i64 ()*, %union.ktime, %union.ktime }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, %union.ktime, i32, i32, i64, i64, i64, %union.ktime, [4 x %struct.hrtimer_clock_base] }
%struct.timerqueue_head = type { %struct.rb_root, %struct.timerqueue_node* }
%struct.cpumask = type { [1 x i64] }
%struct.sched_info = type { i64, i64, i64, i64 }
%struct.plist_node = type { i32, %struct.list_head, %struct.list_head }
%struct.rb_node = type { i64, %struct.rb_node*, %struct.rb_node* }
%struct.mm_struct = type { %struct.vm_area_struct*, %struct.rb_root, i32, i64 (%struct.file*, i64, i64, i64, i64)*, i64, i64, i64, i64, %struct.pgd_t*, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [46 x i64], %struct.mm_rss_stat, %struct.linux_binfmt*, [1 x %struct.cpumask], %struct.mm_context_t, i64, %struct.core_state*, %struct.spinlock, %struct.kioctx_table*, %struct.file*, i8, %struct.uprobes_state }
%struct.vm_area_struct = type { i64, i64, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i64, %struct.mm_struct*, %struct.pgprot, i64, %union.anon.3, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i64, %struct.file*, i8*, %struct.mempolicy* }
%struct.pgprot = type { i64 }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { %struct.rb_node, i64 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.vm_fault*)*, void (%struct.vm_area_struct*, %struct.vm_fault*)*, i32 (%struct.vm_area_struct*, %struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i64, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.mempolicy*)*, %struct.mempolicy* (%struct.vm_area_struct*, i64)*, i32 (%struct.vm_area_struct*, i64, i64, i64)* }
%struct.vm_fault = type { i32, i64, i8*, %struct.page*, i64, %struct.pte_t* }
%struct.page = type { i64, %union.anon.5, %struct.anon.6, %union.anon.12, %union.anon.14, [8 x i8] }
%union.anon.5 = type { %struct.address_space* }
%struct.anon.6 = type { %union.anon.7, %union.anon.8 }
%union.anon.7 = type { i64 }
%union.anon.8 = type { i64 }
%union.anon.12 = type { %struct.list_head }
%union.anon.14 = type { i64 }
%struct.pte_t = type { i64 }
%struct.pgd_t = type { i64 }
%struct.rw_semaphore = type { i64, %struct.list_head, %struct.raw_spinlock, %struct.optimistic_spin_queue, %struct.task_struct* }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
%struct.mm_rss_stat = type { [3 x %struct.atomic64_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i8*, i32, i16, %struct.mutex, i8* }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.completion = type { i32, %struct.__wait_queue_head }
%struct.__wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.kioctx_table = type opaque
%struct.uprobes_state = type {}
%struct.task_rss_stat = type { i32, [3 x i32] }
%struct.pid_link = type { %struct.hlist_node, %struct.pid* }
%struct.cputime = type { i64, i64 }
%struct.task_cputime = type { i64, i64, i64 }
%struct.sysv_sem = type { %struct.sem_undo_list* }
%struct.sem_undo_list = type opaque
%struct.sysv_shm = type { %struct.list_head }
%struct.thread_struct = type { [3 x %struct.desc_struct], i64, i64, i64, i16, i16, i16, i16, i64, i64, [4 x %struct.perf_event*], i64, i64, i64, i64, i64, %struct.fpu, i64*, i64, i32, i8 }
%struct.desc_struct = type <{ %union.anon.16 }>
%union.anon.16 = type { %struct.anon.17 }
%struct.anon.17 = type { i32, i32 }
%struct.perf_event = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, i32, i32, %struct.perf_event*, %struct.pmu*, i32, i32, %struct.local64_t, %struct.atomic64_t, i64, i64, i64, i64, i64, i64, %struct.perf_event_attr, i16, i16, i16, %struct.hw_perf_event, %struct.perf_event_context*, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t, %struct.mutex, %struct.list_head, %struct.perf_event*, i32, i32, %struct.list_head, %struct.task_struct*, %struct.mutex, %struct.atomic_t, %struct.ring_buffer*, %struct.list_head, i64, i32, %struct.__wait_queue_head, %struct.fasync_struct*, i32, i32, i32, %struct.irq_work, %struct.atomic_t, void (%struct.perf_event*)*, %struct.callback_head, %struct.pid_namespace*, i64, void (%struct.perf_event*, %struct.perf_sample_data*, %struct.pt_regs*)*, i8*, %struct.ftrace_event_call*, %struct.event_filter* }
%struct.pmu = type { %struct.list_head, %struct.module*, %struct.device*, %struct.attribute_group**, i8*, i32, i32, i32*, %struct.perf_cpu_context*, i32, i32, void (%struct.pmu*)*, void (%struct.pmu*)*, i32 (%struct.perf_event*)*, i32 (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*)*, void (%struct.pmu*)*, i32 (%struct.pmu*)*, void (%struct.pmu*)*, i32 (%struct.perf_event*)*, void ()* }
%struct.module = type { i32, %struct.list_head, [56 x i8], %struct.module_kobject, %struct.module_attribute*, i8*, i8*, %struct.kobject*, %struct.kernel_symbol*, i64*, i32, %struct.kernel_param*, i32, i32, %struct.kernel_symbol*, i64*, %struct.kernel_symbol*, i64*, i32, i32, %struct.exception_table_entry*, i32 ()*, i8*, i8*, i32, i32, i32, i32, i32, i32, %struct.mod_arch_specific, i32, i32, %struct.list_head, %struct.bug_entry*, %struct.elf64_sym*, %struct.elf64_sym*, i32, i32, i8*, i8*, %struct.module_sect_attrs*, %struct.module_notes_attrs*, i8*, i8*, i32, i32, %struct.tracepoint**, i32, i8**, %struct.ftrace_event_call**, i32, %struct.list_head, %struct.list_head, void ()*, %struct.atomic_t }
%struct.module_kobject = type { %struct.kobject, %struct.module*, %struct.kobject*, %struct.module_param_attrs*, %struct.completion* }
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_uevent_env = type { [3 x i8*], [32 x i8*], i32, [2048 x i8], i32 }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)* }
%struct.sysfs_ops = type { i64 (%struct.kobject*, %struct.attribute*, i8*)*, i64 (%struct.kobject*, %struct.attribute*, i8*, i64)* }
%struct.attribute = type { i8*, i16 }
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.sock = type { %struct.sock_common, %struct.socket_lock_t, %struct.sk_buff_head, %struct.anon.46, i32, i32, i16, i32, i32, i32, %struct.atomic_t, i32, %struct.sk_filter*, %struct.socket_wq*, [2 x %struct.xfrm_policy*], i64, %struct.dst_entry*, %struct.dst_entry*, %struct.spinlock, %struct.atomic_t, %struct.atomic_t, i32, %struct.sk_buff_head, [4 x i8], i32, i32, i32, i32, i64, i64, i32, i32, i16, i32, i64, %struct.sk_buff_head, %struct.proto*, %struct.rwlock_t, i32, i32, i16, i16, i32, %struct.pid*, %struct.cred*, i64, i64, i8*, %struct.timer_list, %union.ktime, i16, i32, %struct.socket*, i8*, %struct.page_frag, %struct.sk_buff*, i32, i32, i8*, i32, i32, %struct.cg_proto*, void (%struct.sock*)*, void (%struct.sock*)*, void (%struct.sock*)*, void (%struct.sock*)*, i32 (%struct.sock*, %struct.sk_buff*)*, void (%struct.sock*)* }
%struct.sock_common = type { %union.anon.19, %union.anon.21, %union.anon.22, i16, i8, i8, i32, %union.anon.24, %struct.proto*, %struct.net*, %struct.in6_addr, %struct.in6_addr, [0 x i32], %union.anon.45, i32, %struct.atomic_t, [0 x i32] }
%union.anon.19 = type { i64 }
%union.anon.21 = type { i32 }
%union.anon.22 = type { i32 }
%union.anon.24 = type { %struct.hlist_node }
%struct.net = type { %struct.atomic_t, %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.list_head, %struct.list_head, %struct.user_namespace*, %struct.ns_common, %struct.proc_dir_entry*, %struct.proc_dir_entry*, %struct.ctl_table_set, %struct.sock*, %struct.sock*, %struct.list_head, %struct.hlist_head*, %struct.hlist_head*, i32, i32, i32, %struct.list_head, %struct.net_device*, %struct.netns_core, %struct.netns_mib, %struct.netns_packet, %struct.netns_unix, [32 x i8], %struct.netns_ipv4, %struct.netns_ipv6, %struct.netns_nf, %struct.netns_xt, %struct.netns_ct, [8 x i8], %struct.netns_nf_frag, %struct.sock*, %struct.sock*, %struct.net_generic*, [40 x i8], %struct.netns_xfrm, %struct.sock*, %struct.atomic_t, [52 x i8] }
%struct.proc_dir_entry = type opaque
%struct.ctl_table_set = type { i32 (%struct.ctl_table_set*)*, %struct.ctl_dir }
%struct.ctl_dir = type { %struct.ctl_table_header, %struct.rb_root }
%struct.ctl_table_header = type { %union.anon.37, %struct.completion*, %struct.ctl_table*, %struct.ctl_table_root*, %struct.ctl_table_set*, %struct.ctl_dir*, %struct.ctl_node* }
%union.anon.37 = type { %struct.anon.38 }
%struct.anon.38 = type { %struct.ctl_table*, i32, i32, i32 }
%struct.ctl_table = type { i8*, i8*, i32, i16, %struct.ctl_table*, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)*, %struct.ctl_table_poll*, i8*, i8* }
%struct.ctl_table_poll = type { %struct.atomic_t, %struct.__wait_queue_head }
%struct.ctl_table_root = type { %struct.ctl_table_set, %struct.ctl_table_set* (%struct.ctl_table_root*, %struct.nsproxy*)*, i32 (%struct.ctl_table_header*, %struct.ctl_table*)* }
%struct.ctl_node = type { %struct.rb_node, %struct.ctl_table_header* }
%struct.net_device = type { [16 x i8], %struct.hlist_node, i8*, i64, i64, i64, i32, i64, %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.anon.96, %struct.anon.97, i64, i64, i64, i64, i64, i64, i32, i32, %struct.net_device_stats, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic_t, %struct.net_device_ops*, %struct.ethtool_ops*, %struct.forwarding_accel_ops*, %struct.header_ops*, i32, i32, i16, i16, i8, i8, i8, i8, i32, i16, i16, i16, i16, [32 x i8], i8, i8, i16, i16, i16, %struct.spinlock, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.netdev_hw_addr_list, %struct.kset*, i8, i8, i32, i32, i8*, %struct.in_device*, %struct.dn_dev*, %struct.inet6_dev*, i8*, %struct.wireless_dev*, %struct.wpan_dev*, i64, i8*, %struct.netdev_rx_queue*, i32, i32, i64, i32 (%struct.sk_buff**)*, i8*, %struct.netdev_queue*, [32 x i8], [8 x i8], %struct.netdev_queue*, i32, i32, %struct.Qdisc*, i64, %struct.spinlock, %struct.xps_dev_maps*, %struct.cpu_rmap*, i64, i32, %struct.timer_list, i32*, %struct.list_head, %struct.hlist_node, %struct.list_head, i8, i8, [2 x i8], void (%struct.net_device*)*, %struct.netpoll_info*, %struct.net*, %union.anon.101, %struct.garp_port*, %struct.mrp_port*, %struct.device, [4 x %struct.attribute_group*], %struct.attribute_group*, %struct.rtnl_link_ops*, i32, i16, i16, i8, [16 x %struct.netdev_tc_txq], [16 x i8], %struct.phy_device*, %struct.lock_class_key*, i32, %struct.pm_qos_request, [56 x i8] }
%struct.anon.96 = type { %struct.list_head, %struct.list_head }
%struct.anon.97 = type { %struct.list_head, %struct.list_head }
%struct.net_device_stats = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.net_device_ops = type { i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i16 (%struct.net_device*, %struct.sk_buff*, i8*, i16 (%struct.net_device*, %struct.sk_buff*)*)*, void (%struct.net_device*, i32)*, void (%struct.net_device*)*, i32 (%struct.net_device*, i8*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ifreq*, i32)*, i32 (%struct.net_device*, %struct.ifmap*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.neigh_parms*)*, void (%struct.net_device*)*, %struct.rtnl_link_stats64* (%struct.net_device*, %struct.rtnl_link_stats64*)*, %struct.net_device_stats* (%struct.net_device*)*, i32 (%struct.net_device*, i16, i16)*, i32 (%struct.net_device*, i16, i16)*, void (%struct.net_device*)*, i32 (%struct.net_device*, %struct.netpoll_info*)*, void (%struct.net_device*)*, i32 (%struct.napi_struct*)*, i32 (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32, i16, i8)*, i32 (%struct.net_device*, i32, i32, i32)*, i32 (%struct.net_device*, i32, i1)*, i32 (%struct.net_device*, i32, %struct.ifla_vf_info*)*, i32 (%struct.net_device*, i32, i32)*, i32 (%struct.net_device*, i32, %struct.nlattr**)*, i32 (%struct.net_device*, i32, %struct.sk_buff*)*, i32 (%struct.net_device*, i8)*, i32 (%struct.net_device*, %struct.sk_buff*, i16, i32)*, i32 (%struct.net_device*, %struct.net_device*)*, i32 (%struct.net_device*, %struct.net_device*)*, i64 (%struct.net_device*, i64)*, i32 (%struct.net_device*, i64)*, i32 (%struct.neighbour*)*, void (%struct.neighbour*)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16, i16)*, i32 (%struct.ndmsg*, %struct.nlattr**, %struct.net_device*, i8*, i16)*, i32 (%struct.sk_buff*, %struct.netlink_callback*, %struct.net_device*, %struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.nlmsghdr*)*, i32 (%struct.sk_buff*, i32, i32, %struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.nlmsghdr*)*, i32 (%struct.net_device*, i1)*, i32 (%struct.net_device*, %struct.netdev_phys_item_id*)*, void (%struct.net_device*, i16, i16)*, void (%struct.net_device*, i16, i16)*, i8* (%struct.net_device*, %struct.net_device*)*, void (%struct.net_device*, i8*)*, i32 (%struct.sk_buff*, %struct.net_device*, i8*)*, i32 (%struct.net_device*)*, i64 (%struct.sk_buff*, %struct.net_device*, i64)* }
%struct.ifreq = type { %union.anon.98, %union.anon.99 }
%union.anon.98 = type { [16 x i8] }
%union.anon.99 = type { %struct.ifmap }
%struct.ifmap = type { i64, i64, i16, i8, i8, i8 }
%struct.neigh_parms = type { %struct.net*, %struct.net_device*, %struct.list_head, i32 (%struct.neighbour*)*, void (%struct.neighbour*)*, %struct.neigh_table*, i8*, i32, %struct.atomic_t, %struct.callback_head, i32, [12 x i32], [1 x i64] }
%struct.neigh_table = type { i32, i32, i32, i32 (i8*, %struct.net_device*, i32*)*, i32 (%struct.neighbour*)*, i32 (%struct.pneigh_entry*)*, void (%struct.pneigh_entry*)*, void (%struct.sk_buff*)*, i8*, %struct.neigh_parms, %struct.list_head, i32, i32, i32, i32, i64, %struct.delayed_work, %struct.timer_list, %struct.sk_buff_head, %struct.atomic_t, %struct.rwlock_t, i64, %struct.neigh_statistics*, %struct.neigh_hash_table*, %struct.pneigh_entry** }
%struct.pneigh_entry = type { %struct.pneigh_entry*, %struct.net*, %struct.net_device*, i8, [0 x i8] }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.workqueue_struct = type opaque
%struct.neigh_statistics = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.neigh_hash_table = type { %struct.neighbour**, i32, [4 x i32], %struct.callback_head }
%struct.neighbour = type { %struct.neighbour*, %struct.neigh_table*, %struct.neigh_parms*, i64, i64, %struct.rwlock_t, %struct.atomic_t, %struct.sk_buff_head, i32, %struct.timer_list, i64, %struct.atomic_t, i8, i8, i8, i8, %struct.seqlock_t, [32 x i8], %struct.hh_cache, i32 (%struct.neighbour*, %struct.sk_buff*)*, %struct.neigh_ops*, %struct.callback_head, %struct.net_device*, [0 x i8] }
%struct.seqlock_t = type { %struct.seqcount, %struct.spinlock }
%struct.hh_cache = type { i16, i16, %struct.seqlock_t, [12 x i64] }
%struct.neigh_ops = type { i32, void (%struct.neighbour*, %struct.sk_buff*)*, void (%struct.neighbour*, %struct.sk_buff*)*, i32 (%struct.neighbour*, %struct.sk_buff*)*, i32 (%struct.neighbour*, %struct.sk_buff*)* }
%struct.rtnl_link_stats64 = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.napi_struct = type { %struct.list_head, i64, i32, i32, i32 (%struct.napi_struct*, i32)*, %struct.spinlock, i32, %struct.net_device*, %struct.sk_buff*, %struct.sk_buff*, %struct.hrtimer, %struct.list_head, %struct.hlist_node, i32 }
%struct.ifla_vf_info = type { i32, [32 x i8], i32, i32, i32, i32, i32, i32 }
%struct.nlattr = type { i16, i16 }
%struct.ndmsg = type { i8, i8, i16, i32, i16, i8, i8 }
%struct.netlink_callback = type { %struct.sk_buff*, %struct.nlmsghdr*, i32 (%struct.sk_buff*, %struct.netlink_callback*)*, i32 (%struct.netlink_callback*)*, i8*, %struct.module*, i16, i16, i32, i32, [6 x i64] }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%struct.netdev_phys_item_id = type { [32 x i8], i8 }
%struct.ethtool_ops = type { i32 (%struct.net_device*, %struct.ethtool_cmd*)*, i32 (%struct.net_device*, %struct.ethtool_cmd*)*, void (%struct.net_device*, %struct.ethtool_drvinfo*)*, i32 (%struct.net_device*)*, void (%struct.net_device*, %struct.ethtool_regs*, i8*)*, void (%struct.net_device*, %struct.ethtool_wolinfo*)*, i32 (%struct.net_device*, %struct.ethtool_wolinfo*)*, i32 (%struct.net_device*)*, void (%struct.net_device*, i32)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_coalesce*)*, i32 (%struct.net_device*, %struct.ethtool_coalesce*)*, void (%struct.net_device*, %struct.ethtool_ringparam*)*, i32 (%struct.net_device*, %struct.ethtool_ringparam*)*, void (%struct.net_device*, %struct.ethtool_pauseparam*)*, i32 (%struct.net_device*, %struct.ethtool_pauseparam*)*, void (%struct.net_device*, %struct.ethtool_test*, i64*)*, void (%struct.net_device*, i32, i8*)*, i32 (%struct.net_device*, i32)*, void (%struct.net_device*, %struct.ethtool_stats*, i64*)*, i32 (%struct.net_device*)*, void (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, i32)*, i32 (%struct.net_device*, %struct.ethtool_rxnfc*, i32*)*, i32 (%struct.net_device*, %struct.ethtool_rxnfc*)*, i32 (%struct.net_device*, %struct.ethtool_flash*)*, i32 (%struct.net_device*, i32*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*)*, i32 (%struct.net_device*, i32*, i8*, i8*)*, i32 (%struct.net_device*, i32*, i8*, i8)*, void (%struct.net_device*, %struct.ethtool_channels*)*, i32 (%struct.net_device*, %struct.ethtool_channels*)*, i32 (%struct.net_device*, %struct.ethtool_dump*)*, i32 (%struct.net_device*, %struct.ethtool_dump*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_dump*)*, i32 (%struct.net_device*, %struct.ethtool_ts_info*)*, i32 (%struct.net_device*, %struct.ethtool_modinfo*)*, i32 (%struct.net_device*, %struct.ethtool_eeprom*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_eee*)*, i32 (%struct.net_device*, %struct.ethtool_eee*)*, i32 (%struct.net_device*, %struct.ethtool_tunable*, i8*)*, i32 (%struct.net_device*, %struct.ethtool_tunable*, i8*)* }
%struct.ethtool_cmd = type { i32, i32, i32, i16, i8, i8, i8, i8, i8, i8, i32, i32, i16, i8, i8, i32, [2 x i32] }
%struct.ethtool_drvinfo = type { i32, [32 x i8], [32 x i8], [32 x i8], [32 x i8], [32 x i8], [12 x i8], i32, i32, i32, i32, i32 }
%struct.ethtool_regs = type { i32, i32, i32, [0 x i8] }
%struct.ethtool_wolinfo = type { i32, i32, i32, [6 x i8] }
%struct.ethtool_coalesce = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_ringparam = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_pauseparam = type { i32, i32, i32, i32 }
%struct.ethtool_test = type { i32, i32, i32, i32, [0 x i64] }
%struct.ethtool_stats = type { i32, i32, [0 x i64] }
%struct.ethtool_rxnfc = type { i32, i32, i64, %struct.ethtool_rx_flow_spec, i32, [0 x i32] }
%struct.ethtool_rx_flow_spec = type { i32, %union.ethtool_flow_union, %struct.ethtool_flow_ext, %union.ethtool_flow_union, %struct.ethtool_flow_ext, i64, i32 }
%union.ethtool_flow_union = type { %struct.ethtool_tcpip4_spec, [36 x i8] }
%struct.ethtool_tcpip4_spec = type { i32, i32, i16, i16, i8 }
%struct.ethtool_flow_ext = type { [2 x i8], [6 x i8], i16, i16, [2 x i32] }
%struct.ethtool_flash = type { i32, i32, [128 x i8] }
%struct.ethtool_channels = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.ethtool_dump = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_ts_info = type { i32, i32, i32, i32, [3 x i32], i32, [3 x i32] }
%struct.ethtool_modinfo = type { i32, i32, i32, [8 x i32] }
%struct.ethtool_eeprom = type { i32, i32, i32, i32, [0 x i8] }
%struct.ethtool_eee = type { i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32] }
%struct.ethtool_tunable = type { i32, i32, i32, i32, [0 x i8*] }
%struct.forwarding_accel_ops = type opaque
%struct.header_ops = type { i32 (%struct.sk_buff*, %struct.net_device*, i16, i8*, i8*, i32)*, i32 (%struct.sk_buff*, i8*)*, i32 (%struct.sk_buff*)*, i32 (%struct.neighbour*, %struct.hh_cache*, i16)*, void (%struct.hh_cache*, %struct.net_device*, i8*)* }
%struct.netdev_hw_addr_list = type { %struct.list_head, i32 }
%struct.in_device = type opaque
%struct.dn_dev = type opaque
%struct.inet6_dev = type { %struct.net_device*, %struct.list_head, %struct.ifmcaddr6*, %struct.ifmcaddr6*, %struct.spinlock, i8, i8, i8, i8, i64, i64, i64, i64, %struct.timer_list, %struct.timer_list, %struct.timer_list, %struct.ifacaddr6*, %struct.rwlock_t, %struct.atomic_t, i32, i32, [8 x i8], %struct.timer_list, %struct.list_head, %struct.in6_addr, %struct.neigh_parms*, %struct.ipv6_devconf, %struct.ipv6_devstat, %struct.timer_list, i8, i8, i64, %struct.callback_head }
%struct.ifmcaddr6 = type { %struct.in6_addr, %struct.inet6_dev*, %struct.ifmcaddr6*, %struct.ip6_sf_list*, %struct.ip6_sf_list*, i32, i8, [2 x i64], %struct.timer_list, i32, i32, %struct.atomic_t, %struct.spinlock, i64, i64 }
%struct.ip6_sf_list = type { %struct.ip6_sf_list*, %struct.in6_addr, [2 x i64], i8, i8, i8 }
%struct.ifacaddr6 = type { %struct.in6_addr, %struct.inet6_dev*, %struct.rt6_info*, %struct.ifacaddr6*, i32, %struct.atomic_t, i64, i64 }
%struct.rt6_info = type opaque
%struct.ipv6_devconf = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }
%struct.ipv6_devstat = type { %struct.proc_dir_entry*, %struct.ipstats_mib*, %struct.icmpv6_mib_device*, %struct.icmpv6msg_mib_device* }
%struct.ipstats_mib = type { [36 x i64], %struct.u64_stats_sync }
%struct.u64_stats_sync = type {}
%struct.icmpv6_mib_device = type { [6 x %struct.atomic64_t] }
%struct.icmpv6msg_mib_device = type { [512 x %struct.atomic64_t] }
%struct.wireless_dev = type opaque
%struct.wpan_dev = type opaque
%struct.netdev_rx_queue = type { %struct.rps_map*, %struct.rps_dev_flow_table*, %struct.kobject, %struct.net_device*, [40 x i8] }
%struct.rps_map = type { i32, %struct.callback_head, [0 x i16] }
%struct.rps_dev_flow_table = type { i32, %struct.callback_head, [0 x %struct.rps_dev_flow] }
%struct.rps_dev_flow = type { i16, i16, i32 }
%struct.netdev_queue = type { %struct.net_device*, %struct.Qdisc*, %struct.Qdisc*, %struct.kobject, i32, [36 x i8], %struct.spinlock, i32, i64, i64, i64, [32 x i8], %struct.dql }
%struct.dql = type { i32, i32, i32, [52 x i8], i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, [20 x i8] }
%struct.Qdisc = type opaque
%struct.xps_dev_maps = type { %struct.callback_head, [0 x %struct.xps_map*] }
%struct.xps_map = type { i32, i32, %struct.callback_head, [0 x i16] }
%struct.cpu_rmap = type opaque
%struct.netpoll_info = type opaque
%union.anon.101 = type { i8* }
%struct.garp_port = type opaque
%struct.mrp_port = type opaque
%struct.device = type { %struct.device*, %struct.device_private*, %struct.kobject, i8*, %struct.device_type*, %struct.mutex, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.dev_pm_info, %struct.dev_pm_domain*, i32, i64*, i64, i64, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.dev_archdata, %struct.device_node*, %struct.acpi_dev_node, i32, i32, %struct.spinlock, %struct.list_head, %struct.klist_node, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, i8 }
%struct.device_private = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.device_attribute*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key }
%struct.device_attribute = type { %struct.attribute, i64 (%struct.device*, %struct.device_attribute*, i8*)*, i64 (%struct.device*, %struct.device_attribute*, i8*, i64)* }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.lock_class_key = type {}
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.dev_pm_ops*, %struct.driver_private* }
%struct.of_device_id = type { [32 x i8], [32 x i8], [128 x i8], i8* }
%struct.acpi_device_id = type { [9 x i8], i64 }
%struct.driver_private = type opaque
%struct.dev_pm_info = type { %struct.pm_message, [2 x i8], %struct.spinlock, %struct.list_head, %struct.completion, %struct.wakeup_source*, i8, %struct.timer_list, i64, %struct.work_struct, %struct.__wait_queue_head, %struct.atomic_t, %struct.atomic_t, [2 x i8], i32, i32, i32, i32, i64, i64, i64, i64, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.wakeup_source = type { i8*, %struct.list_head, %struct.spinlock, %struct.timer_list, i64, %union.ktime, %union.ktime, %union.ktime, %union.ktime, %union.ktime, i64, i64, i64, i64, i64, i8 }
%struct.pm_subsys_data = type { %struct.spinlock, i32 }
%struct.dev_pm_qos = type { %struct.pm_qos_constraints, %struct.pm_qos_constraints, %struct.pm_qos_flags, %struct.dev_pm_qos_request*, %struct.dev_pm_qos_request*, %struct.dev_pm_qos_request* }
%struct.pm_qos_constraints = type { %struct.plist_head, i32, i32, i32, i32, %struct.blocking_notifier_head* }
%struct.plist_head = type { %struct.list_head }
%struct.blocking_notifier_head = type { %struct.rw_semaphore, %struct.notifier_block* }
%struct.notifier_block = type { i32 (%struct.notifier_block*, i64, i8*)*, %struct.notifier_block*, i32 }
%struct.pm_qos_flags = type { %struct.list_head, i32 }
%struct.dev_pm_qos_request = type { i32, %union.anon.52, %struct.device* }
%union.anon.52 = type { %struct.plist_node }
%struct.dev_pm_domain = type { %struct.dev_pm_ops, void (%struct.device*, i1)* }
%struct.device_dma_parameters = type { i32, i64 }
%struct.dma_coherent_mem = type opaque
%struct.dev_archdata = type { %struct.dma_map_ops*, i8* }
%struct.dma_map_ops = type { i8* (%struct.device*, i64, i64*, i32, %struct.dma_attrs*)*, void (%struct.device*, i64, i8*, i64, %struct.dma_attrs*)*, i32 (%struct.device*, %struct.vm_area_struct*, i8*, i64, i64, %struct.dma_attrs*)*, i32 (%struct.device*, %struct.sg_table*, i8*, i64, i64, %struct.dma_attrs*)*, i64 (%struct.device*, %struct.page*, i64, i64, i32, %struct.dma_attrs*)*, void (%struct.device*, i64, i64, i32, %struct.dma_attrs*)*, i32 (%struct.device*, %struct.scatterlist*, i32, i32, %struct.dma_attrs*)*, void (%struct.device*, %struct.scatterlist*, i32, i32, %struct.dma_attrs*)*, void (%struct.device*, i64, i64, i32)*, void (%struct.device*, i64, i64, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, void (%struct.device*, %struct.scatterlist*, i32, i32)*, i32 (%struct.device*, i64)*, i32 (%struct.device*, i64)*, i32 (%struct.device*, i64)*, i32 }
%struct.dma_attrs = type { [1 x i64] }
%struct.sg_table = type { %struct.scatterlist*, i32, i32 }
%struct.scatterlist = type { i64, i32, i32, i64, i32 }
%struct.device_node = type { i8*, i8*, i32, i8*, %struct.fwnode_handle, %struct.property*, %struct.property*, %struct.device_node*, %struct.device_node*, %struct.device_node*, %struct.kobject, i64, i8* }
%struct.fwnode_handle = type { i32 }
%struct.property = type { i8*, i32, i8*, %struct.property*, i64, i32, %struct.bin_attribute }
%struct.bin_attribute = type { %struct.attribute, i64, i8*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.acpi_dev_node = type { %struct.acpi_device* }
%struct.acpi_device = type opaque
%struct.klist_node = type { i8*, %struct.list_head, %struct.kref }
%struct.class = type { i8*, %struct.module*, %struct.class_attribute*, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.class_attribute = type { %struct.attribute, i64 (%struct.class*, %struct.class_attribute*, i8*)*, i64 (%struct.class*, %struct.class_attribute*, i8*, i64)* }
%struct.iommu_group = type opaque
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.rtnl_link_ops = type { %struct.list_head, i8*, i64, void (%struct.net_device*)*, i32, %struct.nla_policy*, i32 (%struct.nlattr**, %struct.nlattr**)*, i32 (%struct.net*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**)*, i32 (%struct.net_device*, %struct.nlattr**, %struct.nlattr**)*, void (%struct.net_device*, %struct.list_head*)*, i64 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i64 (%struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*)*, i32 ()*, i32 ()*, i32, %struct.nla_policy*, i32 (%struct.nlattr**, %struct.nlattr**)*, i32 (%struct.net_device*, %struct.net_device*, %struct.nlattr**, %struct.nlattr**)*, i64 (%struct.net_device*, %struct.net_device*)*, i32 (%struct.sk_buff*, %struct.net_device*, %struct.net_device*)* }
%struct.nla_policy = type { i16, i16 }
%struct.netdev_tc_txq = type { i16, i16 }
%struct.phy_device = type { %struct.phy_driver*, %struct.mii_bus*, %struct.device, i32, %struct.phy_c45_device_ids, i8, i8, i8, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, %struct.work_struct, %struct.delayed_work, %struct.atomic_t, %struct.mutex, %struct.net_device*, void (%struct.net_device*)* }
%struct.phy_driver = type { i32, i8*, i32, i32, i32, i8*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*)*, void (%struct.phy_device*)*, i32 (%struct.phy_device*)*, i32 (%struct.phy_device*, %struct.ethtool_ts_info*)*, i32 (%struct.phy_device*, %struct.ifreq*)*, i1 (%struct.phy_device*, %struct.sk_buff*, i32)*, void (%struct.phy_device*, %struct.sk_buff*, i32)*, i32 (%struct.phy_device*, %struct.ethtool_wolinfo*)*, void (%struct.phy_device*, %struct.ethtool_wolinfo*)*, void (%struct.phy_device*)*, i32 (%struct.phy_device*, i32, i32, i32)*, void (%struct.phy_device*, i32, i32, i32, i32)*, %struct.device_driver }
%struct.mii_bus = type { i8*, [17 x i8], i8*, i32 (%struct.mii_bus*, i32, i32)*, i32 (%struct.mii_bus*, i32, i32, i16)*, i32 (%struct.mii_bus*)*, %struct.mutex, %struct.device*, i32, %struct.device, [32 x %struct.phy_device*], i32, i32* }
%struct.phy_c45_device_ids = type { i32, [8 x i32] }
%struct.pm_qos_request = type { %struct.plist_node, i32, %struct.delayed_work }
%struct.netns_core = type { %struct.ctl_table_header*, i32, %struct.prot_inuse* }
%struct.prot_inuse = type opaque
%struct.netns_mib = type { %struct.tcp_mib*, %struct.ipstats_mib*, %struct.linux_mib*, %struct.udp_mib*, %struct.udp_mib*, %struct.icmp_mib*, %struct.icmpmsg_mib*, %struct.proc_dir_entry*, %struct.udp_mib*, %struct.udp_mib*, %struct.ipstats_mib*, %struct.icmpv6_mib*, %struct.icmpv6msg_mib* }
%struct.tcp_mib = type { [16 x i64] }
%struct.linux_mib = type { [107 x i64] }
%struct.icmp_mib = type { [28 x i64] }
%struct.icmpmsg_mib = type { [512 x %struct.atomic64_t] }
%struct.udp_mib = type { [9 x i64] }
%struct.icmpv6_mib = type { [6 x i64] }
%struct.icmpv6msg_mib = type { [512 x %struct.atomic64_t] }
%struct.netns_packet = type { %struct.mutex, %struct.hlist_head }
%struct.netns_unix = type { i32, %struct.ctl_table_header* }
%struct.netns_ipv4 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ipv4_devconf*, %struct.ipv4_devconf*, %struct.fib_rules_ops*, i8, %struct.fib_table*, %struct.fib_table*, %struct.fib_table*, %struct.hlist_head*, %struct.sock*, %struct.sock**, %struct.inet_peer_base*, %struct.tcpm_hash_bucket*, i32, [52 x i8], %struct.netns_frags, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, i32, i32, i32, i32, i32, i32, %struct.local_ports, i32, i32, i32, i32, i32, i32, %struct.ping_group_range, %struct.atomic_t, i64*, %struct.mr_table*, %struct.atomic_t, [36 x i8] }
%struct.ipv4_devconf = type opaque
%struct.fib_rules_ops = type opaque
%struct.fib_table = type opaque
%struct.inet_peer_base = type { %struct.inet_peer*, %struct.seqlock_t, i32 }
%struct.inet_peer = type { %struct.inet_peer*, %struct.inet_peer*, %struct.inetpeer_addr, i32, [15 x i32], i32, i64, %union.anon.40, %union.anon.41, i32, %struct.atomic_t }
%struct.inetpeer_addr = type { %struct.inetpeer_addr_base, i16 }
%struct.inetpeer_addr_base = type { %union.anon.39 }
%union.anon.39 = type { [4 x i32] }
%union.anon.40 = type { %struct.list_head }
%union.anon.41 = type { %struct.callback_head }
%struct.tcpm_hash_bucket = type opaque
%struct.netns_frags = type { %struct.percpu_counter, i32, i32, i32, [12 x i8] }
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.xt_table = type opaque
%struct.local_ports = type { %struct.seqlock_t, [2 x i32] }
%struct.ping_group_range = type { %struct.seqlock_t, [2 x %struct.kgid_t] }
%struct.mr_table = type opaque
%struct.netns_ipv6 = type { %struct.netns_sysctl_ipv6, %struct.ipv6_devconf*, %struct.ipv6_devconf*, %struct.inet_peer_base*, [8 x i8], %struct.netns_frags, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.xt_table*, %struct.rt6_info*, %struct.rt6_statistics*, %struct.timer_list, %struct.hlist_head*, %struct.fib6_table*, [40 x i8], %struct.dst_ops, i32, i64, %struct.sock**, %struct.sock*, %struct.sock*, %struct.sock*, %struct.atomic_t, %struct.atomic_t, [8 x i8] }
%struct.netns_sysctl_ipv6 = type { %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.rt6_statistics = type opaque
%struct.fib6_table = type opaque
%struct.dst_ops = type { i16, i16, i32, i32 (%struct.dst_ops*)*, %struct.dst_entry* (%struct.dst_entry*, i32)*, i32 (%struct.dst_entry*)*, i32 (%struct.dst_entry*)*, i32* (%struct.dst_entry*, i64)*, void (%struct.dst_entry*)*, void (%struct.dst_entry*, %struct.net_device*, i32)*, %struct.dst_entry* (%struct.dst_entry*)*, void (%struct.sk_buff*)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*, i32)*, void (%struct.dst_entry*, %struct.sock*, %struct.sk_buff*)*, i32 (%struct.sk_buff*)*, %struct.neighbour* (%struct.dst_entry*, %struct.sk_buff*, i8*)*, %struct.kmem_cache*, [8 x i8], %struct.percpu_counter, [24 x i8] }
%struct.netns_nf = type { %struct.proc_dir_entry*, [13 x %struct.nf_logger*], %struct.ctl_table_header* }
%struct.nf_logger = type opaque
%struct.netns_xt = type { [13 x %struct.list_head], i8 }
%struct.netns_ct = type { %struct.atomic_t, i32, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, %struct.ctl_table_header*, i8*, i32, i32, i32, i32, i8, i32, i32, i32, %struct.seqcount, %struct.kmem_cache*, %struct.hlist_nulls_head*, %struct.hlist_head*, %struct.ct_pcpu*, %struct.ip_conntrack_stat*, %struct.nf_ct_event_notifier*, %struct.nf_exp_event_notifier*, %struct.nf_ip_net, %struct.hlist_head*, i32 }
%struct.hlist_nulls_head = type { %struct.hlist_nulls_node* }
%struct.hlist_nulls_node = type { %struct.hlist_nulls_node*, %struct.hlist_nulls_node** }
%struct.ct_pcpu = type { %struct.spinlock, %struct.hlist_nulls_head, %struct.hlist_nulls_head, %struct.hlist_nulls_head }
%struct.ip_conntrack_stat = type opaque
%struct.nf_ct_event_notifier = type opaque
%struct.nf_exp_event_notifier = type opaque
%struct.nf_ip_net = type { %struct.nf_generic_net, %struct.nf_tcp_net, %struct.nf_udp_net, %struct.nf_icmp_net, %struct.nf_icmp_net, %struct.ctl_table_header*, %struct.ctl_table* }
%struct.nf_generic_net = type { %struct.nf_proto_net, i32 }
%struct.nf_proto_net = type { %struct.ctl_table_header*, %struct.ctl_table*, %struct.ctl_table_header*, %struct.ctl_table*, i32 }
%struct.nf_tcp_net = type { %struct.nf_proto_net, [14 x i32], i32, i32, i32 }
%struct.nf_udp_net = type { %struct.nf_proto_net, [2 x i32] }
%struct.nf_icmp_net = type { %struct.nf_proto_net, i32 }
%struct.netns_nf_frag = type { %struct.netns_sysctl_ipv6, [32 x i8], %struct.netns_frags }
%struct.net_generic = type opaque
%struct.netns_xfrm = type { %struct.list_head, %struct.hlist_head*, %struct.hlist_head*, %struct.hlist_head*, i32, i32, %struct.work_struct, %struct.hlist_head, %struct.work_struct, %struct.list_head, %struct.hlist_head*, i32, [3 x %struct.hlist_head], [3 x %struct.xfrm_policy_hash], [6 x i32], %struct.work_struct, %struct.xfrm_policy_hthresh, %struct.sock*, %struct.sock*, i32, i32, i32, i32, %struct.ctl_table_header*, [16 x i8], %struct.dst_ops, %struct.dst_ops, %struct.spinlock, %struct.rwlock_t, %struct.mutex, %struct.flow_cache, %struct.atomic_t, %struct.list_head, %struct.spinlock, %struct.work_struct, %struct.work_struct, %struct.mutex }
%struct.xfrm_policy_hash = type { %struct.hlist_head*, i32, i8, i8, i8, i8 }
%struct.xfrm_policy_hthresh = type { %struct.work_struct, %struct.seqlock_t, i8, i8, i8, i8 }
%struct.flow_cache = type { i32, %struct.flow_cache_percpu*, %struct.notifier_block, i32, i32, %struct.timer_list }
%struct.flow_cache_percpu = type { %struct.hlist_head*, i32, i32, i32, %struct.tasklet_struct }
%struct.tasklet_struct = type { %struct.tasklet_struct*, i64, %struct.atomic_t, void (i64)*, i64 }
%struct.in6_addr = type { %union.anon.44 }
%union.anon.44 = type { [4 x i32] }
%union.anon.45 = type { %struct.hlist_node }
%struct.socket_lock_t = type { %struct.spinlock, i32, %struct.__wait_queue_head }
%struct.anon.46 = type { %struct.atomic_t, i32, %struct.sk_buff*, %struct.sk_buff* }
%struct.sk_filter = type { %struct.atomic_t, %struct.callback_head, %struct.bpf_prog* }
%struct.bpf_prog = type { i16, i8, i32, %struct.sock_fprog_kern*, %struct.bpf_prog_aux*, i32 (%struct.sk_buff*, %struct.bpf_insn*)*, %union.anon.47 }
%struct.sock_fprog_kern = type { i16, %struct.sock_filter* }
%struct.sock_filter = type { i16, i8, i8, i32 }
%struct.bpf_prog_aux = type opaque
%struct.bpf_insn = type { i8, i8, i16, i32 }
%union.anon.47 = type { [0 x %struct.sock_filter] }
%struct.socket_wq = type { %struct.__wait_queue_head, %struct.fasync_struct*, %struct.callback_head, [16 x i8] }
%struct.xfrm_policy = type opaque
%struct.dst_entry = type { %struct.callback_head, %struct.dst_entry*, %struct.net_device*, %struct.dst_ops*, i64, i64, %struct.dst_entry*, %struct.dst_entry*, %struct.xfrm_state*, i32 (%struct.sk_buff*)*, i32 (%struct.sock*, %struct.sk_buff*)*, i16, i16, i16, i16, i16, i16, i32, [2 x i64], %struct.atomic_t, i32, i64, %union.anon.43 }
%struct.xfrm_state = type opaque
%union.anon.43 = type { %struct.dst_entry* }
%struct.sk_buff_head = type { %struct.sk_buff*, %struct.sk_buff*, i32, %struct.spinlock }
%struct.proto = type { void (%struct.sock*, i64)*, i32 (%struct.sock*, %struct.sockaddr*, i32)*, i32 (%struct.sock*, i32)*, %struct.sock* (%struct.sock*, i32, i32*)*, i32 (%struct.sock*, i32, i64)*, i32 (%struct.sock*)*, void (%struct.sock*)*, void (%struct.sock*, i32)*, i32 (%struct.sock*, i32, i32, i8*, i32)*, i32 (%struct.sock*, i32, i32, i8*, i32*)*, i32 (%struct.sock*, i32, i32, i8*, i32)*, i32 (%struct.sock*, i32, i32, i8*, i32*)*, i32 (%struct.sock*, i32, i64)*, i32 (%struct.kiocb*, %struct.sock*, %struct.msghdr*, i64)*, i32 (%struct.kiocb*, %struct.sock*, %struct.msghdr*, i64, i32, i32, i32*)*, i32 (%struct.sock*, %struct.page*, i32, i64, i32)*, i32 (%struct.sock*, %struct.sockaddr*, i32)*, i32 (%struct.sock*, %struct.sk_buff*)*, void (%struct.sock*)*, void (%struct.sock*)*, void (%struct.sock*)*, void (%struct.sock*)*, i32 (%struct.sock*, i16)*, void (%struct.sock*, i32)*, i32, i1 (%struct.sock*)*, void (%struct.sock*)*, %struct.atomic64_t*, %struct.percpu_counter*, i32*, i64*, i32*, i32*, i32, i8, %struct.kmem_cache*, i32, i32, %struct.percpu_counter*, %struct.request_sock_ops*, %struct.timewait_sock_ops*, %union.anon.36, %struct.module*, [32 x i8], %struct.list_head }
%struct.kiocb = type { %struct.file*, %struct.kioctx*, i32 (%struct.kiocb*)*, i8*, %union.anon.25, i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }
%struct.kioctx = type opaque
%union.anon.25 = type { i8* }
%struct.eventfd_ctx = type opaque
%struct.msghdr = type { i8*, i32, %struct.iov_iter, i8*, i64, i32 }
%struct.iov_iter = type { i32, i64, i64, %union.anon.26, i64 }
%union.anon.26 = type { %struct.iovec* }
%struct.iovec = type { i8*, i64 }
%struct.sockaddr = type { i16, [14 x i8] }
%struct.request_sock_ops = type { i32, i32, %struct.kmem_cache*, i8*, i32 (%struct.sock*, %struct.request_sock*)*, void (%struct.sock*, %struct.sk_buff*, %struct.request_sock*)*, void (%struct.sock*, %struct.sk_buff*)*, void (%struct.request_sock*)*, void (%struct.sock*, %struct.request_sock*)* }
%struct.request_sock = type { %struct.sock_common, %struct.request_sock*, i16, i8, i8, i32, i32, i32, i64, %struct.request_sock_ops*, %struct.sock*, i32, i32 }
%struct.timewait_sock_ops = type { %struct.kmem_cache*, i8*, i32, i32 (%struct.sock*, %struct.sock*, i8*)*, void (%struct.sock*)* }
%union.anon.36 = type { %struct.inet_hashinfo* }
%struct.inet_hashinfo = type opaque
%struct.timer_list = type { %struct.list_head, i64, %struct.tvec_base*, void (i64)*, i64, i32, i32, i8*, [16 x i8] }
%struct.tvec_base = type opaque
%struct.socket = type { i32, i16, i64, %struct.socket_wq*, %struct.file*, %struct.sock*, %struct.proto_ops* }
%struct.proto_ops = type { i32, %struct.module*, i32 (%struct.socket*)*, i32 (%struct.socket*, %struct.sockaddr*, i32)*, i32 (%struct.socket*, %struct.sockaddr*, i32, i32)*, i32 (%struct.socket*, %struct.socket*)*, i32 (%struct.socket*, %struct.socket*, i32)*, i32 (%struct.socket*, %struct.sockaddr*, i32*, i32)*, i32 (%struct.file*, %struct.socket*, %struct.poll_table_struct*)*, i32 (%struct.socket*, i32, i64)*, i32 (%struct.socket*, i32, i64)*, i32 (%struct.socket*, i32)*, i32 (%struct.socket*, i32)*, i32 (%struct.socket*, i32, i32, i8*, i32)*, i32 (%struct.socket*, i32, i32, i8*, i32*)*, i32 (%struct.socket*, i32, i32, i8*, i32)*, i32 (%struct.socket*, i32, i32, i8*, i32*)*, i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64)*, i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64, i32)*, i32 (%struct.file*, %struct.socket*, %struct.vm_area_struct*)*, i64 (%struct.socket*, %struct.page*, i32, i64, i32)*, i64 (%struct.socket*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.sock*, i32)* }
%struct.poll_table_struct = type { void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)*, i64 }
%struct.sk_buff = type { %union.anon.27, %struct.sock*, %struct.net_device*, [48 x i8], i64, void (%struct.sk_buff*)*, %struct.sec_path*, %struct.nf_conntrack*, i32, i32, i16, i16, i16, i8, [0 x i32], [0 x i8], [4 x i8], i16, i16, %union.anon.32, i32, i32, i32, i16, i16, i32, i32, %union.anon.34, %union.anon.35, i16, i16, i16, i16, i16, i16, i16, [0 x i32], i32, i32, i8*, i8*, i32, %struct.atomic_t }
%union.anon.27 = type { %struct.anon.28 }
%struct.anon.28 = type { %struct.sk_buff*, %struct.sk_buff*, %union.anon.29 }
%union.anon.29 = type { %union.ktime }
%struct.sec_path = type opaque
%struct.nf_conntrack = type { %struct.atomic_t }
%union.anon.32 = type { i32 }
%union.anon.34 = type { i32 }
%union.anon.35 = type { i16 }
%struct.cg_proto = type { %struct.page_counter, %struct.percpu_counter, i32, [3 x i64], i64, %struct.mem_cgroup* }
%struct.page_counter = type { %struct.atomic64_t, i64, %struct.page_counter*, i64, i64 }
%struct.mem_cgroup = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.48, i8*, i16, i16, i32, %struct.kernfs_iattrs* }
%union.anon.48 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_ops = type { i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i64, i8, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)* }
%struct.seq_file = type { i8*, i64, i64, i64, i64, i64, i64, i64, %struct.mutex, %struct.seq_operations*, i32, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, i8*, %struct.mutex, i32, %struct.list_head, i8*, i64, i8, %struct.vm_operations_struct* }
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.module_param_attrs = type opaque
%struct.module_attribute = type { %struct.attribute, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*)*, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*, i64)*, void (%struct.module*, i8*)*, i32 (%struct.module*)*, void (%struct.module*)* }
%struct.kernel_param = type { i8*, %struct.kernel_param_ops*, i16, i8, i8, %union.anon.50 }
%struct.kernel_param_ops = type { i32, i32 (i8*, %struct.kernel_param*)*, i32 (i8*, %struct.kernel_param*)*, void (i8*)* }
%union.anon.50 = type { i8* }
%struct.kernel_symbol = type { i64, i8* }
%struct.exception_table_entry = type { i32, i32 }
%struct.mod_arch_specific = type {}
%struct.bug_entry = type { i32, i32, i16, i16 }
%struct.elf64_sym = type { i32, i8, i8, i16, i64, i64 }
%struct.module_sect_attrs = type opaque
%struct.module_notes_attrs = type opaque
%struct.tracepoint = type { i8*, %struct.static_key, void ()*, void ()*, %struct.tracepoint_func* }
%struct.static_key = type { %struct.atomic_t }
%struct.tracepoint_func = type { i8*, i8* }
%struct.perf_cpu_context = type { %struct.perf_event_context, %struct.perf_event_context*, i32, i32, %struct.hrtimer, %union.ktime, %struct.list_head, %struct.pmu*, %struct.perf_cgroup* }
%struct.perf_event_context = type { %struct.pmu*, i32, %struct.raw_spinlock, %struct.mutex, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i32, i32, i32, i32, %struct.atomic_t, %struct.task_struct*, i64, i64, %struct.perf_event_context*, i64, i64, i32, i32, i32, %struct.callback_head, %struct.delayed_work, i8 }
%struct.perf_cgroup = type opaque
%struct.local64_t = type { %struct.local_t }
%struct.local_t = type { %struct.atomic64_t }
%struct.perf_event_attr = type { i32, i32, i64, %union.anon.53, i64, i64, [8 x i8], %union.anon.54, i32, %union.anon.55, %union.anon.56, i64, i64, i32, i32, i64 }
%union.anon.53 = type { i64 }
%union.anon.54 = type { i32 }
%union.anon.55 = type { i64 }
%union.anon.56 = type { i64 }
%struct.hw_perf_event = type { %union.anon.57, i32, %struct.local64_t, i64, i64, %struct.local64_t, i64, i64, i64, i64 }
%union.anon.57 = type { %struct.anon.58 }
%struct.anon.58 = type { i64, i64, i64, i64, i32, i32, i32, i32, %struct.hw_perf_event_extra, %struct.hw_perf_event_extra, %struct.event_constraint* }
%struct.hw_perf_event_extra = type { i64, i32, i32, i32 }
%struct.event_constraint = type opaque
%struct.ring_buffer = type opaque
%struct.fasync_struct = type { %struct.spinlock, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.irq_work = type { i64, %struct.llist_node, void (%struct.irq_work*)* }
%struct.perf_sample_data = type { i64, %struct.perf_raw_record*, %struct.perf_branch_stack*, i64, i64, i64, %union.perf_mem_data_src, i64, i64, %struct.anon.63, i64, i64, i64, %struct.anon.64, %struct.perf_callchain_entry*, %struct.perf_regs, %struct.pt_regs, %struct.perf_regs, i64, [56 x i8] }
%struct.perf_raw_record = type { i32, i8* }
%struct.perf_branch_stack = type { i64, [0 x %struct.perf_branch_entry] }
%struct.perf_branch_entry = type { i64, i64, [8 x i8] }
%union.perf_mem_data_src = type { i64 }
%struct.anon.63 = type { i32, i32 }
%struct.anon.64 = type { i32, i32 }
%struct.perf_callchain_entry = type { i64, [127 x i64] }
%struct.pt_regs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.perf_regs = type { i64, %struct.pt_regs* }
%struct.ftrace_event_call = type { %struct.list_head, %struct.ftrace_event_class*, %union.anon.51, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }
%struct.ftrace_event_class = type { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }
%union.anon.51 = type { i8* }
%struct.trace_event = type { %struct.hlist_node, %struct.list_head, i32, %struct.trace_event_functions* }
%struct.trace_event_functions = type { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)*, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)*, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)*, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* }
%struct.trace_iterator = type { %struct.trace_array*, %struct.tracer*, %struct.trace_buffer*, i8*, i32, %struct.mutex, %struct.ring_buffer_iter**, i64, %struct.trace_seq, [1 x %struct.cpumask], i8, %struct.trace_seq, %struct.trace_entry*, i64, i32, i32, i32, i64, i64, i64 }
%struct.trace_array = type opaque
%struct.tracer = type opaque
%struct.trace_buffer = type opaque
%struct.ring_buffer_iter = type opaque
%struct.trace_seq = type { [4096 x i8], %struct.seq_buf, i32 }
%struct.seq_buf = type { i8*, i64, i64, i64 }
%struct.trace_entry = type { i16, i8, i8, i32 }
%struct.event_filter = type opaque
%struct.fpu = type { i32, i32, %union.thread_xstate* }
%union.thread_xstate = type { %struct.i387_fxsave_struct, [576 x i8] }
%struct.i387_fxsave_struct = type { i16, i16, i16, i16, %union.anon.65, i32, i32, [32 x i32], [64 x i32], [12 x i32], %union.anon.68 }
%union.anon.65 = type { %struct.anon.66 }
%struct.anon.66 = type { i64, i64 }
%union.anon.68 = type { [12 x i32] }
%struct.fs_struct = type opaque
%struct.files_struct = type opaque
%struct.nsproxy = type { %struct.atomic_t, %struct.uts_namespace*, %struct.ipc_namespace*, %struct.mnt_namespace*, %struct.pid_namespace*, %struct.net* }
%struct.uts_namespace = type opaque
%struct.ipc_namespace = type opaque
%struct.mnt_namespace = type opaque
%struct.signal_struct = type { %struct.atomic_t, %struct.atomic_t, i32, %struct.list_head, %struct.__wait_queue_head, %struct.task_struct*, %struct.sigpending, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, %struct.pid*, %union.ktime, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.task_cputime, [3 x %struct.list_head], %struct.pid*, i32, %struct.tty_struct*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.cputime, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.task_io_accounting, i64, [16 x %struct.rlimit], %struct.pacct_struct, %struct.taskstats*, i32, i32, %struct.tty_audit_buf*, %struct.rw_semaphore, i32, i16, i16, %struct.mutex }
%struct.cpu_itimer = type { i64, i64, i32, i32 }
%struct.thread_group_cputimer = type { %struct.task_cputime, i32, %struct.raw_spinlock }
%struct.tty_struct = type opaque
%struct.rlimit = type { i64, i64 }
%struct.pacct_struct = type { i32, i64, i64, i64, i64, i64, i64 }
%struct.taskstats = type { i16, i32, i8, i8, i64, i64, i64, i64, i64, i64, i64, i64, [32 x i8], i8, [3 x i8], [4 x i8], i32, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.tty_audit_buf = type opaque
%struct.sighand_struct = type { %struct.atomic_t, [64 x %struct.k_sigaction], %struct.spinlock, %struct.__wait_queue_head }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i64, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [1 x i64] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.audit_context = type opaque
%struct.seccomp = type { i32, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.raw_spinlock = type { %struct.arch_spinlock }
%struct.rb_root = type { %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.backing_dev_info = type opaque
%struct.io_context = type opaque
%struct.siginfo = type { i32, i32, i32, %union.anon.70 }
%union.anon.70 = type { %struct.anon.74, [80 x i8] }
%struct.anon.74 = type { i32, i32, i32, i64, i64 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [1 x i64] }
%struct.css_set = type { %struct.atomic_t, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.cgroup*, [4 x %struct.cgroup_subsys_state*], %struct.list_head, %struct.list_head, %struct.cgroup*, %struct.css_set*, [4 x %struct.list_head], %struct.callback_head }
%struct.cgroup_subsys_state = type { %struct.cgroup*, %struct.cgroup_subsys*, %struct.percpu_ref, %struct.cgroup_subsys_state*, %struct.list_head, %struct.list_head, i32, i32, i64, %struct.callback_head, %struct.work_struct }
%struct.cgroup_subsys = type { %struct.cgroup_subsys_state* (%struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, void (%struct.cgroup_subsys_state*)*, i32 (%struct.cgroup_subsys_state*, %struct.cgroup_taskset*)*, void (%struct.cgroup_subsys_state*, %struct.cgroup_taskset*)*, void (%struct.cgroup_subsys_state*, %struct.cgroup_taskset*)*, void (%struct.task_struct*)*, void (%struct.cgroup_subsys_state*, %struct.cgroup_subsys_state*, %struct.task_struct*)*, void (%struct.cgroup_subsys_state*)*, i32, i32, i8, i8, i32, i8*, %struct.cgroup_root*, %struct.idr, %struct.list_head, %struct.cftype*, %struct.cftype*, i32 }
%struct.cgroup_taskset = type opaque
%struct.cgroup_root = type { %struct.kernfs_root*, i32, i32, %struct.cgroup, %struct.atomic_t, %struct.list_head, i32, %struct.idr, [4096 x i8], [64 x i8] }
%struct.kernfs_root = type { %struct.kernfs_node*, i32, %struct.ida, %struct.kernfs_syscall_ops*, %struct.list_head, %struct.__wait_queue_head }
%struct.ida = type { %struct.idr, %struct.ida_bitmap* }
%struct.ida_bitmap = type { i64, [15 x i64] }
%struct.kernfs_syscall_ops = type { i32 (%struct.kernfs_root*, i32*, i8*)*, i32 (%struct.seq_file*, %struct.kernfs_root*)*, i32 (%struct.kernfs_node*, i8*, i16)*, i32 (%struct.kernfs_node*)*, i32 (%struct.kernfs_node*, %struct.kernfs_node*, i8*)* }
%struct.cgroup = type { %struct.cgroup_subsys_state, i64, i32, i32, %struct.kernfs_node*, %struct.kernfs_node*, i32, i32, [4 x %struct.cgroup_subsys_state*], %struct.cgroup_root*, %struct.list_head, [4 x %struct.list_head], %struct.list_head, %struct.mutex, %struct.__wait_queue_head, %struct.work_struct }
%struct.idr = type { %struct.idr_layer*, %struct.idr_layer*, i32, i32, %struct.spinlock, i32, %struct.idr_layer* }
%struct.idr_layer = type { i32, i32, [256 x %struct.idr_layer*], i32, %union.anon.49 }
%union.anon.49 = type { [4 x i64] }
%struct.cftype = type { [64 x i8], i32, i16, i64, i32, %struct.cgroup_subsys*, %struct.list_head, %struct.kernfs_ops*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i64 (%struct.cgroup_subsys_state*, %struct.cftype*)*, i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i32 (%struct.cgroup_subsys_state*, %struct.cftype*, i64)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)* }
%struct.percpu_ref = type { %struct.atomic64_t, i64, void (%struct.percpu_ref*)*, void (%struct.percpu_ref*)*, i8, %struct.callback_head }
%struct.robust_list_head = type opaque
%struct.compat_robust_list_head = type { %struct.compat_robust_list, i32, i32 }
%struct.compat_robust_list = type { i32 }
%struct.futex_pi_state = type opaque
%struct.mempolicy = type opaque
%struct.pipe_inode_info = type opaque
%struct.page_frag = type { %struct.page*, i32, i32 }
%struct.task_delay_info = type { %struct.spinlock, i32, i64, i64, i64, i32, i32, i64, i64, i32 }
%struct.kmem_cache = type opaque
%struct.bsd_acct_struct = type opaque
%struct.user_namespace = type opaque
%struct.work_struct = type { %struct.atomic64_t, %struct.list_head, void (%struct.work_struct*)* }
%struct.ns_common = type { %struct.atomic64_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
%struct.cred = type { %struct.atomic_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %struct.callback_head }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.key = type { %struct.atomic_t, i32, %union.anon.1, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.79, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i64, %union.anon.80, %union.anon.82, %union.anon.83 }
%union.anon.1 = type { %struct.rb_node }
%struct.key_user = type opaque
%union.anon.79 = type { i64 }
%union.anon.80 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { %struct.key_type*, i8*, i64 }
%struct.key_type = type opaque
%union.anon.82 = type { %struct.list_head }
%union.anon.83 = type { %union.anon.84 }
%union.anon.84 = type { [2 x i8*] }
%struct.user_struct = type { %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i64, i64, %struct.key*, %struct.key*, %struct.hlist_node, %struct.kuid_t, %struct.atomic64_t }
%struct.group_info = type { %struct.atomic_t, i32, i32, [32 x %struct.kgid_t], [0 x %struct.kgid_t*] }
%struct.file_ra_state = type { i64, i32, i32, i32, i32, i64 }
%struct.kstat = type { i64, i32, i16, i32, %struct.kuid_t, %struct.kgid_t, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64 }
%struct.fiemap_extent_info = type { i32, i32, i32, %struct.fiemap_extent* }
%struct.fiemap_extent = type { i64, i64, i64, [2 x i64], i32, [3 x i32] }
%union.anon.86 = type { i32 }
%struct.timespec = type { i64, i64 }
%struct.spinlock = type { %union.anon.15 }
%union.anon.15 = type { %struct.raw_spinlock }
%struct.mutex = type { %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%union.anon.87 = type { %struct.callback_head }
%struct.atomic_t = type { i32 }
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, void (%struct.file*, %struct.vm_area_struct*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (%struct.kiocb*, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)* }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.file_lock = type { %struct.file_lock*, %struct.hlist_node, %struct.list_head, i8*, i32, i8, i32, i32, %struct.pid*, %struct.__wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i64, i64, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.88 }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i32 (%struct.file_lock*, %struct.file_lock*)*, i64 (%struct.file_lock*)*, void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock**, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)* }
%union.anon.88 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.address_space = type { %struct.inode*, %struct.radix_tree_root, %struct.spinlock, %struct.atomic_t, %struct.rb_root, %struct.list_head, %struct.rw_semaphore, i64, i64, i64, %struct.address_space_operations*, i64, %struct.backing_dev_info*, %struct.spinlock, %struct.list_head, i8* }
%struct.radix_tree_root = type { i32, i32, %struct.radix_tree_node* }
%struct.radix_tree_node = type { i32, i32, %union.anon.90, %struct.list_head, [64 x i8*], [3 x [1 x i64]] }
%union.anon.90 = type { %struct.anon.91 }
%struct.anon.91 = type { %struct.radix_tree_node*, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i64 (i32, %struct.kiocb*, %struct.iov_iter*, i64)*, i32 (%struct.address_space*, i64, i32, i8**, i64*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i32 (%struct.page*)*, i32 (%struct.page*, i64, i64)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.writeback_control = type opaque
%struct.swap_info_struct = type opaque
%union.anon.92 = type { %struct.pipe_inode_info* }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.lockref = type { %union.anon.93 }
%union.anon.93 = type { i64 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, %struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.dentry*, i1)*, [40 x i8] }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%union.anon.95 = type { %struct.hlist_node }
%struct.super_block = type { %struct.list_head, i32, i8, i64, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i64, i64, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.list_head, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, [32 x i8], [16 x i8], i8*, i32, i32, i32, %struct.mutex, i8*, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic64_t, i32, %struct.workqueue_struct*, %struct.hlist_head, [24 x i8], %struct.list_lru, [48 x i8], %struct.list_lru, %struct.callback_head, i32, [28 x i8] }
%struct.file_system_type = type { i8*, i32, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i64 (%struct.super_block*, i32)*, i64 (%struct.super_block*, i64, i32)* }
%struct.kstatfs = type opaque
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.atomic_t, %struct.__wait_queue_head, %struct.super_block*, %struct.kqid, i64, i64, %struct.mem_dqblk }
%struct.kqid = type { %union.anon.85, i32 }
%union.anon.85 = type { %struct.kuid_t }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)* }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.if_dqinfo*)*, i32 (%struct.super_block*, i32, %struct.if_dqinfo*)*, i32 (%struct.super_block*, i64, %struct.fs_disk_quota*)*, i32 (%struct.super_block*, i64, %struct.fs_disk_quota*)*, i32 (%struct.super_block*, %struct.fs_quota_stat*)*, i32 (%struct.super_block*, i32, i32)*, i32 (%struct.super_block*, %struct.fs_quota_statv*)*, i32 (%struct.super_block*, i32)* }
%struct.if_dqinfo = type { i64, i64, i32, i32 }
%struct.fs_disk_quota = type { i8, i8, i16, i32, i64, i64, i64, i64, i64, i64, i32, i32, i16, i16, i32, i64, i64, i64, i32, i16, i16, [8 x i8] }
%struct.fs_quota_stat = type { i8, i16, i8, %struct.fs_qfilestat, %struct.fs_qfilestat, i32, i32, i32, i32, i16, i16 }
%struct.fs_qfilestat = type { i64, i64, i32 }
%struct.fs_quota_statv = type { i8, i8, i16, i32, %struct.fs_qfilestatv, %struct.fs_qfilestatv, %struct.fs_qfilestatv, i32, i32, i32, i16, i16, [8 x i64] }
%struct.fs_qfilestatv = type { i64, i64, i32, i32 }
%struct.export_operations = type opaque
%struct.xattr_handler = type { i8*, i32, i64 (%struct.dentry*, i8*, i64, i8*, i64, i32)*, i32 (%struct.dentry*, i8*, i8*, i64, i32)*, i32 (%struct.dentry*, i8*, i8*, i64, i32, i32)* }
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, %struct.list_head, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i32, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.list_head, i64, i32, %struct.mutex }
%struct.hd_struct = type opaque
%struct.gendisk = type opaque
%struct.request_queue = type opaque
%struct.mtd_info = type opaque
%struct.quota_info = type { i32, %struct.mutex, %struct.mutex, [2 x %struct.inode*], [2 x %struct.mem_dqinfo], [2 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i64, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)* }
%struct.sb_writers = type { [3 x %struct.percpu_counter], %struct.__wait_queue_head, i32, %struct.__wait_queue_head }
%struct.shrinker = type { i64 (%struct.shrinker*, %struct.shrink_control*)*, i64 (%struct.shrinker*, %struct.shrink_control*)*, i32, i64, i64, %struct.list_head, %struct.atomic64_t* }
%struct.shrink_control = type { i32, i64, i32 }
%struct.list_lru = type { %struct.list_lru_node*, %struct.nodemask_t }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_head, i64, [32 x i8] }
%struct.net_proto_family = type { i32, i32 (%struct.net*, %struct.socket*, i32, i32)*, %struct.module* }
%struct.user_msghdr = type { i8*, i32, %struct.iovec*, i64, i8*, i64, i32 }
%struct.mmsghdr = type { %struct.user_msghdr, i32 }
%struct.__kernel_sockaddr_storage = type { i16, [126 x i8] }
%struct.anon = type { i32, i32 }
%struct.sock_iocb = type { %struct.list_head, i32, i32, %struct.socket*, %struct.sock*, %struct.scm_cookie*, %struct.msghdr*, %struct.msghdr, %struct.kiocb* }
%struct.scm_cookie = type { %struct.pid*, %struct.scm_fp_list*, %struct.scm_creds, i32 }
%struct.scm_fp_list = type { i16, i16, [253 x %struct.file*] }
%struct.scm_creds = type { i32, %struct.kuid_t, %struct.kgid_t }
%struct.kvec = type { i8*, i64 }
%struct.thread_info = type { %struct.task_struct*, %struct.exec_domain*, i32, i32, i32, i32, %struct.mm_segment_t, %struct.restart_block, i8*, i8 }
%struct.exec_domain = type { i8*, void (i32, %struct.pt_regs*)*, i8, i8, i64*, i64*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.module*, %struct.exec_domain* }
%struct.map_segment = type opaque
%struct.mm_segment_t = type { i64 }
%struct.restart_block = type { i64 (%struct.restart_block*)*, %union.anon.102 }
%union.anon.102 = type { %struct.anon.103 }
%struct.anon.103 = type { i32*, i32, i32, i32, i64, i32* }
%struct.scm_timestamping = type { [3 x %struct.timespec] }
%struct.timeval = type { i64, i64 }
%struct.used_address = type { %struct.__kernel_sockaddr_storage, i32, [4 x i8] }
%struct.compat_msghdr = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.compat_mmsghdr = type { %struct.compat_msghdr, i32 }
%struct.__large_struct = type { [100 x i64] }
%struct.in6_rtmsg = type { %struct.in6_addr, %struct.in6_addr, %struct.in6_addr, i32, i16, i16, i32, i64, i32, i32 }
%struct.rtentry = type { i64, %struct.sockaddr, %struct.sockaddr, %struct.sockaddr, i16, i16, i64, i8*, i16, i8*, i64, i64, i16 }
%struct.compat_ifconf = type { i32, i32 }
%struct.ifconf = type { i32, %union.anon.109 }
%union.anon.109 = type { i8* }
%struct.compat_ifreq = type { %union.anon.107, %union.anon.108 }
%union.anon.107 = type { [16 x i8] }
%union.anon.108 = type { %struct.compat_ifmap }
%struct.compat_ifmap = type { i32, i32, i16, i8, i8, i8 }
%struct.raw_hdlc_proto = type { i16, i16 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@sock_alloc_file.name = private unnamed_addr constant %struct.qstr { %union.anon.0 zeroinitializer, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0) }, align 8
@sock_mnt = internal unnamed_addr global %struct.vfsmount* null, section ".data..read_mostly", align 8
@socket_file_ops = internal constant %struct.file_operations { %struct.module* null, i64 (%struct.file*, i64, i32)* @no_llseek, i64 (%struct.file*, i8*, i64, i64*)* null, i64 (%struct.file*, i8*, i64, i64*)* null, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* @sock_aio_read, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* @sock_aio_write, i64 (%struct.kiocb*, %struct.iov_iter*)* null, i64 (%struct.kiocb*, %struct.iov_iter*)* null, i32 (%struct.file*, %struct.dir_context*)* null, i32 (%struct.file*, %struct.poll_table_struct*)* @sock_poll, i64 (%struct.file*, i32, i64)* @sock_ioctl, i64 (%struct.file*, i32, i64)* @compat_sock_ioctl, i32 (%struct.file*, %struct.vm_area_struct*)* @sock_mmap, void (%struct.file*, %struct.vm_area_struct*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i8*)* null, i32 (%struct.inode*, %struct.file*)* @sock_close, i32 (%struct.file*, i64, i64, i32)* null, i32 (%struct.kiocb*, i32)* null, i32 (i32, %struct.file*, i32)* @sock_fasync, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)* @sock_sendpage, i64 (%struct.file*, i64, i64, i64, i64)* null, i32 (i32)* null, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)* @generic_splice_sendpage, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)* @sock_splice_read, i32 (%struct.file*, i64, %struct.file_lock**, i8**)* null, i64 (%struct.file*, i32, i64, i64)* null, void (%struct.seq_file*, %struct.file*)* null }, align 8
@__kstrtab_sock_alloc_file = internal constant [16 x i8] c"sock_alloc_file\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_alloc_file = constant %struct.kernel_symbol { i64 ptrtoint (%struct.file* (%struct.socket*, i32, i8*)* @sock_alloc_file to i64), i8* getelementptr inbounds ([16 x i8]* @__kstrtab_sock_alloc_file, i32 0, i32 0) }, section "___ksymtab+sock_alloc_file", align 8
@__kstrtab_sock_from_file = internal constant [15 x i8] c"sock_from_file\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_from_file = constant %struct.kernel_symbol { i64 ptrtoint (%struct.socket* (%struct.file*, i32*)* @sock_from_file to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_sock_from_file, i32 0, i32 0) }, section "___ksymtab+sock_from_file", align 8
@__kstrtab_sockfd_lookup = internal constant [14 x i8] c"sockfd_lookup\00", section "__ksymtab_strings", align 1
@__ksymtab_sockfd_lookup = constant %struct.kernel_symbol { i64 ptrtoint (%struct.socket* (i32, i32*)* @sockfd_lookup to i64), i8* getelementptr inbounds ([14 x i8]* @__kstrtab_sockfd_lookup, i32 0, i32 0) }, section "___ksymtab+sockfd_lookup", align 8
@.str1 = private unnamed_addr constant [30 x i8] c"\013%s: fasync list not empty!\0A\00", align 1
@__func__.sock_release = private unnamed_addr constant [13 x i8] c"sock_release\00", align 1
@sockets_in_use = internal global i32 0, section ".data..percpu", align 4
@__kstrtab_sock_release = internal constant [13 x i8] c"sock_release\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_release = constant %struct.kernel_symbol { i64 ptrtoint (void (%struct.socket*)* @sock_release to i64), i8* getelementptr inbounds ([13 x i8]* @__kstrtab_sock_release, i32 0, i32 0) }, section "___ksymtab+sock_release", align 8
@__kstrtab___sock_tx_timestamp = internal constant [20 x i8] c"__sock_tx_timestamp\00", section "__ksymtab_strings", align 1
@__ksymtab___sock_tx_timestamp = constant %struct.kernel_symbol { i64 ptrtoint (void (%struct.sock*, i8*)* @__sock_tx_timestamp to i64), i8* getelementptr inbounds ([20 x i8]* @__kstrtab___sock_tx_timestamp, i32 0, i32 0) }, section "___ksymtab+__sock_tx_timestamp", align 8
@__kstrtab_sock_sendmsg = internal constant [13 x i8] c"sock_sendmsg\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_sendmsg = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.msghdr*, i64)* @sock_sendmsg to i64), i8* getelementptr inbounds ([13 x i8]* @__kstrtab_sock_sendmsg, i32 0, i32 0) }, section "___ksymtab+sock_sendmsg", align 8
@__kstrtab_kernel_sendmsg = internal constant [15 x i8] c"kernel_sendmsg\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_sendmsg = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.msghdr*, %struct.kvec*, i64, i64)* @kernel_sendmsg to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_kernel_sendmsg, i32 0, i32 0) }, section "___ksymtab+kernel_sendmsg", align 8
@__kstrtab___sock_recv_timestamp = internal constant [22 x i8] c"__sock_recv_timestamp\00", section "__ksymtab_strings", align 1
@__ksymtab___sock_recv_timestamp = constant %struct.kernel_symbol { i64 ptrtoint (void (%struct.msghdr*, %struct.sock*, %struct.sk_buff*)* @__sock_recv_timestamp to i64), i8* getelementptr inbounds ([22 x i8]* @__kstrtab___sock_recv_timestamp, i32 0, i32 0) }, section "___ksymtab_gpl+__sock_recv_timestamp", align 8
@__kstrtab___sock_recv_wifi_status = internal constant [24 x i8] c"__sock_recv_wifi_status\00", section "__ksymtab_strings", align 1
@__ksymtab___sock_recv_wifi_status = constant %struct.kernel_symbol { i64 ptrtoint (void (%struct.msghdr*, %struct.sock*, %struct.sk_buff*)* @__sock_recv_wifi_status to i64), i8* getelementptr inbounds ([24 x i8]* @__kstrtab___sock_recv_wifi_status, i32 0, i32 0) }, section "___ksymtab_gpl+__sock_recv_wifi_status", align 8
@__kstrtab___sock_recv_ts_and_drops = internal constant [25 x i8] c"__sock_recv_ts_and_drops\00", section "__ksymtab_strings", align 1
@__ksymtab___sock_recv_ts_and_drops = constant %struct.kernel_symbol { i64 ptrtoint (void (%struct.msghdr*, %struct.sock*, %struct.sk_buff*)* @__sock_recv_ts_and_drops to i64), i8* getelementptr inbounds ([25 x i8]* @__kstrtab___sock_recv_ts_and_drops, i32 0, i32 0) }, section "___ksymtab_gpl+__sock_recv_ts_and_drops", align 8
@__kstrtab_sock_recvmsg = internal constant [13 x i8] c"sock_recvmsg\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_recvmsg = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.msghdr*, i64, i32)* @sock_recvmsg to i64), i8* getelementptr inbounds ([13 x i8]* @__kstrtab_sock_recvmsg, i32 0, i32 0) }, section "___ksymtab+sock_recvmsg", align 8
@__kstrtab_kernel_recvmsg = internal constant [15 x i8] c"kernel_recvmsg\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_recvmsg = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.msghdr*, %struct.kvec*, i64, i64, i32)* @kernel_recvmsg to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_kernel_recvmsg, i32 0, i32 0) }, section "___ksymtab+kernel_recvmsg", align 8
@br_ioctl_hook = internal unnamed_addr global i32 (%struct.net*, i32, i8*)* null, align 8
@__kstrtab_brioctl_set = internal constant [12 x i8] c"brioctl_set\00", section "__ksymtab_strings", align 1
@__ksymtab_brioctl_set = constant %struct.kernel_symbol { i64 ptrtoint (void (i32 (%struct.net*, i32, i8*)*)* @brioctl_set to i64), i8* getelementptr inbounds ([12 x i8]* @__kstrtab_brioctl_set, i32 0, i32 0) }, section "___ksymtab+brioctl_set", align 8
@vlan_ioctl_hook = internal unnamed_addr global i32 (%struct.net*, i8*)* null, align 8
@__kstrtab_vlan_ioctl_set = internal constant [15 x i8] c"vlan_ioctl_set\00", section "__ksymtab_strings", align 1
@__ksymtab_vlan_ioctl_set = constant %struct.kernel_symbol { i64 ptrtoint (void (i32 (%struct.net*, i8*)*)* @vlan_ioctl_set to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_vlan_ioctl_set, i32 0, i32 0) }, section "___ksymtab+vlan_ioctl_set", align 8
@dlci_ioctl_hook = internal unnamed_addr global i32 (i32, i8*)* null, align 8
@__kstrtab_dlci_ioctl_set = internal constant [15 x i8] c"dlci_ioctl_set\00", section "__ksymtab_strings", align 1
@__ksymtab_dlci_ioctl_set = constant %struct.kernel_symbol { i64 ptrtoint (void (i32 (i32, i8*)*)* @dlci_ioctl_set to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_dlci_ioctl_set, i32 0, i32 0) }, section "___ksymtab+dlci_ioctl_set", align 8
@__kstrtab_sock_create_lite = internal constant [17 x i8] c"sock_create_lite\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_create_lite = constant %struct.kernel_symbol { i64 ptrtoint (i32 (i32, i32, i32, %struct.socket**)* @sock_create_lite to i64), i8* getelementptr inbounds ([17 x i8]* @__kstrtab_sock_create_lite, i32 0, i32 0) }, section "___ksymtab+sock_create_lite", align 8
@__kstrtab_sock_wake_async = internal constant [16 x i8] c"sock_wake_async\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_wake_async = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, i32, i32)* @sock_wake_async to i64), i8* getelementptr inbounds ([16 x i8]* @__kstrtab_sock_wake_async, i32 0, i32 0) }, section "___ksymtab+sock_wake_async", align 8
@__sock_create.warned = internal unnamed_addr global i1 false
@.str2 = private unnamed_addr constant [42 x i8] c"\016%s uses obsolete (PF_INET,SOCK_PACKET)\0A\00", align 1
@.str3 = private unnamed_addr constant [27 x i8] c"\014socket: no more sockets\0A\00", align 1
@net_families = internal global [41 x %struct.net_proto_family*] zeroinitializer, section ".data..read_mostly", align 16
@.str4 = private unnamed_addr constant [10 x i8] c"net-pf-%d\00", align 1
@__kstrtab___sock_create = internal constant [14 x i8] c"__sock_create\00", section "__ksymtab_strings", align 1
@__ksymtab___sock_create = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.net*, i32, i32, i32, %struct.socket**, i32)* @__sock_create to i64), i8* getelementptr inbounds ([14 x i8]* @__kstrtab___sock_create, i32 0, i32 0) }, section "___ksymtab+__sock_create", align 8
@__kstrtab_sock_create = internal constant [12 x i8] c"sock_create\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_create = constant %struct.kernel_symbol { i64 ptrtoint (i32 (i32, i32, i32, %struct.socket**)* @sock_create to i64), i8* getelementptr inbounds ([12 x i8]* @__kstrtab_sock_create, i32 0, i32 0) }, section "___ksymtab+sock_create", align 8
@init_net = external global %struct.net
@__kstrtab_sock_create_kern = internal constant [17 x i8] c"sock_create_kern\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_create_kern = constant %struct.kernel_symbol { i64 ptrtoint (i32 (i32, i32, i32, %struct.socket**)* @sock_create_kern to i64), i8* getelementptr inbounds ([17 x i8]* @__kstrtab_sock_create_kern, i32 0, i32 0) }, section "___ksymtab+sock_create_kern", align 8
@.str5 = private unnamed_addr constant [29 x i8] c"\012protocol %d >= NPROTO(%d)\0A\00", align 1
@net_family_lock = internal global %struct.spinlock zeroinitializer, align 2
@.str6 = private unnamed_addr constant [38 x i8] c"\016NET: Registered protocol family %d\0A\00", align 1
@__kstrtab_sock_register = internal constant [14 x i8] c"sock_register\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_register = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.net_proto_family*)* @sock_register to i64), i8* getelementptr inbounds ([14 x i8]* @__kstrtab_sock_register, i32 0, i32 0) }, section "___ksymtab+sock_register", align 8
@.str7 = private unnamed_addr constant [13 x i8] c"net/socket.c\00", align 1
@.str8 = private unnamed_addr constant [40 x i8] c"\016NET: Unregistered protocol family %d\0A\00", align 1
@__kstrtab_sock_unregister = internal constant [16 x i8] c"sock_unregister\00", section "__ksymtab_strings", align 1
@__ksymtab_sock_unregister = constant %struct.kernel_symbol { i64 ptrtoint (void (i32)* @sock_unregister to i64), i8* getelementptr inbounds ([16 x i8]* @__kstrtab_sock_unregister, i32 0, i32 0) }, section "___ksymtab+sock_unregister", align 8
@__initcall_sock_init1 = internal global i32 ()* @sock_init, section ".initcall1.init", align 8
@cpu_possible_mask = external constant %struct.cpumask*
@nr_cpu_ids = external global i32
@__per_cpu_offset = external global [64 x i64]
@.str9 = private unnamed_addr constant [18 x i8] c"sockets: used %d\0A\00", align 1
@__kstrtab_kernel_bind = internal constant [12 x i8] c"kernel_bind\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_bind = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.sockaddr*, i32)* @kernel_bind to i64), i8* getelementptr inbounds ([12 x i8]* @__kstrtab_kernel_bind, i32 0, i32 0) }, section "___ksymtab+kernel_bind", align 8
@__kstrtab_kernel_listen = internal constant [14 x i8] c"kernel_listen\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_listen = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, i32)* @kernel_listen to i64), i8* getelementptr inbounds ([14 x i8]* @__kstrtab_kernel_listen, i32 0, i32 0) }, section "___ksymtab+kernel_listen", align 8
@__kstrtab_kernel_accept = internal constant [14 x i8] c"kernel_accept\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_accept = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.socket**, i32)* @kernel_accept to i64), i8* getelementptr inbounds ([14 x i8]* @__kstrtab_kernel_accept, i32 0, i32 0) }, section "___ksymtab+kernel_accept", align 8
@__kstrtab_kernel_connect = internal constant [15 x i8] c"kernel_connect\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_connect = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.sockaddr*, i32, i32)* @kernel_connect to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_kernel_connect, i32 0, i32 0) }, section "___ksymtab+kernel_connect", align 8
@__kstrtab_kernel_getsockname = internal constant [19 x i8] c"kernel_getsockname\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_getsockname = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.sockaddr*, i32*)* @kernel_getsockname to i64), i8* getelementptr inbounds ([19 x i8]* @__kstrtab_kernel_getsockname, i32 0, i32 0) }, section "___ksymtab+kernel_getsockname", align 8
@__kstrtab_kernel_getpeername = internal constant [19 x i8] c"kernel_getpeername\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_getpeername = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.sockaddr*, i32*)* @kernel_getpeername to i64), i8* getelementptr inbounds ([19 x i8]* @__kstrtab_kernel_getpeername, i32 0, i32 0) }, section "___ksymtab+kernel_getpeername", align 8
@__kstrtab_kernel_getsockopt = internal constant [18 x i8] c"kernel_getsockopt\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_getsockopt = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, i32, i32, i8*, i32*)* @kernel_getsockopt to i64), i8* getelementptr inbounds ([18 x i8]* @__kstrtab_kernel_getsockopt, i32 0, i32 0) }, section "___ksymtab+kernel_getsockopt", align 8
@__kstrtab_kernel_setsockopt = internal constant [18 x i8] c"kernel_setsockopt\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_setsockopt = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, i32, i32, i8*, i32)* @kernel_setsockopt to i64), i8* getelementptr inbounds ([18 x i8]* @__kstrtab_kernel_setsockopt, i32 0, i32 0) }, section "___ksymtab+kernel_setsockopt", align 8
@__kstrtab_kernel_sendpage = internal constant [16 x i8] c"kernel_sendpage\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_sendpage = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, %struct.page*, i32, i64, i32)* @kernel_sendpage to i64), i8* getelementptr inbounds ([16 x i8]* @__kstrtab_kernel_sendpage, i32 0, i32 0) }, section "___ksymtab+kernel_sendpage", align 8
@__kstrtab_kernel_sock_ioctl = internal constant [18 x i8] c"kernel_sock_ioctl\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_sock_ioctl = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, i32, i64)* @kernel_sock_ioctl to i64), i8* getelementptr inbounds ([18 x i8]* @__kstrtab_kernel_sock_ioctl, i32 0, i32 0) }, section "___ksymtab+kernel_sock_ioctl", align 8
@__kstrtab_kernel_sock_shutdown = internal constant [21 x i8] c"kernel_sock_shutdown\00", section "__ksymtab_strings", align 1
@__ksymtab_kernel_sock_shutdown = constant %struct.kernel_symbol { i64 ptrtoint (i32 (%struct.socket*, i32)* @kernel_sock_shutdown to i64), i8* getelementptr inbounds ([21 x i8]* @__kstrtab_kernel_sock_shutdown, i32 0, i32 0) }, section "___ksymtab+kernel_sock_shutdown", align 8
@sysctl_net_busy_read = global i32 0, section ".data..read_mostly", align 4
@sysctl_net_busy_poll = global i32 0, section ".data..read_mostly", align 4
@sock_fs_type = internal global %struct.file_system_type { i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0), i32 0, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)* @sockfs_mount, void (%struct.super_block*)* @kill_anon_super, %struct.module* null, %struct.file_system_type* null, %struct.hlist_head zeroinitializer, %struct.lock_class_key zeroinitializer, %struct.lock_class_key zeroinitializer, %struct.lock_class_key zeroinitializer, [3 x %struct.lock_class_key] zeroinitializer, %struct.lock_class_key zeroinitializer, %struct.lock_class_key zeroinitializer, %struct.lock_class_key zeroinitializer }, align 8
@.str10 = private unnamed_addr constant [7 x i8] c"sockfs\00", align 1
@.str11 = private unnamed_addr constant [8 x i8] c"socket:\00", align 1
@sockfs_ops = internal constant %struct.super_operations { %struct.inode* (%struct.super_block*)* @sock_alloc_inode, void (%struct.inode*)* @sock_destroy_inode, void (%struct.inode*, i32)* null, i32 (%struct.inode*, %struct.writeback_control*)* null, i32 (%struct.inode*)* null, void (%struct.inode*)* null, void (%struct.super_block*)* null, i32 (%struct.super_block*, i32)* null, i32 (%struct.super_block*)* null, i32 (%struct.super_block*)* null, i32 (%struct.super_block*)* null, i32 (%struct.super_block*)* null, i32 (%struct.dentry*, %struct.kstatfs*)* @simple_statfs, i32 (%struct.super_block*, i32*, i8*)* null, void (%struct.super_block*)* null, i32 (%struct.seq_file*, %struct.dentry*)* null, i32 (%struct.seq_file*, %struct.dentry*)* null, i32 (%struct.seq_file*, %struct.dentry*)* null, i32 (%struct.seq_file*, %struct.dentry*)* null, i64 (%struct.super_block*, i32, i8*, i64, i64)* null, i64 (%struct.super_block*, i32, i8*, i64, i64)* null, %struct.dquot** (%struct.inode*)* null, i32 (%struct.super_block*, %struct.page*, i32)* null, i64 (%struct.super_block*, i32)* null, i64 (%struct.super_block*, i64, i32)* null }, align 8
@sockfs_dentry_operations = internal constant %struct.dentry_operations { i32 (%struct.dentry*, i32)* null, i32 (%struct.dentry*, i32)* null, i32 (%struct.dentry*, %struct.qstr*)* null, i32 (%struct.dentry*, %struct.dentry*, i32, i8*, %struct.qstr*)* null, i32 (%struct.dentry*)* null, void (%struct.dentry*)* null, void (%struct.dentry*)* null, void (%struct.dentry*, %struct.inode*)* null, i8* (%struct.dentry*, i8*, i32)* @sockfs_dname, %struct.vfsmount* (%struct.path*)* null, i32 (%struct.dentry*, i1)* null, [40 x i8] undef }, align 64
@.str12 = private unnamed_addr constant [13 x i8] c"socket:[%lu]\00", align 1
@sock_inode_cachep = internal unnamed_addr global %struct.kmem_cache* null, section ".data..read_mostly", align 8
@sock_alloc_inode.__key = internal global %struct.lock_class_key zeroinitializer, align 1
@.str13 = private unnamed_addr constant [10 x i8] c"&wq->wait\00", align 1
@.str14 = private unnamed_addr constant [17 x i8] c"sock_inode_cache\00", align 1
@nargs = internal unnamed_addr constant [21 x i8] c"\00\18\18\18\10\18\18\18   00\10((\18\18 ( ", align 16
@.str15 = private unnamed_addr constant [33 x i8] c"./arch/x86/include/asm/uaccess.h\00", align 1
@.str16 = private unnamed_addr constant [38 x i8] c"Buffer overflow detected (%d < %lu)!\0A\00", align 1
@current_task = external global %struct.task_struct*
@sockfs_inode_ops = internal constant %struct.inode_operations { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)* null, i8* (%struct.dentry*, %struct.nameidata*)* null, i32 (%struct.inode*, i32)* null, %struct.posix_acl* (%struct.inode*, i32)* null, i32 (%struct.dentry*, i8*, i32)* null, void (%struct.dentry*, %struct.nameidata*, i8*)* null, i32 (%struct.inode*, %struct.dentry*, i16, i1)* null, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)* null, i32 (%struct.inode*, %struct.dentry*)* null, i32 (%struct.inode*, %struct.dentry*, i8*)* null, i32 (%struct.inode*, %struct.dentry*, i16)* null, i32 (%struct.inode*, %struct.dentry*)* null, i32 (%struct.inode*, %struct.dentry*, i16, i32)* null, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*)* null, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)* null, i32 (%struct.dentry*, %struct.iattr*)* null, i32 (%struct.vfsmount*, %struct.dentry*, %struct.kstat*)* null, i32 (%struct.dentry*, i8*, i8*, i64, i32)* null, i64 (%struct.dentry*, i8*, i8*, i64)* @sockfs_getxattr, i64 (%struct.dentry*, i8*, i64)* @sockfs_listxattr, i32 (%struct.dentry*, i8*)* null, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)* null, i32 (%struct.inode*, %struct.timespec*, i32)* null, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16, i32*)* null, i32 (%struct.inode*, %struct.dentry*, i16)* null, i32 (%struct.inode*, %struct.posix_acl*, i32)* null, i32 (%struct.dentry*, %struct.file*, %struct.cred*)* null, [40 x i8] undef }, align 64
@.str17 = private unnamed_addr constant [21 x i8] c"system.sockprotoname\00", align 1
@dlci_ioctl_mutex = internal global { %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] } { %struct.atomic_t { i32 1 }, %struct.spinlock zeroinitializer, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @dlci_ioctl_mutex to i8*), i64 8) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @dlci_ioctl_mutex to i8*), i64 8) to %struct.list_head*) }, %struct.task_struct* null, %struct.optimistic_spin_queue zeroinitializer, [4 x i8] undef }, align 8
@vlan_ioctl_mutex = internal global { %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] } { %struct.atomic_t { i32 1 }, %struct.spinlock zeroinitializer, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @vlan_ioctl_mutex to i8*), i64 8) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @vlan_ioctl_mutex to i8*), i64 8) to %struct.list_head*) }, %struct.task_struct* null, %struct.optimistic_spin_queue zeroinitializer, [4 x i8] undef }, align 8
@br_ioctl_mutex = internal global { %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] } { %struct.atomic_t { i32 1 }, %struct.spinlock zeroinitializer, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @br_ioctl_mutex to i8*), i64 8) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @br_ioctl_mutex to i8*), i64 8) to %struct.list_head*) }, %struct.task_struct* null, %struct.optimistic_spin_queue zeroinitializer, [4 x i8] undef }, align 8
@kernel_stack = external global i64
@.str18 = private unnamed_addr constant [7 x i8] c"bridge\00", align 1
@.str19 = private unnamed_addr constant [6 x i8] c"8021q\00", align 1
@.str20 = private unnamed_addr constant [5 x i8] c"dlci\00", align 1
@__preempt_count = external global i32
@llvm.used = appending global [34 x i8*] [i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_wake_async to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_release to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_recvmsg to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_getsockname to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_register to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_connect to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_getpeername to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_sendmsg to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_sendpage to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_getsockopt to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_sock_ioctl to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_create to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab___sock_recv_wifi_status to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_brioctl_set to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab___sock_recv_ts_and_drops to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_create_lite to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab___sock_create to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_vlan_ioctl_set to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab___sock_tx_timestamp to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_create_kern to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sockfd_lookup to i8*), i8* bitcast (i32 ()** @__initcall_sock_init1 to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_setsockopt to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_unregister to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_bind to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_listen to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_accept to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_recvmsg to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_sock_shutdown to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab___sock_recv_timestamp to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_from_file to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_sock_alloc_file to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_dlci_ioctl_set to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_kernel_sendmsg to i8*)], section "llvm.metadata"

@sys_socket = alias bitcast (i64 (i64, i64, i64)* @SyS_socket to i64 (i32, i32, i32)*)
@sys_socketpair = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_socketpair to i64 (i32, i32, i32, i32*)*)
@sys_bind = alias bitcast (i64 (i64, i64, i64)* @SyS_bind to i64 (i32, %struct.sockaddr*, i32)*)
@sys_listen = alias bitcast (i64 (i64, i64)* @SyS_listen to i64 (i32, i32)*)
@sys_accept4 = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_accept4 to i64 (i32, %struct.sockaddr*, i32*, i32)*)
@sys_accept = alias bitcast (i64 (i64, i64, i64)* @SyS_accept to i64 (i32, %struct.sockaddr*, i32*)*)
@sys_connect = alias bitcast (i64 (i64, i64, i64)* @SyS_connect to i64 (i32, %struct.sockaddr*, i32)*)
@sys_getsockname = alias bitcast (i64 (i64, i64, i64)* @SyS_getsockname to i64 (i32, %struct.sockaddr*, i32*)*)
@sys_getpeername = alias bitcast (i64 (i64, i64, i64)* @SyS_getpeername to i64 (i32, %struct.sockaddr*, i32*)*)
@sys_sendto = alias bitcast (i64 (i64, i64, i64, i64, i64, i64)* @SyS_sendto to i64 (i32, i8*, i64, i32, %struct.sockaddr*, i32)*)
@sys_send = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_send to i64 (i32, i8*, i64, i32)*)
@sys_recvfrom = alias bitcast (i64 (i64, i64, i64, i64, i64, i64)* @SyS_recvfrom to i64 (i32, i8*, i64, i32, %struct.sockaddr*, i32*)*)
@sys_recv = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_recv to i64 (i32, i8*, i64, i32)*)
@sys_setsockopt = alias bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_setsockopt to i64 (i32, i32, i32, i8*, i32)*)
@sys_getsockopt = alias bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_getsockopt to i64 (i32, i32, i32, i8*, i32*)*)
@sys_shutdown = alias bitcast (i64 (i64, i64)* @SyS_shutdown to i64 (i32, i32)*)
@sys_sendmsg = alias bitcast (i64 (i64, i64, i64)* @SyS_sendmsg to i64 (i32, %struct.user_msghdr*, i32)*)
@sys_sendmmsg = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_sendmmsg to i64 (i32, %struct.mmsghdr*, i32, i32)*)
@sys_recvmsg = alias bitcast (i64 (i64, i64, i64)* @SyS_recvmsg to i64 (i32, %struct.user_msghdr*, i32)*)
@sys_recvmmsg = alias bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_recvmmsg to i64 (i32, %struct.mmsghdr*, i32, i32, %struct.timespec*)*)
@sys_socketcall = alias bitcast (i64 (i64, i64)* @SyS_socketcall to i64 (i32, i64*)*)

; Function Attrs: noredzone nounwind
define i32 @move_addr_to_kernel(i8* %uaddr, i32 %ulen, %struct.__kernel_sockaddr_storage* %kaddr) #0 {
  %1 = icmp slt i32 %ulen, 0
  br i1 %1, label %audit_sockaddr.exit, label %2

; <label>:2                                       ; preds = %0
  %3 = sext i32 %ulen to i64
  %4 = icmp ugt i32 %ulen, 128
  br i1 %4, label %audit_sockaddr.exit, label %5

; <label>:5                                       ; preds = %2
  %6 = icmp eq i32 %ulen, 0
  br i1 %6, label %audit_sockaddr.exit, label %7

; <label>:7                                       ; preds = %5
  %8 = bitcast %struct.__kernel_sockaddr_storage* %kaddr to i8*
  %9 = tail call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false) #1
  %10 = trunc i64 %9 to i32
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %.critedge.i, label %12

; <label>:12                                      ; preds = %7
  %sext.i = shl i64 %9, 32
  %13 = ashr exact i64 %sext.i, 32
  %14 = icmp ult i64 %13, %3
  br i1 %14, label %16, label %.critedge.i, !prof !1

.critedge.i:                                      ; preds = %12, %7
  %15 = tail call i64 @_copy_from_user(i8* %8, i8* %uaddr, i32 %ulen) #4
  br label %copy_from_user.exit

; <label>:16                                      ; preds = %12
  tail call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str15, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str16, i64 0, i64 0), i32 %10, i64 %3) #4
  br label %copy_from_user.exit

copy_from_user.exit:                              ; preds = %16, %.critedge.i
  %.0.i = phi i64 [ %15, %.critedge.i ], [ %3, %16 ]
  %17 = icmp eq i64 %.0.i, 0
  br i1 %17, label %18, label %audit_sockaddr.exit

; <label>:18                                      ; preds = %copy_from_user.exit
  %19 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %20 = getelementptr inbounds %struct.task_struct* %19, i64 0, i32 94
  %21 = load %struct.audit_context** %20, align 8
  %22 = icmp eq %struct.audit_context* %21, null
  br i1 %22, label %audit_sockaddr.exit, label %audit_dummy_context.exit.i

audit_dummy_context.exit.i:                       ; preds = %18
  %23 = bitcast %struct.audit_context* %21 to i32*
  %24 = load i32* %23, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %audit_sockaddr.exit, !prof !1

; <label>:26                                      ; preds = %audit_dummy_context.exit.i
  %27 = tail call i32 @__audit_sockaddr(i32 %ulen, i8* %8) #4
  br label %audit_sockaddr.exit

audit_sockaddr.exit:                              ; preds = %26, %audit_dummy_context.exit.i, %18, %copy_from_user.exit, %5, %2, %0
  %.0 = phi i32 [ -22, %2 ], [ -22, %0 ], [ 0, %5 ], [ -14, %copy_from_user.exit ], [ %27, %26 ], [ 0, %audit_dummy_context.exit.i ], [ 0, %18 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define %struct.file* @sock_alloc_file(%struct.socket* %sock, i32 %flags, i8* %dname) #0 {
  %name = alloca %struct.qstr, align 8
  %path = alloca %struct.path, align 8
  %1 = bitcast %struct.qstr* %name to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.qstr* @sock_alloc_file.name to i8*), i64 16, i32 8, i1 false)
  %2 = icmp eq i8* %dname, null
  br i1 %2, label %9, label %3

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.qstr* %name, i64 0, i32 1
  store i8* %dname, i8** %4, align 8
  %5 = call i64 @strlen(i8* %dname) #4
  %6 = trunc i64 %5 to i32
  %7 = bitcast %struct.qstr* %name to %struct.anon*
  %8 = getelementptr inbounds %struct.anon* %7, i64 0, i32 1
  store i32 %6, i32* %8, align 4
  br label %22

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 5
  %11 = load %struct.sock** %10, align 8
  %12 = icmp eq %struct.sock* %11, null
  br i1 %12, label %22, label %13

; <label>:13                                      ; preds = %9
  %14 = getelementptr inbounds %struct.sock* %11, i64 0, i32 36
  %15 = load %struct.proto** %14, align 8
  %16 = getelementptr inbounds %struct.proto* %15, i64 0, i32 43, i64 0
  %17 = getelementptr inbounds %struct.qstr* %name, i64 0, i32 1
  store i8* %16, i8** %17, align 8
  %18 = call i64 @strlen(i8* %16) #4
  %19 = trunc i64 %18 to i32
  %20 = bitcast %struct.qstr* %name to %struct.anon*
  %21 = getelementptr inbounds %struct.anon* %20, i64 0, i32 1
  store i32 %19, i32* %21, align 4
  br label %22

; <label>:22                                      ; preds = %13, %9, %3
  %23 = load %struct.vfsmount** @sock_mnt, align 8
  %24 = getelementptr inbounds %struct.vfsmount* %23, i64 0, i32 1
  %25 = load %struct.super_block** %24, align 8
  %26 = call %struct.dentry* @d_alloc_pseudo(%struct.super_block* %25, %struct.qstr* %name) #4
  %27 = getelementptr inbounds %struct.path* %path, i64 0, i32 1
  store %struct.dentry* %26, %struct.dentry** %27, align 8
  %28 = icmp eq %struct.dentry* %26, null
  br i1 %28, label %48, label %29, !prof !1

; <label>:29                                      ; preds = %22
  %30 = load %struct.vfsmount** @sock_mnt, align 8
  %31 = call %struct.vfsmount* @mntget(%struct.vfsmount* %30) #4
  %32 = getelementptr inbounds %struct.path* %path, i64 0, i32 0
  store %struct.vfsmount* %31, %struct.vfsmount** %32, align 8
  %33 = getelementptr inbounds %struct.socket* %sock, i64 1
  %34 = bitcast %struct.socket* %33 to %struct.inode*
  call void @d_instantiate(%struct.dentry* %26, %struct.inode* %34) #4
  %35 = call %struct.file* @alloc_file(%struct.path* %path, i32 3, %struct.file_operations* @socket_file_ops) #4
  %36 = icmp ugt %struct.file* %35, inttoptr (i64 -4096 to %struct.file*)
  br i1 %36, label %37, label %41, !prof !1

; <label>:37                                      ; preds = %29
  %38 = load %struct.dentry** %27, align 8
  %39 = getelementptr inbounds %struct.dentry* %38, i64 0, i32 5
  %40 = load %struct.inode** %39, align 8
  call void @ihold(%struct.inode* %40) #4
  call void @path_put(%struct.path* %path) #4
  br label %48

; <label>:41                                      ; preds = %29
  %42 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 4
  store %struct.file* %35, %struct.file** %42, align 8
  %43 = and i32 %flags, 2048
  %44 = or i32 %43, 2
  %45 = getelementptr inbounds %struct.file* %35, i64 0, i32 6
  store i32 %44, i32* %45, align 4
  %46 = bitcast %struct.socket* %sock to i8*
  %47 = getelementptr inbounds %struct.file* %35, i64 0, i32 15
  store i8* %46, i8** %47, align 8
  br label %48

; <label>:48                                      ; preds = %41, %37, %22
  %.0 = phi %struct.file* [ %35, %37 ], [ %35, %41 ], [ inttoptr (i64 -12 to %struct.file*), %22 ]
  ret %struct.file* %.0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noredzone
declare i64 @strlen(i8*) #2

; Function Attrs: noredzone
declare %struct.dentry* @d_alloc_pseudo(%struct.super_block*, %struct.qstr*) #2

; Function Attrs: noredzone
declare %struct.vfsmount* @mntget(%struct.vfsmount*) #2

; Function Attrs: noredzone
declare void @d_instantiate(%struct.dentry*, %struct.inode*) #2

; Function Attrs: noredzone
declare %struct.file* @alloc_file(%struct.path*, i32, %struct.file_operations*) #2

; Function Attrs: noredzone
declare void @ihold(%struct.inode*) #2

; Function Attrs: noredzone
declare void @path_put(%struct.path*) #2

; Function Attrs: noredzone nounwind
define %struct.socket* @sock_from_file(%struct.file* nocapture readonly %file, i32* nocapture %err) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %2 = load %struct.file_operations** %1, align 8
  %3 = icmp eq %struct.file_operations* %2, @socket_file_ops
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.file* %file, i64 0, i32 15
  %6 = load i8** %5, align 8
  %7 = bitcast i8* %6 to %struct.socket*
  br label %9

; <label>:8                                       ; preds = %0
  store i32 -88, i32* %err, align 4
  br label %9

; <label>:9                                       ; preds = %8, %4
  %.0 = phi %struct.socket* [ %7, %4 ], [ null, %8 ]
  ret %struct.socket* %.0
}

; Function Attrs: noredzone nounwind
define %struct.socket* @sockfd_lookup(i32 %fd, i32* nocapture %err) #0 {
  %1 = tail call %struct.file* @fget(i32 %fd) #4
  %2 = icmp eq %struct.file* %1, null
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  store i32 -9, i32* %err, align 4
  br label %13

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.file* %1, i64 0, i32 3
  %6 = load %struct.file_operations** %5, align 8
  %7 = icmp eq %struct.file_operations* %6, @socket_file_ops
  br i1 %7, label %sock_from_file.exit, label %sock_from_file.exit.thread

sock_from_file.exit.thread:                       ; preds = %4
  store i32 -88, i32* %err, align 4
  br label %12

sock_from_file.exit:                              ; preds = %4
  %8 = getelementptr inbounds %struct.file* %1, i64 0, i32 15
  %9 = load i8** %8, align 8
  %10 = bitcast i8* %9 to %struct.socket*
  %11 = icmp eq i8* %9, null
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %sock_from_file.exit, %sock_from_file.exit.thread
  tail call void @fput(%struct.file* %1) #4
  br label %13

; <label>:13                                      ; preds = %12, %sock_from_file.exit, %3
  %.0 = phi %struct.socket* [ null, %3 ], [ %10, %sock_from_file.exit ], [ null, %12 ]
  ret %struct.socket* %.0
}

; Function Attrs: noredzone
declare %struct.file* @fget(i32) #2

; Function Attrs: noredzone
declare void @fput(%struct.file*) #2

; Function Attrs: noredzone nounwind
define void @sock_release(%struct.socket* %sock) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = icmp eq %struct.proto_ops* %2, null
  br i1 %3, label %10, label %4

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 1
  %6 = load %struct.module** %5, align 8
  %7 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 2
  %8 = load i32 (%struct.socket*)** %7, align 8
  %9 = tail call i32 %8(%struct.socket* %sock) #4
  store %struct.proto_ops* null, %struct.proto_ops** %1, align 8
  tail call void @module_put(%struct.module* %6) #4
  br label %10

; <label>:10                                      ; preds = %4, %0
  %11 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 3
  %12 = load %struct.socket_wq** %11, align 8
  %13 = getelementptr inbounds %struct.socket_wq* %12, i64 0, i32 1
  %14 = load %struct.fasync_struct** %13, align 8
  %15 = icmp eq %struct.fasync_struct* %14, null
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %10
  %17 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %18

; <label>:18                                      ; preds = %16, %10
  %19 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 2
  %20 = load volatile i64* %19, align 8
  %21 = and i64 %20, 32
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %18
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %24 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 4
  %25 = load %struct.file** %24, align 8
  %26 = icmp eq %struct.file* %25, null
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %23
  %28 = getelementptr inbounds %struct.socket* %sock, i64 1
  %29 = bitcast %struct.socket* %28 to %struct.inode*
  tail call void @iput(%struct.inode* %29) #4
  br label %31

; <label>:30                                      ; preds = %23
  store %struct.file* null, %struct.file** %24, align 8
  br label %31

; <label>:31                                      ; preds = %30, %27, %18
  ret void
}

; Function Attrs: noredzone
declare void @module_put(%struct.module*) #2

; Function Attrs: noredzone
declare i32 @printk(i8*, ...) #2

; Function Attrs: noredzone
declare void @iput(%struct.inode*) #2

; Function Attrs: noredzone nounwind
define void @__sock_tx_timestamp(%struct.sock* nocapture readonly %sk, i8* nocapture %tx_flags) #0 {
  %1 = load i8* %tx_flags, align 1
  %2 = getelementptr inbounds %struct.sock* %sk, i64 0, i32 50
  %3 = load i16* %2, align 2
  %.tr = trunc i16 %3 to i8
  %4 = and i8 %.tr, 1
  %5 = or i8 %4, %1
  %6 = and i8 %.tr, 2
  %7 = or i8 %5, %6
  %8 = lshr i16 %3, 2
  %.tr2 = trunc i16 %8 to i8
  %9 = and i8 %.tr2, 64
  %10 = or i8 %7, %9
  %11 = and i8 %.tr2, -128
  %12 = or i8 %10, %11
  store i8 %12, i8* %tx_flags, align 1
  ret void
}

; Function Attrs: noredzone nounwind
define i32 @sock_sendmsg(%struct.socket* %sock, %struct.msghdr* %msg, i64 %size) #0 {
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb.i = alloca %struct.kiocb, align 8
  %siocb.i = alloca %struct.sock_iocb, align 8
  %1 = bitcast %struct.kiocb* %iocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %1) #1
  %2 = bitcast %struct.sock_iocb* %siocb.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %2) #1
  %3 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %3)
  %4 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %4)
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 48, i32 8, i1 false)
  %5 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %6 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 0
  store %struct.file* null, %struct.file** %6, align 8
  %7 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 1
  %8 = bitcast %struct.kioctx** %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %3, i64 16, i32 8, i1 false) #1
  %9 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %5 to i8*
  store i8* %.c.i.i, i8** %9, align 8
  %10 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 5
  %11 = bitcast i64* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %4, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %3)
  call void @llvm.lifetime.end(i64 48, i8* %4)
  %12 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 3
  store i8* %2, i8** %12, align 8
  %13 = trunc i64 %size to i32
  %14 = call i32 @security_socket_sendmsg(%struct.socket* %sock, %struct.msghdr* %msg, i32 %13) #4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %__sock_sendmsg.exit.i

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 3
  store %struct.socket* %sock, %struct.socket** %17, align 8
  %18 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %18, align 8
  %19 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 6
  store %struct.msghdr* %msg, %struct.msghdr** %19, align 8
  %20 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 2
  store i32 %13, i32* %20, align 4
  %21 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %22 = load %struct.proto_ops** %21, align 8
  %23 = getelementptr inbounds %struct.proto_ops* %22, i64 0, i32 17
  %24 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64)** %23, align 8
  %25 = call i32 %24(%struct.kiocb* %iocb.i, %struct.socket* %sock, %struct.msghdr* %msg, i64 %size) #4
  br label %__sock_sendmsg.exit.i

__sock_sendmsg.exit.i:                            ; preds = %16, %0
  %26 = phi i32 [ %25, %16 ], [ %14, %0 ]
  %27 = icmp eq i32 %26, -529
  br i1 %27, label %28, label %do_sock_sendmsg.exit

; <label>:28                                      ; preds = %__sock_sendmsg.exit.i
  %29 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb.i) #4
  %30 = trunc i64 %29 to i32
  br label %do_sock_sendmsg.exit

do_sock_sendmsg.exit:                             ; preds = %28, %__sock_sendmsg.exit.i
  %ret.0.i = phi i32 [ %30, %28 ], [ %26, %__sock_sendmsg.exit.i ]
  call void @llvm.lifetime.end(i64 144, i8* %2) #1
  call void @llvm.lifetime.end(i64 88, i8* %1) #1
  ret i32 %ret.0.i
}

; Function Attrs: noredzone nounwind
define i32 @kernel_sendmsg(%struct.socket* %sock, %struct.msghdr* %msg, %struct.kvec* %vec, i64 %num, i64 %size) #0 {
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb.i.i = alloca %struct.kiocb, align 8
  %siocb.i.i = alloca %struct.sock_iocb, align 8
  %1 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %2 = add i64 %1, -16344
  %3 = inttoptr i64 %2 to %struct.thread_info*
  %4 = getelementptr inbounds %struct.thread_info* %3, i64 0, i32 6, i32 0
  %5 = load i64* %4, align 8
  %6 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %7 = add i64 %6, -16344
  %8 = inttoptr i64 %7 to %struct.thread_info*
  %9 = getelementptr inbounds %struct.thread_info* %8, i64 0, i32 6, i32 0
  store i64 -1, i64* %9, align 8
  %10 = getelementptr inbounds %struct.msghdr* %msg, i64 0, i32 2
  %11 = bitcast %struct.kvec* %vec to %struct.iovec*
  call void @iov_iter_init(%struct.iov_iter* %10, i32 1, %struct.iovec* %11, i64 %num, i64 %size) #4
  %12 = bitcast %struct.kiocb* %iocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %12) #1
  %13 = bitcast %struct.sock_iocb* %siocb.i.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %13) #1
  %14 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %14)
  %15 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %15)
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 48, i32 8, i1 false)
  %16 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %17 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 0
  store %struct.file* null, %struct.file** %17, align 8
  %18 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 1
  %19 = bitcast %struct.kioctx** %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %14, i64 16, i32 8, i1 false) #1
  %20 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %16 to i8*
  store i8* %.c.i.i.i, i8** %20, align 8
  %21 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 5
  %22 = bitcast i64* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %15, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %14)
  call void @llvm.lifetime.end(i64 48, i8* %15)
  %23 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 3
  store i8* %13, i8** %23, align 8
  %24 = trunc i64 %size to i32
  %25 = call i32 @security_socket_sendmsg(%struct.socket* %sock, %struct.msghdr* %msg, i32 %24) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %__sock_sendmsg.exit.i.i

; <label>:27                                      ; preds = %0
  %28 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 3
  store %struct.socket* %sock, %struct.socket** %28, align 8
  %29 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %29, align 8
  %30 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 6
  store %struct.msghdr* %msg, %struct.msghdr** %30, align 8
  %31 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 2
  store i32 %24, i32* %31, align 4
  %32 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %33 = load %struct.proto_ops** %32, align 8
  %34 = getelementptr inbounds %struct.proto_ops* %33, i64 0, i32 17
  %35 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64)** %34, align 8
  %36 = call i32 %35(%struct.kiocb* %iocb.i.i, %struct.socket* %sock, %struct.msghdr* %msg, i64 %size) #4
  br label %__sock_sendmsg.exit.i.i

__sock_sendmsg.exit.i.i:                          ; preds = %27, %0
  %37 = phi i32 [ %36, %27 ], [ %25, %0 ]
  %38 = icmp eq i32 %37, -529
  br i1 %38, label %39, label %sock_sendmsg.exit

; <label>:39                                      ; preds = %__sock_sendmsg.exit.i.i
  %40 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb.i.i) #4
  %41 = trunc i64 %40 to i32
  br label %sock_sendmsg.exit

sock_sendmsg.exit:                                ; preds = %39, %__sock_sendmsg.exit.i.i
  %ret.0.i.i = phi i32 [ %41, %39 ], [ %37, %__sock_sendmsg.exit.i.i ]
  call void @llvm.lifetime.end(i64 144, i8* %13) #1
  call void @llvm.lifetime.end(i64 88, i8* %12) #1
  %42 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %43 = add i64 %42, -16344
  %44 = inttoptr i64 %43 to %struct.thread_info*
  %45 = getelementptr inbounds %struct.thread_info* %44, i64 0, i32 6, i32 0
  store i64 %5, i64* %45, align 8
  ret i32 %ret.0.i.i
}

; Function Attrs: noredzone
declare void @iov_iter_init(%struct.iov_iter*, i32, %struct.iovec*, i64, i64) #2

; Function Attrs: noredzone nounwind
define void @__sock_recv_timestamp(%struct.msghdr* %msg, %struct.sock* %sk, %struct.sk_buff* nocapture %skb) #0 {
  %tss = alloca %struct.scm_timestamping, align 8
  %tv = alloca %struct.timeval, align 8
  %ts = alloca %struct.timespec, align 8
  %1 = getelementptr inbounds %struct.sock* %sk, i64 0, i32 15
  %2 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %1, i64 11) #1, !srcloc !5
  %3 = icmp eq i32 %2, 0
  %4 = bitcast %struct.scm_timestamping* %tss to i8*
  call void @llvm.lifetime.start(i64 48, i8* %4) #1
  %5 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 39
  %6 = load i8** %5, align 8
  %7 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 38
  %8 = load i32* %7, align 4
  %9 = zext i32 %8 to i64
  %.sum.i = add i64 %9, 16
  %10 = getelementptr inbounds i8* %6, i64 %.sum.i
  br i1 %3, label %.critedge, label %11

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %13 = load i64* %12, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %.thread

; <label>:15                                      ; preds = %11
  %16 = call i64 @ktime_get_with_offset(i32 0) #4
  store i64 %16, i64* %12, align 8
  br label %.thread

.thread:                                          ; preds = %15, %11
  %17 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %1, i64 12) #1, !srcloc !5
  %18 = icmp eq i32 %17, 0
  %19 = load i64* %12, align 8
  br i1 %18, label %20, label %28

; <label>:20                                      ; preds = %.thread
  %21 = call { i64, i64 } @ns_to_timeval(i64 %19) #4
  %22 = extractvalue { i64, i64 } %21, 0
  %23 = extractvalue { i64, i64 } %21, 1
  %24 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 0
  store i64 %22, i64* %24, align 8
  %25 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 1
  store i64 %23, i64* %25, align 8
  %26 = bitcast %struct.timeval* %tv to i8*
  %27 = call i32 @put_cmsg(%struct.msghdr* %msg, i32 1, i32 29, i32 16, i8* %26) #4
  br label %.critedge

; <label>:28                                      ; preds = %.thread
  %29 = call { i64, i64 } @ns_to_timespec(i64 %19) #4
  %30 = extractvalue { i64, i64 } %29, 0
  %31 = extractvalue { i64, i64 } %29, 1
  %32 = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 0
  store i64 %30, i64* %32, align 8
  %33 = getelementptr inbounds %struct.timespec* %ts, i64 0, i32 1
  store i64 %31, i64* %33, align 8
  %34 = bitcast %struct.timespec* %ts to i8*
  %35 = call i32 @put_cmsg(%struct.msghdr* %msg, i32 1, i32 35, i32 16, i8* %34) #4
  br label %.critedge

.critedge:                                        ; preds = %28, %20, %0
  %36 = call i8* @memset(i8* %4, i32 0, i64 48) #4
  %37 = getelementptr inbounds %struct.sock* %sk, i64 0, i32 50
  %38 = load i16* %37, align 2
  %39 = and i16 %38, 16
  %40 = icmp eq i16 %39, 0
  br i1 %40, label %ktime_to_timespec_cond.exit2, label %41

; <label>:41                                      ; preds = %.critedge
  %42 = getelementptr %struct.sk_buff* %skb, i64 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %43 = load i64* %42, align 8
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %ktime_to_timespec_cond.exit2, label %45

; <label>:45                                      ; preds = %41
  %46 = call { i64, i64 } @ns_to_timespec(i64 %43) #4
  %47 = extractvalue { i64, i64 } %46, 0
  %48 = extractvalue { i64, i64 } %46, 1
  %49 = getelementptr inbounds %struct.scm_timestamping* %tss, i64 0, i32 0, i64 0, i32 0
  store i64 %47, i64* %49, align 8
  %50 = getelementptr inbounds %struct.scm_timestamping* %tss, i64 0, i32 0, i64 0, i32 1
  store i64 %48, i64* %50, align 8
  %.pre = load i16* %37, align 2
  br label %ktime_to_timespec_cond.exit2

ktime_to_timespec_cond.exit2:                     ; preds = %45, %41, %.critedge
  %51 = phi i16 [ %38, %.critedge ], [ %.pre, %45 ], [ %38, %41 ]
  %empty.0 = phi i32 [ 1, %.critedge ], [ 0, %45 ], [ 1, %41 ]
  %52 = and i16 %51, 64
  %53 = icmp eq i16 %52, 0
  br i1 %53, label %ktime_to_timespec_cond.exit, label %54

; <label>:54                                      ; preds = %ktime_to_timespec_cond.exit2
  %55 = bitcast i8* %10 to i64*
  %56 = load i64* %55, align 8
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %ktime_to_timespec_cond.exit, label %.thread3

.thread3:                                         ; preds = %54
  %58 = call { i64, i64 } @ns_to_timespec(i64 %56) #4
  %59 = extractvalue { i64, i64 } %58, 0
  %60 = extractvalue { i64, i64 } %58, 1
  %61 = getelementptr %struct.scm_timestamping* %tss, i64 0, i32 0, i64 2, i32 0
  store i64 %59, i64* %61, align 8
  %62 = getelementptr %struct.scm_timestamping* %tss, i64 0, i32 0, i64 2, i32 1
  store i64 %60, i64* %62, align 8
  br label %64

ktime_to_timespec_cond.exit:                      ; preds = %54, %ktime_to_timespec_cond.exit2
  %63 = icmp eq i32 %empty.0, 0
  br i1 %63, label %64, label %66

; <label>:64                                      ; preds = %ktime_to_timespec_cond.exit, %.thread3
  %65 = call i32 @put_cmsg(%struct.msghdr* %msg, i32 1, i32 37, i32 48, i8* %4) #4
  br label %66

; <label>:66                                      ; preds = %64, %ktime_to_timespec_cond.exit
  call void @llvm.lifetime.end(i64 48, i8* %4) #1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: noredzone
declare i32 @put_cmsg(%struct.msghdr*, i32, i32, i32, i8*) #2

; Function Attrs: noredzone
declare i8* @memset(i8*, i32, i64) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noredzone nounwind
define void @__sock_recv_wifi_status(%struct.msghdr* %msg, %struct.sock* %sk, %struct.sk_buff* nocapture readonly %skb) #0 {
  %ack = alloca i32, align 4
  %1 = getelementptr inbounds %struct.sock* %sk, i64 0, i32 15
  %2 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %1, i64 20) #1, !srcloc !5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %15, label %4

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 16
  %6 = bitcast [4 x i8]* %5 to i32*
  %7 = load i32* %6, align 8
  %8 = and i32 %7, 16384
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %15, label %10

; <label>:10                                      ; preds = %4
  %11 = lshr i32 %7, 15
  %12 = and i32 %11, 1
  store i32 %12, i32* %ack, align 4
  %13 = bitcast i32* %ack to i8*
  %14 = call i32 @put_cmsg(%struct.msghdr* %msg, i32 1, i32 41, i32 4, i8* %13) #4
  br label %15

; <label>:15                                      ; preds = %10, %4, %0
  ret void
}

; Function Attrs: noredzone nounwind
define void @__sock_recv_ts_and_drops(%struct.msghdr* %msg, %struct.sock* %sk, %struct.sk_buff* %skb) #0 {
  %ack.i.i = alloca i32, align 4
  %1 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %2 = load i64* %1, align 8
  %3 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 39
  %4 = load i8** %3, align 8
  %5 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 38
  %6 = load i32* %5, align 4
  %7 = zext i32 %6 to i64
  %.sum.i.i = add i64 %7, 16
  %8 = getelementptr inbounds i8* %4, i64 %.sum.i.i
  %9 = getelementptr inbounds %struct.sock* %sk, i64 0, i32 15
  %10 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %9, i64 11) #1, !srcloc !5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %28

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.sock* %sk, i64 0, i32 50
  %14 = load i16* %13, align 2
  %15 = zext i16 %14 to i32
  %16 = and i32 %15, 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %28

; <label>:18                                      ; preds = %12
  %19 = icmp eq i64 %2, 0
  %20 = and i32 %15, 16
  %21 = icmp eq i32 %20, 0
  %or.cond.i = or i1 %19, %21
  br i1 %or.cond.i, label %22, label %28

; <label>:22                                      ; preds = %18
  %23 = bitcast i8* %8 to i64*
  %24 = load i64* %23, align 8
  %25 = icmp eq i64 %24, 0
  %26 = and i16 %14, 64
  %27 = icmp eq i16 %26, 0
  %or.cond3.i = or i1 %25, %27
  br i1 %or.cond3.i, label %29, label %28

; <label>:28                                      ; preds = %22, %18, %12, %0
  call void @__sock_recv_timestamp(%struct.msghdr* %msg, %struct.sock* %sk, %struct.sk_buff* %skb) #4
  br label %31

; <label>:29                                      ; preds = %22
  %30 = getelementptr inbounds %struct.sock* %sk, i64 0, i32 49, i32 0
  store i64 %2, i64* %30, align 8
  br label %31

; <label>:31                                      ; preds = %29, %28
  %32 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %9, i64 20) #1, !srcloc !5
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %sock_recv_timestamp.exit, label %34

; <label>:34                                      ; preds = %31
  %35 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 16
  %36 = bitcast [4 x i8]* %35 to i32*
  %37 = load i32* %36, align 8
  %38 = and i32 %37, 16384
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %sock_recv_timestamp.exit, label %40

; <label>:40                                      ; preds = %34
  %41 = bitcast i32* %ack.i.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %41) #1
  %42 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %9, i64 20) #1, !srcloc !5
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %sock_recv_timestamp.exit, label %44

; <label>:44                                      ; preds = %40
  %45 = load i32* %36, align 8
  %46 = and i32 %45, 16384
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %sock_recv_timestamp.exit, label %48

; <label>:48                                      ; preds = %44
  %49 = lshr i32 %45, 15
  %50 = and i32 %49, 1
  store i32 %50, i32* %ack.i.i, align 4
  %51 = call i32 @put_cmsg(%struct.msghdr* %msg, i32 1, i32 41, i32 4, i8* %41) #4
  br label %sock_recv_timestamp.exit

sock_recv_timestamp.exit:                         ; preds = %48, %44, %40, %34, %31
  %52 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %9, i64 18) #1, !srcloc !5
  %53 = icmp ne i32 %52, 0
  %54 = icmp ne %struct.sk_buff* %skb, null
  %or.cond.i1 = and i1 %53, %54
  br i1 %or.cond.i1, label %55, label %sock_recv_drops.exit

; <label>:55                                      ; preds = %sock_recv_timestamp.exit
  %56 = getelementptr inbounds %struct.sk_buff* %skb, i64 0, i32 27, i32 0
  %57 = load i32* %56, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %sock_recv_drops.exit, label %59

; <label>:59                                      ; preds = %55
  %60 = bitcast i32* %56 to i8*
  %61 = call i32 @put_cmsg(%struct.msghdr* %msg, i32 1, i32 40, i32 4, i8* %60) #4
  br label %sock_recv_drops.exit

sock_recv_drops.exit:                             ; preds = %59, %55, %sock_recv_timestamp.exit
  ret void
}

; Function Attrs: noredzone nounwind
define i32 @sock_recvmsg(%struct.socket* %sock, %struct.msghdr* %msg, i64 %size, i32 %flags) #0 {
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb = alloca %struct.kiocb, align 8
  %siocb = alloca %struct.sock_iocb, align 8
  %1 = bitcast %struct.kiocb* %iocb to i8*
  call void @llvm.lifetime.start(i64 88, i8* %1) #1
  %2 = bitcast %struct.sock_iocb* %siocb to i8*
  call void @llvm.lifetime.start(i64 144, i8* %2) #1
  %3 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %3)
  %4 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %4)
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 48, i32 8, i1 false)
  %5 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %6 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 0
  store %struct.file* null, %struct.file** %6, align 8
  %7 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 1
  %8 = bitcast %struct.kioctx** %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %3, i64 16, i32 8, i1 false) #1
  %9 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %5 to i8*
  store i8* %.c.i, i8** %9, align 8
  %10 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 5
  %11 = bitcast i64* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %4, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %3)
  call void @llvm.lifetime.end(i64 48, i8* %4)
  %12 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 3
  store i8* %2, i8** %12, align 8
  %13 = trunc i64 %size to i32
  %14 = call i32 @security_socket_recvmsg(%struct.socket* %sock, %struct.msghdr* %msg, i32 %13, i32 %flags) #4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %__sock_recvmsg.exit

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 3
  store %struct.socket* %sock, %struct.socket** %17, align 8
  %18 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %18, align 8
  %19 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 6
  store %struct.msghdr* %msg, %struct.msghdr** %19, align 8
  %20 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 2
  store i32 %13, i32* %20, align 4
  %21 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 1
  store i32 %flags, i32* %21, align 8
  %22 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %23 = load %struct.proto_ops** %22, align 8
  %24 = getelementptr inbounds %struct.proto_ops* %23, i64 0, i32 18
  %25 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64, i32)** %24, align 8
  %26 = call i32 %25(%struct.kiocb* %iocb, %struct.socket* %sock, %struct.msghdr* %msg, i64 %size, i32 %flags) #4
  br label %__sock_recvmsg.exit

__sock_recvmsg.exit:                              ; preds = %16, %0
  %27 = phi i32 [ %26, %16 ], [ %14, %0 ]
  %28 = icmp eq i32 %27, -529
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %__sock_recvmsg.exit
  %30 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb) #4
  %31 = trunc i64 %30 to i32
  br label %32

; <label>:32                                      ; preds = %29, %__sock_recvmsg.exit
  %ret.0 = phi i32 [ %31, %29 ], [ %27, %__sock_recvmsg.exit ]
  call void @llvm.lifetime.end(i64 144, i8* %2) #1
  call void @llvm.lifetime.end(i64 88, i8* %1) #1
  ret i32 %ret.0
}

; Function Attrs: noredzone
declare i64 @wait_on_sync_kiocb(%struct.kiocb*) #2

; Function Attrs: noredzone nounwind
define i32 @kernel_recvmsg(%struct.socket* %sock, %struct.msghdr* %msg, %struct.kvec* %vec, i64 %num, i64 %size, i32 %flags) #0 {
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb.i = alloca %struct.kiocb, align 8
  %siocb.i = alloca %struct.sock_iocb, align 8
  %1 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %2 = add i64 %1, -16344
  %3 = inttoptr i64 %2 to %struct.thread_info*
  %4 = getelementptr inbounds %struct.thread_info* %3, i64 0, i32 6, i32 0
  %5 = load i64* %4, align 8
  %6 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %7 = add i64 %6, -16344
  %8 = inttoptr i64 %7 to %struct.thread_info*
  %9 = getelementptr inbounds %struct.thread_info* %8, i64 0, i32 6, i32 0
  store i64 -1, i64* %9, align 8
  %10 = getelementptr inbounds %struct.msghdr* %msg, i64 0, i32 2
  %11 = bitcast %struct.kvec* %vec to %struct.iovec*
  call void @iov_iter_init(%struct.iov_iter* %10, i32 0, %struct.iovec* %11, i64 %num, i64 %size) #4
  %12 = bitcast %struct.kiocb* %iocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %12) #1
  %13 = bitcast %struct.sock_iocb* %siocb.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %13) #1
  %14 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %14)
  %15 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %15)
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 48, i32 8, i1 false)
  %16 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %17 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 0
  store %struct.file* null, %struct.file** %17, align 8
  %18 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 1
  %19 = bitcast %struct.kioctx** %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %14, i64 16, i32 8, i1 false) #1
  %20 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %16 to i8*
  store i8* %.c.i.i, i8** %20, align 8
  %21 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 5
  %22 = bitcast i64* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %15, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %14)
  call void @llvm.lifetime.end(i64 48, i8* %15)
  %23 = getelementptr inbounds %struct.kiocb* %iocb.i, i64 0, i32 3
  store i8* %13, i8** %23, align 8
  %24 = trunc i64 %size to i32
  %25 = call i32 @security_socket_recvmsg(%struct.socket* %sock, %struct.msghdr* %msg, i32 %24, i32 %flags) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %__sock_recvmsg.exit.i

; <label>:27                                      ; preds = %0
  %28 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 3
  store %struct.socket* %sock, %struct.socket** %28, align 8
  %29 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %29, align 8
  %30 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 6
  store %struct.msghdr* %msg, %struct.msghdr** %30, align 8
  %31 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 2
  store i32 %24, i32* %31, align 4
  %32 = getelementptr inbounds %struct.sock_iocb* %siocb.i, i64 0, i32 1
  store i32 %flags, i32* %32, align 8
  %33 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %34 = load %struct.proto_ops** %33, align 8
  %35 = getelementptr inbounds %struct.proto_ops* %34, i64 0, i32 18
  %36 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64, i32)** %35, align 8
  %37 = call i32 %36(%struct.kiocb* %iocb.i, %struct.socket* %sock, %struct.msghdr* %msg, i64 %size, i32 %flags) #4
  br label %__sock_recvmsg.exit.i

__sock_recvmsg.exit.i:                            ; preds = %27, %0
  %38 = phi i32 [ %37, %27 ], [ %25, %0 ]
  %39 = icmp eq i32 %38, -529
  br i1 %39, label %40, label %sock_recvmsg.exit

; <label>:40                                      ; preds = %__sock_recvmsg.exit.i
  %41 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb.i) #4
  %42 = trunc i64 %41 to i32
  br label %sock_recvmsg.exit

sock_recvmsg.exit:                                ; preds = %40, %__sock_recvmsg.exit.i
  %ret.0.i = phi i32 [ %42, %40 ], [ %38, %__sock_recvmsg.exit.i ]
  call void @llvm.lifetime.end(i64 144, i8* %13) #1
  call void @llvm.lifetime.end(i64 88, i8* %12) #1
  %43 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %44 = add i64 %43, -16344
  %45 = inttoptr i64 %44 to %struct.thread_info*
  %46 = getelementptr inbounds %struct.thread_info* %45, i64 0, i32 6, i32 0
  store i64 %5, i64* %46, align 8
  ret i32 %ret.0.i
}

; Function Attrs: noredzone nounwind
define void @brioctl_set(i32 (%struct.net*, i32, i8*)* %hook) #0 {
  tail call void @mutex_lock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @br_ioctl_mutex to %struct.mutex*)) #4
  store i32 (%struct.net*, i32, i8*)* %hook, i32 (%struct.net*, i32, i8*)** @br_ioctl_hook, align 8
  tail call void @mutex_unlock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @br_ioctl_mutex to %struct.mutex*)) #4
  ret void
}

; Function Attrs: noredzone
declare void @mutex_lock(%struct.mutex*) #2

; Function Attrs: noredzone
declare void @mutex_unlock(%struct.mutex*) #2

; Function Attrs: noredzone nounwind
define void @vlan_ioctl_set(i32 (%struct.net*, i8*)* %hook) #0 {
  tail call void @mutex_lock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @vlan_ioctl_mutex to %struct.mutex*)) #4
  store i32 (%struct.net*, i8*)* %hook, i32 (%struct.net*, i8*)** @vlan_ioctl_hook, align 8
  tail call void @mutex_unlock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @vlan_ioctl_mutex to %struct.mutex*)) #4
  ret void
}

; Function Attrs: noredzone nounwind
define void @dlci_ioctl_set(i32 (i32, i8*)* %hook) #0 {
  tail call void @mutex_lock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @dlci_ioctl_mutex to %struct.mutex*)) #4
  store i32 (i32, i8*)* %hook, i32 (i32, i8*)** @dlci_ioctl_hook, align 8
  tail call void @mutex_unlock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @dlci_ioctl_mutex to %struct.mutex*)) #4
  ret void
}

; Function Attrs: noredzone nounwind
define i32 @sock_create_lite(i32 %family, i32 %type, i32 %protocol, %struct.socket** nocapture %res) #0 {
  %1 = tail call i32 @security_socket_create(i32 %family, i32 %type, i32 %protocol, i32 1) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %sock_release.exit

; <label>:3                                       ; preds = %0
  %4 = load %struct.vfsmount** @sock_mnt, align 8
  %5 = getelementptr inbounds %struct.vfsmount* %4, i64 0, i32 1
  %6 = load %struct.super_block** %5, align 8
  %7 = tail call %struct.inode* @new_inode_pseudo(%struct.super_block* %6) #4
  %8 = icmp eq %struct.inode* %7, null
  br i1 %8, label %sock_release.exit, label %sock_alloc.exit

sock_alloc.exit:                                  ; preds = %3
  %9 = getelementptr %struct.inode* %7, i64 -1, i32 37
  %10 = bitcast %struct.list_head* %9 to %struct.socket*
  %11 = tail call i32 @get_next_ino() #4
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds %struct.inode* %7, i64 0, i32 11
  store i64 %12, i64* %13, align 8
  %14 = getelementptr inbounds %struct.inode* %7, i64 0, i32 0
  store i16 -15873, i16* %14, align 2
  %15 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %16 = getelementptr inbounds %struct.task_struct* %15, i64 0, i32 72
  %17 = load %struct.cred** %16, align 8
  %18 = getelementptr inbounds %struct.cred* %17, i64 0, i32 7, i32 0
  %19 = load i32* %18, align 4
  %20 = getelementptr inbounds %struct.inode* %7, i64 0, i32 2, i32 0
  store i32 %19, i32* %20, align 4
  %21 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %22 = getelementptr inbounds %struct.task_struct* %21, i64 0, i32 72
  %23 = load %struct.cred** %22, align 8
  %24 = getelementptr inbounds %struct.cred* %23, i64 0, i32 8, i32 0
  %25 = load i32* %24, align 4
  %26 = getelementptr inbounds %struct.inode* %7, i64 0, i32 3, i32 0
  store i32 %25, i32* %26, align 4
  %27 = getelementptr inbounds %struct.inode* %7, i64 0, i32 7
  store %struct.inode_operations* @sockfs_inode_ops, %struct.inode_operations** %27, align 8
  tail call void asm "incl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !6
  %28 = icmp eq %struct.list_head* %9, null
  br i1 %28, label %sock_release.exit, label %29

; <label>:29                                      ; preds = %sock_alloc.exit
  %30 = trunc i32 %type to i16
  %31 = getelementptr inbounds %struct.socket* %10, i64 0, i32 1
  store i16 %30, i16* %31, align 2
  %32 = tail call i32 @security_socket_post_create(%struct.socket* %10, i32 %family, i32 %type, i32 %protocol, i32 1) #4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %sock_release.exit, label %34

sock_release.exit:                                ; preds = %68, %65, %55, %29, %sock_alloc.exit, %3, %0
  %err.0 = phi i32 [ %1, %0 ], [ 0, %29 ], [ -12, %sock_alloc.exit ], [ %32, %55 ], [ %32, %65 ], [ %32, %68 ], [ -12, %3 ]
  %sock.0 = phi %struct.socket* [ null, %0 ], [ %10, %29 ], [ null, %sock_alloc.exit ], [ null, %55 ], [ null, %65 ], [ null, %68 ], [ null, %3 ]
  store %struct.socket* %sock.0, %struct.socket** %res, align 8
  ret i32 %err.0

; <label>:34                                      ; preds = %29
  %35 = getelementptr inbounds %struct.list_head* %9, i64 2, i32 1
  %36 = load %struct.list_head** %35, align 8
  %37 = icmp eq %struct.list_head* %36, null
  br i1 %37, label %46, label %38

; <label>:38                                      ; preds = %34
  %39 = getelementptr inbounds %struct.list_head* %36, i64 0, i32 1
  %40 = load %struct.list_head** %39, align 8
  %41 = bitcast %struct.list_head* %40 to %struct.module*
  %42 = getelementptr inbounds %struct.list_head* %36, i64 1
  %43 = bitcast %struct.list_head* %42 to i32 (%struct.socket*)**
  %44 = load i32 (%struct.socket*)** %43, align 8
  %45 = tail call i32 %44(%struct.socket* %10) #4
  store %struct.list_head* null, %struct.list_head** %35, align 8
  tail call void @module_put(%struct.module* %41) #4
  br label %46

; <label>:46                                      ; preds = %38, %34
  %47 = getelementptr inbounds %struct.list_head* %9, i64 1
  %48 = bitcast %struct.list_head* %47 to %struct.socket_wq**
  %49 = load %struct.socket_wq** %48, align 8
  %50 = getelementptr inbounds %struct.socket_wq* %49, i64 0, i32 1
  %51 = load %struct.fasync_struct** %50, align 8
  %52 = icmp eq %struct.fasync_struct* %51, null
  br i1 %52, label %55, label %53

; <label>:53                                      ; preds = %46
  %54 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %55

; <label>:55                                      ; preds = %53, %46
  %56 = getelementptr %struct.inode* %7, i64 -1, i32 37, i32 1
  %57 = bitcast %struct.list_head** %56 to i64*
  %58 = load volatile i64* %57, align 8
  %59 = and i64 %58, 32
  %60 = icmp eq i64 %59, 0
  br i1 %60, label %61, label %sock_release.exit

; <label>:61                                      ; preds = %55
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %62 = getelementptr inbounds %struct.list_head* %9, i64 1, i32 1
  %63 = load %struct.list_head** %62, align 8
  %64 = icmp eq %struct.list_head* %63, null
  br i1 %64, label %65, label %68

; <label>:65                                      ; preds = %61
  %66 = getelementptr inbounds %struct.list_head* %9, i64 3
  %67 = bitcast %struct.list_head* %66 to %struct.inode*
  tail call void @iput(%struct.inode* %67) #4
  br label %sock_release.exit

; <label>:68                                      ; preds = %61
  store %struct.list_head* null, %struct.list_head** %62, align 8
  br label %sock_release.exit
}

; Function Attrs: noredzone
declare i32 @security_socket_create(i32, i32, i32, i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_post_create(%struct.socket*, i32, i32, i32, i32) #2

; Function Attrs: noredzone nounwind
define i32 @sock_wake_async(%struct.socket* %sock, i32 %how, i32 %band) #0 {
  %c.i = alloca i8, align 1
  %1 = icmp eq %struct.socket* %sock, null
  br i1 %1, label %24, label %2

; <label>:2                                       ; preds = %0
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !7
  %3 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 3
  %4 = load volatile %struct.socket_wq** %3, align 8
  %5 = icmp eq %struct.socket_wq* %4, null
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %2
  %7 = getelementptr inbounds %struct.socket_wq* %4, i64 0, i32 1
  %8 = load %struct.fasync_struct** %7, align 8
  %9 = icmp eq %struct.fasync_struct* %8, null
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %2
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !8
  br label %24

; <label>:11                                      ; preds = %6
  switch i32 %how, label %23 [
    i32 1, label %12
    i32 2, label %17
    i32 0, label %21
    i32 3, label %22
  ]

; <label>:12                                      ; preds = %11
  %13 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 2
  %14 = load volatile i64* %13, align 8
  %15 = and i64 %14, 2
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %21, label %23

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 2
  call void @llvm.lifetime.start(i64 1, i8* %c.i) #1
  call void asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; btr $2, $0; setc $1", "=*m,=*qm,Ir,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %18, i8* %c.i, i64 0, i64* %18) #1, !srcloc !9
  %19 = load i8* %c.i, align 1
  %20 = icmp eq i8 %19, 0
  call void @llvm.lifetime.end(i64 1, i8* %c.i) #1
  br i1 %20, label %23, label %21

; <label>:21                                      ; preds = %17, %12, %11
  call void @kill_fasync(%struct.fasync_struct** %7, i32 29, i32 %band) #4
  br label %23

; <label>:22                                      ; preds = %11
  call void @kill_fasync(%struct.fasync_struct** %7, i32 23, i32 %band) #4
  br label %23

; <label>:23                                      ; preds = %22, %21, %17, %12, %11
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !8
  br label %24

; <label>:24                                      ; preds = %23, %10, %0
  %.0 = phi i32 [ 0, %23 ], [ -1, %10 ], [ -1, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare void @kill_fasync(%struct.fasync_struct**, i32, i32) #2

; Function Attrs: noredzone nounwind
define i32 @__sock_create(%struct.net* %net, i32 %family, i32 %type, i32 %protocol, %struct.socket** nocapture %res, i32 %kern) #0 {
  %1 = icmp ugt i32 %family, 40
  br i1 %1, label %sock_release.exit, label %2

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i32 %type, 10
  br i1 %3, label %sock_release.exit, label %4

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %family, 2
  %6 = icmp eq i32 %type, 10
  %or.cond6 = and i1 %5, %6
  br i1 %or.cond6, label %7, label %12

; <label>:7                                       ; preds = %4
  %.b = load i1* @__sock_create.warned, align 1
  br i1 %.b, label %12, label %8

; <label>:8                                       ; preds = %7
  store i1 true, i1* @__sock_create.warned, align 1
  %9 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %10 = getelementptr inbounds %struct.task_struct* %9, i64 0, i32 73, i64 0
  %11 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([42 x i8]* @.str2, i64 0, i64 0), i8* %10) #4
  br label %12

; <label>:12                                      ; preds = %8, %7, %4
  %.07 = phi i32 [ %family, %4 ], [ 17, %8 ], [ 17, %7 ]
  %13 = tail call i32 @security_socket_create(i32 %.07, i32 %type, i32 %protocol, i32 %kern) #4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %sock_release.exit

; <label>:15                                      ; preds = %12
  %16 = load %struct.vfsmount** @sock_mnt, align 8
  %17 = getelementptr inbounds %struct.vfsmount* %16, i64 0, i32 1
  %18 = load %struct.super_block** %17, align 8
  %19 = tail call %struct.inode* @new_inode_pseudo(%struct.super_block* %18) #4
  %20 = icmp eq %struct.inode* %19, null
  br i1 %20, label %sock_alloc.exit.thread, label %sock_alloc.exit

sock_alloc.exit:                                  ; preds = %15
  %21 = getelementptr %struct.inode* %19, i64 -1, i32 37
  %22 = bitcast %struct.list_head* %21 to %struct.socket*
  %23 = tail call i32 @get_next_ino() #4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds %struct.inode* %19, i64 0, i32 11
  store i64 %24, i64* %25, align 8
  %26 = getelementptr inbounds %struct.inode* %19, i64 0, i32 0
  store i16 -15873, i16* %26, align 2
  %27 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %28 = getelementptr inbounds %struct.task_struct* %27, i64 0, i32 72
  %29 = load %struct.cred** %28, align 8
  %30 = getelementptr inbounds %struct.cred* %29, i64 0, i32 7, i32 0
  %31 = load i32* %30, align 4
  %32 = getelementptr inbounds %struct.inode* %19, i64 0, i32 2, i32 0
  store i32 %31, i32* %32, align 4
  %33 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %34 = getelementptr inbounds %struct.task_struct* %33, i64 0, i32 72
  %35 = load %struct.cred** %34, align 8
  %36 = getelementptr inbounds %struct.cred* %35, i64 0, i32 8, i32 0
  %37 = load i32* %36, align 4
  %38 = getelementptr inbounds %struct.inode* %19, i64 0, i32 3, i32 0
  store i32 %37, i32* %38, align 4
  %39 = getelementptr inbounds %struct.inode* %19, i64 0, i32 7
  store %struct.inode_operations* @sockfs_inode_ops, %struct.inode_operations** %39, align 8
  tail call void asm "incl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !6
  %40 = icmp eq %struct.list_head* %21, null
  br i1 %40, label %sock_alloc.exit.thread, label %45

sock_alloc.exit.thread:                           ; preds = %sock_alloc.exit, %15
  %41 = tail call i32 @net_ratelimit() #4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %sock_release.exit, label %43

; <label>:43                                      ; preds = %sock_alloc.exit.thread
  %44 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([27 x i8]* @.str3, i64 0, i64 0)) #4
  br label %sock_release.exit

; <label>:45                                      ; preds = %sock_alloc.exit
  %46 = trunc i32 %type to i16
  %47 = getelementptr inbounds %struct.socket* %22, i64 0, i32 1
  store i16 %46, i16* %47, align 2
  %48 = sext i32 %.07 to i64
  %49 = getelementptr [41 x %struct.net_proto_family*]* @net_families, i64 0, i64 %48
  %50 = load volatile %struct.net_proto_family** %49, align 8
  %51 = icmp eq %struct.net_proto_family* %50, null
  br i1 %51, label %52, label %54

; <label>:52                                      ; preds = %45
  %53 = tail call i32 (i1, i8*, ...)* @__request_module(i1 zeroext true, i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0), i32 %.07) #4
  br label %54

; <label>:54                                      ; preds = %52, %45
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !7
  %55 = load volatile %struct.net_proto_family** %49, align 8
  %56 = icmp eq %struct.net_proto_family* %55, null
  br i1 %56, label %112, label %57

; <label>:57                                      ; preds = %54
  %58 = getelementptr inbounds %struct.net_proto_family* %55, i64 0, i32 2
  %59 = load %struct.module** %58, align 8
  %60 = tail call zeroext i1 @try_module_get(%struct.module* %59) #4
  br i1 %60, label %61, label %112

; <label>:61                                      ; preds = %57
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !8
  %62 = getelementptr inbounds %struct.net_proto_family* %55, i64 0, i32 1
  %63 = load i32 (%struct.net*, %struct.socket*, i32, i32)** %62, align 8
  %64 = tail call i32 %63(%struct.net* %net, %struct.socket* %22, i32 %protocol, i32 %kern) #4
  %65 = icmp slt i32 %64, 0
  %.pre9 = getelementptr inbounds %struct.list_head* %21, i64 2, i32 1
  br i1 %65, label %._crit_edge, label %66

; <label>:66                                      ; preds = %61
  %67 = load %struct.list_head** %.pre9, align 8
  %68 = getelementptr inbounds %struct.list_head* %67, i64 0, i32 1
  %69 = load %struct.list_head** %68, align 8
  %70 = bitcast %struct.list_head* %69 to %struct.module*
  %71 = tail call zeroext i1 @try_module_get(%struct.module* %70) #4
  br i1 %71, label %72, label %._crit_edge

; <label>:72                                      ; preds = %66
  %73 = load %struct.module** %58, align 8
  tail call void @module_put(%struct.module* %73) #4
  %74 = tail call i32 @security_socket_post_create(%struct.socket* %22, i32 %.07, i32 %type, i32 %protocol, i32 %kern) #4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %78

; <label>:76                                      ; preds = %72
  store %struct.socket* %22, %struct.socket** %res, align 8
  br label %sock_release.exit

._crit_edge:                                      ; preds = %66, %61
  %err.0 = phi i32 [ -97, %66 ], [ %64, %61 ]
  store %struct.list_head* null, %struct.list_head** %.pre9, align 8
  %77 = load %struct.module** %58, align 8
  tail call void @module_put(%struct.module* %77) #4
  br label %78

; <label>:78                                      ; preds = %112, %._crit_edge, %72
  %.pre-phi = phi %struct.list_head** [ %.pre9, %72 ], [ %.pre, %112 ], [ %.pre9, %._crit_edge ]
  %err.1 = phi i32 [ %74, %72 ], [ -97, %112 ], [ %err.0, %._crit_edge ]
  %79 = load %struct.list_head** %.pre-phi, align 8
  %80 = icmp eq %struct.list_head* %79, null
  br i1 %80, label %89, label %81

; <label>:81                                      ; preds = %78
  %82 = getelementptr inbounds %struct.list_head* %79, i64 0, i32 1
  %83 = load %struct.list_head** %82, align 8
  %84 = bitcast %struct.list_head* %83 to %struct.module*
  %85 = getelementptr inbounds %struct.list_head* %79, i64 1
  %86 = bitcast %struct.list_head* %85 to i32 (%struct.socket*)**
  %87 = load i32 (%struct.socket*)** %86, align 8
  %88 = tail call i32 %87(%struct.socket* %22) #4
  store %struct.list_head* null, %struct.list_head** %.pre-phi, align 8
  tail call void @module_put(%struct.module* %84) #4
  br label %89

; <label>:89                                      ; preds = %81, %78
  %90 = getelementptr inbounds %struct.list_head* %21, i64 1
  %91 = bitcast %struct.list_head* %90 to %struct.socket_wq**
  %92 = load %struct.socket_wq** %91, align 8
  %93 = getelementptr inbounds %struct.socket_wq* %92, i64 0, i32 1
  %94 = load %struct.fasync_struct** %93, align 8
  %95 = icmp eq %struct.fasync_struct* %94, null
  br i1 %95, label %98, label %96

; <label>:96                                      ; preds = %89
  %97 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %98

; <label>:98                                      ; preds = %96, %89
  %99 = getelementptr %struct.inode* %19, i64 -1, i32 37, i32 1
  %100 = bitcast %struct.list_head** %99 to i64*
  %101 = load volatile i64* %100, align 8
  %102 = and i64 %101, 32
  %103 = icmp eq i64 %102, 0
  br i1 %103, label %104, label %sock_release.exit

; <label>:104                                     ; preds = %98
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %105 = getelementptr inbounds %struct.list_head* %21, i64 1, i32 1
  %106 = load %struct.list_head** %105, align 8
  %107 = icmp eq %struct.list_head* %106, null
  br i1 %107, label %108, label %111

; <label>:108                                     ; preds = %104
  %109 = getelementptr inbounds %struct.list_head* %21, i64 3
  %110 = bitcast %struct.list_head* %109 to %struct.inode*
  tail call void @iput(%struct.inode* %110) #4
  br label %sock_release.exit

; <label>:111                                     ; preds = %104
  store %struct.list_head* null, %struct.list_head** %105, align 8
  br label %sock_release.exit

; <label>:112                                     ; preds = %57, %54
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !8
  %.pre = getelementptr inbounds %struct.list_head* %21, i64 2, i32 1
  br label %78

sock_release.exit:                                ; preds = %111, %108, %98, %76, %43, %sock_alloc.exit.thread, %12, %2, %0
  %.0 = phi i32 [ 0, %76 ], [ -97, %0 ], [ -22, %2 ], [ %13, %12 ], [ -23, %sock_alloc.exit.thread ], [ -23, %43 ], [ %err.1, %98 ], [ %err.1, %108 ], [ %err.1, %111 ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare i32 @net_ratelimit() #2

; Function Attrs: noredzone
declare i32 @__request_module(i1 zeroext, i8*, ...) #2

; Function Attrs: noredzone
declare zeroext i1 @try_module_get(%struct.module*) #2

; Function Attrs: noredzone nounwind
define i32 @sock_create(i32 %family, i32 %type, i32 %protocol, %struct.socket** nocapture %res) #0 {
  %1 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %2 = getelementptr inbounds %struct.task_struct* %1, i64 0, i32 81
  %3 = load %struct.nsproxy** %2, align 8
  %4 = getelementptr inbounds %struct.nsproxy* %3, i64 0, i32 5
  %5 = load %struct.net** %4, align 8
  %6 = tail call i32 @__sock_create(%struct.net* %5, i32 %family, i32 %type, i32 %protocol, %struct.socket** %res, i32 0) #5
  ret i32 %6
}

; Function Attrs: noredzone nounwind
define i32 @sock_create_kern(i32 %family, i32 %type, i32 %protocol, %struct.socket** nocapture %res) #0 {
  %1 = tail call i32 @__sock_create(%struct.net* @init_net, i32 %family, i32 %type, i32 %protocol, %struct.socket** %res, i32 1) #5
  ret i32 %1
}

; Function Attrs: noredzone nounwind
define i64 @SyS_socket(i64 %family, i64 %type, i64 %protocol) #0 {
  %sock.i = alloca %struct.socket*, align 8
  %1 = trunc i64 %type to i32
  %2 = bitcast %struct.socket** %sock.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #1
  %3 = and i32 %1, -526352
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %SYSC_socket.exit

; <label>:5                                       ; preds = %0
  %6 = trunc i64 %protocol to i32
  %7 = trunc i64 %family to i32
  %8 = and i32 %1, 15
  %9 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %10 = getelementptr inbounds %struct.task_struct* %9, i64 0, i32 81
  %11 = load %struct.nsproxy** %10, align 8
  %12 = getelementptr inbounds %struct.nsproxy* %11, i64 0, i32 5
  %13 = load %struct.net** %12, align 8
  %14 = call i32 @__sock_create(%struct.net* %13, i32 %7, i32 %8, i32 %6, %struct.socket** %sock.i, i32 0) #4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %29, label %16

; <label>:16                                      ; preds = %5
  %17 = load %struct.socket** %sock.i, align 8
  %18 = and i32 %1, 526336
  %19 = tail call i32 @get_unused_fd_flags(i32 %18) #4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %sock_map_fd.exit.thread.i, label %21, !prof !1

; <label>:21                                      ; preds = %16
  %22 = tail call %struct.file* @sock_alloc_file(%struct.socket* %17, i32 %18, i8* null) #4
  %23 = icmp ugt %struct.file* %22, inttoptr (i64 -4096 to %struct.file*)
  br i1 %23, label %25, label %24, !prof !1

; <label>:24                                      ; preds = %21
  tail call void @fd_install(i32 %19, %struct.file* %22) #4
  br label %sock_map_fd.exit.i

; <label>:25                                      ; preds = %21
  tail call void @put_unused_fd(i32 %19) #4
  %26 = ptrtoint %struct.file* %22 to i64
  %27 = trunc i64 %26 to i32
  br label %sock_map_fd.exit.i

sock_map_fd.exit.i:                               ; preds = %25, %24
  %.0.i.i = phi i32 [ %19, %24 ], [ %27, %25 ]
  %28 = icmp slt i32 %.0.i.i, 0
  br i1 %28, label %sock_map_fd.exit.thread.i, label %29

; <label>:29                                      ; preds = %sock_map_fd.exit.i, %5
  %retval.0.i = phi i32 [ %14, %5 ], [ %.0.i.i, %sock_map_fd.exit.i ]
  %30 = sext i32 %retval.0.i to i64
  br label %SYSC_socket.exit

sock_map_fd.exit.thread.i:                        ; preds = %sock_map_fd.exit.i, %16
  %.0.i4.i = phi i32 [ %.0.i.i, %sock_map_fd.exit.i ], [ %19, %16 ]
  %31 = getelementptr inbounds %struct.socket* %17, i64 0, i32 6
  %32 = load %struct.proto_ops** %31, align 8
  %33 = icmp eq %struct.proto_ops* %32, null
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %sock_map_fd.exit.thread.i
  %35 = getelementptr inbounds %struct.proto_ops* %32, i64 0, i32 1
  %36 = load %struct.module** %35, align 8
  %37 = getelementptr inbounds %struct.proto_ops* %32, i64 0, i32 2
  %38 = load i32 (%struct.socket*)** %37, align 8
  %39 = tail call i32 %38(%struct.socket* %17) #4
  store %struct.proto_ops* null, %struct.proto_ops** %31, align 8
  tail call void @module_put(%struct.module* %36) #4
  br label %40

; <label>:40                                      ; preds = %34, %sock_map_fd.exit.thread.i
  %41 = getelementptr inbounds %struct.socket* %17, i64 0, i32 3
  %42 = load %struct.socket_wq** %41, align 8
  %43 = getelementptr inbounds %struct.socket_wq* %42, i64 0, i32 1
  %44 = load %struct.fasync_struct** %43, align 8
  %45 = icmp eq %struct.fasync_struct* %44, null
  br i1 %45, label %48, label %46

; <label>:46                                      ; preds = %40
  %47 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %48

; <label>:48                                      ; preds = %46, %40
  %49 = getelementptr inbounds %struct.socket* %17, i64 0, i32 2
  %50 = load volatile i64* %49, align 8
  %51 = and i64 %50, 32
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %53, label %sock_release.exit.i

; <label>:53                                      ; preds = %48
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %54 = getelementptr inbounds %struct.socket* %17, i64 0, i32 4
  %55 = load %struct.file** %54, align 8
  %56 = icmp eq %struct.file* %55, null
  br i1 %56, label %57, label %60

; <label>:57                                      ; preds = %53
  %58 = getelementptr inbounds %struct.socket* %17, i64 1
  %59 = bitcast %struct.socket* %58 to %struct.inode*
  tail call void @iput(%struct.inode* %59) #4
  br label %sock_release.exit.i

; <label>:60                                      ; preds = %53
  store %struct.file* null, %struct.file** %54, align 8
  br label %sock_release.exit.i

sock_release.exit.i:                              ; preds = %60, %57, %48
  %61 = sext i32 %.0.i4.i to i64
  br label %SYSC_socket.exit

SYSC_socket.exit:                                 ; preds = %sock_release.exit.i, %29, %0
  %.0.i = phi i64 [ %30, %29 ], [ %61, %sock_release.exit.i ], [ -22, %0 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #1
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_socketpair(i64 %family, i64 %type, i64 %protocol, i64 %usockvec) #0 {
  %sock1.i = alloca %struct.socket*, align 8
  %sock2.i = alloca %struct.socket*, align 8
  %1 = trunc i64 %family to i32
  %2 = trunc i64 %type to i32
  %3 = trunc i64 %protocol to i32
  %4 = inttoptr i64 %usockvec to i32*
  %5 = bitcast %struct.socket** %sock1.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %5) #1
  %6 = bitcast %struct.socket** %sock2.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %6) #1
  %7 = and i32 %2, -16
  %8 = and i32 %2, -526352
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %SYSC_socketpair.exit

; <label>:10                                      ; preds = %0
  %11 = and i32 %2, 15
  %12 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %13 = getelementptr inbounds %struct.task_struct* %12, i64 0, i32 81
  %14 = load %struct.nsproxy** %13, align 8
  %15 = getelementptr inbounds %struct.nsproxy* %14, i64 0, i32 5
  %16 = load %struct.net** %15, align 8
  %17 = call i32 @__sock_create(%struct.net* %16, i32 %1, i32 %11, i32 %3, %struct.socket** %sock1.i, i32 0) #4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %sock_release.exit3.i, label %19

; <label>:19                                      ; preds = %10
  %20 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %21 = getelementptr inbounds %struct.task_struct* %20, i64 0, i32 81
  %22 = load %struct.nsproxy** %21, align 8
  %23 = getelementptr inbounds %struct.nsproxy* %22, i64 0, i32 5
  %24 = load %struct.net** %23, align 8
  %25 = call i32 @__sock_create(%struct.net* %24, i32 %1, i32 %11, i32 %3, %struct.socket** %sock2.i, i32 0) #4
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %sock_release.exit4.i, label %27

; <label>:27                                      ; preds = %19
  %28 = load %struct.socket** %sock1.i, align 8
  %29 = getelementptr inbounds %struct.socket* %28, i64 0, i32 6
  %30 = load %struct.proto_ops** %29, align 8
  %31 = getelementptr inbounds %struct.proto_ops* %30, i64 0, i32 5
  %32 = load i32 (%struct.socket*, %struct.socket*)** %31, align 8
  %33 = load %struct.socket** %sock2.i, align 8
  %34 = tail call i32 %32(%struct.socket* %28, %struct.socket* %33) #4
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %102, label %36

; <label>:36                                      ; preds = %27
  %37 = tail call i32 @get_unused_fd_flags(i32 %7) #4
  %38 = icmp slt i32 %37, 0
  br i1 %38, label %102, label %39, !prof !1

; <label>:39                                      ; preds = %36
  %40 = tail call i32 @get_unused_fd_flags(i32 %7) #4
  %41 = icmp slt i32 %40, 0
  br i1 %41, label %101, label %42, !prof !1

; <label>:42                                      ; preds = %39
  %43 = tail call %struct.file* @sock_alloc_file(%struct.socket* %28, i32 %7, i8* null) #4
  %44 = icmp ugt %struct.file* %43, inttoptr (i64 -4096 to %struct.file*)
  br i1 %44, label %45, label %48, !prof !1

; <label>:45                                      ; preds = %42
  %46 = ptrtoint %struct.file* %43 to i64
  %47 = trunc i64 %46 to i32
  tail call void @put_unused_fd(i32 %40) #4
  br label %101

; <label>:48                                      ; preds = %42
  %49 = tail call %struct.file* @sock_alloc_file(%struct.socket* %33, i32 %7, i8* null) #4
  %50 = icmp ugt %struct.file* %49, inttoptr (i64 -4096 to %struct.file*)
  br i1 %50, label %51, label %84

; <label>:51                                      ; preds = %48
  %52 = ptrtoint %struct.file* %49 to i64
  %53 = trunc i64 %52 to i32
  tail call void @fput(%struct.file* %43) #4
  tail call void @put_unused_fd(i32 %40) #4
  tail call void @put_unused_fd(i32 %37) #4
  %54 = getelementptr inbounds %struct.socket* %33, i64 0, i32 6
  %55 = load %struct.proto_ops** %54, align 8
  %56 = icmp eq %struct.proto_ops* %55, null
  br i1 %56, label %63, label %57

; <label>:57                                      ; preds = %51
  %58 = getelementptr inbounds %struct.proto_ops* %55, i64 0, i32 1
  %59 = load %struct.module** %58, align 8
  %60 = getelementptr inbounds %struct.proto_ops* %55, i64 0, i32 2
  %61 = load i32 (%struct.socket*)** %60, align 8
  %62 = tail call i32 %61(%struct.socket* %33) #4
  store %struct.proto_ops* null, %struct.proto_ops** %54, align 8
  tail call void @module_put(%struct.module* %59) #4
  br label %63

; <label>:63                                      ; preds = %57, %51
  %64 = getelementptr inbounds %struct.socket* %33, i64 0, i32 3
  %65 = load %struct.socket_wq** %64, align 8
  %66 = getelementptr inbounds %struct.socket_wq* %65, i64 0, i32 1
  %67 = load %struct.fasync_struct** %66, align 8
  %68 = icmp eq %struct.fasync_struct* %67, null
  br i1 %68, label %71, label %69

; <label>:69                                      ; preds = %63
  %70 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %71

; <label>:71                                      ; preds = %69, %63
  %72 = getelementptr inbounds %struct.socket* %33, i64 0, i32 2
  %73 = load volatile i64* %72, align 8
  %74 = and i64 %73, 32
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %76, label %sock_release.exit3.i

; <label>:76                                      ; preds = %71
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %77 = getelementptr inbounds %struct.socket* %33, i64 0, i32 4
  %78 = load %struct.file** %77, align 8
  %79 = icmp eq %struct.file* %78, null
  br i1 %79, label %80, label %83

; <label>:80                                      ; preds = %76
  %81 = getelementptr inbounds %struct.socket* %33, i64 1
  %82 = bitcast %struct.socket* %81 to %struct.inode*
  tail call void @iput(%struct.inode* %82) #4
  br label %sock_release.exit3.i

; <label>:83                                      ; preds = %76
  store %struct.file* null, %struct.file** %77, align 8
  br label %sock_release.exit3.i

; <label>:84                                      ; preds = %48
  %85 = tail call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %37, i32* %4) #1, !srcloc !10
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %100

; <label>:87                                      ; preds = %84
  %88 = getelementptr i32* %4, i64 1
  %89 = tail call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %40, i32* %88) #1, !srcloc !11
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %100

; <label>:91                                      ; preds = %87
  %92 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %93 = getelementptr inbounds %struct.task_struct* %92, i64 0, i32 94
  %94 = load %struct.audit_context** %93, align 8
  %95 = icmp eq %struct.audit_context* %94, null
  br i1 %95, label %audit_fd_pair.exit.i, label %audit_dummy_context.exit.i.i

audit_dummy_context.exit.i.i:                     ; preds = %91
  %96 = bitcast %struct.audit_context* %94 to i32*
  %97 = load i32* %96, align 4
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %audit_fd_pair.exit.i, !prof !1

; <label>:99                                      ; preds = %audit_dummy_context.exit.i.i
  tail call void @__audit_fd_pair(i32 %37, i32 %40) #4
  br label %audit_fd_pair.exit.i

audit_fd_pair.exit.i:                             ; preds = %99, %audit_dummy_context.exit.i.i, %91
  tail call void @fd_install(i32 %37, %struct.file* %43) #4
  tail call void @fd_install(i32 %40, %struct.file* %49) #4
  br label %SYSC_socketpair.exit

; <label>:100                                     ; preds = %87, %84
  %err.0.i = phi i32 [ %85, %84 ], [ %89, %87 ]
  tail call void @fput(%struct.file* %49) #4
  tail call void @fput(%struct.file* %43) #4
  tail call void @put_unused_fd(i32 %40) #4
  tail call void @put_unused_fd(i32 %37) #4
  br label %sock_release.exit3.i

; <label>:101                                     ; preds = %45, %39
  %err.1.i = phi i32 [ %47, %45 ], [ %40, %39 ]
  tail call void @put_unused_fd(i32 %37) #4
  br label %102

; <label>:102                                     ; preds = %101, %36, %27
  %err.2.i = phi i32 [ %34, %27 ], [ %err.1.i, %101 ], [ %37, %36 ]
  %103 = getelementptr inbounds %struct.socket* %33, i64 0, i32 6
  %104 = load %struct.proto_ops** %103, align 8
  %105 = icmp eq %struct.proto_ops* %104, null
  br i1 %105, label %112, label %106

; <label>:106                                     ; preds = %102
  %107 = getelementptr inbounds %struct.proto_ops* %104, i64 0, i32 1
  %108 = load %struct.module** %107, align 8
  %109 = getelementptr inbounds %struct.proto_ops* %104, i64 0, i32 2
  %110 = load i32 (%struct.socket*)** %109, align 8
  %111 = tail call i32 %110(%struct.socket* %33) #4
  store %struct.proto_ops* null, %struct.proto_ops** %103, align 8
  tail call void @module_put(%struct.module* %108) #4
  br label %112

; <label>:112                                     ; preds = %106, %102
  %113 = getelementptr inbounds %struct.socket* %33, i64 0, i32 3
  %114 = load %struct.socket_wq** %113, align 8
  %115 = getelementptr inbounds %struct.socket_wq* %114, i64 0, i32 1
  %116 = load %struct.fasync_struct** %115, align 8
  %117 = icmp eq %struct.fasync_struct* %116, null
  br i1 %117, label %120, label %118

; <label>:118                                     ; preds = %112
  %119 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %120

; <label>:120                                     ; preds = %118, %112
  %121 = getelementptr inbounds %struct.socket* %33, i64 0, i32 2
  %122 = load volatile i64* %121, align 8
  %123 = and i64 %122, 32
  %124 = icmp eq i64 %123, 0
  br i1 %124, label %125, label %sock_release.exit4.i

; <label>:125                                     ; preds = %120
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %126 = getelementptr inbounds %struct.socket* %33, i64 0, i32 4
  %127 = load %struct.file** %126, align 8
  %128 = icmp eq %struct.file* %127, null
  br i1 %128, label %129, label %132

; <label>:129                                     ; preds = %125
  %130 = getelementptr inbounds %struct.socket* %33, i64 1
  %131 = bitcast %struct.socket* %130 to %struct.inode*
  tail call void @iput(%struct.inode* %131) #4
  br label %sock_release.exit4.i

; <label>:132                                     ; preds = %125
  store %struct.file* null, %struct.file** %126, align 8
  br label %sock_release.exit4.i

sock_release.exit4.i:                             ; preds = %132, %129, %120, %19
  %err.3.i = phi i32 [ %25, %19 ], [ %err.2.i, %120 ], [ %err.2.i, %129 ], [ %err.2.i, %132 ]
  %133 = load %struct.socket** %sock1.i, align 8
  %134 = getelementptr inbounds %struct.socket* %133, i64 0, i32 6
  %135 = load %struct.proto_ops** %134, align 8
  %136 = icmp eq %struct.proto_ops* %135, null
  br i1 %136, label %143, label %137

; <label>:137                                     ; preds = %sock_release.exit4.i
  %138 = getelementptr inbounds %struct.proto_ops* %135, i64 0, i32 1
  %139 = load %struct.module** %138, align 8
  %140 = getelementptr inbounds %struct.proto_ops* %135, i64 0, i32 2
  %141 = load i32 (%struct.socket*)** %140, align 8
  %142 = tail call i32 %141(%struct.socket* %133) #4
  store %struct.proto_ops* null, %struct.proto_ops** %134, align 8
  tail call void @module_put(%struct.module* %139) #4
  br label %143

; <label>:143                                     ; preds = %137, %sock_release.exit4.i
  %144 = getelementptr inbounds %struct.socket* %133, i64 0, i32 3
  %145 = load %struct.socket_wq** %144, align 8
  %146 = getelementptr inbounds %struct.socket_wq* %145, i64 0, i32 1
  %147 = load %struct.fasync_struct** %146, align 8
  %148 = icmp eq %struct.fasync_struct* %147, null
  br i1 %148, label %151, label %149

; <label>:149                                     ; preds = %143
  %150 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %151

; <label>:151                                     ; preds = %149, %143
  %152 = getelementptr inbounds %struct.socket* %133, i64 0, i32 2
  %153 = load volatile i64* %152, align 8
  %154 = and i64 %153, 32
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %156, label %sock_release.exit3.i

; <label>:156                                     ; preds = %151
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %157 = getelementptr inbounds %struct.socket* %133, i64 0, i32 4
  %158 = load %struct.file** %157, align 8
  %159 = icmp eq %struct.file* %158, null
  br i1 %159, label %160, label %163

; <label>:160                                     ; preds = %156
  %161 = getelementptr inbounds %struct.socket* %133, i64 1
  %162 = bitcast %struct.socket* %161 to %struct.inode*
  tail call void @iput(%struct.inode* %162) #4
  br label %sock_release.exit3.i

; <label>:163                                     ; preds = %156
  store %struct.file* null, %struct.file** %157, align 8
  br label %sock_release.exit3.i

sock_release.exit3.i:                             ; preds = %163, %160, %151, %100, %83, %80, %71, %10
  %err.4.i = phi i32 [ %17, %10 ], [ %err.0.i, %100 ], [ %53, %71 ], [ %53, %80 ], [ %53, %83 ], [ %err.3.i, %151 ], [ %err.3.i, %160 ], [ %err.3.i, %163 ]
  %164 = sext i32 %err.4.i to i64
  br label %SYSC_socketpair.exit

SYSC_socketpair.exit:                             ; preds = %sock_release.exit3.i, %audit_fd_pair.exit.i, %0
  %.0.i = phi i64 [ %164, %sock_release.exit3.i ], [ 0, %audit_fd_pair.exit.i ], [ -22, %0 ]
  call void @llvm.lifetime.end(i64 8, i8* %5) #1
  call void @llvm.lifetime.end(i64 8, i8* %6) #1
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_bind(i64 %fd, i64 %umyaddr, i64 %addrlen) #0 {
  %address.i = alloca %struct.__kernel_sockaddr_storage, align 8
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %addrlen to i32
  %3 = bitcast %struct.__kernel_sockaddr_storage* %address.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %3) #1
  %4 = call i64 @__fdget(i32 %1) #4
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %4 to i32
  %7 = and i32 %v.tr.i.i.i.i, 3
  %8 = icmp eq i64 %5, 0
  br i1 %8, label %SYSC_bind.exit, label %9

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %11 = load %struct.file_operations** %10, align 8
  %12 = icmp eq %struct.file_operations* %11, @socket_file_ops
  br i1 %12, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %9
  %13 = getelementptr inbounds %struct.file* %6, i64 0, i32 15
  %14 = load i8** %13, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %9
  %16 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %9 ]
  %17 = and i32 %v.tr.i.i.i.i, 1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %SYSC_bind.exit, label %19

; <label>:19                                      ; preds = %sock_from_file.exit.thread.i.i
  call void @fput(%struct.file* %6) #4
  br label %SYSC_bind.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %20 = bitcast i8* %14 to %struct.socket*
  %21 = inttoptr i64 %umyaddr to i8*
  %22 = call i32 @move_addr_to_kernel(i8* %21, i32 %2, %struct.__kernel_sockaddr_storage* %address.i) #4
  %23 = icmp sgt i32 %22, -1
  br i1 %23, label %24, label %35

; <label>:24                                      ; preds = %sockfd_lookup_light.exit.i
  %25 = bitcast %struct.__kernel_sockaddr_storage* %address.i to %struct.sockaddr*
  %26 = call i32 @security_socket_bind(%struct.socket* %20, %struct.sockaddr* %25, i32 %2) #4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %35

; <label>:28                                      ; preds = %24
  %29 = getelementptr inbounds i8* %14, i64 40
  %30 = bitcast i8* %29 to %struct.proto_ops**
  %31 = load %struct.proto_ops** %30, align 8
  %32 = getelementptr inbounds %struct.proto_ops* %31, i64 0, i32 3
  %33 = load i32 (%struct.socket*, %struct.sockaddr*, i32)** %32, align 8
  %34 = call i32 %33(%struct.socket* %20, %struct.sockaddr* %25, i32 %2) #4
  br label %35

; <label>:35                                      ; preds = %28, %24, %sockfd_lookup_light.exit.i
  %36 = phi i32 [ %26, %24 ], [ %34, %28 ], [ %22, %sockfd_lookup_light.exit.i ]
  %37 = icmp eq i32 %7, 0
  br i1 %37, label %SYSC_bind.exit, label %38

; <label>:38                                      ; preds = %35
  %39 = getelementptr inbounds i8* %14, i64 24
  %40 = bitcast i8* %39 to %struct.file**
  %41 = load %struct.file** %40, align 8
  call void @fput(%struct.file* %41) #4
  br label %SYSC_bind.exit

SYSC_bind.exit:                                   ; preds = %38, %35, %19, %sock_from_file.exit.thread.i.i, %0
  %42 = phi i32 [ %36, %35 ], [ %36, %38 ], [ -9, %0 ], [ %16, %sock_from_file.exit.thread.i.i ], [ %16, %19 ]
  %43 = sext i32 %42 to i64
  call void @llvm.lifetime.end(i64 128, i8* %3) #1
  ret i64 %43
}

; Function Attrs: noredzone nounwind
define i64 @SyS_listen(i64 %fd, i64 %backlog) #0 {
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %backlog to i32
  %3 = tail call i64 @__fdget(i32 %1) #4
  %4 = and i64 %3, -4
  %5 = inttoptr i64 %4 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %3 to i32
  %6 = and i32 %v.tr.i.i.i.i, 3
  %7 = icmp eq i64 %4, 0
  br i1 %7, label %SYSC_listen.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.file* %5, i64 0, i32 3
  %10 = load %struct.file_operations** %9, align 8
  %11 = icmp eq %struct.file_operations* %10, @socket_file_ops
  br i1 %11, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %8
  %12 = getelementptr inbounds %struct.file* %5, i64 0, i32 15
  %13 = load i8** %12, align 8
  %14 = icmp eq i8* %13, null
  br i1 %14, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %8
  %15 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %8 ]
  %16 = and i32 %v.tr.i.i.i.i, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %SYSC_listen.exit, label %18

; <label>:18                                      ; preds = %sock_from_file.exit.thread.i.i
  tail call void @fput(%struct.file* %5) #4
  br label %SYSC_listen.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %19 = bitcast i8* %13 to %struct.socket*
  %20 = getelementptr inbounds i8* %13, i64 32
  %21 = bitcast i8* %20 to %struct.sock**
  %22 = load %struct.sock** %21, align 8
  %23 = getelementptr inbounds %struct.sock* %22, i64 0, i32 0, i32 9
  %24 = load %struct.net** %23, align 8
  %25 = getelementptr inbounds %struct.net* %24, i64 0, i32 21, i32 1
  %26 = load i32* %25, align 4
  %27 = icmp ult i32 %26, %2
  %.backlog.i = select i1 %27, i32 %26, i32 %2
  %28 = tail call i32 @security_socket_listen(%struct.socket* %19, i32 %.backlog.i) #4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %37

; <label>:30                                      ; preds = %sockfd_lookup_light.exit.i
  %31 = getelementptr inbounds i8* %13, i64 40
  %32 = bitcast i8* %31 to %struct.proto_ops**
  %33 = load %struct.proto_ops** %32, align 8
  %34 = getelementptr inbounds %struct.proto_ops* %33, i64 0, i32 11
  %35 = load i32 (%struct.socket*, i32)** %34, align 8
  %36 = tail call i32 %35(%struct.socket* %19, i32 %.backlog.i) #4
  br label %37

; <label>:37                                      ; preds = %30, %sockfd_lookup_light.exit.i
  %38 = phi i32 [ %28, %sockfd_lookup_light.exit.i ], [ %36, %30 ]
  %39 = icmp eq i32 %6, 0
  br i1 %39, label %SYSC_listen.exit, label %40

; <label>:40                                      ; preds = %37
  %41 = getelementptr inbounds i8* %13, i64 24
  %42 = bitcast i8* %41 to %struct.file**
  %43 = load %struct.file** %42, align 8
  tail call void @fput(%struct.file* %43) #4
  br label %SYSC_listen.exit

SYSC_listen.exit:                                 ; preds = %40, %37, %18, %sock_from_file.exit.thread.i.i, %0
  %44 = phi i32 [ %38, %37 ], [ %38, %40 ], [ -9, %0 ], [ %15, %sock_from_file.exit.thread.i.i ], [ %15, %18 ]
  %45 = sext i32 %44 to i64
  ret i64 %45
}

; Function Attrs: noredzone nounwind
define i64 @SyS_accept4(i64 %fd, i64 %upeer_sockaddr, i64 %upeer_addrlen, i64 %flags) #0 {
  %len.i = alloca i32, align 4
  %address.i = alloca %struct.__kernel_sockaddr_storage, align 8
  %1 = inttoptr i64 %upeer_addrlen to i32*
  %2 = trunc i64 %flags to i32
  %3 = bitcast i32* %len.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast %struct.__kernel_sockaddr_storage* %address.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %4) #1
  %5 = and i32 %2, -526337
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %SYSC_accept4.exit

; <label>:7                                       ; preds = %0
  %8 = trunc i64 %fd to i32
  %9 = call i64 @__fdget(i32 %8) #4
  %10 = and i64 %9, -4
  %11 = inttoptr i64 %10 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %9 to i32
  %12 = and i32 %v.tr.i.i.i.i, 3
  %13 = icmp eq i64 %10, 0
  br i1 %13, label %fput_light.exit.i, label %14

; <label>:14                                      ; preds = %7
  %15 = getelementptr inbounds %struct.file* %11, i64 0, i32 3
  %16 = load %struct.file_operations** %15, align 8
  %17 = icmp eq %struct.file_operations* %16, @socket_file_ops
  br i1 %17, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %14
  %18 = getelementptr inbounds %struct.file* %11, i64 0, i32 15
  %19 = load i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %14
  %21 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %14 ]
  %22 = and i32 %v.tr.i.i.i.i, 1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %fput_light.exit.i, label %24

; <label>:24                                      ; preds = %sock_from_file.exit.thread.i.i
  call void @fput(%struct.file* %11) #4
  br label %fput_light.exit.i

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %25 = bitcast i8* %19 to %struct.socket*
  %26 = load %struct.vfsmount** @sock_mnt, align 8
  %27 = getelementptr inbounds %struct.vfsmount* %26, i64 0, i32 1
  %28 = load %struct.super_block** %27, align 8
  %29 = call %struct.inode* @new_inode_pseudo(%struct.super_block* %28) #4
  %30 = icmp eq %struct.inode* %29, null
  br i1 %30, label %sock_release.exit.i, label %sock_alloc.exit.i

sock_alloc.exit.i:                                ; preds = %sockfd_lookup_light.exit.i
  %31 = getelementptr %struct.inode* %29, i64 -1, i32 37
  %32 = bitcast %struct.list_head* %31 to %struct.socket*
  %33 = call i32 @get_next_ino() #4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %struct.inode* %29, i64 0, i32 11
  store i64 %34, i64* %35, align 8
  %36 = getelementptr inbounds %struct.inode* %29, i64 0, i32 0
  store i16 -15873, i16* %36, align 2
  %37 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %38 = getelementptr inbounds %struct.task_struct* %37, i64 0, i32 72
  %39 = load %struct.cred** %38, align 8
  %40 = getelementptr inbounds %struct.cred* %39, i64 0, i32 7, i32 0
  %41 = load i32* %40, align 4
  %42 = getelementptr inbounds %struct.inode* %29, i64 0, i32 2, i32 0
  store i32 %41, i32* %42, align 4
  %43 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %44 = getelementptr inbounds %struct.task_struct* %43, i64 0, i32 72
  %45 = load %struct.cred** %44, align 8
  %46 = getelementptr inbounds %struct.cred* %45, i64 0, i32 8, i32 0
  %47 = load i32* %46, align 4
  %48 = getelementptr inbounds %struct.inode* %29, i64 0, i32 3, i32 0
  store i32 %47, i32* %48, align 4
  %49 = getelementptr inbounds %struct.inode* %29, i64 0, i32 7
  store %struct.inode_operations* @sockfs_inode_ops, %struct.inode_operations** %49, align 8
  call void asm "incl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !6
  %50 = icmp eq %struct.list_head* %31, null
  br i1 %50, label %sock_release.exit.i, label %51

; <label>:51                                      ; preds = %sock_alloc.exit.i
  %52 = getelementptr inbounds i8* %19, i64 4
  %53 = bitcast i8* %52 to i16*
  %54 = load i16* %53, align 2
  %55 = getelementptr inbounds %struct.socket* %32, i64 0, i32 1
  store i16 %54, i16* %55, align 2
  %56 = getelementptr inbounds i8* %19, i64 40
  %57 = bitcast i8* %56 to %struct.proto_ops**
  %58 = load %struct.proto_ops** %57, align 8
  %59 = getelementptr inbounds %struct.list_head* %31, i64 2, i32 1
  %.c.i = bitcast %struct.proto_ops* %58 to %struct.list_head*
  store %struct.list_head* %.c.i, %struct.list_head** %59, align 8
  %60 = getelementptr inbounds %struct.proto_ops* %58, i64 0, i32 1
  %61 = load %struct.module** %60, align 8
  call void @__module_get(%struct.module* %61) #4
  %62 = call i32 @get_unused_fd_flags(i32 %2) #4
  %63 = icmp slt i32 %62, 0
  br i1 %63, label %64, label %98, !prof !1

; <label>:64                                      ; preds = %51
  %65 = load %struct.list_head** %59, align 8
  %66 = icmp eq %struct.list_head* %65, null
  br i1 %66, label %75, label %67

; <label>:67                                      ; preds = %64
  %68 = getelementptr inbounds %struct.list_head* %65, i64 0, i32 1
  %69 = load %struct.list_head** %68, align 8
  %70 = bitcast %struct.list_head* %69 to %struct.module*
  %71 = getelementptr inbounds %struct.list_head* %65, i64 1
  %72 = bitcast %struct.list_head* %71 to i32 (%struct.socket*)**
  %73 = load i32 (%struct.socket*)** %72, align 8
  %74 = call i32 %73(%struct.socket* %32) #4
  store %struct.list_head* null, %struct.list_head** %59, align 8
  call void @module_put(%struct.module* %70) #4
  br label %75

; <label>:75                                      ; preds = %67, %64
  %76 = getelementptr inbounds %struct.list_head* %31, i64 1
  %77 = bitcast %struct.list_head* %76 to %struct.socket_wq**
  %78 = load %struct.socket_wq** %77, align 8
  %79 = getelementptr inbounds %struct.socket_wq* %78, i64 0, i32 1
  %80 = load %struct.fasync_struct** %79, align 8
  %81 = icmp eq %struct.fasync_struct* %80, null
  br i1 %81, label %84, label %82

; <label>:82                                      ; preds = %75
  %83 = call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %84

; <label>:84                                      ; preds = %82, %75
  %85 = getelementptr %struct.inode* %29, i64 -1, i32 37, i32 1
  %86 = bitcast %struct.list_head** %85 to i64*
  %87 = load volatile i64* %86, align 8
  %88 = and i64 %87, 32
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %90, label %sock_release.exit.i

; <label>:90                                      ; preds = %84
  call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %91 = getelementptr inbounds %struct.list_head* %31, i64 1, i32 1
  %92 = load %struct.list_head** %91, align 8
  %93 = icmp eq %struct.list_head* %92, null
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %90
  %95 = getelementptr inbounds %struct.list_head* %31, i64 3
  %96 = bitcast %struct.list_head* %95 to %struct.inode*
  call void @iput(%struct.inode* %96) #4
  br label %sock_release.exit.i

; <label>:97                                      ; preds = %90
  store %struct.list_head* null, %struct.list_head** %91, align 8
  br label %sock_release.exit.i

; <label>:98                                      ; preds = %51
  %99 = getelementptr inbounds i8* %19, i64 32
  %100 = bitcast i8* %99 to %struct.sock**
  %101 = load %struct.sock** %100, align 8
  %102 = getelementptr inbounds %struct.sock* %101, i64 0, i32 36
  %103 = load %struct.proto** %102, align 8
  %104 = getelementptr inbounds %struct.proto* %103, i64 0, i32 43, i64 0
  %105 = call %struct.file* @sock_alloc_file(%struct.socket* %32, i32 %2, i8* %104) #4
  %106 = icmp ugt %struct.file* %105, inttoptr (i64 -4096 to %struct.file*)
  br i1 %106, label %107, label %143, !prof !1

; <label>:107                                     ; preds = %98
  %108 = ptrtoint %struct.file* %105 to i64
  %109 = trunc i64 %108 to i32
  call void @put_unused_fd(i32 %62) #4
  %110 = load %struct.list_head** %59, align 8
  %111 = icmp eq %struct.list_head* %110, null
  br i1 %111, label %120, label %112

; <label>:112                                     ; preds = %107
  %113 = getelementptr inbounds %struct.list_head* %110, i64 0, i32 1
  %114 = load %struct.list_head** %113, align 8
  %115 = bitcast %struct.list_head* %114 to %struct.module*
  %116 = getelementptr inbounds %struct.list_head* %110, i64 1
  %117 = bitcast %struct.list_head* %116 to i32 (%struct.socket*)**
  %118 = load i32 (%struct.socket*)** %117, align 8
  %119 = call i32 %118(%struct.socket* %32) #4
  store %struct.list_head* null, %struct.list_head** %59, align 8
  call void @module_put(%struct.module* %115) #4
  br label %120

; <label>:120                                     ; preds = %112, %107
  %121 = getelementptr inbounds %struct.list_head* %31, i64 1
  %122 = bitcast %struct.list_head* %121 to %struct.socket_wq**
  %123 = load %struct.socket_wq** %122, align 8
  %124 = getelementptr inbounds %struct.socket_wq* %123, i64 0, i32 1
  %125 = load %struct.fasync_struct** %124, align 8
  %126 = icmp eq %struct.fasync_struct* %125, null
  br i1 %126, label %129, label %127

; <label>:127                                     ; preds = %120
  %128 = call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %129

; <label>:129                                     ; preds = %127, %120
  %130 = getelementptr %struct.inode* %29, i64 -1, i32 37, i32 1
  %131 = bitcast %struct.list_head** %130 to i64*
  %132 = load volatile i64* %131, align 8
  %133 = and i64 %132, 32
  %134 = icmp eq i64 %133, 0
  br i1 %134, label %135, label %sock_release.exit.i

; <label>:135                                     ; preds = %129
  call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %136 = getelementptr inbounds %struct.list_head* %31, i64 1, i32 1
  %137 = load %struct.list_head** %136, align 8
  %138 = icmp eq %struct.list_head* %137, null
  br i1 %138, label %139, label %142

; <label>:139                                     ; preds = %135
  %140 = getelementptr inbounds %struct.list_head* %31, i64 3
  %141 = bitcast %struct.list_head* %140 to %struct.inode*
  call void @iput(%struct.inode* %141) #4
  br label %sock_release.exit.i

; <label>:142                                     ; preds = %135
  store %struct.list_head* null, %struct.list_head** %136, align 8
  br label %sock_release.exit.i

; <label>:143                                     ; preds = %98
  %144 = call i32 @security_socket_accept(%struct.socket* %25, %struct.socket* %32) #4
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %146, label %181

; <label>:146                                     ; preds = %143
  %147 = load %struct.proto_ops** %57, align 8
  %148 = getelementptr inbounds %struct.proto_ops* %147, i64 0, i32 6
  %149 = load i32 (%struct.socket*, %struct.socket*, i32)** %148, align 8
  %150 = getelementptr inbounds i8* %19, i64 24
  %151 = bitcast i8* %150 to %struct.file**
  %152 = load %struct.file** %151, align 8
  %153 = getelementptr inbounds %struct.file* %152, i64 0, i32 6
  %154 = load i32* %153, align 4
  %155 = call i32 %149(%struct.socket* %25, %struct.socket* %32, i32 %154) #4
  %156 = icmp slt i32 %155, 0
  br i1 %156, label %181, label %157

; <label>:157                                     ; preds = %146
  %158 = icmp eq i64 %upeer_sockaddr, 0
  br i1 %158, label %172, label %159

; <label>:159                                     ; preds = %157
  %160 = load %struct.list_head** %59, align 8
  %161 = getelementptr inbounds %struct.list_head* %160, i64 3, i32 1
  %162 = load %struct.list_head** %161, align 8
  %163 = bitcast %struct.list_head* %162 to i32 (%struct.socket*, %struct.sockaddr*, i32*, i32)*
  %164 = bitcast %struct.__kernel_sockaddr_storage* %address.i to %struct.sockaddr*
  %165 = call i32 %163(%struct.socket* %32, %struct.sockaddr* %164, i32* %len.i, i32 2) #4
  %166 = icmp slt i32 %165, 0
  br i1 %166, label %181, label %167

; <label>:167                                     ; preds = %159
  %168 = load i32* %len.i, align 4
  %169 = inttoptr i64 %upeer_sockaddr to i8*
  %170 = call fastcc i32 @move_addr_to_user(%struct.__kernel_sockaddr_storage* %address.i, i32 %168, i8* %169, i32* %1) #4
  %171 = icmp slt i32 %170, 0
  br i1 %171, label %181, label %172

; <label>:172                                     ; preds = %167, %157
  call void @fd_install(i32 %62, %struct.file* %105) #4
  br label %sock_release.exit.i

sock_release.exit.i:                              ; preds = %181, %172, %142, %139, %129, %97, %94, %84, %sock_alloc.exit.i, %sockfd_lookup_light.exit.i
  %173 = phi i32 [ -23, %sock_alloc.exit.i ], [ %182, %181 ], [ %62, %172 ], [ %62, %84 ], [ %62, %94 ], [ %62, %97 ], [ %109, %129 ], [ %109, %139 ], [ %109, %142 ], [ -23, %sockfd_lookup_light.exit.i ]
  %174 = icmp eq i32 %12, 0
  br i1 %174, label %fput_light.exit.i, label %175

; <label>:175                                     ; preds = %sock_release.exit.i
  %176 = getelementptr inbounds i8* %19, i64 24
  %177 = bitcast i8* %176 to %struct.file**
  %178 = load %struct.file** %177, align 8
  call void @fput(%struct.file* %178) #4
  br label %fput_light.exit.i

fput_light.exit.i:                                ; preds = %175, %sock_release.exit.i, %24, %sock_from_file.exit.thread.i.i, %7
  %179 = phi i32 [ %173, %sock_release.exit.i ], [ %173, %175 ], [ -9, %7 ], [ %21, %sock_from_file.exit.thread.i.i ], [ %21, %24 ]
  %180 = sext i32 %179 to i64
  br label %SYSC_accept4.exit

; <label>:181                                     ; preds = %167, %159, %146, %143
  %182 = phi i32 [ %144, %143 ], [ %170, %167 ], [ %155, %146 ], [ -103, %159 ]
  call void @fput(%struct.file* %105) #4
  call void @put_unused_fd(i32 %62) #4
  br label %sock_release.exit.i

SYSC_accept4.exit:                                ; preds = %fput_light.exit.i, %0
  %.0.i = phi i64 [ %180, %fput_light.exit.i ], [ -22, %0 ]
  call void @llvm.lifetime.end(i64 128, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_accept(i64 %fd, i64 %upeer_sockaddr, i64 %upeer_addrlen) #0 {
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %upeer_sockaddr to %struct.sockaddr*
  %3 = inttoptr i64 %upeer_addrlen to i32*
  %4 = tail call i64 bitcast (i64 (i64, i64, i64, i64)* @SyS_accept4 to i64 (i32, %struct.sockaddr*, i32*, i32)*)(i32 %1, %struct.sockaddr* %2, i32* %3, i32 0) #4
  ret i64 %4
}

; Function Attrs: noredzone nounwind
define i64 @SyS_connect(i64 %fd, i64 %uservaddr, i64 %addrlen) #0 {
  %address.i = alloca %struct.__kernel_sockaddr_storage, align 8
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %addrlen to i32
  %3 = bitcast %struct.__kernel_sockaddr_storage* %address.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %3) #1
  %4 = call i64 @__fdget(i32 %1) #4
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %4 to i32
  %7 = and i32 %v.tr.i.i.i.i, 3
  %8 = icmp eq i64 %5, 0
  br i1 %8, label %SYSC_connect.exit, label %9

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %11 = load %struct.file_operations** %10, align 8
  %12 = icmp eq %struct.file_operations* %11, @socket_file_ops
  br i1 %12, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %9
  %13 = getelementptr inbounds %struct.file* %6, i64 0, i32 15
  %14 = load i8** %13, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %9
  %16 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %9 ]
  %17 = and i32 %v.tr.i.i.i.i, 1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %SYSC_connect.exit, label %19

; <label>:19                                      ; preds = %sock_from_file.exit.thread.i.i
  call void @fput(%struct.file* %6) #4
  br label %SYSC_connect.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %20 = bitcast i8* %14 to %struct.socket*
  %21 = inttoptr i64 %uservaddr to i8*
  %22 = call i32 @move_addr_to_kernel(i8* %21, i32 %2, %struct.__kernel_sockaddr_storage* %address.i) #4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %40, label %24

; <label>:24                                      ; preds = %sockfd_lookup_light.exit.i
  %25 = bitcast %struct.__kernel_sockaddr_storage* %address.i to %struct.sockaddr*
  %26 = call i32 @security_socket_connect(%struct.socket* %20, %struct.sockaddr* %25, i32 %2) #4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %40

; <label>:28                                      ; preds = %24
  %29 = getelementptr inbounds i8* %14, i64 40
  %30 = bitcast i8* %29 to %struct.proto_ops**
  %31 = load %struct.proto_ops** %30, align 8
  %32 = getelementptr inbounds %struct.proto_ops* %31, i64 0, i32 4
  %33 = load i32 (%struct.socket*, %struct.sockaddr*, i32, i32)** %32, align 8
  %34 = getelementptr inbounds i8* %14, i64 24
  %35 = bitcast i8* %34 to %struct.file**
  %36 = load %struct.file** %35, align 8
  %37 = getelementptr inbounds %struct.file* %36, i64 0, i32 6
  %38 = load i32* %37, align 4
  %39 = call i32 %33(%struct.socket* %20, %struct.sockaddr* %25, i32 %2, i32 %38) #4
  br label %40

; <label>:40                                      ; preds = %28, %24, %sockfd_lookup_light.exit.i
  %41 = phi i32 [ %26, %24 ], [ %22, %sockfd_lookup_light.exit.i ], [ %39, %28 ]
  %42 = icmp eq i32 %7, 0
  br i1 %42, label %SYSC_connect.exit, label %43

; <label>:43                                      ; preds = %40
  %44 = getelementptr inbounds i8* %14, i64 24
  %45 = bitcast i8* %44 to %struct.file**
  %46 = load %struct.file** %45, align 8
  call void @fput(%struct.file* %46) #4
  br label %SYSC_connect.exit

SYSC_connect.exit:                                ; preds = %43, %40, %19, %sock_from_file.exit.thread.i.i, %0
  %47 = phi i32 [ %41, %40 ], [ %41, %43 ], [ -9, %0 ], [ %16, %sock_from_file.exit.thread.i.i ], [ %16, %19 ]
  %48 = sext i32 %47 to i64
  call void @llvm.lifetime.end(i64 128, i8* %3) #1
  ret i64 %48
}

; Function Attrs: noredzone nounwind
define i64 @SyS_getsockname(i64 %fd, i64 %usockaddr, i64 %usockaddr_len) #0 {
  %address.i = alloca %struct.__kernel_sockaddr_storage, align 8
  %len.i = alloca i32, align 4
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %usockaddr_len to i32*
  %3 = bitcast i32* %len.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast %struct.__kernel_sockaddr_storage* %address.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %4) #1
  %5 = call i64 @__fdget(i32 %1) #4
  %6 = and i64 %5, -4
  %7 = inttoptr i64 %6 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %5 to i32
  %8 = and i32 %v.tr.i.i.i.i, 3
  %9 = icmp eq i64 %6, 0
  br i1 %9, label %SYSC_getsockname.exit, label %10

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.file* %7, i64 0, i32 3
  %12 = load %struct.file_operations** %11, align 8
  %13 = icmp eq %struct.file_operations* %12, @socket_file_ops
  br i1 %13, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %10
  %14 = getelementptr inbounds %struct.file* %7, i64 0, i32 15
  %15 = load i8** %14, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %10
  %17 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %10 ]
  %18 = and i32 %v.tr.i.i.i.i, 1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %SYSC_getsockname.exit, label %20

; <label>:20                                      ; preds = %sock_from_file.exit.thread.i.i
  call void @fput(%struct.file* %7) #4
  br label %SYSC_getsockname.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %21 = bitcast i8* %15 to %struct.socket*
  %22 = call i32 @security_socket_getsockname(%struct.socket* %21) #4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %37

; <label>:24                                      ; preds = %sockfd_lookup_light.exit.i
  %25 = getelementptr inbounds i8* %15, i64 40
  %26 = bitcast i8* %25 to %struct.proto_ops**
  %27 = load %struct.proto_ops** %26, align 8
  %28 = getelementptr inbounds %struct.proto_ops* %27, i64 0, i32 7
  %29 = load i32 (%struct.socket*, %struct.sockaddr*, i32*, i32)** %28, align 8
  %30 = bitcast %struct.__kernel_sockaddr_storage* %address.i to %struct.sockaddr*
  %31 = call i32 %29(%struct.socket* %21, %struct.sockaddr* %30, i32* %len.i, i32 0) #4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

; <label>:33                                      ; preds = %24
  %34 = load i32* %len.i, align 4
  %35 = inttoptr i64 %usockaddr to i8*
  %36 = call fastcc i32 @move_addr_to_user(%struct.__kernel_sockaddr_storage* %address.i, i32 %34, i8* %35, i32* %2) #4
  br label %37

; <label>:37                                      ; preds = %33, %24, %sockfd_lookup_light.exit.i
  %38 = phi i32 [ %31, %24 ], [ %22, %sockfd_lookup_light.exit.i ], [ %36, %33 ]
  %39 = icmp eq i32 %8, 0
  br i1 %39, label %SYSC_getsockname.exit, label %40

; <label>:40                                      ; preds = %37
  %41 = getelementptr inbounds i8* %15, i64 24
  %42 = bitcast i8* %41 to %struct.file**
  %43 = load %struct.file** %42, align 8
  call void @fput(%struct.file* %43) #4
  br label %SYSC_getsockname.exit

SYSC_getsockname.exit:                            ; preds = %40, %37, %20, %sock_from_file.exit.thread.i.i, %0
  %44 = phi i32 [ %38, %37 ], [ %38, %40 ], [ -9, %0 ], [ %17, %sock_from_file.exit.thread.i.i ], [ %17, %20 ]
  %45 = sext i32 %44 to i64
  call void @llvm.lifetime.end(i64 128, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  ret i64 %45
}

; Function Attrs: noredzone nounwind
define i64 @SyS_getpeername(i64 %fd, i64 %usockaddr, i64 %usockaddr_len) #0 {
  %address.i = alloca %struct.__kernel_sockaddr_storage, align 8
  %len.i = alloca i32, align 4
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %usockaddr_len to i32*
  %3 = bitcast i32* %len.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast %struct.__kernel_sockaddr_storage* %address.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %4) #1
  %5 = call i64 @__fdget(i32 %1) #4
  %6 = and i64 %5, -4
  %7 = inttoptr i64 %6 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %5 to i32
  %8 = and i32 %v.tr.i.i.i.i, 3
  %9 = icmp eq i64 %6, 0
  br i1 %9, label %SYSC_getpeername.exit, label %10

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.file* %7, i64 0, i32 3
  %12 = load %struct.file_operations** %11, align 8
  %13 = icmp eq %struct.file_operations* %12, @socket_file_ops
  br i1 %13, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %10
  %14 = getelementptr inbounds %struct.file* %7, i64 0, i32 15
  %15 = load i8** %14, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %10
  %17 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %10 ]
  %18 = and i32 %v.tr.i.i.i.i, 1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %SYSC_getpeername.exit, label %20

; <label>:20                                      ; preds = %sock_from_file.exit.thread.i.i
  call void @fput(%struct.file* %7) #4
  br label %SYSC_getpeername.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %21 = bitcast i8* %15 to %struct.socket*
  %22 = call i32 @security_socket_getpeername(%struct.socket* %21) #4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %30, label %24

; <label>:24                                      ; preds = %sockfd_lookup_light.exit.i
  %25 = icmp eq i32 %8, 0
  br i1 %25, label %SYSC_getpeername.exit, label %26

; <label>:26                                      ; preds = %24
  %27 = getelementptr inbounds i8* %15, i64 24
  %28 = bitcast i8* %27 to %struct.file**
  %29 = load %struct.file** %28, align 8
  call void @fput(%struct.file* %29) #4
  br label %SYSC_getpeername.exit

; <label>:30                                      ; preds = %sockfd_lookup_light.exit.i
  %31 = getelementptr inbounds i8* %15, i64 40
  %32 = bitcast i8* %31 to %struct.proto_ops**
  %33 = load %struct.proto_ops** %32, align 8
  %34 = getelementptr inbounds %struct.proto_ops* %33, i64 0, i32 7
  %35 = load i32 (%struct.socket*, %struct.sockaddr*, i32*, i32)** %34, align 8
  %36 = bitcast %struct.__kernel_sockaddr_storage* %address.i to %struct.sockaddr*
  %37 = call i32 %35(%struct.socket* %21, %struct.sockaddr* %36, i32* %len.i, i32 1) #4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %43

; <label>:39                                      ; preds = %30
  %40 = load i32* %len.i, align 4
  %41 = inttoptr i64 %usockaddr to i8*
  %42 = call fastcc i32 @move_addr_to_user(%struct.__kernel_sockaddr_storage* %address.i, i32 %40, i8* %41, i32* %2) #4
  br label %43

; <label>:43                                      ; preds = %39, %30
  %44 = phi i32 [ %37, %30 ], [ %42, %39 ]
  %45 = icmp eq i32 %8, 0
  br i1 %45, label %SYSC_getpeername.exit, label %46

; <label>:46                                      ; preds = %43
  %47 = getelementptr inbounds i8* %15, i64 24
  %48 = bitcast i8* %47 to %struct.file**
  %49 = load %struct.file** %48, align 8
  call void @fput(%struct.file* %49) #4
  br label %SYSC_getpeername.exit

SYSC_getpeername.exit:                            ; preds = %46, %43, %26, %24, %20, %sock_from_file.exit.thread.i.i, %0
  %50 = phi i32 [ %22, %24 ], [ %22, %26 ], [ %44, %43 ], [ %44, %46 ], [ -9, %0 ], [ %17, %sock_from_file.exit.thread.i.i ], [ %17, %20 ]
  %.0.i = sext i32 %50 to i64
  call void @llvm.lifetime.end(i64 128, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_sendto(i64 %fd, i64 %buff, i64 %len, i64 %flags, i64 %addr, i64 %addr_len) #0 {
  %.sroa.3.i.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb.i.i.i = alloca %struct.kiocb, align 8
  %siocb.i.i.i = alloca %struct.sock_iocb, align 8
  %address.i = alloca %struct.__kernel_sockaddr_storage, align 8
  %msg.i = alloca %struct.msghdr, align 8
  %iov.i = alloca %struct.iovec, align 8
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %buff to i8*
  %3 = trunc i64 %flags to i32
  %4 = trunc i64 %addr_len to i32
  %5 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %5) #1
  %6 = bitcast %struct.__kernel_sockaddr_storage* %address.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %6) #1
  %7 = bitcast %struct.msghdr* %msg.i to i8*
  call void @llvm.lifetime.start(i64 80, i8* %7) #1
  %8 = icmp ugt i64 %len, 2147483647
  %.len.i = select i1 %8, i64 2147483647, i64 %len
  %9 = call i64 @__fdget(i32 %1) #4
  %10 = and i64 %9, -4
  %11 = inttoptr i64 %10 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %9 to i32
  %12 = and i32 %v.tr.i.i.i.i, 3
  %13 = icmp eq i64 %10, 0
  br i1 %13, label %SYSC_sendto.exit, label %14

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.file* %11, i64 0, i32 3
  %16 = load %struct.file_operations** %15, align 8
  %17 = icmp eq %struct.file_operations* %16, @socket_file_ops
  br i1 %17, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %14
  %18 = getelementptr inbounds %struct.file* %11, i64 0, i32 15
  %19 = load i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %14
  %21 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %14 ]
  %22 = and i32 %v.tr.i.i.i.i, 1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %SYSC_sendto.exit, label %24

; <label>:24                                      ; preds = %sock_from_file.exit.thread.i.i
  call void @fput(%struct.file* %11) #4
  br label %SYSC_sendto.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %25 = bitcast i8* %19 to %struct.socket*
  %26 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 0
  store i8* %2, i8** %26, align 8
  %27 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 1
  store i64 %.len.i, i64* %27, align 8
  %28 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 0
  store i8* null, i8** %28, align 8
  %29 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 2
  call void @iov_iter_init(%struct.iov_iter* %29, i32 1, %struct.iovec* %iov.i, i64 1, i64 %.len.i) #4
  %30 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 3
  store i8* null, i8** %30, align 8
  %31 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 4
  store i64 0, i64* %31, align 8
  %32 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 1
  store i32 0, i32* %32, align 8
  %33 = icmp eq i64 %addr, 0
  br i1 %33, label %39, label %34

; <label>:34                                      ; preds = %sockfd_lookup_light.exit.i
  %35 = inttoptr i64 %addr to i8*
  %36 = call i32 @move_addr_to_kernel(i8* %35, i32 %4, %struct.__kernel_sockaddr_storage* %address.i) #4
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %sock_sendmsg.exit.i, label %38

; <label>:38                                      ; preds = %34
  store i8* %6, i8** %28, align 8
  store i32 %4, i32* %32, align 8
  br label %39

; <label>:39                                      ; preds = %38, %sockfd_lookup_light.exit.i
  %40 = getelementptr inbounds i8* %19, i64 24
  %41 = bitcast i8* %40 to %struct.file**
  %42 = load %struct.file** %41, align 8
  %43 = getelementptr inbounds %struct.file* %42, i64 0, i32 6
  %44 = load i32* %43, align 4
  %45 = lshr i32 %44, 5
  %46 = and i32 %45, 64
  %47 = or i32 %46, %3
  %48 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 5
  store i32 %47, i32* %48, align 8
  %49 = bitcast %struct.kiocb* %iocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %49) #1
  %50 = bitcast %struct.sock_iocb* %siocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %50) #1
  %51 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %51)
  %52 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %52)
  call void @llvm.memset.p0i8.i64(i8* %51, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 48, i32 8, i1 false)
  %53 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %54 = getelementptr inbounds %struct.kiocb* %iocb.i.i.i, i64 0, i32 0
  store %struct.file* null, %struct.file** %54, align 8
  %55 = getelementptr inbounds %struct.kiocb* %iocb.i.i.i, i64 0, i32 1
  %56 = bitcast %struct.kioctx** %55 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %56, i8* %51, i64 16, i32 8, i1 false) #1
  %57 = getelementptr inbounds %struct.kiocb* %iocb.i.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i.i = bitcast %struct.task_struct* %53 to i8*
  store i8* %.c.i.i.i.i, i8** %57, align 8
  %58 = getelementptr inbounds %struct.kiocb* %iocb.i.i.i, i64 0, i32 5
  %59 = bitcast i64* %58 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %52, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %51)
  call void @llvm.lifetime.end(i64 48, i8* %52)
  %60 = getelementptr inbounds %struct.kiocb* %iocb.i.i.i, i64 0, i32 3
  store i8* %50, i8** %60, align 8
  %61 = trunc i64 %.len.i to i32
  %62 = call i32 @security_socket_sendmsg(%struct.socket* %25, %struct.msghdr* %msg.i, i32 %61) #4
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %__sock_sendmsg.exit.i.i.i

; <label>:64                                      ; preds = %39
  %65 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i.i, i64 0, i32 3
  store %struct.socket* %25, %struct.socket** %65, align 8
  %66 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i.i, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %66, align 8
  %67 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i.i, i64 0, i32 6
  store %struct.msghdr* %msg.i, %struct.msghdr** %67, align 8
  %68 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i.i, i64 0, i32 2
  store i32 %61, i32* %68, align 4
  %69 = getelementptr inbounds i8* %19, i64 40
  %70 = bitcast i8* %69 to %struct.proto_ops**
  %71 = load %struct.proto_ops** %70, align 8
  %72 = getelementptr inbounds %struct.proto_ops* %71, i64 0, i32 17
  %73 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64)** %72, align 8
  %74 = call i32 %73(%struct.kiocb* %iocb.i.i.i, %struct.socket* %25, %struct.msghdr* %msg.i, i64 %.len.i) #4
  br label %__sock_sendmsg.exit.i.i.i

__sock_sendmsg.exit.i.i.i:                        ; preds = %64, %39
  %75 = phi i32 [ %74, %64 ], [ %62, %39 ]
  %76 = icmp eq i32 %75, -529
  br i1 %76, label %77, label %sock_sendmsg.exit.i

; <label>:77                                      ; preds = %__sock_sendmsg.exit.i.i.i
  %78 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb.i.i.i) #4
  %79 = trunc i64 %78 to i32
  br label %sock_sendmsg.exit.i

sock_sendmsg.exit.i:                              ; preds = %77, %__sock_sendmsg.exit.i.i.i, %34
  %80 = phi i32 [ %36, %34 ], [ %79, %77 ], [ %75, %__sock_sendmsg.exit.i.i.i ]
  %81 = icmp eq i32 %12, 0
  br i1 %81, label %SYSC_sendto.exit, label %82

; <label>:82                                      ; preds = %sock_sendmsg.exit.i
  %83 = getelementptr inbounds i8* %19, i64 24
  %84 = bitcast i8* %83 to %struct.file**
  %85 = load %struct.file** %84, align 8
  call void @fput(%struct.file* %85) #4
  br label %SYSC_sendto.exit

SYSC_sendto.exit:                                 ; preds = %82, %sock_sendmsg.exit.i, %24, %sock_from_file.exit.thread.i.i, %0
  %86 = phi i32 [ %80, %sock_sendmsg.exit.i ], [ %80, %82 ], [ -9, %0 ], [ %21, %sock_from_file.exit.thread.i.i ], [ %21, %24 ]
  %87 = sext i32 %86 to i64
  call void @llvm.lifetime.end(i64 80, i8* %7) #1
  call void @llvm.lifetime.end(i64 128, i8* %6) #1
  call void @llvm.lifetime.end(i64 16, i8* %5) #1
  ret i64 %87
}

; Function Attrs: noredzone nounwind
define i64 @SyS_send(i64 %fd, i64 %buff, i64 %len, i64 %flags) #0 {
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %buff to i8*
  %3 = trunc i64 %flags to i32
  %4 = tail call i64 bitcast (i64 (i64, i64, i64, i64, i64, i64)* @SyS_sendto to i64 (i32, i8*, i64, i32, %struct.sockaddr*, i32)*)(i32 %1, i8* %2, i64 %len, i32 %3, %struct.sockaddr* null, i32 0) #4
  ret i64 %4
}

; Function Attrs: noredzone nounwind
define i64 @SyS_recvfrom(i64 %fd, i64 %ubuf, i64 %size, i64 %flags, i64 %addr, i64 %addr_len) #0 {
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb.i.i = alloca %struct.kiocb, align 8
  %siocb.i.i = alloca %struct.sock_iocb, align 8
  %iov.i = alloca %struct.iovec, align 8
  %msg.i = alloca %struct.msghdr, align 8
  %address.i = alloca %struct.__kernel_sockaddr_storage, align 8
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %ubuf to i8*
  %3 = trunc i64 %flags to i32
  %4 = inttoptr i64 %addr_len to i32*
  %5 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %5) #1
  %6 = bitcast %struct.msghdr* %msg.i to i8*
  call void @llvm.lifetime.start(i64 80, i8* %6) #1
  %7 = bitcast %struct.__kernel_sockaddr_storage* %address.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %7) #1
  %8 = icmp ugt i64 %size, 2147483647
  %.size.i = select i1 %8, i64 2147483647, i64 %size
  %9 = call i64 @__fdget(i32 %1) #4
  %10 = and i64 %9, -4
  %11 = inttoptr i64 %10 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %9 to i32
  %12 = and i32 %v.tr.i.i.i.i, 3
  %13 = icmp eq i64 %10, 0
  br i1 %13, label %SYSC_recvfrom.exit, label %14

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.file* %11, i64 0, i32 3
  %16 = load %struct.file_operations** %15, align 8
  %17 = icmp eq %struct.file_operations* %16, @socket_file_ops
  br i1 %17, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %14
  %18 = getelementptr inbounds %struct.file* %11, i64 0, i32 15
  %19 = load i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %14
  %ret.0.i5.i = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %14 ]
  %21 = and i32 %v.tr.i.i.i.i, 1
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %SYSC_recvfrom.exit, label %23

; <label>:23                                      ; preds = %sock_from_file.exit.thread.i.i
  call void @fput(%struct.file* %11) #4
  br label %SYSC_recvfrom.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %24 = bitcast i8* %19 to %struct.socket*
  %25 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 3
  store i8* null, i8** %25, align 8
  %26 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 4
  store i64 0, i64* %26, align 8
  %27 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 1
  store i64 %.size.i, i64* %27, align 8
  %28 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 0
  store i8* %2, i8** %28, align 8
  %29 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 2
  call void @iov_iter_init(%struct.iov_iter* %29, i32 0, %struct.iovec* %iov.i, i64 1, i64 %.size.i) #4
  %30 = icmp ne i64 %addr, 0
  %..i = select i1 %30, i8* %7, i8* null
  %31 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 0
  store i8* %..i, i8** %31, align 8
  %32 = getelementptr inbounds %struct.msghdr* %msg.i, i64 0, i32 1
  store i32 0, i32* %32, align 8
  %33 = getelementptr inbounds i8* %19, i64 24
  %34 = bitcast i8* %33 to %struct.file**
  %35 = load %struct.file** %34, align 8
  %36 = getelementptr inbounds %struct.file* %35, i64 0, i32 6
  %37 = load i32* %36, align 4
  %38 = lshr i32 %37, 5
  %39 = and i32 %38, 64
  %40 = or i32 %39, %3
  %41 = bitcast %struct.kiocb* %iocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %41) #1
  %42 = bitcast %struct.sock_iocb* %siocb.i.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %42) #1
  %43 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %43)
  %44 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %44)
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %44, i8 0, i64 48, i32 8, i1 false)
  %45 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %46 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 0
  store %struct.file* null, %struct.file** %46, align 8
  %47 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 1
  %48 = bitcast %struct.kioctx** %47 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %48, i8* %43, i64 16, i32 8, i1 false) #1
  %49 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %45 to i8*
  store i8* %.c.i.i.i, i8** %49, align 8
  %50 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 5
  %51 = bitcast i64* %50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %44, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %43)
  call void @llvm.lifetime.end(i64 48, i8* %44)
  %52 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 3
  store i8* %42, i8** %52, align 8
  %53 = trunc i64 %.size.i to i32
  %54 = call i32 @security_socket_recvmsg(%struct.socket* %24, %struct.msghdr* %msg.i, i32 %53, i32 %40) #4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %__sock_recvmsg.exit.i.i

; <label>:56                                      ; preds = %sockfd_lookup_light.exit.i
  %57 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 3
  store %struct.socket* %24, %struct.socket** %57, align 8
  %58 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %58, align 8
  %59 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 6
  store %struct.msghdr* %msg.i, %struct.msghdr** %59, align 8
  %60 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 2
  store i32 %53, i32* %60, align 4
  %61 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 1
  store i32 %40, i32* %61, align 8
  %62 = getelementptr inbounds i8* %19, i64 40
  %63 = bitcast i8* %62 to %struct.proto_ops**
  %64 = load %struct.proto_ops** %63, align 8
  %65 = getelementptr inbounds %struct.proto_ops* %64, i64 0, i32 18
  %66 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64, i32)** %65, align 8
  %67 = call i32 %66(%struct.kiocb* %iocb.i.i, %struct.socket* %24, %struct.msghdr* %msg.i, i64 %.size.i, i32 %40) #4
  br label %__sock_recvmsg.exit.i.i

__sock_recvmsg.exit.i.i:                          ; preds = %56, %sockfd_lookup_light.exit.i
  %68 = phi i32 [ %67, %56 ], [ %54, %sockfd_lookup_light.exit.i ]
  %69 = icmp eq i32 %68, -529
  br i1 %69, label %70, label %sock_recvmsg.exit.i

; <label>:70                                      ; preds = %__sock_recvmsg.exit.i.i
  %71 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb.i.i) #4
  %72 = trunc i64 %71 to i32
  br label %sock_recvmsg.exit.i

sock_recvmsg.exit.i:                              ; preds = %70, %__sock_recvmsg.exit.i.i
  %ret.0.i.i = phi i32 [ %72, %70 ], [ %68, %__sock_recvmsg.exit.i.i ]
  call void @llvm.lifetime.end(i64 144, i8* %42) #1
  call void @llvm.lifetime.end(i64 88, i8* %41) #1
  %73 = icmp sgt i32 %ret.0.i.i, -1
  %or.cond.i = and i1 %73, %30
  br i1 %or.cond.i, label %74, label %79

; <label>:74                                      ; preds = %sock_recvmsg.exit.i
  %75 = load i32* %32, align 8
  %76 = inttoptr i64 %addr to i8*
  %77 = call fastcc i32 @move_addr_to_user(%struct.__kernel_sockaddr_storage* %address.i, i32 %75, i8* %76, i32* %4) #4
  %78 = icmp slt i32 %77, 0
  %.ret.0.i.i = select i1 %78, i32 %77, i32 %ret.0.i.i
  br label %79

; <label>:79                                      ; preds = %74, %sock_recvmsg.exit.i
  %ret.0.i4.i = phi i32 [ %ret.0.i.i, %sock_recvmsg.exit.i ], [ %.ret.0.i.i, %74 ]
  %80 = icmp eq i32 %12, 0
  br i1 %80, label %SYSC_recvfrom.exit, label %81

; <label>:81                                      ; preds = %79
  %82 = load %struct.file** %34, align 8
  call void @fput(%struct.file* %82) #4
  br label %SYSC_recvfrom.exit

SYSC_recvfrom.exit:                               ; preds = %81, %79, %23, %sock_from_file.exit.thread.i.i, %0
  %ret.0.i3.i = phi i32 [ %ret.0.i4.i, %79 ], [ %ret.0.i4.i, %81 ], [ -9, %0 ], [ %ret.0.i5.i, %sock_from_file.exit.thread.i.i ], [ %ret.0.i5.i, %23 ]
  %83 = sext i32 %ret.0.i3.i to i64
  call void @llvm.lifetime.end(i64 128, i8* %7) #1
  call void @llvm.lifetime.end(i64 80, i8* %6) #1
  call void @llvm.lifetime.end(i64 16, i8* %5) #1
  ret i64 %83
}

; Function Attrs: noredzone nounwind
define i64 @SyS_recv(i64 %fd, i64 %ubuf, i64 %size, i64 %flags) #0 {
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %ubuf to i8*
  %3 = trunc i64 %flags to i32
  %4 = tail call i64 bitcast (i64 (i64, i64, i64, i64, i64, i64)* @SyS_recvfrom to i64 (i32, i8*, i64, i32, %struct.sockaddr*, i32*)*)(i32 %1, i8* %2, i64 %size, i32 %3, %struct.sockaddr* null, i32* null) #4
  ret i64 %4
}

; Function Attrs: noredzone nounwind
define i64 @SyS_setsockopt(i64 %fd, i64 %level, i64 %optname, i64 %optval, i64 %optlen) #0 {
  %1 = trunc i64 %level to i32
  %2 = trunc i64 %optname to i32
  %3 = inttoptr i64 %optval to i8*
  %4 = trunc i64 %optlen to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %SYSC_setsockopt.exit, label %6

; <label>:6                                       ; preds = %0
  %7 = trunc i64 %fd to i32
  %8 = tail call i64 @__fdget(i32 %7) #4
  %9 = and i64 %8, -4
  %10 = inttoptr i64 %9 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %8 to i32
  %11 = and i32 %v.tr.i.i.i.i, 3
  %12 = icmp eq i64 %9, 0
  br i1 %12, label %fput_light.exit.i, label %13

; <label>:13                                      ; preds = %6
  %14 = getelementptr inbounds %struct.file* %10, i64 0, i32 3
  %15 = load %struct.file_operations** %14, align 8
  %16 = icmp eq %struct.file_operations* %15, @socket_file_ops
  br i1 %16, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %13
  %17 = getelementptr inbounds %struct.file* %10, i64 0, i32 15
  %18 = load i8** %17, align 8
  %19 = icmp eq i8* %18, null
  br i1 %19, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %13
  %20 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %13 ]
  %21 = and i32 %v.tr.i.i.i.i, 1
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %fput_light.exit.i, label %23

; <label>:23                                      ; preds = %sock_from_file.exit.thread.i.i
  tail call void @fput(%struct.file* %10) #4
  br label %fput_light.exit.i

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %24 = bitcast i8* %18 to %struct.socket*
  %25 = tail call i32 @security_socket_setsockopt(%struct.socket* %24, i32 %1, i32 %2) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %38

; <label>:27                                      ; preds = %sockfd_lookup_light.exit.i
  %28 = icmp eq i32 %1, 1
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %27
  %30 = tail call i32 @sock_setsockopt(%struct.socket* %24, i32 1, i32 %2, i8* %3, i32 %4) #4
  br label %38

; <label>:31                                      ; preds = %27
  %32 = getelementptr inbounds i8* %18, i64 40
  %33 = bitcast i8* %32 to %struct.proto_ops**
  %34 = load %struct.proto_ops** %33, align 8
  %35 = getelementptr inbounds %struct.proto_ops* %34, i64 0, i32 13
  %36 = load i32 (%struct.socket*, i32, i32, i8*, i32)** %35, align 8
  %37 = tail call i32 %36(%struct.socket* %24, i32 %1, i32 %2, i8* %3, i32 %4) #4
  br label %38

; <label>:38                                      ; preds = %31, %29, %sockfd_lookup_light.exit.i
  %39 = phi i32 [ %25, %sockfd_lookup_light.exit.i ], [ %30, %29 ], [ %37, %31 ]
  %40 = icmp eq i32 %11, 0
  br i1 %40, label %fput_light.exit.i, label %41

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds i8* %18, i64 24
  %43 = bitcast i8* %42 to %struct.file**
  %44 = load %struct.file** %43, align 8
  tail call void @fput(%struct.file* %44) #4
  br label %fput_light.exit.i

fput_light.exit.i:                                ; preds = %41, %38, %23, %sock_from_file.exit.thread.i.i, %6
  %45 = phi i32 [ %39, %38 ], [ %39, %41 ], [ -9, %6 ], [ %20, %sock_from_file.exit.thread.i.i ], [ %20, %23 ]
  %46 = sext i32 %45 to i64
  br label %SYSC_setsockopt.exit

SYSC_setsockopt.exit:                             ; preds = %fput_light.exit.i, %0
  %.0.i = phi i64 [ %46, %fput_light.exit.i ], [ -22, %0 ]
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_getsockopt(i64 %fd, i64 %level, i64 %optname, i64 %optval, i64 %optlen) #0 {
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %level to i32
  %3 = trunc i64 %optname to i32
  %4 = inttoptr i64 %optval to i8*
  %5 = inttoptr i64 %optlen to i32*
  %6 = tail call i64 @__fdget(i32 %1) #4
  %7 = and i64 %6, -4
  %8 = inttoptr i64 %7 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %6 to i32
  %9 = and i32 %v.tr.i.i.i.i, 3
  %10 = icmp eq i64 %7, 0
  br i1 %10, label %SYSC_getsockopt.exit, label %11

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.file* %8, i64 0, i32 3
  %13 = load %struct.file_operations** %12, align 8
  %14 = icmp eq %struct.file_operations* %13, @socket_file_ops
  br i1 %14, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %11
  %15 = getelementptr inbounds %struct.file* %8, i64 0, i32 15
  %16 = load i8** %15, align 8
  %17 = icmp eq i8* %16, null
  br i1 %17, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %11
  %18 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %11 ]
  %19 = and i32 %v.tr.i.i.i.i, 1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %SYSC_getsockopt.exit, label %21

; <label>:21                                      ; preds = %sock_from_file.exit.thread.i.i
  tail call void @fput(%struct.file* %8) #4
  br label %SYSC_getsockopt.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %22 = bitcast i8* %16 to %struct.socket*
  %23 = tail call i32 @security_socket_getsockopt(%struct.socket* %22, i32 %2, i32 %3) #4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %36

; <label>:25                                      ; preds = %sockfd_lookup_light.exit.i
  %26 = icmp eq i32 %2, 1
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %25
  %28 = tail call i32 @sock_getsockopt(%struct.socket* %22, i32 1, i32 %3, i8* %4, i32* %5) #4
  br label %36

; <label>:29                                      ; preds = %25
  %30 = getelementptr inbounds i8* %16, i64 40
  %31 = bitcast i8* %30 to %struct.proto_ops**
  %32 = load %struct.proto_ops** %31, align 8
  %33 = getelementptr inbounds %struct.proto_ops* %32, i64 0, i32 14
  %34 = load i32 (%struct.socket*, i32, i32, i8*, i32*)** %33, align 8
  %35 = tail call i32 %34(%struct.socket* %22, i32 %2, i32 %3, i8* %4, i32* %5) #4
  br label %36

; <label>:36                                      ; preds = %29, %27, %sockfd_lookup_light.exit.i
  %37 = phi i32 [ %23, %sockfd_lookup_light.exit.i ], [ %28, %27 ], [ %35, %29 ]
  %38 = icmp eq i32 %9, 0
  br i1 %38, label %SYSC_getsockopt.exit, label %39

; <label>:39                                      ; preds = %36
  %40 = getelementptr inbounds i8* %16, i64 24
  %41 = bitcast i8* %40 to %struct.file**
  %42 = load %struct.file** %41, align 8
  tail call void @fput(%struct.file* %42) #4
  br label %SYSC_getsockopt.exit

SYSC_getsockopt.exit:                             ; preds = %39, %36, %21, %sock_from_file.exit.thread.i.i, %0
  %43 = phi i32 [ %37, %36 ], [ %37, %39 ], [ -9, %0 ], [ %18, %sock_from_file.exit.thread.i.i ], [ %18, %21 ]
  %44 = sext i32 %43 to i64
  ret i64 %44
}

; Function Attrs: noredzone nounwind
define i64 @SyS_shutdown(i64 %fd, i64 %how) #0 {
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %how to i32
  %3 = tail call i64 @__fdget(i32 %1) #4
  %4 = and i64 %3, -4
  %5 = inttoptr i64 %4 to %struct.file*
  %v.tr.i.i.i.i = trunc i64 %3 to i32
  %6 = and i32 %v.tr.i.i.i.i, 3
  %7 = icmp eq i64 %4, 0
  br i1 %7, label %SYSC_shutdown.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.file* %5, i64 0, i32 3
  %10 = load %struct.file_operations** %9, align 8
  %11 = icmp eq %struct.file_operations* %10, @socket_file_ops
  br i1 %11, label %sock_from_file.exit.i.i, label %sock_from_file.exit.thread.i.i

sock_from_file.exit.i.i:                          ; preds = %8
  %12 = getelementptr inbounds %struct.file* %5, i64 0, i32 15
  %13 = load i8** %12, align 8
  %14 = icmp eq i8* %13, null
  br i1 %14, label %sock_from_file.exit.thread.i.i, label %sockfd_lookup_light.exit.i, !prof !1

sock_from_file.exit.thread.i.i:                   ; preds = %sock_from_file.exit.i.i, %8
  %15 = phi i32 [ -9, %sock_from_file.exit.i.i ], [ -88, %8 ]
  %16 = and i32 %v.tr.i.i.i.i, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %SYSC_shutdown.exit, label %18

; <label>:18                                      ; preds = %sock_from_file.exit.thread.i.i
  tail call void @fput(%struct.file* %5) #4
  br label %SYSC_shutdown.exit

sockfd_lookup_light.exit.i:                       ; preds = %sock_from_file.exit.i.i
  %19 = bitcast i8* %13 to %struct.socket*
  %20 = tail call i32 @security_socket_shutdown(%struct.socket* %19, i32 %2) #4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %29

; <label>:22                                      ; preds = %sockfd_lookup_light.exit.i
  %23 = getelementptr inbounds i8* %13, i64 40
  %24 = bitcast i8* %23 to %struct.proto_ops**
  %25 = load %struct.proto_ops** %24, align 8
  %26 = getelementptr inbounds %struct.proto_ops* %25, i64 0, i32 12
  %27 = load i32 (%struct.socket*, i32)** %26, align 8
  %28 = tail call i32 %27(%struct.socket* %19, i32 %2) #4
  br label %29

; <label>:29                                      ; preds = %22, %sockfd_lookup_light.exit.i
  %30 = phi i32 [ %20, %sockfd_lookup_light.exit.i ], [ %28, %22 ]
  %31 = icmp eq i32 %6, 0
  br i1 %31, label %SYSC_shutdown.exit, label %32

; <label>:32                                      ; preds = %29
  %33 = getelementptr inbounds i8* %13, i64 24
  %34 = bitcast i8* %33 to %struct.file**
  %35 = load %struct.file** %34, align 8
  tail call void @fput(%struct.file* %35) #4
  br label %SYSC_shutdown.exit

SYSC_shutdown.exit:                               ; preds = %32, %29, %18, %sock_from_file.exit.thread.i.i, %0
  %36 = phi i32 [ %30, %29 ], [ %30, %32 ], [ -9, %0 ], [ %15, %sock_from_file.exit.thread.i.i ], [ %15, %18 ]
  %37 = sext i32 %36 to i64
  ret i64 %37
}

; Function Attrs: noredzone nounwind
define i64 @__sys_sendmsg(i32 %fd, %struct.user_msghdr* %msg, i32 %flags) #0 {
  %msg_sys = alloca %struct.msghdr, align 8
  %1 = bitcast %struct.msghdr* %msg_sys to i8*
  call void @llvm.lifetime.start(i64 80, i8* %1) #1
  %2 = call i64 @__fdget(i32 %fd) #4
  %3 = and i64 %2, -4
  %4 = inttoptr i64 %3 to %struct.file*
  %v.tr.i.i.i = trunc i64 %2 to i32
  %5 = and i32 %v.tr.i.i.i, 3
  %6 = icmp eq i64 %3, 0
  br i1 %6, label %fput_light.exit, label %7

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.file* %4, i64 0, i32 3
  %9 = load %struct.file_operations** %8, align 8
  %10 = icmp eq %struct.file_operations* %9, @socket_file_ops
  br i1 %10, label %sock_from_file.exit.i, label %sock_from_file.exit.thread.i

sock_from_file.exit.i:                            ; preds = %7
  %11 = getelementptr inbounds %struct.file* %4, i64 0, i32 15
  %12 = load i8** %11, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %sock_from_file.exit.thread.i, label %sockfd_lookup_light.exit, !prof !1

sock_from_file.exit.thread.i:                     ; preds = %sock_from_file.exit.i, %7
  %14 = phi i32 [ -9, %sock_from_file.exit.i ], [ -88, %7 ]
  %15 = and i32 %v.tr.i.i.i, 1
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %fput_light.exit, label %17

; <label>:17                                      ; preds = %sock_from_file.exit.thread.i
  call void @fput(%struct.file* %4) #4
  br label %fput_light.exit

sockfd_lookup_light.exit:                         ; preds = %sock_from_file.exit.i
  %18 = bitcast i8* %12 to %struct.socket*
  %19 = call fastcc i32 @___sys_sendmsg(%struct.socket* %18, %struct.user_msghdr* %msg, %struct.msghdr* %msg_sys, i32 %flags, %struct.used_address* null) #5
  %20 = icmp eq i32 %5, 0
  br i1 %20, label %fput_light.exit, label %21

; <label>:21                                      ; preds = %sockfd_lookup_light.exit
  %22 = getelementptr inbounds i8* %12, i64 24
  %23 = bitcast i8* %22 to %struct.file**
  %24 = load %struct.file** %23, align 8
  call void @fput(%struct.file* %24) #4
  br label %fput_light.exit

fput_light.exit:                                  ; preds = %21, %sockfd_lookup_light.exit, %17, %sock_from_file.exit.thread.i, %0
  %25 = phi i32 [ %19, %sockfd_lookup_light.exit ], [ %19, %21 ], [ -9, %0 ], [ %14, %sock_from_file.exit.thread.i ], [ %14, %17 ]
  %26 = sext i32 %25 to i64
  call void @llvm.lifetime.end(i64 80, i8* %1) #1
  ret i64 %26
}

; Function Attrs: noredzone nounwind
define internal fastcc i32 @___sys_sendmsg(%struct.socket* %sock, %struct.user_msghdr* %msg, %struct.msghdr* %msg_sys, i32 %flags, %struct.used_address* %used_address) #0 {
  %.sroa.3.i.i.i6 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i7 = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb.i.i8 = alloca %struct.kiocb, align 8
  %siocb.i.i9 = alloca %struct.sock_iocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb.i.i = alloca %struct.kiocb, align 8
  %siocb.i.i = alloca %struct.sock_iocb, align 8
  %address = alloca %struct.__kernel_sockaddr_storage, align 8
  %iovstack = alloca [8 x %struct.iovec], align 16
  %iov = alloca %struct.iovec*, align 8
  %ctl = alloca [36 x i8], align 8
  %1 = bitcast %struct.__kernel_sockaddr_storage* %address to i8*
  call void @llvm.lifetime.start(i64 128, i8* %1) #1
  %2 = bitcast [8 x %struct.iovec]* %iovstack to i8*
  call void @llvm.lifetime.start(i64 128, i8* %2) #1
  %3 = getelementptr inbounds [8 x %struct.iovec]* %iovstack, i64 0, i64 0
  store %struct.iovec* %3, %struct.iovec** %iov, align 8
  %4 = getelementptr inbounds [36 x i8]* %ctl, i64 0, i64 0
  call void @llvm.lifetime.start(i64 36, i8* %4) #1
  %5 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 0
  store i8* %1, i8** %5, align 8
  %6 = icmp slt i32 %flags, 0
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = bitcast %struct.user_msghdr* %msg to %struct.compat_msghdr*
  %9 = call i64 @get_compat_msghdr(%struct.msghdr* %msg_sys, %struct.compat_msghdr* %8, %struct.sockaddr** null, %struct.iovec** %iov) #4
  br label %12

; <label>:10                                      ; preds = %0
  %11 = call fastcc i64 @copy_msghdr_from_user(%struct.msghdr* %msg_sys, %struct.user_msghdr* %msg, %struct.sockaddr** null, %struct.iovec** %iov) #5
  br label %12

; <label>:12                                      ; preds = %10, %7
  %err.0 = phi i64 [ %9, %7 ], [ %11, %10 ]
  %13 = icmp slt i64 %err.0, 0
  br i1 %13, label %158, label %14

; <label>:14                                      ; preds = %12
  %15 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 4
  %16 = load i64* %15, align 8
  %17 = icmp ugt i64 %16, 2147483647
  br i1 %17, label %158, label %18

; <label>:18                                      ; preds = %14
  %19 = trunc i64 %16 to i32
  %20 = icmp ne i32 %19, 0
  %or.cond = and i1 %6, %20
  br i1 %or.cond, label %21, label %32

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 5
  %23 = load %struct.sock** %22, align 8
  %24 = call i32 @cmsghdr_from_user_compat_to_kern(%struct.msghdr* %msg_sys, %struct.sock* %23, i8* %4, i32 36) #4
  %25 = sext i32 %24 to i64
  %26 = icmp eq i32 %24, 0
  br i1 %26, label %27, label %158

; <label>:27                                      ; preds = %21
  %28 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 3
  %29 = load i8** %28, align 8
  %30 = load i64* %15, align 8
  %31 = trunc i64 %30 to i32
  br label %55

; <label>:32                                      ; preds = %18
  br i1 %20, label %33, label %55

; <label>:33                                      ; preds = %32
  %sext5 = shl i64 %16, 32
  %34 = ashr exact i64 %sext5, 32
  %35 = icmp ugt i64 %34, 36
  br i1 %35, label %36, label %41

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 5
  %38 = load %struct.sock** %37, align 8
  %39 = call i8* @sock_kmalloc(%struct.sock* %38, i32 %19, i32 208) #4
  %40 = icmp eq i8* %39, null
  br i1 %40, label %158, label %41

; <label>:41                                      ; preds = %36, %33
  %ctl_buf.0 = phi i8* [ %39, %36 ], [ %4, %33 ]
  %42 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 3
  %43 = load i8** %42, align 8
  %44 = call i64 @llvm.objectsize.i64.p0i8(i8* %ctl_buf.0, i1 false) #1
  %45 = trunc i64 %44 to i32
  %46 = icmp slt i32 %45, 0
  br i1 %46, label %.critedge.i, label %47

; <label>:47                                      ; preds = %41
  %sext.i = shl i64 %44, 32
  %48 = ashr exact i64 %sext.i, 32
  %49 = icmp ult i64 %48, %34
  br i1 %49, label %52, label %.critedge.i, !prof !1

.critedge.i:                                      ; preds = %47, %41
  %50 = trunc i64 %34 to i32
  %51 = call i64 @_copy_from_user(i8* %ctl_buf.0, i8* %43, i32 %50) #4
  br label %copy_from_user.exit

; <label>:52                                      ; preds = %47
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str15, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str16, i64 0, i64 0), i32 %45, i64 %34) #4
  br label %copy_from_user.exit

copy_from_user.exit:                              ; preds = %52, %.critedge.i
  %.0.i = phi i64 [ %51, %.critedge.i ], [ %34, %52 ]
  %53 = icmp eq i64 %.0.i, 0
  br i1 %53, label %54, label %153

; <label>:54                                      ; preds = %copy_from_user.exit
  store i8* %ctl_buf.0, i8** %42, align 8
  br label %55

; <label>:55                                      ; preds = %54, %32, %27
  %ctl_len.0 = phi i32 [ %31, %27 ], [ %19, %54 ], [ 0, %32 ]
  %ctl_buf.1 = phi i8* [ %29, %27 ], [ %ctl_buf.0, %54 ], [ %4, %32 ]
  %56 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 5
  store i32 %flags, i32* %56, align 4
  %57 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 4
  %58 = load %struct.file** %57, align 8
  %59 = getelementptr inbounds %struct.file* %58, i64 0, i32 6
  %60 = load i32* %59, align 4
  %61 = and i32 %60, 2048
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %65, label %63

; <label>:63                                      ; preds = %55
  %64 = or i32 %flags, 64
  store i32 %64, i32* %56, align 4
  br label %65

; <label>:65                                      ; preds = %63, %55
  %66 = icmp ne %struct.used_address* %used_address, null
  br i1 %66, label %67, label %110

; <label>:67                                      ; preds = %65
  %68 = load i8** %5, align 8
  %69 = icmp eq i8* %68, null
  br i1 %69, label %110, label %70

; <label>:70                                      ; preds = %67
  %71 = getelementptr inbounds %struct.used_address* %used_address, i64 0, i32 1
  %72 = load i32* %71, align 4
  %73 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 1
  %74 = load i32* %73, align 4
  %75 = icmp eq i32 %72, %74
  br i1 %75, label %76, label %110

; <label>:76                                      ; preds = %70
  %77 = bitcast %struct.used_address* %used_address to i8*
  %78 = zext i32 %72 to i64
  %79 = call i32 @memcmp(i8* %77, i8* %68, i64 %78) #4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %110

; <label>:81                                      ; preds = %76
  %sext4 = shl i64 %err.0, 32
  %82 = ashr exact i64 %sext4, 32
  %83 = bitcast %struct.kiocb* %iocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %83) #1
  %84 = bitcast %struct.sock_iocb* %siocb.i.i to i8*
  call void @llvm.lifetime.start(i64 144, i8* %84) #1
  %85 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %85)
  %86 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %86)
  call void @llvm.memset.p0i8.i64(i8* %85, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %86, i8 0, i64 48, i32 8, i1 false)
  %87 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %88 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 0
  store %struct.file* null, %struct.file** %88, align 8
  %89 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 1
  %90 = bitcast %struct.kioctx** %89 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %90, i8* %85, i64 16, i32 8, i1 false) #1
  %91 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %87 to i8*
  store i8* %.c.i.i.i, i8** %91, align 8
  %92 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 5
  %93 = bitcast i64* %92 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %93, i8* %86, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %85)
  call void @llvm.lifetime.end(i64 48, i8* %86)
  %94 = getelementptr inbounds %struct.kiocb* %iocb.i.i, i64 0, i32 3
  store i8* %84, i8** %94, align 8
  %95 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 3
  store %struct.socket* %sock, %struct.socket** %95, align 8
  %96 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %96, align 8
  %97 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 6
  store %struct.msghdr* %msg_sys, %struct.msghdr** %97, align 8
  %98 = trunc i64 %82 to i32
  %99 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i, i64 0, i32 2
  store i32 %98, i32* %99, align 4
  %100 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %101 = load %struct.proto_ops** %100, align 8
  %102 = getelementptr inbounds %struct.proto_ops* %101, i64 0, i32 17
  %103 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64)** %102, align 8
  %104 = call i32 %103(%struct.kiocb* %iocb.i.i, %struct.socket* %sock, %struct.msghdr* %msg_sys, i64 %82) #4
  %105 = icmp eq i32 %104, -529
  br i1 %105, label %106, label %sock_sendmsg_nosec.exit

; <label>:106                                     ; preds = %81
  %107 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb.i.i) #4
  %108 = trunc i64 %107 to i32
  br label %sock_sendmsg_nosec.exit

sock_sendmsg_nosec.exit:                          ; preds = %106, %81
  %ret.0.i.i = phi i32 [ %108, %106 ], [ %104, %81 ]
  call void @llvm.lifetime.end(i64 144, i8* %84) #1
  call void @llvm.lifetime.end(i64 88, i8* %83) #1
  %109 = sext i32 %ret.0.i.i to i64
  br label %153

; <label>:110                                     ; preds = %76, %70, %67, %65
  %sext = shl i64 %err.0, 32
  %111 = ashr exact i64 %sext, 32
  %112 = bitcast %struct.kiocb* %iocb.i.i8 to i8*
  call void @llvm.lifetime.start(i64 88, i8* %112) #1
  %113 = bitcast %struct.sock_iocb* %siocb.i.i9 to i8*
  call void @llvm.lifetime.start(i64 144, i8* %113) #1
  %114 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i6 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %114)
  %115 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i7 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %115)
  call void @llvm.memset.p0i8.i64(i8* %114, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %115, i8 0, i64 48, i32 8, i1 false)
  %116 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %117 = getelementptr inbounds %struct.kiocb* %iocb.i.i8, i64 0, i32 0
  store %struct.file* null, %struct.file** %117, align 8
  %118 = getelementptr inbounds %struct.kiocb* %iocb.i.i8, i64 0, i32 1
  %119 = bitcast %struct.kioctx** %118 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %119, i8* %114, i64 16, i32 8, i1 false) #1
  %120 = getelementptr inbounds %struct.kiocb* %iocb.i.i8, i64 0, i32 4, i32 0
  %.c.i.i.i10 = bitcast %struct.task_struct* %116 to i8*
  store i8* %.c.i.i.i10, i8** %120, align 8
  %121 = getelementptr inbounds %struct.kiocb* %iocb.i.i8, i64 0, i32 5
  %122 = bitcast i64* %121 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %115, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %114)
  call void @llvm.lifetime.end(i64 48, i8* %115)
  %123 = getelementptr inbounds %struct.kiocb* %iocb.i.i8, i64 0, i32 3
  store i8* %113, i8** %123, align 8
  %124 = trunc i64 %111 to i32
  %125 = call i32 @security_socket_sendmsg(%struct.socket* %sock, %struct.msghdr* %msg_sys, i32 %124) #4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %__sock_sendmsg.exit.i.i

; <label>:127                                     ; preds = %110
  %128 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i9, i64 0, i32 3
  store %struct.socket* %sock, %struct.socket** %128, align 8
  %129 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i9, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %129, align 8
  %130 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i9, i64 0, i32 6
  store %struct.msghdr* %msg_sys, %struct.msghdr** %130, align 8
  %131 = getelementptr inbounds %struct.sock_iocb* %siocb.i.i9, i64 0, i32 2
  store i32 %124, i32* %131, align 4
  %132 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %133 = load %struct.proto_ops** %132, align 8
  %134 = getelementptr inbounds %struct.proto_ops* %133, i64 0, i32 17
  %135 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64)** %134, align 8
  %136 = call i32 %135(%struct.kiocb* %iocb.i.i8, %struct.socket* %sock, %struct.msghdr* %msg_sys, i64 %111) #4
  br label %__sock_sendmsg.exit.i.i

__sock_sendmsg.exit.i.i:                          ; preds = %127, %110
  %137 = phi i32 [ %136, %127 ], [ %125, %110 ]
  %138 = icmp eq i32 %137, -529
  br i1 %138, label %139, label %sock_sendmsg.exit

; <label>:139                                     ; preds = %__sock_sendmsg.exit.i.i
  %140 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb.i.i8) #4
  %141 = trunc i64 %140 to i32
  br label %sock_sendmsg.exit

sock_sendmsg.exit:                                ; preds = %139, %__sock_sendmsg.exit.i.i
  %ret.0.i.i11 = phi i32 [ %141, %139 ], [ %137, %__sock_sendmsg.exit.i.i ]
  call void @llvm.lifetime.end(i64 144, i8* %113) #1
  call void @llvm.lifetime.end(i64 88, i8* %112) #1
  %142 = sext i32 %ret.0.i.i11 to i64
  %143 = icmp sgt i32 %ret.0.i.i11, -1
  %or.cond3 = and i1 %66, %143
  br i1 %or.cond3, label %144, label %153

; <label>:144                                     ; preds = %sock_sendmsg.exit
  %145 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 1
  %146 = load i32* %145, align 4
  %147 = getelementptr inbounds %struct.used_address* %used_address, i64 0, i32 1
  store i32 %146, i32* %147, align 4
  %148 = load i8** %5, align 8
  %149 = icmp eq i8* %148, null
  br i1 %149, label %153, label %150

; <label>:150                                     ; preds = %144
  %151 = zext i32 %146 to i64
  %152 = bitcast %struct.used_address* %used_address to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %152, i8* %148, i64 %151, i32 1, i1 false)
  br label %153

; <label>:153                                     ; preds = %150, %144, %sock_sendmsg.exit, %sock_sendmsg_nosec.exit, %copy_from_user.exit
  %err.1 = phi i64 [ %142, %150 ], [ %142, %144 ], [ %142, %sock_sendmsg.exit ], [ %109, %sock_sendmsg_nosec.exit ], [ -14, %copy_from_user.exit ]
  %ctl_len.1 = phi i32 [ %ctl_len.0, %150 ], [ %ctl_len.0, %144 ], [ %ctl_len.0, %sock_sendmsg.exit ], [ %ctl_len.0, %sock_sendmsg_nosec.exit ], [ %19, %copy_from_user.exit ]
  %ctl_buf.2 = phi i8* [ %ctl_buf.1, %150 ], [ %ctl_buf.1, %144 ], [ %ctl_buf.1, %sock_sendmsg.exit ], [ %ctl_buf.1, %sock_sendmsg_nosec.exit ], [ %ctl_buf.0, %copy_from_user.exit ]
  %154 = icmp eq i8* %ctl_buf.2, %4
  br i1 %154, label %158, label %155

; <label>:155                                     ; preds = %153
  %156 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 5
  %157 = load %struct.sock** %156, align 8
  call void @sock_kfree_s(%struct.sock* %157, i8* %ctl_buf.2, i32 %ctl_len.1) #4
  br label %158

; <label>:158                                     ; preds = %155, %153, %36, %21, %14, %12
  %err.2 = phi i64 [ %err.0, %12 ], [ -105, %14 ], [ %25, %21 ], [ %err.1, %155 ], [ %err.1, %153 ], [ -105, %36 ]
  %159 = load %struct.iovec** %iov, align 8
  %160 = icmp eq %struct.iovec* %159, %3
  br i1 %160, label %163, label %161

; <label>:161                                     ; preds = %158
  %162 = bitcast %struct.iovec* %159 to i8*
  call void @kfree(i8* %162) #4
  br label %163

; <label>:163                                     ; preds = %161, %158
  %164 = trunc i64 %err.2 to i32
  call void @llvm.lifetime.end(i64 36, i8* %4) #1
  call void @llvm.lifetime.end(i64 128, i8* %2) #1
  call void @llvm.lifetime.end(i64 128, i8* %1) #1
  ret i32 %164
}

; Function Attrs: noredzone nounwind
define i64 @SyS_sendmsg(i64 %fd, i64 %msg, i64 %flags) #0 {
  %1 = trunc i64 %flags to i32
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %SYSC_sendmsg.exit, label %3

; <label>:3                                       ; preds = %0
  %4 = inttoptr i64 %msg to %struct.user_msghdr*
  %5 = trunc i64 %fd to i32
  %6 = tail call i64 @__sys_sendmsg(i32 %5, %struct.user_msghdr* %4, i32 %1) #4
  br label %SYSC_sendmsg.exit

SYSC_sendmsg.exit:                                ; preds = %3, %0
  %.0.i = phi i64 [ %6, %3 ], [ -22, %0 ]
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i32 @__sys_sendmmsg(i32 %fd, %struct.mmsghdr* %mmsg, i32 %vlen, i32 %flags) #0 {
  %msg_sys = alloca %struct.msghdr, align 8
  %used_address = alloca %struct.used_address, align 8
  %1 = bitcast %struct.msghdr* %msg_sys to i8*
  call void @llvm.lifetime.start(i64 80, i8* %1) #1
  %2 = bitcast %struct.used_address* %used_address to i8*
  call void @llvm.lifetime.start(i64 136, i8* %2) #1
  %3 = icmp ugt i32 %vlen, 1024
  %.vlen = select i1 %3, i32 1024, i32 %vlen
  %4 = call i64 @__fdget(i32 %fd) #4
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i = trunc i64 %4 to i32
  %7 = and i32 %v.tr.i.i.i, 3
  %8 = icmp eq i64 %5, 0
  br i1 %8, label %sockfd_lookup_light.exit.thread, label %9

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %11 = load %struct.file_operations** %10, align 8
  %12 = icmp eq %struct.file_operations* %11, @socket_file_ops
  br i1 %12, label %sock_from_file.exit.i, label %sock_from_file.exit.thread.i

sock_from_file.exit.i:                            ; preds = %9
  %13 = getelementptr inbounds %struct.file* %6, i64 0, i32 15
  %14 = load i8** %13, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %sock_from_file.exit.thread.i, label %sockfd_lookup_light.exit, !prof !1

sock_from_file.exit.thread.i:                     ; preds = %sock_from_file.exit.i, %9
  %16 = phi i32 [ -9, %sock_from_file.exit.i ], [ -88, %9 ]
  %17 = and i32 %v.tr.i.i.i, 1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %sockfd_lookup_light.exit.thread, label %19

; <label>:19                                      ; preds = %sock_from_file.exit.thread.i
  call void @fput(%struct.file* %6) #4
  br label %sockfd_lookup_light.exit.thread

sockfd_lookup_light.exit:                         ; preds = %sock_from_file.exit.i
  %20 = bitcast i8* %14 to %struct.socket*
  %21 = getelementptr inbounds %struct.used_address* %used_address, i64 0, i32 1
  store i32 -1, i32* %21, align 8
  %22 = icmp eq i32 %.vlen, 0
  br i1 %22, label %split7, label %.lr.ph

.lr.ph:                                           ; preds = %sockfd_lookup_light.exit
  %23 = bitcast %struct.mmsghdr* %mmsg to %struct.compat_mmsghdr*
  %24 = icmp slt i32 %flags, 0
  br label %27

; <label>:25                                      ; preds = %45
  %26 = icmp ult i32 %48, %.vlen
  br i1 %26, label %27, label %split7

; <label>:27                                      ; preds = %25, %.lr.ph
  %datagrams.05 = phi i32 [ 0, %.lr.ph ], [ %48, %25 ]
  %entry.04 = phi %struct.mmsghdr* [ %mmsg, %.lr.ph ], [ %entry.1, %25 ]
  %compat_entry.03 = phi %struct.compat_mmsghdr* [ %23, %.lr.ph ], [ %compat_entry.1, %25 ]
  br i1 %24, label %28, label %37

; <label>:28                                      ; preds = %27
  %29 = bitcast %struct.compat_mmsghdr* %compat_entry.03 to %struct.user_msghdr*
  %30 = call fastcc i32 @___sys_sendmsg(%struct.socket* %20, %struct.user_msghdr* %29, %struct.msghdr* %msg_sys, i32 %flags, %struct.used_address* %used_address) #5
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %split7, label %32

; <label>:32                                      ; preds = %28
  %33 = getelementptr inbounds %struct.compat_mmsghdr* %compat_entry.03, i64 0, i32 1
  %34 = bitcast i32* %33 to %struct.__large_struct*
  %35 = call i32 asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movl ${1:k},$2\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,ir,*m,i,0,~{dirflag},~{fpsr},~{flags}"(i32 %30, %struct.__large_struct* %34, i32 -14, i32 0) #1, !srcloc !12
  %36 = getelementptr %struct.compat_mmsghdr* %compat_entry.03, i64 1
  br label %45

; <label>:37                                      ; preds = %27
  %38 = getelementptr inbounds %struct.mmsghdr* %entry.04, i64 0, i32 0
  %39 = call fastcc i32 @___sys_sendmsg(%struct.socket* %20, %struct.user_msghdr* %38, %struct.msghdr* %msg_sys, i32 %flags, %struct.used_address* %used_address) #5
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %split7, label %41

; <label>:41                                      ; preds = %37
  %42 = getelementptr inbounds %struct.mmsghdr* %entry.04, i64 0, i32 1
  %43 = call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %39, i32* %42) #1, !srcloc !13
  %44 = getelementptr %struct.mmsghdr* %entry.04, i64 1
  br label %45

; <label>:45                                      ; preds = %41, %32
  %46 = phi i32 [ %35, %32 ], [ %43, %41 ]
  %compat_entry.1 = phi %struct.compat_mmsghdr* [ %36, %32 ], [ %compat_entry.03, %41 ]
  %entry.1 = phi %struct.mmsghdr* [ %entry.04, %32 ], [ %44, %41 ]
  %47 = icmp eq i32 %46, 0
  %48 = add i32 %datagrams.05, 1
  br i1 %47, label %25, label %split7

split7:                                           ; preds = %45, %37, %28, %25, %sockfd_lookup_light.exit
  %datagrams.0.lcssa = phi i32 [ 0, %sockfd_lookup_light.exit ], [ %48, %25 ], [ %datagrams.05, %45 ], [ %datagrams.05, %37 ], [ %datagrams.05, %28 ]
  %49 = phi i32 [ 0, %sockfd_lookup_light.exit ], [ 0, %25 ], [ %46, %45 ], [ %39, %37 ], [ %30, %28 ]
  %50 = icmp eq i32 %7, 0
  br i1 %50, label %fput_light.exit, label %51

; <label>:51                                      ; preds = %split7
  %52 = getelementptr inbounds i8* %14, i64 24
  %53 = bitcast i8* %52 to %struct.file**
  %54 = load %struct.file** %53, align 8
  call void @fput(%struct.file* %54) #4
  br label %fput_light.exit

fput_light.exit:                                  ; preds = %51, %split7
  %55 = icmp eq i32 %datagrams.0.lcssa, 0
  %.datagrams.0 = select i1 %55, i32 %49, i32 %datagrams.0.lcssa
  br label %sockfd_lookup_light.exit.thread

sockfd_lookup_light.exit.thread:                  ; preds = %fput_light.exit, %19, %sock_from_file.exit.thread.i, %0
  %.0 = phi i32 [ %.datagrams.0, %fput_light.exit ], [ -9, %0 ], [ %16, %sock_from_file.exit.thread.i ], [ %16, %19 ]
  call void @llvm.lifetime.end(i64 136, i8* %2) #1
  call void @llvm.lifetime.end(i64 80, i8* %1) #1
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define i64 @SyS_sendmmsg(i64 %fd, i64 %mmsg, i64 %vlen, i64 %flags) #0 {
  %1 = trunc i64 %flags to i32
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %SYSC_sendmmsg.exit, label %3

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %vlen to i32
  %5 = inttoptr i64 %mmsg to %struct.mmsghdr*
  %6 = trunc i64 %fd to i32
  %7 = tail call i32 @__sys_sendmmsg(i32 %6, %struct.mmsghdr* %5, i32 %4, i32 %1) #4
  %8 = sext i32 %7 to i64
  br label %SYSC_sendmmsg.exit

SYSC_sendmmsg.exit:                               ; preds = %3, %0
  %.0.i = phi i64 [ %8, %3 ], [ -22, %0 ]
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @__sys_recvmsg(i32 %fd, %struct.user_msghdr* %msg, i32 %flags) #0 {
  %msg_sys = alloca %struct.msghdr, align 8
  %1 = bitcast %struct.msghdr* %msg_sys to i8*
  call void @llvm.lifetime.start(i64 80, i8* %1) #1
  %2 = call i64 @__fdget(i32 %fd) #4
  %3 = and i64 %2, -4
  %4 = inttoptr i64 %3 to %struct.file*
  %v.tr.i.i.i = trunc i64 %2 to i32
  %5 = and i32 %v.tr.i.i.i, 3
  %6 = icmp eq i64 %3, 0
  br i1 %6, label %fput_light.exit, label %7

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.file* %4, i64 0, i32 3
  %9 = load %struct.file_operations** %8, align 8
  %10 = icmp eq %struct.file_operations* %9, @socket_file_ops
  br i1 %10, label %sock_from_file.exit.i, label %sock_from_file.exit.thread.i

sock_from_file.exit.i:                            ; preds = %7
  %11 = getelementptr inbounds %struct.file* %4, i64 0, i32 15
  %12 = load i8** %11, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %sock_from_file.exit.thread.i, label %sockfd_lookup_light.exit, !prof !1

sock_from_file.exit.thread.i:                     ; preds = %sock_from_file.exit.i, %7
  %14 = phi i32 [ -9, %sock_from_file.exit.i ], [ -88, %7 ]
  %15 = and i32 %v.tr.i.i.i, 1
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %fput_light.exit, label %17

; <label>:17                                      ; preds = %sock_from_file.exit.thread.i
  call void @fput(%struct.file* %4) #4
  br label %fput_light.exit

sockfd_lookup_light.exit:                         ; preds = %sock_from_file.exit.i
  %18 = bitcast i8* %12 to %struct.socket*
  %19 = call fastcc i32 @___sys_recvmsg(%struct.socket* %18, %struct.user_msghdr* %msg, %struct.msghdr* %msg_sys, i32 %flags, i32 0) #5
  %20 = icmp eq i32 %5, 0
  br i1 %20, label %fput_light.exit, label %21

; <label>:21                                      ; preds = %sockfd_lookup_light.exit
  %22 = getelementptr inbounds i8* %12, i64 24
  %23 = bitcast i8* %22 to %struct.file**
  %24 = load %struct.file** %23, align 8
  call void @fput(%struct.file* %24) #4
  br label %fput_light.exit

fput_light.exit:                                  ; preds = %21, %sockfd_lookup_light.exit, %17, %sock_from_file.exit.thread.i, %0
  %25 = phi i32 [ %19, %sockfd_lookup_light.exit ], [ %19, %21 ], [ -9, %0 ], [ %14, %sock_from_file.exit.thread.i ], [ %14, %17 ]
  %26 = sext i32 %25 to i64
  call void @llvm.lifetime.end(i64 80, i8* %1) #1
  ret i64 %26
}

; Function Attrs: noredzone nounwind
define internal fastcc i32 @___sys_recvmsg(%struct.socket* %sock, %struct.user_msghdr* %msg, %struct.msghdr* %msg_sys, i32 %flags, i32 %nosec) #0 {
  %iovstack = alloca [8 x %struct.iovec], align 16
  %iov = alloca %struct.iovec*, align 8
  %addr = alloca %struct.__kernel_sockaddr_storage, align 8
  %uaddr = alloca %struct.sockaddr*, align 8
  %1 = bitcast %struct.user_msghdr* %msg to %struct.compat_msghdr*
  %2 = bitcast [8 x %struct.iovec]* %iovstack to i8*
  call void @llvm.lifetime.start(i64 128, i8* %2) #1
  %3 = getelementptr inbounds [8 x %struct.iovec]* %iovstack, i64 0, i64 0
  store %struct.iovec* %3, %struct.iovec** %iov, align 8
  %4 = bitcast %struct.__kernel_sockaddr_storage* %addr to i8*
  call void @llvm.lifetime.start(i64 128, i8* %4) #1
  %5 = icmp slt i32 %flags, 0
  %6 = getelementptr inbounds %struct.compat_msghdr* %1, i64 0, i32 1
  %7 = getelementptr inbounds %struct.user_msghdr* %msg, i64 0, i32 1
  %8 = select i1 %5, i32* %6, i32* %7
  %9 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 0
  store i8* %4, i8** %9, align 8
  br i1 %5, label %10, label %12

; <label>:10                                      ; preds = %0
  %11 = call i64 @get_compat_msghdr(%struct.msghdr* %msg_sys, %struct.compat_msghdr* %1, %struct.sockaddr** %uaddr, %struct.iovec** %iov) #4
  br label %14

; <label>:12                                      ; preds = %0
  %13 = call fastcc i64 @copy_msghdr_from_user(%struct.msghdr* %msg_sys, %struct.user_msghdr* %msg, %struct.sockaddr** %uaddr, %struct.iovec** %iov) #5
  br label %14

; <label>:14                                      ; preds = %12, %10
  %err.0 = phi i64 [ %11, %10 ], [ %13, %12 ]
  %15 = icmp slt i64 %err.0, 0
  br i1 %15, label %75, label %16

; <label>:16                                      ; preds = %14
  %17 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 3
  %18 = load i8** %17, align 8
  %19 = ptrtoint i8* %18 to i64
  %20 = and i32 %flags, -1073741824
  %21 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 5
  store i32 %20, i32* %21, align 4
  %22 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 1
  store i32 0, i32* %22, align 4
  %23 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 4
  %24 = load %struct.file** %23, align 8
  %25 = getelementptr inbounds %struct.file* %24, i64 0, i32 6
  %26 = load i32* %25, align 4
  %27 = lshr i32 %26, 5
  %28 = and i32 %27, 64
  %29 = or i32 %28, %flags
  %30 = icmp ne i32 %nosec, 0
  %31 = select i1 %30, i32 (%struct.socket*, %struct.msghdr*, i64, i32)* @sock_recvmsg_nosec, i32 (%struct.socket*, %struct.msghdr*, i64, i32)* @sock_recvmsg
  %sext = shl i64 %err.0, 32
  %32 = ashr exact i64 %sext, 32
  %33 = call i32 %31(%struct.socket* %sock, %struct.msghdr* %msg_sys, i64 %32, i32 %29) #4
  %34 = sext i32 %33 to i64
  %35 = icmp slt i32 %33, 0
  br i1 %35, label %75, label %36

; <label>:36                                      ; preds = %16
  %37 = load %struct.sockaddr** %uaddr, align 8
  %38 = icmp eq %struct.sockaddr* %37, null
  br i1 %38, label %45, label %39

; <label>:39                                      ; preds = %36
  %40 = load i32* %22, align 4
  %41 = bitcast %struct.sockaddr* %37 to i8*
  %42 = call fastcc i32 @move_addr_to_user(%struct.__kernel_sockaddr_storage* %addr, i32 %40, i8* %41, i32* %8) #5
  %43 = sext i32 %42 to i64
  %44 = icmp slt i32 %42, 0
  br i1 %44, label %75, label %45

; <label>:45                                      ; preds = %39, %36
  %46 = load i32* %21, align 4
  %47 = and i32 %46, 2147483647
  %48 = icmp slt i32 %29, 0
  br i1 %48, label %49, label %52

; <label>:49                                      ; preds = %45
  %50 = getelementptr inbounds %struct.user_msghdr* %msg, i64 0, i32 3
  %51 = bitcast i64* %50 to i32*
  br label %54

; <label>:52                                      ; preds = %45
  %53 = getelementptr inbounds %struct.user_msghdr* %msg, i64 0, i32 6
  br label %54

; <label>:54                                      ; preds = %52, %49
  %55 = phi i32* [ %51, %49 ], [ %53, %52 ]
  %56 = bitcast i32* %55 to %struct.__large_struct*
  %57 = call i32 asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movl ${1:k},$2\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,ir,*m,i,0,~{dirflag},~{fpsr},~{flags}"(i32 %47, %struct.__large_struct* %56, i32 -14, i32 0) #1, !srcloc !14
  %58 = sext i32 %57 to i64
  %59 = icmp eq i32 %57, 0
  br i1 %59, label %60, label %75

; <label>:60                                      ; preds = %54
  %61 = load i8** %17, align 8
  %62 = ptrtoint i8* %61 to i64
  %63 = sub i64 %62, %19
  br i1 %48, label %64, label %69

; <label>:64                                      ; preds = %60
  %65 = trunc i64 %63 to i32
  %66 = getelementptr inbounds %struct.compat_msghdr* %1, i64 0, i32 5
  %67 = bitcast i32* %66 to %struct.__large_struct*
  %68 = call i32 asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movl ${1:k},$2\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,ir,*m,i,0,~{dirflag},~{fpsr},~{flags}"(i32 %65, %struct.__large_struct* %67, i32 -14, i32 0) #1, !srcloc !15
  br label %73

; <label>:69                                      ; preds = %60
  %70 = getelementptr inbounds %struct.user_msghdr* %msg, i64 0, i32 5
  %71 = bitcast i64* %70 to %struct.__large_struct*
  %72 = call i32 asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movq $1,$2\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,er,*m,i,0,~{dirflag},~{fpsr},~{flags}"(i64 %63, %struct.__large_struct* %71, i32 -14, i32 0) #1, !srcloc !16
  br label %73

; <label>:73                                      ; preds = %69, %64
  %err.1.in = phi i32 [ %68, %64 ], [ %72, %69 ]
  %err.1 = sext i32 %err.1.in to i64
  %74 = icmp eq i32 %err.1.in, 0
  %.err.1 = select i1 %74, i64 %34, i64 %err.1
  br label %75

; <label>:75                                      ; preds = %73, %54, %39, %16, %14
  %err.2 = phi i64 [ %err.0, %14 ], [ %34, %16 ], [ %43, %39 ], [ %58, %54 ], [ %.err.1, %73 ]
  %76 = load %struct.iovec** %iov, align 8
  %77 = icmp eq %struct.iovec* %76, %3
  br i1 %77, label %80, label %78

; <label>:78                                      ; preds = %75
  %79 = bitcast %struct.iovec* %76 to i8*
  call void @kfree(i8* %79) #4
  br label %80

; <label>:80                                      ; preds = %78, %75
  %81 = trunc i64 %err.2 to i32
  call void @llvm.lifetime.end(i64 128, i8* %4) #1
  call void @llvm.lifetime.end(i64 128, i8* %2) #1
  ret i32 %81
}

; Function Attrs: noredzone nounwind
define i64 @SyS_recvmsg(i64 %fd, i64 %msg, i64 %flags) #0 {
  %1 = trunc i64 %flags to i32
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %SYSC_recvmsg.exit, label %3

; <label>:3                                       ; preds = %0
  %4 = inttoptr i64 %msg to %struct.user_msghdr*
  %5 = trunc i64 %fd to i32
  %6 = tail call i64 @__sys_recvmsg(i32 %5, %struct.user_msghdr* %4, i32 %1) #4
  br label %SYSC_recvmsg.exit

SYSC_recvmsg.exit:                                ; preds = %3, %0
  %.0.i = phi i64 [ %6, %3 ], [ -22, %0 ]
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i32 @__sys_recvmmsg(i32 %fd, %struct.mmsghdr* %mmsg, i32 %vlen, i32 %flags, %struct.timespec* %timeout) #0 {
  %ts_delta.i = alloca %struct.timespec, align 8
  %msg_sys = alloca %struct.msghdr, align 8
  %end_time = alloca %struct.timespec, align 8
  %1 = bitcast %struct.msghdr* %msg_sys to i8*
  call void @llvm.lifetime.start(i64 80, i8* %1) #1
  %2 = icmp ne %struct.timespec* %timeout, null
  br i1 %2, label %3, label %10

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.timespec* %timeout, i64 0, i32 0
  %5 = load i64* %4, align 8
  %6 = getelementptr inbounds %struct.timespec* %timeout, i64 0, i32 1
  %7 = load i64* %6, align 8
  %8 = call i32 @poll_select_set_timeout(%struct.timespec* %end_time, i64 %5, i64 %7) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %sockfd_lookup_light.exit.thread

; <label>:10                                      ; preds = %3, %0
  %11 = call i64 @__fdget(i32 %fd) #4
  %12 = and i64 %11, -4
  %13 = inttoptr i64 %12 to %struct.file*
  %v.tr.i.i.i = trunc i64 %11 to i32
  %14 = and i32 %v.tr.i.i.i, 3
  %15 = icmp eq i64 %12, 0
  br i1 %15, label %sockfd_lookup_light.exit.thread, label %16

; <label>:16                                      ; preds = %10
  %17 = getelementptr inbounds %struct.file* %13, i64 0, i32 3
  %18 = load %struct.file_operations** %17, align 8
  %19 = icmp eq %struct.file_operations* %18, @socket_file_ops
  br i1 %19, label %sock_from_file.exit.i, label %sock_from_file.exit.thread.i

sock_from_file.exit.i:                            ; preds = %16
  %20 = getelementptr inbounds %struct.file* %13, i64 0, i32 15
  %21 = load i8** %20, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %sock_from_file.exit.thread.i, label %sockfd_lookup_light.exit, !prof !1

sock_from_file.exit.thread.i:                     ; preds = %sock_from_file.exit.i, %16
  %23 = phi i32 [ -9, %sock_from_file.exit.i ], [ -88, %16 ]
  %24 = and i32 %v.tr.i.i.i, 1
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %sockfd_lookup_light.exit.thread, label %26

; <label>:26                                      ; preds = %sock_from_file.exit.thread.i
  call void @fput(%struct.file* %13) #4
  br label %sockfd_lookup_light.exit.thread

sockfd_lookup_light.exit:                         ; preds = %sock_from_file.exit.i
  %27 = bitcast i8* %21 to %struct.socket*
  %28 = getelementptr inbounds i8* %21, i64 32
  %29 = bitcast i8* %28 to %struct.sock**
  %30 = load %struct.sock** %29, align 8
  %31 = getelementptr inbounds %struct.sock* %30, i64 0, i32 38
  %32 = load i32* %31, align 4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %sock_error.exit.thread, label %sock_error.exit, !prof !17

sock_error.exit:                                  ; preds = %sockfd_lookup_light.exit
  %34 = call i32 asm sideeffect "xchgl $0, $1\0A", "=r,=*m,0,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %31, i32 0, i32* %31) #1, !srcloc !18
  %35 = sub i32 0, %34
  %36 = icmp eq i32 %34, 0
  br i1 %36, label %sock_error.exit.thread, label %.loopexit

sock_error.exit.thread:                           ; preds = %sock_error.exit, %sockfd_lookup_light.exit
  %37 = bitcast %struct.mmsghdr* %mmsg to %struct.compat_mmsghdr*
  %38 = getelementptr inbounds %struct.timespec* %end_time, i64 0, i32 0
  %39 = getelementptr %struct.timespec* %end_time, i64 0, i32 1
  %40 = getelementptr inbounds %struct.timespec* %timeout, i64 0, i32 0
  %41 = getelementptr %struct.timespec* %timeout, i64 0, i32 1
  %42 = bitcast %struct.timespec* %ts_delta.i to i8*
  %43 = getelementptr inbounds %struct.timespec* %ts_delta.i, i64 0, i32 0
  %44 = getelementptr inbounds %struct.timespec* %ts_delta.i, i64 0, i32 1
  %45 = getelementptr inbounds %struct.msghdr* %msg_sys, i64 0, i32 5
  br label %46

; <label>:46                                      ; preds = %91, %sock_error.exit.thread
  %compat_entry.0 = phi %struct.compat_mmsghdr* [ %37, %sock_error.exit.thread ], [ %compat_entry.1, %91 ]
  %entry.0 = phi %struct.mmsghdr* [ %mmsg, %sock_error.exit.thread ], [ %entry.1, %91 ]
  %datagrams.0 = phi i32 [ 0, %sock_error.exit.thread ], [ %73, %91 ]
  %.01 = phi i32 [ %flags, %sock_error.exit.thread ], [ %76, %91 ]
  %47 = icmp ult i32 %datagrams.0, %vlen
  br i1 %47, label %48, label %.loopexit

; <label>:48                                      ; preds = %46
  %49 = icmp slt i32 %.01, 0
  br i1 %49, label %50, label %60

; <label>:50                                      ; preds = %48
  %51 = bitcast %struct.compat_mmsghdr* %compat_entry.0 to %struct.user_msghdr*
  %52 = and i32 %.01, -65537
  %53 = call fastcc i32 @___sys_recvmsg(%struct.socket* %27, %struct.user_msghdr* %51, %struct.msghdr* %msg_sys, i32 %52, i32 %datagrams.0) #5
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %.loopexit, label %55

; <label>:55                                      ; preds = %50
  %56 = getelementptr inbounds %struct.compat_mmsghdr* %compat_entry.0, i64 0, i32 1
  %57 = bitcast i32* %56 to %struct.__large_struct*
  %58 = call i32 asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movl ${1:k},$2\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,ir,*m,i,0,~{dirflag},~{fpsr},~{flags}"(i32 %53, %struct.__large_struct* %57, i32 -14, i32 0) #1, !srcloc !19
  %59 = getelementptr %struct.compat_mmsghdr* %compat_entry.0, i64 1
  br label %69

; <label>:60                                      ; preds = %48
  %61 = getelementptr inbounds %struct.mmsghdr* %entry.0, i64 0, i32 0
  %62 = and i32 %.01, -65537
  %63 = call fastcc i32 @___sys_recvmsg(%struct.socket* %27, %struct.user_msghdr* %61, %struct.msghdr* %msg_sys, i32 %62, i32 %datagrams.0) #5
  %64 = icmp slt i32 %63, 0
  br i1 %64, label %.loopexit, label %65

; <label>:65                                      ; preds = %60
  %66 = getelementptr inbounds %struct.mmsghdr* %entry.0, i64 0, i32 1
  %67 = call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %63, i32* %66) #1, !srcloc !20
  %68 = getelementptr %struct.mmsghdr* %entry.0, i64 1
  br label %69

; <label>:69                                      ; preds = %65, %55
  %70 = phi i32 [ %58, %55 ], [ %67, %65 ]
  %compat_entry.1 = phi %struct.compat_mmsghdr* [ %59, %55 ], [ %compat_entry.0, %65 ]
  %entry.1 = phi %struct.mmsghdr* [ %entry.0, %55 ], [ %68, %65 ]
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %.loopexit

; <label>:72                                      ; preds = %69
  %73 = add i32 %datagrams.0, 1
  %74 = lshr i32 %.01, 10
  %75 = and i32 %74, 64
  %76 = or i32 %75, %.01
  br i1 %2, label %77, label %91

; <label>:77                                      ; preds = %72
  call void @ktime_get_ts64(%struct.timespec* %timeout) #4
  %78 = load i64* %38, align 8
  %79 = load i64* %39, align 8
  %80 = load i64* %40, align 1
  %81 = load i64* %41, align 1
  call void @llvm.lifetime.start(i64 16, i8* %42) #1
  %82 = sub i64 %78, %80
  %83 = sub i64 %79, %81
  call void @set_normalized_timespec(%struct.timespec* %ts_delta.i, i64 %82, i64 %83) #4
  %84 = load i64* %43, align 8
  %85 = load i64* %44, align 8
  call void @llvm.lifetime.end(i64 16, i8* %42) #1
  store i64 %84, i64* %40, align 8
  store i64 %85, i64* %41, align 8
  %86 = icmp slt i64 %84, 0
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %77
  store i64 0, i64* %41, align 8
  store i64 0, i64* %40, align 8
  br label %.loopexit

; <label>:88                                      ; preds = %77
  %89 = or i64 %84, %85
  %90 = icmp eq i64 %89, 0
  br i1 %90, label %.loopexit, label %91

; <label>:91                                      ; preds = %88, %72
  %92 = load i32* %45, align 8
  %93 = and i32 %92, 1
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %46, label %.loopexit

.loopexit:                                        ; preds = %91, %88, %87, %69, %60, %50, %46, %sock_error.exit
  %95 = phi i32 [ %35, %sock_error.exit ], [ 0, %87 ], [ 0, %88 ], [ 0, %91 ], [ %70, %69 ], [ 0, %46 ], [ %53, %50 ], [ %63, %60 ]
  %datagrams.1 = phi i32 [ 0, %sock_error.exit ], [ %73, %87 ], [ %73, %88 ], [ %73, %91 ], [ %datagrams.0, %69 ], [ %datagrams.0, %46 ], [ %datagrams.0, %50 ], [ %datagrams.0, %60 ]
  %96 = icmp eq i32 %14, 0
  br i1 %96, label %fput_light.exit, label %97

; <label>:97                                      ; preds = %.loopexit
  %98 = getelementptr inbounds i8* %21, i64 24
  %99 = bitcast i8* %98 to %struct.file**
  %100 = load %struct.file** %99, align 8
  call void @fput(%struct.file* %100) #4
  br label %fput_light.exit

fput_light.exit:                                  ; preds = %97, %.loopexit
  %101 = icmp eq i32 %95, 0
  br i1 %101, label %sockfd_lookup_light.exit.thread, label %102

; <label>:102                                     ; preds = %fput_light.exit
  %103 = icmp eq i32 %datagrams.1, 0
  br i1 %103, label %sockfd_lookup_light.exit.thread, label %104

; <label>:104                                     ; preds = %102
  %105 = icmp eq i32 %95, -11
  br i1 %105, label %sockfd_lookup_light.exit.thread, label %106

; <label>:106                                     ; preds = %104
  %107 = sub i32 0, %95
  %108 = load %struct.sock** %29, align 8
  %109 = getelementptr inbounds %struct.sock* %108, i64 0, i32 38
  store i32 %107, i32* %109, align 4
  br label %sockfd_lookup_light.exit.thread

sockfd_lookup_light.exit.thread:                  ; preds = %106, %104, %102, %fput_light.exit, %26, %sock_from_file.exit.thread.i, %10, %3
  %.0 = phi i32 [ -22, %3 ], [ %datagrams.1, %fput_light.exit ], [ %datagrams.1, %104 ], [ %datagrams.1, %106 ], [ %95, %102 ], [ -9, %10 ], [ %23, %sock_from_file.exit.thread.i ], [ %23, %26 ]
  call void @llvm.lifetime.end(i64 80, i8* %1) #1
  ret i32 %.0
}

; Function Attrs: noredzone
declare i32 @poll_select_set_timeout(%struct.timespec*, i64, i64) #2

; Function Attrs: noredzone nounwind
define i64 @SyS_recvmmsg(i64 %fd, i64 %mmsg, i64 %vlen, i64 %flags, i64 %timeout) #0 {
  %timeout_sys.i = alloca %struct.timespec, align 8
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %mmsg to %struct.mmsghdr*
  %3 = trunc i64 %vlen to i32
  %4 = trunc i64 %flags to i32
  %5 = bitcast %struct.timespec* %timeout_sys.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %5) #1
  %6 = icmp slt i32 %4, 0
  br i1 %6, label %SYSC_recvmmsg.exit, label %7

; <label>:7                                       ; preds = %0
  %8 = icmp eq i64 %timeout, 0
  br i1 %8, label %9, label %copy_from_user.exit.i

; <label>:9                                       ; preds = %7
  %10 = call i32 @__sys_recvmmsg(i32 %1, %struct.mmsghdr* %2, i32 %3, i32 %4, %struct.timespec* null) #4
  %11 = sext i32 %10 to i64
  br label %SYSC_recvmmsg.exit

copy_from_user.exit.i:                            ; preds = %7
  %12 = inttoptr i64 %timeout to i8*
  %13 = call i64 @_copy_from_user(i8* %5, i8* %12, i32 16) #4
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %SYSC_recvmmsg.exit

; <label>:15                                      ; preds = %copy_from_user.exit.i
  %16 = call i32 @__sys_recvmmsg(i32 %1, %struct.mmsghdr* %2, i32 %3, i32 %4, %struct.timespec* %timeout_sys.i) #4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %.critedge.i2.i, label %19

.critedge.i2.i:                                   ; preds = %15
  %18 = call i64 @_copy_to_user(i8* %12, i8* %5, i32 16) #4
  %phitmp.i = icmp eq i64 %18, 0
  %phitmp4.i = select i1 %phitmp.i, i32 %16, i32 -14
  br label %19

; <label>:19                                      ; preds = %.critedge.i2.i, %15
  %datagrams.0.i = phi i32 [ %16, %15 ], [ %phitmp4.i, %.critedge.i2.i ]
  %20 = sext i32 %datagrams.0.i to i64
  br label %SYSC_recvmmsg.exit

SYSC_recvmmsg.exit:                               ; preds = %19, %copy_from_user.exit.i, %9, %0
  %.0.i = phi i64 [ %20, %19 ], [ %11, %9 ], [ -22, %0 ], [ -14, %copy_from_user.exit.i ]
  call void @llvm.lifetime.end(i64 16, i8* %5) #1
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_socketcall(i64 %call, i64 %args) #0 {
  %a.i = alloca [6 x i64], align 16
  %1 = trunc i64 %call to i32
  %2 = bitcast [6 x i64]* %a.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #1
  %call.off.i = add i32 %1, -1
  %3 = icmp ugt i32 %call.off.i, 19
  br i1 %3, label %SYSC_socketcall.exit, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %0
  %sext = shl i64 %call, 32
  %4 = ashr exact i64 %sext, 32
  %5 = getelementptr [21 x i8]* @nargs, i64 0, i64 %4
  %6 = load i8* %5, align 1
  %7 = inttoptr i64 %args to i8*
  %8 = zext i8 %6 to i32
  %9 = call i64 @_copy_from_user(i8* %2, i8* %7, i32 %8) #4
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %SYSC_socketcall.exit

; <label>:11                                      ; preds = %.critedge.i.i
  %12 = getelementptr inbounds [6 x i64]* %a.i, i64 0, i64 0
  %div.i = lshr i8 %6, 3
  %13 = zext i8 %div.i to i32
  %14 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %15 = getelementptr inbounds %struct.task_struct* %14, i64 0, i32 94
  %16 = load %struct.audit_context** %15, align 8
  %17 = icmp eq %struct.audit_context* %16, null
  br i1 %17, label %audit_socketcall.exit.thread.i, label %audit_dummy_context.exit.i.i

audit_dummy_context.exit.i.i:                     ; preds = %11
  %18 = bitcast %struct.audit_context* %16 to i32*
  %19 = load i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %audit_socketcall.exit.i, label %audit_socketcall.exit.thread.i, !prof !1

audit_socketcall.exit.i:                          ; preds = %audit_dummy_context.exit.i.i
  %21 = call i32 @__audit_socketcall(i32 %13, i64* %12) #4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %audit_socketcall.exit.thread.i, label %23

; <label>:23                                      ; preds = %audit_socketcall.exit.i
  %24 = sext i32 %21 to i64
  br label %SYSC_socketcall.exit

audit_socketcall.exit.thread.i:                   ; preds = %audit_socketcall.exit.i, %audit_dummy_context.exit.i.i, %11
  %25 = load i64* %12, align 16
  %26 = getelementptr [6 x i64]* %a.i, i64 0, i64 1
  %27 = load i64* %26, align 8
  switch i32 %1, label %209 [
    i32 1, label %28
    i32 2, label %35
    i32 3, label %42
    i32 4, label %49
    i32 5, label %53
    i32 6, label %60
    i32 7, label %67
    i32 8, label %74
    i32 9, label %84
    i32 11, label %93
    i32 10, label %108
    i32 12, label %117
    i32 13, label %132
    i32 14, label %136
    i32 15, label %149
    i32 16, label %162
    i32 20, label %169
    i32 17, label %179
    i32 19, label %186
    i32 18, label %199
  ]

; <label>:28                                      ; preds = %audit_socketcall.exit.thread.i
  %29 = trunc i64 %25 to i32
  %30 = trunc i64 %27 to i32
  %31 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %32 = load i64* %31, align 16
  %33 = trunc i64 %32 to i32
  %34 = call i64 bitcast (i64 (i64, i64, i64)* @SyS_socket to i64 (i32, i32, i32)*)(i32 %29, i32 %30, i32 %33) #4
  br label %209

; <label>:35                                      ; preds = %audit_socketcall.exit.thread.i
  %36 = trunc i64 %25 to i32
  %37 = inttoptr i64 %27 to %struct.sockaddr*
  %38 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %39 = load i64* %38, align 16
  %40 = trunc i64 %39 to i32
  %41 = call i64 bitcast (i64 (i64, i64, i64)* @SyS_bind to i64 (i32, %struct.sockaddr*, i32)*)(i32 %36, %struct.sockaddr* %37, i32 %40) #4
  br label %209

; <label>:42                                      ; preds = %audit_socketcall.exit.thread.i
  %43 = trunc i64 %25 to i32
  %44 = inttoptr i64 %27 to %struct.sockaddr*
  %45 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %46 = load i64* %45, align 16
  %47 = trunc i64 %46 to i32
  %48 = call i64 bitcast (i64 (i64, i64, i64)* @SyS_connect to i64 (i32, %struct.sockaddr*, i32)*)(i32 %43, %struct.sockaddr* %44, i32 %47) #4
  br label %209

; <label>:49                                      ; preds = %audit_socketcall.exit.thread.i
  %50 = trunc i64 %25 to i32
  %51 = trunc i64 %27 to i32
  %52 = call i64 bitcast (i64 (i64, i64)* @SyS_listen to i64 (i32, i32)*)(i32 %50, i32 %51) #4
  br label %209

; <label>:53                                      ; preds = %audit_socketcall.exit.thread.i
  %54 = trunc i64 %25 to i32
  %55 = inttoptr i64 %27 to %struct.sockaddr*
  %56 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %57 = load i64* %56, align 16
  %58 = inttoptr i64 %57 to i32*
  %59 = call i64 bitcast (i64 (i64, i64, i64, i64)* @SyS_accept4 to i64 (i32, %struct.sockaddr*, i32*, i32)*)(i32 %54, %struct.sockaddr* %55, i32* %58, i32 0) #4
  br label %209

; <label>:60                                      ; preds = %audit_socketcall.exit.thread.i
  %61 = trunc i64 %25 to i32
  %62 = inttoptr i64 %27 to %struct.sockaddr*
  %63 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %64 = load i64* %63, align 16
  %65 = inttoptr i64 %64 to i32*
  %66 = call i64 bitcast (i64 (i64, i64, i64)* @SyS_getsockname to i64 (i32, %struct.sockaddr*, i32*)*)(i32 %61, %struct.sockaddr* %62, i32* %65) #4
  br label %209

; <label>:67                                      ; preds = %audit_socketcall.exit.thread.i
  %68 = trunc i64 %25 to i32
  %69 = inttoptr i64 %27 to %struct.sockaddr*
  %70 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %71 = load i64* %70, align 16
  %72 = inttoptr i64 %71 to i32*
  %73 = call i64 bitcast (i64 (i64, i64, i64)* @SyS_getpeername to i64 (i32, %struct.sockaddr*, i32*)*)(i32 %68, %struct.sockaddr* %69, i32* %72) #4
  br label %209

; <label>:74                                      ; preds = %audit_socketcall.exit.thread.i
  %75 = trunc i64 %25 to i32
  %76 = trunc i64 %27 to i32
  %77 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %78 = load i64* %77, align 16
  %79 = trunc i64 %78 to i32
  %80 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %81 = load i64* %80, align 8
  %82 = inttoptr i64 %81 to i32*
  %83 = call i64 bitcast (i64 (i64, i64, i64, i64)* @SyS_socketpair to i64 (i32, i32, i32, i32*)*)(i32 %75, i32 %76, i32 %79, i32* %82) #4
  br label %209

; <label>:84                                      ; preds = %audit_socketcall.exit.thread.i
  %85 = trunc i64 %25 to i32
  %86 = inttoptr i64 %27 to i8*
  %87 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %88 = load i64* %87, align 16
  %89 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %90 = load i64* %89, align 8
  %91 = trunc i64 %90 to i32
  %92 = call i64 bitcast (i64 (i64, i64, i64, i64)* @SyS_send to i64 (i32, i8*, i64, i32)*)(i32 %85, i8* %86, i64 %88, i32 %91) #4
  br label %209

; <label>:93                                      ; preds = %audit_socketcall.exit.thread.i
  %94 = trunc i64 %25 to i32
  %95 = inttoptr i64 %27 to i8*
  %96 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %97 = load i64* %96, align 16
  %98 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %99 = load i64* %98, align 8
  %100 = trunc i64 %99 to i32
  %101 = getelementptr [6 x i64]* %a.i, i64 0, i64 4
  %102 = load i64* %101, align 16
  %103 = inttoptr i64 %102 to %struct.sockaddr*
  %104 = getelementptr [6 x i64]* %a.i, i64 0, i64 5
  %105 = load i64* %104, align 8
  %106 = trunc i64 %105 to i32
  %107 = call i64 bitcast (i64 (i64, i64, i64, i64, i64, i64)* @SyS_sendto to i64 (i32, i8*, i64, i32, %struct.sockaddr*, i32)*)(i32 %94, i8* %95, i64 %97, i32 %100, %struct.sockaddr* %103, i32 %106) #4
  br label %209

; <label>:108                                     ; preds = %audit_socketcall.exit.thread.i
  %109 = trunc i64 %25 to i32
  %110 = inttoptr i64 %27 to i8*
  %111 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %112 = load i64* %111, align 16
  %113 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %114 = load i64* %113, align 8
  %115 = trunc i64 %114 to i32
  %116 = call i64 bitcast (i64 (i64, i64, i64, i64)* @SyS_recv to i64 (i32, i8*, i64, i32)*)(i32 %109, i8* %110, i64 %112, i32 %115) #4
  br label %209

; <label>:117                                     ; preds = %audit_socketcall.exit.thread.i
  %118 = trunc i64 %25 to i32
  %119 = inttoptr i64 %27 to i8*
  %120 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %121 = load i64* %120, align 16
  %122 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %123 = load i64* %122, align 8
  %124 = trunc i64 %123 to i32
  %125 = getelementptr [6 x i64]* %a.i, i64 0, i64 4
  %126 = load i64* %125, align 16
  %127 = inttoptr i64 %126 to %struct.sockaddr*
  %128 = getelementptr [6 x i64]* %a.i, i64 0, i64 5
  %129 = load i64* %128, align 8
  %130 = inttoptr i64 %129 to i32*
  %131 = call i64 bitcast (i64 (i64, i64, i64, i64, i64, i64)* @SyS_recvfrom to i64 (i32, i8*, i64, i32, %struct.sockaddr*, i32*)*)(i32 %118, i8* %119, i64 %121, i32 %124, %struct.sockaddr* %127, i32* %130) #4
  br label %209

; <label>:132                                     ; preds = %audit_socketcall.exit.thread.i
  %133 = trunc i64 %25 to i32
  %134 = trunc i64 %27 to i32
  %135 = call i64 bitcast (i64 (i64, i64)* @SyS_shutdown to i64 (i32, i32)*)(i32 %133, i32 %134) #4
  br label %209

; <label>:136                                     ; preds = %audit_socketcall.exit.thread.i
  %137 = trunc i64 %25 to i32
  %138 = trunc i64 %27 to i32
  %139 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %140 = load i64* %139, align 16
  %141 = trunc i64 %140 to i32
  %142 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %143 = load i64* %142, align 8
  %144 = inttoptr i64 %143 to i8*
  %145 = getelementptr [6 x i64]* %a.i, i64 0, i64 4
  %146 = load i64* %145, align 16
  %147 = trunc i64 %146 to i32
  %148 = call i64 bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_setsockopt to i64 (i32, i32, i32, i8*, i32)*)(i32 %137, i32 %138, i32 %141, i8* %144, i32 %147) #4
  br label %209

; <label>:149                                     ; preds = %audit_socketcall.exit.thread.i
  %150 = trunc i64 %25 to i32
  %151 = trunc i64 %27 to i32
  %152 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %153 = load i64* %152, align 16
  %154 = trunc i64 %153 to i32
  %155 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %156 = load i64* %155, align 8
  %157 = inttoptr i64 %156 to i8*
  %158 = getelementptr [6 x i64]* %a.i, i64 0, i64 4
  %159 = load i64* %158, align 16
  %160 = inttoptr i64 %159 to i32*
  %161 = call i64 bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_getsockopt to i64 (i32, i32, i32, i8*, i32*)*)(i32 %150, i32 %151, i32 %154, i8* %157, i32* %160) #4
  br label %209

; <label>:162                                     ; preds = %audit_socketcall.exit.thread.i
  %163 = trunc i64 %25 to i32
  %164 = inttoptr i64 %27 to %struct.user_msghdr*
  %165 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %166 = load i64* %165, align 16
  %167 = trunc i64 %166 to i32
  %168 = call i64 bitcast (i64 (i64, i64, i64)* @SyS_sendmsg to i64 (i32, %struct.user_msghdr*, i32)*)(i32 %163, %struct.user_msghdr* %164, i32 %167) #4
  br label %209

; <label>:169                                     ; preds = %audit_socketcall.exit.thread.i
  %170 = trunc i64 %25 to i32
  %171 = inttoptr i64 %27 to %struct.mmsghdr*
  %172 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %173 = load i64* %172, align 16
  %174 = trunc i64 %173 to i32
  %175 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %176 = load i64* %175, align 8
  %177 = trunc i64 %176 to i32
  %178 = call i64 bitcast (i64 (i64, i64, i64, i64)* @SyS_sendmmsg to i64 (i32, %struct.mmsghdr*, i32, i32)*)(i32 %170, %struct.mmsghdr* %171, i32 %174, i32 %177) #4
  br label %209

; <label>:179                                     ; preds = %audit_socketcall.exit.thread.i
  %180 = trunc i64 %25 to i32
  %181 = inttoptr i64 %27 to %struct.user_msghdr*
  %182 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %183 = load i64* %182, align 16
  %184 = trunc i64 %183 to i32
  %185 = call i64 bitcast (i64 (i64, i64, i64)* @SyS_recvmsg to i64 (i32, %struct.user_msghdr*, i32)*)(i32 %180, %struct.user_msghdr* %181, i32 %184) #4
  br label %209

; <label>:186                                     ; preds = %audit_socketcall.exit.thread.i
  %187 = trunc i64 %25 to i32
  %188 = inttoptr i64 %27 to %struct.mmsghdr*
  %189 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %190 = load i64* %189, align 16
  %191 = trunc i64 %190 to i32
  %192 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %193 = load i64* %192, align 8
  %194 = trunc i64 %193 to i32
  %195 = getelementptr [6 x i64]* %a.i, i64 0, i64 4
  %196 = load i64* %195, align 16
  %197 = inttoptr i64 %196 to %struct.timespec*
  %198 = call i64 bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_recvmmsg to i64 (i32, %struct.mmsghdr*, i32, i32, %struct.timespec*)*)(i32 %187, %struct.mmsghdr* %188, i32 %191, i32 %194, %struct.timespec* %197) #4
  br label %209

; <label>:199                                     ; preds = %audit_socketcall.exit.thread.i
  %200 = trunc i64 %25 to i32
  %201 = inttoptr i64 %27 to %struct.sockaddr*
  %202 = getelementptr [6 x i64]* %a.i, i64 0, i64 2
  %203 = load i64* %202, align 16
  %204 = inttoptr i64 %203 to i32*
  %205 = getelementptr [6 x i64]* %a.i, i64 0, i64 3
  %206 = load i64* %205, align 8
  %207 = trunc i64 %206 to i32
  %208 = call i64 bitcast (i64 (i64, i64, i64, i64)* @SyS_accept4 to i64 (i32, %struct.sockaddr*, i32*, i32)*)(i32 %200, %struct.sockaddr* %201, i32* %204, i32 %207) #4
  br label %209

; <label>:209                                     ; preds = %199, %186, %179, %169, %162, %149, %136, %132, %117, %108, %93, %84, %74, %67, %60, %53, %49, %42, %35, %28, %audit_socketcall.exit.thread.i
  %err.0.i = phi i64 [ %208, %199 ], [ %198, %186 ], [ %185, %179 ], [ %178, %169 ], [ %168, %162 ], [ %161, %149 ], [ %148, %136 ], [ %135, %132 ], [ %131, %117 ], [ %116, %108 ], [ %107, %93 ], [ %92, %84 ], [ %83, %74 ], [ %73, %67 ], [ %66, %60 ], [ %59, %53 ], [ %52, %49 ], [ %48, %42 ], [ %41, %35 ], [ %34, %28 ], [ -22, %audit_socketcall.exit.thread.i ]
  %sext.i = shl i64 %err.0.i, 32
  %210 = ashr exact i64 %sext.i, 32
  br label %SYSC_socketcall.exit

SYSC_socketcall.exit:                             ; preds = %209, %23, %.critedge.i.i, %0
  %.0.i = phi i64 [ %24, %23 ], [ %210, %209 ], [ -22, %0 ], [ -14, %.critedge.i.i ]
  call void @llvm.lifetime.end(i64 48, i8* %2) #1
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i32 @sock_register(%struct.net_proto_family* %ops) #0 {
  %1 = getelementptr inbounds %struct.net_proto_family* %ops, i64 0, i32 0
  %2 = load i32* %1, align 4
  %3 = icmp sgt i32 %2, 40
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([29 x i8]* @.str5, i64 0, i64 0), i32 %2, i32 41) #4
  br label %19

; <label>:6                                       ; preds = %0
  tail call void @_raw_spin_lock(%struct.raw_spinlock* getelementptr inbounds (%struct.spinlock* @net_family_lock, i64 0, i32 0, i32 0)) #4
  %7 = load i32* %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr [41 x %struct.net_proto_family*]* @net_families, i64 0, i64 %8
  %10 = load %struct.net_proto_family** %9, align 8
  %11 = icmp eq %struct.net_proto_family* %10, null
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %6
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !21
  %13 = load i32* %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr [41 x %struct.net_proto_family*]* @net_families, i64 0, i64 %14
  store volatile %struct.net_proto_family* %ops, %struct.net_proto_family** %15, align 8
  br label %16

; <label>:16                                      ; preds = %12, %6
  %err.0 = phi i32 [ 0, %12 ], [ -17, %6 ]
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* bitcast (%struct.spinlock* @net_family_lock to i8*), i8 1, i8* bitcast (%struct.spinlock* @net_family_lock to i8*)) #1, !srcloc !22
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !23
  %17 = load i32* %1, align 4
  %18 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([38 x i8]* @.str6, i64 0, i64 0), i32 %17) #4
  br label %19

; <label>:19                                      ; preds = %16, %4
  %.0 = phi i32 [ -105, %4 ], [ %err.0, %16 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define void @sock_unregister(i32 %family) #0 {
  %1 = icmp ugt i32 %family, 40
  br i1 %1, label %2, label %4, !prof !1

; <label>:2                                       ; preds = %0
  tail call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), i32 2616, i64 12) #1, !srcloc !24
  br label %3

; <label>:3                                       ; preds = %3, %2
  br label %3

; <label>:4                                       ; preds = %0
  tail call void @_raw_spin_lock(%struct.raw_spinlock* getelementptr inbounds (%struct.spinlock* @net_family_lock, i64 0, i32 0, i32 0)) #4
  %5 = sext i32 %family to i64
  %6 = getelementptr [41 x %struct.net_proto_family*]* @net_families, i64 0, i64 %5
  store %struct.net_proto_family* null, %struct.net_proto_family** %6, align 8
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* bitcast (%struct.spinlock* @net_family_lock to i8*), i8 1, i8* bitcast (%struct.spinlock* @net_family_lock to i8*)) #1, !srcloc !22
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !23
  tail call void @synchronize_sched() #4
  %7 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([40 x i8]* @.str8, i64 0, i64 0), i32 %family) #4
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @sock_init() #0 section ".init.text" {
  %1 = tail call i32 @net_sysctl_init() #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %18

; <label>:3                                       ; preds = %0
  tail call void @skb_init() #4
  %4 = tail call %struct.kmem_cache* @kmem_cache_create(i8* getelementptr inbounds ([17 x i8]* @.str14, i64 0, i64 0), i64 600, i64 0, i64 1187840, void (i8*)* @init_once) #4
  store %struct.kmem_cache* %4, %struct.kmem_cache** @sock_inode_cachep, align 8
  %5 = tail call i32 @register_filesystem(%struct.file_system_type* @sock_fs_type) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %3
  %8 = tail call %struct.vfsmount* @kern_mount_data(%struct.file_system_type* @sock_fs_type, i8* null) #4
  store %struct.vfsmount* %8, %struct.vfsmount** @sock_mnt, align 8
  %9 = icmp ugt %struct.vfsmount* %8, inttoptr (i64 -4096 to %struct.vfsmount*)
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %7
  %11 = ptrtoint %struct.vfsmount* %8 to i64
  %12 = trunc i64 %11 to i32
  %13 = tail call i32 @unregister_filesystem(%struct.file_system_type* @sock_fs_type) #4
  br label %18

; <label>:14                                      ; preds = %7
  %15 = tail call i32 @netfilter_init() #4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  tail call void @ptp_classifier_init() #4
  br label %18

; <label>:18                                      ; preds = %17, %14, %10, %3, %0
  %err.0 = phi i32 [ %1, %0 ], [ %5, %3 ], [ %12, %10 ], [ %15, %14 ], [ 0, %17 ]
  ret i32 %err.0
}

; Function Attrs: noredzone nounwind
define void @socket_seq_show(%struct.seq_file* %seq) #0 {
  %1 = load %struct.cpumask** @cpu_possible_mask, align 8
  %2 = getelementptr inbounds %struct.cpumask* %1, i64 0, i32 0, i64 0
  %3 = tail call i64 @find_next_bit(i64* %2, i64 64, i64 0) #4
  %4 = trunc i64 %3 to i32
  %5 = load i32* @nr_cpu_ids, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %0
  %7 = phi i64 [ %16, %.lr.ph ], [ %3, %0 ]
  %counter.03 = phi i32 [ %15, %.lr.ph ], [ 0, %0 ]
  %8 = tail call i64 asm "", "=r,0,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use) #1, !srcloc !25
  %sext2 = shl i64 %7, 32
  %9 = ashr exact i64 %sext2, 32
  %10 = getelementptr [64 x i64]* @__per_cpu_offset, i64 0, i64 %9
  %11 = load i64* %10, align 8
  %12 = add i64 %11, %8
  %13 = inttoptr i64 %12 to i32*
  %14 = load i32* %13, align 4
  %15 = add i32 %14, %counter.03
  %sext = add i64 %sext2, 4294967296
  %phitmp1 = ashr exact i64 %sext, 32
  %16 = tail call i64 @find_next_bit(i64* %2, i64 64, i64 %phitmp1) #4
  %17 = trunc i64 %16 to i32
  %18 = load i32* @nr_cpu_ids, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %0
  %counter.0.lcssa = phi i32 [ 0, %0 ], [ %15, %.lr.ph ]
  %20 = icmp slt i32 %counter.0.lcssa, 0
  %.counter.0 = select i1 %20, i32 0, i32 %counter.0.lcssa
  %21 = tail call i32 (%struct.seq_file*, i8*, ...)* @seq_printf(%struct.seq_file* %seq, i8* getelementptr inbounds ([18 x i8]* @.str9, i64 0, i64 0), i32 %.counter.0) #4
  ret void
}

; Function Attrs: noredzone
declare i32 @seq_printf(%struct.seq_file*, i8*, ...) #2

; Function Attrs: noredzone nounwind
define i32 @kernel_bind(%struct.socket* %sock, %struct.sockaddr* %addr, i32 %addrlen) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 3
  %4 = load i32 (%struct.socket*, %struct.sockaddr*, i32)** %3, align 8
  %5 = tail call i32 %4(%struct.socket* %sock, %struct.sockaddr* %addr, i32 %addrlen) #4
  ret i32 %5
}

; Function Attrs: noredzone nounwind
define i32 @kernel_listen(%struct.socket* %sock, i32 %backlog) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 11
  %4 = load i32 (%struct.socket*, i32)** %3, align 8
  %5 = tail call i32 %4(%struct.socket* %sock, i32 %backlog) #4
  ret i32 %5
}

; Function Attrs: noredzone nounwind
define i32 @kernel_accept(%struct.socket* %sock, %struct.socket** nocapture %newsock, i32 %flags) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 5
  %2 = load %struct.sock** %1, align 8
  %3 = getelementptr inbounds %struct.sock* %2, i64 0, i32 0, i32 3
  %4 = load i16* %3, align 2
  %5 = zext i16 %4 to i32
  %6 = getelementptr inbounds %struct.sock* %2, i64 0, i32 23
  %7 = bitcast [4 x i8]* %6 to i32*
  %8 = load i32* %7, align 8
  %9 = lshr i32 %8, 16
  %10 = lshr i32 %8, 8
  %11 = and i32 %10, 255
  %12 = tail call i32 @sock_create_lite(i32 %5, i32 %9, i32 %11, %struct.socket** %newsock) #5
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %63, label %14

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %16 = load %struct.proto_ops** %15, align 8
  %17 = getelementptr inbounds %struct.proto_ops* %16, i64 0, i32 6
  %18 = load i32 (%struct.socket*, %struct.socket*, i32)** %17, align 8
  %19 = load %struct.socket** %newsock, align 8
  %20 = tail call i32 %18(%struct.socket* %sock, %struct.socket* %19, i32 %flags) #4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %54

; <label>:22                                      ; preds = %14
  %23 = load %struct.socket** %newsock, align 8
  %24 = getelementptr inbounds %struct.socket* %23, i64 0, i32 6
  %25 = load %struct.proto_ops** %24, align 8
  %26 = icmp eq %struct.proto_ops* %25, null
  br i1 %26, label %33, label %27

; <label>:27                                      ; preds = %22
  %28 = getelementptr inbounds %struct.proto_ops* %25, i64 0, i32 1
  %29 = load %struct.module** %28, align 8
  %30 = getelementptr inbounds %struct.proto_ops* %25, i64 0, i32 2
  %31 = load i32 (%struct.socket*)** %30, align 8
  %32 = tail call i32 %31(%struct.socket* %23) #4
  store %struct.proto_ops* null, %struct.proto_ops** %24, align 8
  tail call void @module_put(%struct.module* %29) #4
  br label %33

; <label>:33                                      ; preds = %27, %22
  %34 = getelementptr inbounds %struct.socket* %23, i64 0, i32 3
  %35 = load %struct.socket_wq** %34, align 8
  %36 = getelementptr inbounds %struct.socket_wq* %35, i64 0, i32 1
  %37 = load %struct.fasync_struct** %36, align 8
  %38 = icmp eq %struct.fasync_struct* %37, null
  br i1 %38, label %41, label %39

; <label>:39                                      ; preds = %33
  %40 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %41

; <label>:41                                      ; preds = %39, %33
  %42 = getelementptr inbounds %struct.socket* %23, i64 0, i32 2
  %43 = load volatile i64* %42, align 8
  %44 = and i64 %43, 32
  %45 = icmp eq i64 %44, 0
  br i1 %45, label %46, label %sock_release.exit

; <label>:46                                      ; preds = %41
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %47 = getelementptr inbounds %struct.socket* %23, i64 0, i32 4
  %48 = load %struct.file** %47, align 8
  %49 = icmp eq %struct.file* %48, null
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %46
  %51 = getelementptr inbounds %struct.socket* %23, i64 1
  %52 = bitcast %struct.socket* %51 to %struct.inode*
  tail call void @iput(%struct.inode* %52) #4
  br label %sock_release.exit

; <label>:53                                      ; preds = %46
  store %struct.file* null, %struct.file** %47, align 8
  br label %sock_release.exit

sock_release.exit:                                ; preds = %53, %50, %41
  store %struct.socket* null, %struct.socket** %newsock, align 8
  br label %63

; <label>:54                                      ; preds = %14
  %55 = load %struct.proto_ops** %15, align 8
  %56 = load %struct.socket** %newsock, align 8
  %57 = getelementptr inbounds %struct.socket* %56, i64 0, i32 6
  store %struct.proto_ops* %55, %struct.proto_ops** %57, align 8
  %58 = load %struct.socket** %newsock, align 8
  %59 = getelementptr inbounds %struct.socket* %58, i64 0, i32 6
  %60 = load %struct.proto_ops** %59, align 8
  %61 = getelementptr inbounds %struct.proto_ops* %60, i64 0, i32 1
  %62 = load %struct.module** %61, align 8
  tail call void @__module_get(%struct.module* %62) #4
  br label %63

; <label>:63                                      ; preds = %54, %sock_release.exit, %0
  %err.0 = phi i32 [ %12, %0 ], [ %20, %sock_release.exit ], [ %20, %54 ]
  ret i32 %err.0
}

; Function Attrs: noredzone
declare void @__module_get(%struct.module*) #2

; Function Attrs: noredzone nounwind
define i32 @kernel_connect(%struct.socket* %sock, %struct.sockaddr* %addr, i32 %addrlen, i32 %flags) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 4
  %4 = load i32 (%struct.socket*, %struct.sockaddr*, i32, i32)** %3, align 8
  %5 = tail call i32 %4(%struct.socket* %sock, %struct.sockaddr* %addr, i32 %addrlen, i32 %flags) #4
  ret i32 %5
}

; Function Attrs: noredzone nounwind
define i32 @kernel_getsockname(%struct.socket* %sock, %struct.sockaddr* %addr, i32* %addrlen) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 7
  %4 = load i32 (%struct.socket*, %struct.sockaddr*, i32*, i32)** %3, align 8
  %5 = tail call i32 %4(%struct.socket* %sock, %struct.sockaddr* %addr, i32* %addrlen, i32 0) #4
  ret i32 %5
}

; Function Attrs: noredzone nounwind
define i32 @kernel_getpeername(%struct.socket* %sock, %struct.sockaddr* %addr, i32* %addrlen) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 7
  %4 = load i32 (%struct.socket*, %struct.sockaddr*, i32*, i32)** %3, align 8
  %5 = tail call i32 %4(%struct.socket* %sock, %struct.sockaddr* %addr, i32* %addrlen, i32 1) #4
  ret i32 %5
}

; Function Attrs: noredzone nounwind
define i32 @kernel_getsockopt(%struct.socket* %sock, i32 %level, i32 %optname, i8* %optval, i32* %optlen) #0 {
  %1 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %2 = add i64 %1, -16344
  %3 = inttoptr i64 %2 to %struct.thread_info*
  %4 = getelementptr inbounds %struct.thread_info* %3, i64 0, i32 6, i32 0
  %5 = load i64* %4, align 8
  %6 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %7 = add i64 %6, -16344
  %8 = inttoptr i64 %7 to %struct.thread_info*
  %9 = getelementptr inbounds %struct.thread_info* %8, i64 0, i32 6, i32 0
  store i64 -1, i64* %9, align 8
  %10 = icmp eq i32 %level, 1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %0
  %12 = tail call i32 @sock_getsockopt(%struct.socket* %sock, i32 1, i32 %optname, i8* %optval, i32* %optlen) #4
  br label %19

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %15 = load %struct.proto_ops** %14, align 8
  %16 = getelementptr inbounds %struct.proto_ops* %15, i64 0, i32 14
  %17 = load i32 (%struct.socket*, i32, i32, i8*, i32*)** %16, align 8
  %18 = tail call i32 %17(%struct.socket* %sock, i32 %level, i32 %optname, i8* %optval, i32* %optlen) #4
  br label %19

; <label>:19                                      ; preds = %13, %11
  %err.0 = phi i32 [ %12, %11 ], [ %18, %13 ]
  %20 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %21 = add i64 %20, -16344
  %22 = inttoptr i64 %21 to %struct.thread_info*
  %23 = getelementptr inbounds %struct.thread_info* %22, i64 0, i32 6, i32 0
  store i64 %5, i64* %23, align 8
  ret i32 %err.0
}

; Function Attrs: noredzone
declare i32 @sock_getsockopt(%struct.socket*, i32, i32, i8*, i32*) #2

; Function Attrs: noredzone nounwind
define i32 @kernel_setsockopt(%struct.socket* %sock, i32 %level, i32 %optname, i8* %optval, i32 %optlen) #0 {
  %1 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %2 = add i64 %1, -16344
  %3 = inttoptr i64 %2 to %struct.thread_info*
  %4 = getelementptr inbounds %struct.thread_info* %3, i64 0, i32 6, i32 0
  %5 = load i64* %4, align 8
  %6 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %7 = add i64 %6, -16344
  %8 = inttoptr i64 %7 to %struct.thread_info*
  %9 = getelementptr inbounds %struct.thread_info* %8, i64 0, i32 6, i32 0
  store i64 -1, i64* %9, align 8
  %10 = icmp eq i32 %level, 1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %0
  %12 = tail call i32 @sock_setsockopt(%struct.socket* %sock, i32 1, i32 %optname, i8* %optval, i32 %optlen) #4
  br label %19

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %15 = load %struct.proto_ops** %14, align 8
  %16 = getelementptr inbounds %struct.proto_ops* %15, i64 0, i32 13
  %17 = load i32 (%struct.socket*, i32, i32, i8*, i32)** %16, align 8
  %18 = tail call i32 %17(%struct.socket* %sock, i32 %level, i32 %optname, i8* %optval, i32 %optlen) #4
  br label %19

; <label>:19                                      ; preds = %13, %11
  %err.0 = phi i32 [ %12, %11 ], [ %18, %13 ]
  %20 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %21 = add i64 %20, -16344
  %22 = inttoptr i64 %21 to %struct.thread_info*
  %23 = getelementptr inbounds %struct.thread_info* %22, i64 0, i32 6, i32 0
  store i64 %5, i64* %23, align 8
  ret i32 %err.0
}

; Function Attrs: noredzone
declare i32 @sock_setsockopt(%struct.socket*, i32, i32, i8*, i32) #2

; Function Attrs: noredzone nounwind
define i32 @kernel_sendpage(%struct.socket* %sock, %struct.page* %page, i32 %offset, i64 %size, i32 %flags) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 20
  %4 = load i64 (%struct.socket*, %struct.page*, i32, i64, i32)** %3, align 8
  %5 = icmp eq i64 (%struct.socket*, %struct.page*, i32, i64, i32)* %4, null
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = tail call i64 %4(%struct.socket* %sock, %struct.page* %page, i32 %offset, i64 %size, i32 %flags) #4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = tail call i64 @sock_no_sendpage(%struct.socket* %sock, %struct.page* %page, i32 %offset, i64 %size, i32 %flags) #4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %.0.in = phi i64 [ %7, %6 ], [ %9, %8 ]
  %.0 = trunc i64 %.0.in to i32
  ret i32 %.0
}

; Function Attrs: noredzone
declare i64 @sock_no_sendpage(%struct.socket*, %struct.page*, i32, i64, i32) #2

; Function Attrs: noredzone nounwind
define i32 @kernel_sock_ioctl(%struct.socket* %sock, i32 %cmd, i64 %arg) #0 {
  %1 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %2 = add i64 %1, -16344
  %3 = inttoptr i64 %2 to %struct.thread_info*
  %4 = getelementptr inbounds %struct.thread_info* %3, i64 0, i32 6, i32 0
  %5 = load i64* %4, align 8
  %6 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %7 = add i64 %6, -16344
  %8 = inttoptr i64 %7 to %struct.thread_info*
  %9 = getelementptr inbounds %struct.thread_info* %8, i64 0, i32 6, i32 0
  store i64 -1, i64* %9, align 8
  %10 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %11 = load %struct.proto_ops** %10, align 8
  %12 = getelementptr inbounds %struct.proto_ops* %11, i64 0, i32 9
  %13 = load i32 (%struct.socket*, i32, i64)** %12, align 8
  %14 = tail call i32 %13(%struct.socket* %sock, i32 %cmd, i64 %arg) #4
  %15 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %16 = add i64 %15, -16344
  %17 = inttoptr i64 %16 to %struct.thread_info*
  %18 = getelementptr inbounds %struct.thread_info* %17, i64 0, i32 6, i32 0
  store i64 %5, i64* %18, align 8
  ret i32 %14
}

; Function Attrs: noredzone nounwind
define i32 @kernel_sock_shutdown(%struct.socket* %sock, i32 %how) #0 {
  %1 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %2 = load %struct.proto_ops** %1, align 8
  %3 = getelementptr inbounds %struct.proto_ops* %2, i64 0, i32 12
  %4 = load i32 (%struct.socket*, i32)** %3, align 8
  %5 = tail call i32 %4(%struct.socket* %sock, i32 %how) #4
  ret i32 %5
}

; Function Attrs: noredzone
declare i64 @find_next_bit(i64*, i64, i64) #2

; Function Attrs: noredzone
declare i32 @net_sysctl_init() #2

; Function Attrs: noredzone
declare void @skb_init() #2

; Function Attrs: noredzone
declare i32 @register_filesystem(%struct.file_system_type*) #2

; Function Attrs: noredzone
declare %struct.vfsmount* @kern_mount_data(%struct.file_system_type*, i8*) #2

; Function Attrs: noredzone
declare i32 @netfilter_init() #2

; Function Attrs: noredzone
declare void @ptp_classifier_init() #2 section ".init.text"

; Function Attrs: noredzone
declare i32 @unregister_filesystem(%struct.file_system_type*) #2

; Function Attrs: noredzone nounwind
define internal %struct.dentry* @sockfs_mount(%struct.file_system_type* %fs_type, i32 %flags, i8* nocapture readnone %dev_name, i8* nocapture readnone %data) #0 {
  %1 = tail call %struct.dentry* @mount_pseudo(%struct.file_system_type* %fs_type, i8* getelementptr inbounds ([8 x i8]* @.str11, i64 0, i64 0), %struct.super_operations* @sockfs_ops, %struct.dentry_operations* @sockfs_dentry_operations, i64 1397703499) #4
  ret %struct.dentry* %1
}

; Function Attrs: noredzone
declare void @kill_anon_super(%struct.super_block*) #2

; Function Attrs: noredzone
declare %struct.dentry* @mount_pseudo(%struct.file_system_type*, i8*, %struct.super_operations*, %struct.dentry_operations*, i64) #2

; Function Attrs: noredzone nounwind
define internal i8* @sockfs_dname(%struct.dentry* %dentry, i8* %buffer, i32 %buflen) #0 {
  %1 = getelementptr inbounds %struct.dentry* %dentry, i64 0, i32 5
  %2 = load %struct.inode** %1, align 8
  %3 = getelementptr inbounds %struct.inode* %2, i64 0, i32 11
  %4 = load i64* %3, align 8
  %5 = tail call i8* (%struct.dentry*, i8*, i32, i8*, ...)* @dynamic_dname(%struct.dentry* %dentry, i8* %buffer, i32 %buflen, i8* getelementptr inbounds ([13 x i8]* @.str12, i64 0, i64 0), i64 %4) #4
  ret i8* %5
}

; Function Attrs: noredzone
declare i8* @dynamic_dname(%struct.dentry*, i8*, i32, i8*, ...) #2

; Function Attrs: noredzone nounwind
define internal %struct.inode* @sock_alloc_inode(%struct.super_block* nocapture readnone %sb) #0 {
  %1 = load %struct.kmem_cache** @sock_inode_cachep, align 8
  %2 = tail call i8* @kmem_cache_alloc(%struct.kmem_cache* %1, i32 208) #4
  %3 = icmp eq i8* %2, null
  br i1 %3, label %27, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i8* @__kmalloc(i64 64, i32 208) #4
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %4
  %8 = load %struct.kmem_cache** @sock_inode_cachep, align 8
  tail call void @kmem_cache_free(%struct.kmem_cache* %8, i8* %2) #4
  br label %27

; <label>:9                                       ; preds = %4
  %10 = bitcast i8* %5 to %struct.socket_wq*
  %11 = bitcast i8* %5 to %struct.__wait_queue_head*
  tail call void @__init_waitqueue_head(%struct.__wait_queue_head* %11, i8* getelementptr inbounds ([10 x i8]* @.str13, i64 0, i64 0), %struct.lock_class_key* @sock_alloc_inode.__key) #4
  %12 = getelementptr inbounds i8* %5, i64 24
  %13 = bitcast i8* %12 to %struct.fasync_struct**
  store %struct.fasync_struct* null, %struct.fasync_struct** %13, align 8
  %14 = getelementptr inbounds i8* %2, i64 16
  %15 = bitcast i8* %14 to %struct.socket_wq**
  store %struct.socket_wq* %10, %struct.socket_wq** %15, align 8
  %16 = bitcast i8* %2 to i32*
  store i32 1, i32* %16, align 4
  %17 = getelementptr inbounds i8* %2, i64 8
  %18 = bitcast i8* %17 to i64*
  store i64 0, i64* %18, align 8
  %19 = getelementptr inbounds i8* %2, i64 40
  %20 = bitcast i8* %19 to %struct.proto_ops**
  store %struct.proto_ops* null, %struct.proto_ops** %20, align 8
  %21 = getelementptr inbounds i8* %2, i64 32
  %22 = bitcast i8* %21 to %struct.sock**
  store %struct.sock* null, %struct.sock** %22, align 8
  %23 = getelementptr inbounds i8* %2, i64 24
  %24 = bitcast i8* %23 to %struct.file**
  store %struct.file* null, %struct.file** %24, align 8
  %25 = getelementptr inbounds i8* %2, i64 48
  %26 = bitcast i8* %25 to %struct.inode*
  br label %27

; <label>:27                                      ; preds = %9, %7, %0
  %.0 = phi %struct.inode* [ %26, %9 ], [ null, %7 ], [ null, %0 ]
  ret %struct.inode* %.0
}

; Function Attrs: noredzone nounwind
define internal void @sock_destroy_inode(%struct.inode* %inode) #0 {
  %1 = getelementptr %struct.inode* %inode, i64 -1, i32 37
  %2 = getelementptr inbounds %struct.list_head* %1, i64 1
  %3 = bitcast %struct.list_head* %2 to %struct.socket_wq**
  %4 = load %struct.socket_wq** %3, align 8
  %5 = getelementptr inbounds %struct.socket_wq* %4, i64 0, i32 2
  tail call void @kfree_call_rcu(%struct.callback_head* %5, void (%struct.callback_head*)* inttoptr (i64 32 to void (%struct.callback_head*)*)) #4
  %6 = load %struct.kmem_cache** @sock_inode_cachep, align 8
  %7 = bitcast %struct.list_head* %1 to i8*
  tail call void @kmem_cache_free(%struct.kmem_cache* %6, i8* %7) #4
  ret void
}

; Function Attrs: noredzone
declare i32 @simple_statfs(%struct.dentry*, %struct.kstatfs*) #2

; Function Attrs: noredzone
declare void @kfree_call_rcu(%struct.callback_head*, void (%struct.callback_head*)*) #2

; Function Attrs: noredzone
declare void @kmem_cache_free(%struct.kmem_cache*, i8*) #2

; Function Attrs: noredzone
declare i8* @kmem_cache_alloc(%struct.kmem_cache*, i32) #2

; Function Attrs: noredzone
declare void @__init_waitqueue_head(%struct.__wait_queue_head*, i8*, %struct.lock_class_key*) #2

; Function Attrs: noredzone
declare i8* @__kmalloc(i64, i32) #2

; Function Attrs: noredzone
declare %struct.kmem_cache* @kmem_cache_create(i8*, i64, i64, i64, void (i8*)*) #2

; Function Attrs: noredzone nounwind
define internal void @init_once(i8* %foo) #0 {
  %1 = getelementptr inbounds i8* %foo, i64 48
  %2 = bitcast i8* %1 to %struct.inode*
  tail call void @inode_init_once(%struct.inode* %2) #4
  ret void
}

; Function Attrs: noredzone
declare void @inode_init_once(%struct.inode*) #2

; Function Attrs: noredzone
declare void @synchronize_sched() #2

; Function Attrs: noredzone
declare void @_raw_spin_lock(%struct.raw_spinlock*) #2 section ".spinlock.text"

; Function Attrs: noredzone
declare i32 @__audit_socketcall(i32, i64*) #2

; Function Attrs: nounwind readnone
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1) #3

; Function Attrs: noredzone
declare i64 @_copy_to_user(i8*, i8*, i32) #2

; Function Attrs: noredzone
declare void @warn_slowpath_fmt(i8*, i32, i8*, ...) #2

; Function Attrs: noredzone
declare void @set_normalized_timespec(%struct.timespec*, i64, i64) #2

; Function Attrs: noredzone
declare void @ktime_get_ts64(%struct.timespec*) #2

; Function Attrs: noredzone
declare i64 @get_compat_msghdr(%struct.msghdr*, %struct.compat_msghdr*, %struct.sockaddr**, %struct.iovec**) #2

; Function Attrs: noredzone nounwind
define internal fastcc i64 @copy_msghdr_from_user(%struct.msghdr* %kmsg, %struct.user_msghdr* %umsg, %struct.sockaddr** %save_addr, %struct.iovec** %iov) #0 {
  %1 = ptrtoint %struct.user_msghdr* %umsg to i64
  %2 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %3 = add i64 %2, -16344
  %4 = inttoptr i64 %3 to %struct.thread_info*
  %5 = getelementptr inbounds %struct.thread_info* %4, i64 0, i32 6, i32 0
  %6 = load i64* %5, align 8
  %7 = icmp ugt %struct.user_msghdr* %umsg, inttoptr (i64 -57 to %struct.user_msghdr*)
  %8 = add i64 %1, 56
  %9 = icmp ugt i64 %8, %6
  %or.cond = or i1 %7, %9
  br i1 %or.cond, label %__chk_range_not_ok.exit.thread, label %10

; <label>:10                                      ; preds = %0
  %11 = bitcast %struct.user_msghdr* %umsg to %struct.__large_struct*
  %12 = tail call { i32, i64 } asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movq $2,$1\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09xorq $1,$1\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,=r,*m,i,0,~{dirflag},~{fpsr},~{flags}"(%struct.__large_struct* %11, i32 -14, i32 0) #1, !srcloc !26
  %13 = extractvalue { i32, i64 } %12, 0
  %14 = extractvalue { i32, i64 } %12, 1
  %15 = inttoptr i64 %14 to %struct.sockaddr*
  %16 = icmp eq i32 %13, 0
  br i1 %16, label %17, label %__chk_range_not_ok.exit.thread

; <label>:17                                      ; preds = %10
  %18 = getelementptr inbounds %struct.user_msghdr* %umsg, i64 0, i32 1
  %19 = bitcast i32* %18 to %struct.__large_struct*
  %20 = tail call { i32, i64 } asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movl $2,${1:k}\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09xorl ${1:k},${1:k}\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,=r,*m,i,0,~{dirflag},~{fpsr},~{flags}"(%struct.__large_struct* %19, i32 -14, i32 0) #1, !srcloc !27
  %21 = extractvalue { i32, i64 } %20, 0
  %22 = extractvalue { i32, i64 } %20, 1
  %23 = trunc i64 %22 to i32
  %24 = getelementptr inbounds %struct.msghdr* %kmsg, i64 0, i32 1
  store i32 %23, i32* %24, align 4
  %25 = icmp eq i32 %21, 0
  br i1 %25, label %26, label %__chk_range_not_ok.exit.thread

; <label>:26                                      ; preds = %17
  %27 = getelementptr inbounds %struct.user_msghdr* %umsg, i64 0, i32 2
  %28 = bitcast %struct.iovec** %27 to %struct.__large_struct*
  %29 = tail call { i32, i64 } asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movq $2,$1\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09xorq $1,$1\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,=r,*m,i,0,~{dirflag},~{fpsr},~{flags}"(%struct.__large_struct* %28, i32 -14, i32 0) #1, !srcloc !28
  %30 = extractvalue { i32, i64 } %29, 0
  %31 = extractvalue { i32, i64 } %29, 1
  %32 = inttoptr i64 %31 to %struct.iovec*
  %33 = icmp eq i32 %30, 0
  br i1 %33, label %34, label %__chk_range_not_ok.exit.thread

; <label>:34                                      ; preds = %26
  %35 = getelementptr inbounds %struct.user_msghdr* %umsg, i64 0, i32 3
  %36 = bitcast i64* %35 to %struct.__large_struct*
  %37 = tail call { i32, i64 } asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movq $2,$1\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09xorq $1,$1\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,=r,*m,i,0,~{dirflag},~{fpsr},~{flags}"(%struct.__large_struct* %36, i32 -14, i32 0) #1, !srcloc !29
  %38 = extractvalue { i32, i64 } %37, 0
  %39 = extractvalue { i32, i64 } %37, 1
  %40 = icmp eq i32 %38, 0
  br i1 %40, label %41, label %__chk_range_not_ok.exit.thread

; <label>:41                                      ; preds = %34
  %42 = getelementptr inbounds %struct.user_msghdr* %umsg, i64 0, i32 4
  %43 = bitcast i8** %42 to %struct.__large_struct*
  %44 = tail call { i32, i64 } asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movq $2,$1\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09xorq $1,$1\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,=r,*m,i,0,~{dirflag},~{fpsr},~{flags}"(%struct.__large_struct* %43, i32 -14, i32 0) #1, !srcloc !30
  %45 = extractvalue { i32, i64 } %44, 0
  %46 = extractvalue { i32, i64 } %44, 1
  %47 = inttoptr i64 %46 to i8*
  %48 = getelementptr inbounds %struct.msghdr* %kmsg, i64 0, i32 3
  store i8* %47, i8** %48, align 8
  %49 = icmp eq i32 %45, 0
  br i1 %49, label %50, label %__chk_range_not_ok.exit.thread

; <label>:50                                      ; preds = %41
  %51 = getelementptr inbounds %struct.user_msghdr* %umsg, i64 0, i32 5
  %52 = bitcast i64* %51 to %struct.__large_struct*
  %53 = tail call { i32, i64 } asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movq $2,$1\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09xorq $1,$1\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,=r,*m,i,0,~{dirflag},~{fpsr},~{flags}"(%struct.__large_struct* %52, i32 -14, i32 0) #1, !srcloc !31
  %54 = extractvalue { i32, i64 } %53, 0
  %55 = extractvalue { i32, i64 } %53, 1
  %56 = getelementptr inbounds %struct.msghdr* %kmsg, i64 0, i32 4
  store i64 %55, i64* %56, align 8
  %57 = icmp eq i32 %54, 0
  br i1 %57, label %58, label %__chk_range_not_ok.exit.thread

; <label>:58                                      ; preds = %50
  %59 = getelementptr inbounds %struct.user_msghdr* %umsg, i64 0, i32 6
  %60 = bitcast i32* %59 to %struct.__large_struct*
  %61 = tail call { i32, i64 } asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movl $2,${1:k}\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09xorl ${1:k},${1:k}\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,=r,*m,i,0,~{dirflag},~{fpsr},~{flags}"(%struct.__large_struct* %60, i32 -14, i32 0) #1, !srcloc !32
  %62 = extractvalue { i32, i64 } %61, 0
  %63 = extractvalue { i32, i64 } %61, 1
  %64 = trunc i64 %63 to i32
  %65 = getelementptr inbounds %struct.msghdr* %kmsg, i64 0, i32 5
  store i32 %64, i32* %65, align 4
  %66 = icmp eq i32 %62, 0
  br i1 %66, label %67, label %__chk_range_not_ok.exit.thread

; <label>:67                                      ; preds = %58
  %68 = icmp ne i64 %14, 0
  br i1 %68, label %69, label %.thread13

.thread13:                                        ; preds = %67
  store i32 0, i32* %24, align 4
  br label %74

; <label>:69                                      ; preds = %67
  %.pr = load i32* %24, align 4
  %70 = icmp slt i32 %.pr, 0
  br i1 %70, label %__chk_range_not_ok.exit.thread, label %71

; <label>:71                                      ; preds = %69
  %72 = icmp ugt i32 %.pr, 128
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %71
  store i32 128, i32* %24, align 4
  br label %74

; <label>:74                                      ; preds = %73, %71, %.thread13
  %75 = icmp ne %struct.sockaddr** %save_addr, null
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %74
  store %struct.sockaddr* %15, %struct.sockaddr** %save_addr, align 8
  br label %77

; <label>:77                                      ; preds = %76, %74
  br i1 %68, label %78, label %91

; <label>:78                                      ; preds = %77
  %79 = load i32* %24, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %91, label %81

; <label>:81                                      ; preds = %78
  br i1 %75, label %93, label %82

; <label>:82                                      ; preds = %81
  %83 = inttoptr i64 %14 to i8*
  %84 = getelementptr inbounds %struct.msghdr* %kmsg, i64 0, i32 0
  %85 = load i8** %84, align 8
  %86 = bitcast i8* %85 to %struct.__kernel_sockaddr_storage*
  %87 = tail call i32 @move_addr_to_kernel(i8* %83, i32 %79, %struct.__kernel_sockaddr_storage* %86) #5
  %88 = icmp slt i32 %87, 0
  br i1 %88, label %89, label %93

; <label>:89                                      ; preds = %82
  %90 = sext i32 %87 to i64
  br label %__chk_range_not_ok.exit.thread

; <label>:91                                      ; preds = %78, %77
  %92 = getelementptr inbounds %struct.msghdr* %kmsg, i64 0, i32 0
  store i8* null, i8** %92, align 8
  store i32 0, i32* %24, align 4
  br label %93

; <label>:93                                      ; preds = %91, %82, %81
  %94 = icmp ugt i64 %39, 1024
  br i1 %94, label %__chk_range_not_ok.exit.thread, label %95

; <label>:95                                      ; preds = %93
  %96 = zext i1 %75 to i32
  %97 = xor i32 %96, 1
  %98 = load %struct.iovec** %iov, align 8
  %99 = tail call i64 @rw_copy_check_uvector(i32 %97, %struct.iovec* %32, i64 %39, i64 8, %struct.iovec* %98, %struct.iovec** %iov) #4
  %100 = icmp sgt i64 %99, -1
  br i1 %100, label %101, label %__chk_range_not_ok.exit.thread

; <label>:101                                     ; preds = %95
  %102 = getelementptr inbounds %struct.msghdr* %kmsg, i64 0, i32 2
  %103 = load %struct.iovec** %iov, align 8
  tail call void @iov_iter_init(%struct.iov_iter* %102, i32 %97, %struct.iovec* %103, i64 %39, i64 %99) #4
  br label %__chk_range_not_ok.exit.thread

__chk_range_not_ok.exit.thread:                   ; preds = %101, %95, %93, %89, %69, %58, %50, %41, %34, %26, %17, %10, %0
  %.0 = phi i64 [ %90, %89 ], [ -14, %58 ], [ -14, %50 ], [ -14, %41 ], [ -14, %34 ], [ -14, %26 ], [ -14, %17 ], [ -14, %10 ], [ -22, %69 ], [ -90, %93 ], [ %99, %101 ], [ %99, %95 ], [ -14, %0 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @sock_recvmsg_nosec(%struct.socket* %sock, %struct.msghdr* %msg, i64 %size, i32 %flags) #0 {
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iocb = alloca %struct.kiocb, align 8
  %siocb = alloca %struct.sock_iocb, align 8
  %1 = bitcast %struct.kiocb* %iocb to i8*
  call void @llvm.lifetime.start(i64 88, i8* %1) #1
  %2 = bitcast %struct.sock_iocb* %siocb to i8*
  call void @llvm.lifetime.start(i64 144, i8* %2) #1
  %3 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %3)
  %4 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %4)
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 48, i32 8, i1 false)
  %5 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %6 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 0
  store %struct.file* null, %struct.file** %6, align 8
  %7 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 1
  %8 = bitcast %struct.kioctx** %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %3, i64 16, i32 8, i1 false) #1
  %9 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %5 to i8*
  store i8* %.c.i, i8** %9, align 8
  %10 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 5
  %11 = bitcast i64* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %4, i64 48, i32 8, i1 false) #1
  call void @llvm.lifetime.end(i64 24, i8* %3)
  call void @llvm.lifetime.end(i64 48, i8* %4)
  %12 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 3
  store i8* %2, i8** %12, align 8
  %13 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 3
  store %struct.socket* %sock, %struct.socket** %13, align 8
  %14 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 5
  store %struct.scm_cookie* null, %struct.scm_cookie** %14, align 8
  %15 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 6
  store %struct.msghdr* %msg, %struct.msghdr** %15, align 8
  %16 = trunc i64 %size to i32
  %17 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 2
  store i32 %16, i32* %17, align 4
  %18 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 1
  store i32 %flags, i32* %18, align 8
  %19 = getelementptr inbounds %struct.socket* %sock, i64 0, i32 6
  %20 = load %struct.proto_ops** %19, align 8
  %21 = getelementptr inbounds %struct.proto_ops* %20, i64 0, i32 18
  %22 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64, i32)** %21, align 8
  %23 = call i32 %22(%struct.kiocb* %iocb, %struct.socket* %sock, %struct.msghdr* %msg, i64 %size, i32 %flags) #4
  %24 = icmp eq i32 %23, -529
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %0
  %26 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %iocb) #4
  %27 = trunc i64 %26 to i32
  br label %28

; <label>:28                                      ; preds = %25, %0
  %ret.0 = phi i32 [ %27, %25 ], [ %23, %0 ]
  call void @llvm.lifetime.end(i64 144, i8* %2) #1
  call void @llvm.lifetime.end(i64 88, i8* %1) #1
  ret i32 %ret.0
}

; Function Attrs: noredzone nounwind
define internal fastcc i32 @move_addr_to_user(%struct.__kernel_sockaddr_storage* %kaddr, i32 %klen, i8* %uaddr, i32* %ulen) #0 {
  %1 = icmp ugt i32 %klen, 128
  br i1 %1, label %2, label %4, !prof !1

; <label>:2                                       ; preds = %0
  tail call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), i32 224, i64 12) #1, !srcloc !33
  br label %3

; <label>:3                                       ; preds = %3, %2
  br label %3

; <label>:4                                       ; preds = %0
  %5 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %ulen, i64 4) #1, !srcloc !34
  %6 = extractvalue { i32*, i64 } %5, 0
  %7 = extractvalue { i32*, i64 } %5, 1
  %8 = ptrtoint i32* %6 to i64
  %9 = trunc i64 %8 to i32
  %10 = trunc i64 %7 to i32
  %11 = icmp eq i32 %9, 0
  br i1 %11, label %12, label %41

; <label>:12                                      ; preds = %4
  %13 = icmp sgt i32 %10, %klen
  %klen. = select i1 %13, i32 %klen, i32 %10
  %14 = icmp slt i32 %klen., 0
  br i1 %14, label %41, label %15

; <label>:15                                      ; preds = %12
  %16 = icmp eq i32 %klen., 0
  br i1 %16, label %38, label %17

; <label>:17                                      ; preds = %15
  %18 = bitcast %struct.__kernel_sockaddr_storage* %kaddr to i8*
  %19 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %20 = getelementptr inbounds %struct.task_struct* %19, i64 0, i32 94
  %21 = load %struct.audit_context** %20, align 8
  %22 = icmp eq %struct.audit_context* %21, null
  br i1 %22, label %audit_sockaddr.exit.thread, label %audit_dummy_context.exit.i

audit_dummy_context.exit.i:                       ; preds = %17
  %23 = bitcast %struct.audit_context* %21 to i32*
  %24 = load i32* %23, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %audit_sockaddr.exit, label %audit_sockaddr.exit.thread, !prof !1

audit_sockaddr.exit:                              ; preds = %audit_dummy_context.exit.i
  %26 = tail call i32 @__audit_sockaddr(i32 %klen, i8* %18) #4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %audit_sockaddr.exit.thread, label %41

audit_sockaddr.exit.thread:                       ; preds = %audit_sockaddr.exit, %audit_dummy_context.exit.i, %17
  %28 = sext i32 %klen. to i64
  %29 = tail call i64 @llvm.objectsize.i64.p0i8(i8* %18, i1 false) #1
  %30 = trunc i64 %29 to i32
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %.critedge.i, label %32

; <label>:32                                      ; preds = %audit_sockaddr.exit.thread
  %sext.i = shl i64 %29, 32
  %33 = ashr exact i64 %sext.i, 32
  %34 = icmp ult i64 %33, %28
  br i1 %34, label %36, label %.critedge.i, !prof !1

.critedge.i:                                      ; preds = %32, %audit_sockaddr.exit.thread
  %35 = tail call i64 @_copy_to_user(i8* %uaddr, i8* %18, i32 %klen.) #4
  br label %copy_to_user.exit

; <label>:36                                      ; preds = %32
  tail call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str15, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str16, i64 0, i64 0), i32 %30, i64 %28) #4
  br label %copy_to_user.exit

copy_to_user.exit:                                ; preds = %36, %.critedge.i
  %.0.i1 = phi i64 [ %35, %.critedge.i ], [ %28, %36 ]
  %37 = icmp eq i64 %.0.i1, 0
  br i1 %37, label %38, label %41

; <label>:38                                      ; preds = %copy_to_user.exit, %15
  %39 = bitcast i32* %ulen to %struct.__large_struct*
  %40 = tail call i32 asm sideeffect "661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xcb\0A6641:\0A\09.popsection\0A1:\09movl ${1:k},$2\0A2: 661:\0A\09.byte 0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+20)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x0f,0x01,0xca\0A6641:\0A\09.popsection\0A.section .fixup,\22ax\22\0A3:\09mov $3,$0\0A\09jmp 2b\0A.previous\0A .pushsection \22__ex_table\22,\22a\22\0A .balign 8\0A .long (1b) - .\0A .long (3b) - .\0A .popsection\0A", "=r,ir,*m,i,0,~{dirflag},~{fpsr},~{flags}"(i32 %klen, %struct.__large_struct* %39, i32 -14, i32 0) #1, !srcloc !35
  br label %41

; <label>:41                                      ; preds = %38, %copy_to_user.exit, %audit_sockaddr.exit, %12, %4
  %.0 = phi i32 [ %40, %38 ], [ %9, %4 ], [ -22, %12 ], [ -12, %audit_sockaddr.exit ], [ -14, %copy_to_user.exit ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare void @kfree(i8*) #2

; Function Attrs: noredzone
declare i64 @rw_copy_check_uvector(i32, %struct.iovec*, i64, i64, %struct.iovec*, %struct.iovec**) #2

; Function Attrs: noredzone
declare i32 @cmsghdr_from_user_compat_to_kern(%struct.msghdr*, %struct.sock*, i8*, i32) #2

; Function Attrs: noredzone
declare i8* @sock_kmalloc(%struct.sock*, i32, i32) #2

; Function Attrs: noredzone
declare i32 @memcmp(i8*, i8*, i64) #2

; Function Attrs: noredzone
declare void @sock_kfree_s(%struct.sock*, i8*, i32) #2

; Function Attrs: noredzone
declare i64 @__fdget(i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_shutdown(%struct.socket*, i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_getsockopt(%struct.socket*, i32, i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_setsockopt(%struct.socket*, i32, i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_getpeername(%struct.socket*) #2

; Function Attrs: noredzone
declare i32 @security_socket_getsockname(%struct.socket*) #2

; Function Attrs: noredzone
declare i32 @security_socket_connect(%struct.socket*, %struct.sockaddr*, i32) #2

; Function Attrs: noredzone
declare i32 @get_unused_fd_flags(i32) #2

; Function Attrs: noredzone
declare void @put_unused_fd(i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_accept(%struct.socket*, %struct.socket*) #2

; Function Attrs: noredzone
declare void @fd_install(i32, %struct.file*) #2

; Function Attrs: noredzone
declare i32 @security_socket_listen(%struct.socket*, i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_bind(%struct.socket*, %struct.sockaddr*, i32) #2

; Function Attrs: noredzone
declare void @__audit_fd_pair(i32, i32) #2

; Function Attrs: noredzone
declare %struct.inode* @new_inode_pseudo(%struct.super_block*) #2

; Function Attrs: noredzone
declare i32 @get_next_ino() #2

; Function Attrs: noredzone nounwind
define internal i64 @sockfs_getxattr(%struct.dentry* nocapture readonly %dentry, i8* %name, i8* %value, i64 %size) #0 {
  %1 = tail call i32 @strncmp(i8* %name, i8* getelementptr inbounds ([21 x i8]* @.str17, i64 0, i64 0), i64 20) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %15

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.dentry* %dentry, i64 0, i32 4, i32 1
  %5 = load i8** %4, align 8
  %6 = tail call i64 @strlen(i8* %5) #4
  %7 = icmp eq i8* %value, null
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %3
  %9 = add i64 %6, 1
  %10 = icmp ugt i64 %9, %size
  br i1 %10, label %15, label %11

; <label>:11                                      ; preds = %8
  %12 = tail call i8* @strncpy(i8* %value, i8* %5, i64 %9) #4
  br label %13

; <label>:13                                      ; preds = %11, %3
  %14 = shl i64 %6, 32
  %sext = add i64 %14, 4294967296
  %phitmp = ashr exact i64 %sext, 32
  br label %15

; <label>:15                                      ; preds = %13, %8, %0
  %error.0 = phi i64 [ -61, %0 ], [ -34, %8 ], [ %phitmp, %13 ]
  ret i64 %error.0
}

; Function Attrs: noredzone nounwind
define internal i64 @sockfs_listxattr(%struct.dentry* nocapture readonly %dentry, i8* %buffer, i64 %size) #0 {
  %1 = getelementptr inbounds %struct.dentry* %dentry, i64 0, i32 5
  %2 = load %struct.inode** %1, align 8
  %3 = tail call i32 @security_inode_listsecurity(%struct.inode* %2, i8* %buffer, i64 %size) #4
  %4 = sext i32 %3 to i64
  %5 = icmp slt i32 %3, 0
  br i1 %5, label %18, label %6

; <label>:6                                       ; preds = %0
  %7 = icmp eq i8* %buffer, null
  br i1 %7, label %.thread, label %9

.thread:                                          ; preds = %6
  %8 = add i64 %4, 21
  br label %18

; <label>:9                                       ; preds = %6
  %10 = icmp ugt i64 %4, %size
  br i1 %10, label %18, label %11

; <label>:11                                      ; preds = %9
  %12 = getelementptr i8* %buffer, i64 %4
  %13 = add i64 %4, 21
  %14 = icmp eq i8* %12, null
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %11
  %16 = icmp ugt i64 %13, %size
  br i1 %16, label %18, label %17

; <label>:17                                      ; preds = %15
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* getelementptr inbounds ([21 x i8]* @.str17, i64 0, i64 0), i64 21, i32 1, i1 false)
  br label %18

; <label>:18                                      ; preds = %17, %15, %11, %9, %.thread, %0
  %.0 = phi i64 [ %4, %0 ], [ -34, %9 ], [ -34, %15 ], [ %13, %11 ], [ %13, %17 ], [ %8, %.thread ]
  ret i64 %.0
}

; Function Attrs: noredzone
declare i32 @security_inode_listsecurity(%struct.inode*, i8*, i64) #2

; Function Attrs: noredzone
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: noredzone
declare i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: noredzone
declare i32 @security_socket_recvmsg(%struct.socket*, %struct.msghdr*, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: noredzone
declare { i64, i64 } @ns_to_timespec(i64) #2

; Function Attrs: noredzone
declare { i64, i64 } @ns_to_timeval(i64) #2

; Function Attrs: noredzone
declare i64 @ktime_get_with_offset(i32) #2

; Function Attrs: noredzone
declare i32 @security_socket_sendmsg(%struct.socket*, %struct.msghdr*, i32) #2

; Function Attrs: noredzone
declare i64 @no_llseek(%struct.file*, i64, i32) #2

; Function Attrs: noredzone nounwind
define internal i64 @sock_aio_read(%struct.kiocb* %iocb, %struct.iovec* %iov, i64 %nr_segs, i64 %pos) #0 {
  %siocb = alloca %struct.sock_iocb, align 8
  %1 = bitcast %struct.sock_iocb* %siocb to i8*
  call void @llvm.lifetime.start(i64 144, i8* %1) #1
  %2 = icmp eq i64 %pos, 0
  br i1 %2, label %3, label %63

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 7
  %5 = load i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %63, label %7

; <label>:7                                       ; preds = %3
  %8 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 1
  %9 = load %struct.kioctx** %8, align 8
  %10 = icmp eq %struct.kioctx* %9, null
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %7
  call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), i32 873, i64 12) #1, !srcloc !36
  br label %12

; <label>:12                                      ; preds = %12, %11
  br label %12

; <label>:13                                      ; preds = %7
  %14 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 8
  store %struct.kiocb* %iocb, %struct.kiocb** %14, align 8
  %15 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 3
  store i8* %1, i8** %15, align 8
  %16 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7
  %17 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 0
  %18 = load %struct.file** %17, align 8
  %19 = getelementptr inbounds %struct.file* %18, i64 0, i32 15
  %20 = load i8** %19, align 8
  %21 = bitcast i8* %20 to %struct.socket*
  %22 = icmp eq i64 %nr_segs, 0
  br i1 %22, label %._crit_edge.i, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %13
  %23 = phi i64 [ %28, %.lr.ph.i ], [ 0, %13 ]
  %i.02.i = phi i32 [ %27, %.lr.ph.i ], [ 0, %13 ]
  %size.01.i = phi i64 [ %26, %.lr.ph.i ], [ 0, %13 ]
  %24 = getelementptr inbounds %struct.iovec* %iov, i64 %23, i32 1
  %25 = load i64* %24, align 8
  %26 = add i64 %25, %size.01.i
  %27 = add i32 %i.02.i, 1
  %28 = sext i32 %27 to i64
  %29 = icmp ult i64 %28, %nr_segs
  br i1 %29, label %.lr.ph.i, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %13
  %size.0.lcssa.i = phi i64 [ 0, %13 ], [ %26, %.lr.ph.i ]
  %30 = getelementptr inbounds %struct.msghdr* %16, i64 0, i32 0
  store i8* null, i8** %30, align 8
  %31 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 1
  store i32 0, i32* %31, align 8
  %32 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 3
  store i8* null, i8** %32, align 8
  %33 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 4
  store i64 0, i64* %33, align 8
  %34 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 2
  call void @iov_iter_init(%struct.iov_iter* %34, i32 0, %struct.iovec* %iov, i64 %nr_segs, i64 %size.0.lcssa.i) #4
  %35 = getelementptr inbounds %struct.file* %18, i64 0, i32 6
  %36 = load i32* %35, align 4
  %37 = lshr i32 %36, 5
  %38 = and i32 %37, 64
  %39 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 5
  store i32 %38, i32* %39, align 8
  %40 = trunc i64 %size.0.lcssa.i to i32
  %41 = call i32 @security_socket_recvmsg(%struct.socket* %21, %struct.msghdr* %16, i32 %40, i32 %38) #4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %do_sock_read.exit

; <label>:43                                      ; preds = %._crit_edge.i
  %44 = load i8** %15, align 8
  %45 = getelementptr inbounds i8* %44, i64 24
  %46 = bitcast i8* %45 to %struct.socket**
  store %struct.socket* %21, %struct.socket** %46, align 8
  %47 = getelementptr inbounds i8* %44, i64 40
  %48 = bitcast i8* %47 to %struct.scm_cookie**
  store %struct.scm_cookie* null, %struct.scm_cookie** %48, align 8
  %49 = getelementptr inbounds i8* %44, i64 48
  %50 = bitcast i8* %49 to %struct.msghdr**
  store %struct.msghdr* %16, %struct.msghdr** %50, align 8
  %51 = getelementptr inbounds i8* %44, i64 20
  %52 = bitcast i8* %51 to i32*
  store i32 %40, i32* %52, align 4
  %53 = getelementptr inbounds i8* %44, i64 16
  %54 = bitcast i8* %53 to i32*
  store i32 %38, i32* %54, align 4
  %55 = getelementptr inbounds i8* %20, i64 40
  %56 = bitcast i8* %55 to %struct.proto_ops**
  %57 = load %struct.proto_ops** %56, align 8
  %58 = getelementptr inbounds %struct.proto_ops* %57, i64 0, i32 18
  %59 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64, i32)** %58, align 8
  %60 = call i32 %59(%struct.kiocb* %iocb, %struct.socket* %21, %struct.msghdr* %16, i64 %size.0.lcssa.i, i32 %38) #4
  br label %do_sock_read.exit

do_sock_read.exit:                                ; preds = %43, %._crit_edge.i
  %61 = phi i32 [ %60, %43 ], [ %41, %._crit_edge.i ]
  %62 = sext i32 %61 to i64
  br label %63

; <label>:63                                      ; preds = %do_sock_read.exit, %3, %0
  %.0 = phi i64 [ %62, %do_sock_read.exit ], [ -29, %0 ], [ 0, %3 ]
  call void @llvm.lifetime.end(i64 144, i8* %1) #1
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal i64 @sock_aio_write(%struct.kiocb* %iocb, %struct.iovec* %iov, i64 %nr_segs, i64 %pos) #0 {
  %siocb = alloca %struct.sock_iocb, align 8
  %1 = bitcast %struct.sock_iocb* %siocb to i8*
  call void @llvm.lifetime.start(i64 144, i8* %1) #1
  %2 = icmp eq i64 %pos, 0
  br i1 %2, label %3, label %64

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 1
  %5 = load %struct.kioctx** %4, align 8
  %6 = icmp eq %struct.kioctx* %5, null
  br i1 %6, label %9, label %7

; <label>:7                                       ; preds = %3
  call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0), i32 873, i64 12) #1, !srcloc !36
  br label %8

; <label>:8                                       ; preds = %8, %7
  br label %8

; <label>:9                                       ; preds = %3
  %10 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 8
  store %struct.kiocb* %iocb, %struct.kiocb** %10, align 8
  %11 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 3
  store i8* %1, i8** %11, align 8
  %12 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7
  %13 = getelementptr inbounds %struct.kiocb* %iocb, i64 0, i32 0
  %14 = load %struct.file** %13, align 8
  %15 = getelementptr inbounds %struct.file* %14, i64 0, i32 15
  %16 = load i8** %15, align 8
  %17 = bitcast i8* %16 to %struct.socket*
  %18 = icmp eq i64 %nr_segs, 0
  br i1 %18, label %._crit_edge.i, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %9
  %19 = phi i64 [ %24, %.lr.ph.i ], [ 0, %9 ]
  %i.02.i = phi i32 [ %23, %.lr.ph.i ], [ 0, %9 ]
  %size.01.i = phi i64 [ %22, %.lr.ph.i ], [ 0, %9 ]
  %20 = getelementptr inbounds %struct.iovec* %iov, i64 %19, i32 1
  %21 = load i64* %20, align 8
  %22 = add i64 %21, %size.01.i
  %23 = add i32 %i.02.i, 1
  %24 = sext i32 %23 to i64
  %25 = icmp ult i64 %24, %nr_segs
  br i1 %25, label %.lr.ph.i, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %9
  %size.0.lcssa.i = phi i64 [ 0, %9 ], [ %22, %.lr.ph.i ]
  %26 = getelementptr inbounds %struct.msghdr* %12, i64 0, i32 0
  store i8* null, i8** %26, align 8
  %27 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 1
  store i32 0, i32* %27, align 8
  %28 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 3
  store i8* null, i8** %28, align 8
  %29 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 4
  store i64 0, i64* %29, align 8
  %30 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 2
  call void @iov_iter_init(%struct.iov_iter* %30, i32 1, %struct.iovec* %iov, i64 %nr_segs, i64 %size.0.lcssa.i) #4
  %31 = getelementptr inbounds %struct.file* %14, i64 0, i32 6
  %32 = load i32* %31, align 4
  %33 = lshr i32 %32, 5
  %34 = and i32 %33, 64
  %35 = getelementptr inbounds %struct.sock_iocb* %siocb, i64 0, i32 7, i32 5
  store i32 %34, i32* %35, align 8
  %36 = getelementptr inbounds i8* %16, i64 4
  %37 = bitcast i8* %36 to i16*
  %38 = load i16* %37, align 2
  %39 = icmp eq i16 %38, 5
  br i1 %39, label %40, label %42

; <label>:40                                      ; preds = %._crit_edge.i
  %41 = or i32 %34, 128
  store i32 %41, i32* %35, align 8
  br label %42

; <label>:42                                      ; preds = %40, %._crit_edge.i
  %43 = trunc i64 %size.0.lcssa.i to i32
  %44 = call i32 @security_socket_sendmsg(%struct.socket* %17, %struct.msghdr* %12, i32 %43) #4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %do_sock_write.exit

; <label>:46                                      ; preds = %42
  %47 = load i8** %11, align 8
  %48 = getelementptr inbounds i8* %47, i64 24
  %49 = bitcast i8* %48 to %struct.socket**
  store %struct.socket* %17, %struct.socket** %49, align 8
  %50 = getelementptr inbounds i8* %47, i64 40
  %51 = bitcast i8* %50 to %struct.scm_cookie**
  store %struct.scm_cookie* null, %struct.scm_cookie** %51, align 8
  %52 = getelementptr inbounds i8* %47, i64 48
  %53 = bitcast i8* %52 to %struct.msghdr**
  store %struct.msghdr* %12, %struct.msghdr** %53, align 8
  %54 = getelementptr inbounds i8* %47, i64 20
  %55 = bitcast i8* %54 to i32*
  store i32 %43, i32* %55, align 4
  %56 = getelementptr inbounds i8* %16, i64 40
  %57 = bitcast i8* %56 to %struct.proto_ops**
  %58 = load %struct.proto_ops** %57, align 8
  %59 = getelementptr inbounds %struct.proto_ops* %58, i64 0, i32 17
  %60 = load i32 (%struct.kiocb*, %struct.socket*, %struct.msghdr*, i64)** %59, align 8
  %61 = call i32 %60(%struct.kiocb* %iocb, %struct.socket* %17, %struct.msghdr* %12, i64 %size.0.lcssa.i) #4
  br label %do_sock_write.exit

do_sock_write.exit:                               ; preds = %46, %42
  %62 = phi i32 [ %61, %46 ], [ %44, %42 ]
  %63 = sext i32 %62 to i64
  br label %64

; <label>:64                                      ; preds = %do_sock_write.exit, %0
  %.0 = phi i64 [ %63, %do_sock_write.exit ], [ -29, %0 ]
  call void @llvm.lifetime.end(i64 144, i8* %1) #1
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @sock_poll(%struct.file* %file, %struct.poll_table_struct* %wait) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 15
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.socket*
  %4 = getelementptr inbounds i8* %2, i64 32
  %5 = bitcast i8* %4 to %struct.sock**
  %6 = load %struct.sock** %5, align 8
  %7 = getelementptr inbounds %struct.sock* %6, i64 0, i32 9
  %8 = load i32* %7, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %sk_can_busy_loop.exit.thread, label %10

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.sock* %6, i64 0, i32 8
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %sk_can_busy_loop.exit.thread, label %14

; <label>:14                                      ; preds = %10
  %15 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %16 = add i64 %15, -16344
  %17 = inttoptr i64 %16 to %struct.thread_info*
  %18 = getelementptr inbounds %struct.thread_info* %17, i64 0, i32 2
  %19 = bitcast i32* %18 to i64*
  %20 = tail call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %19, i64 3) #1, !srcloc !5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %sk_can_busy_loop.exit, label %sk_can_busy_loop.exit.thread

sk_can_busy_loop.exit:                            ; preds = %14
  %22 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #1, !srcloc !2
  %23 = getelementptr inbounds %struct.task_struct* %22, i64 0, i32 1
  %24 = load i8** %23, align 8
  %25 = getelementptr inbounds i8* %24, i64 16
  %26 = bitcast i8* %25 to i64*
  %27 = tail call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %26, i64 2) #1, !srcloc !5
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %sk_can_busy_loop.exit.thread

; <label>:29                                      ; preds = %sk_can_busy_loop.exit
  %30 = icmp eq %struct.poll_table_struct* %wait, null
  br i1 %30, label %sk_can_busy_loop.exit.thread, label %31

; <label>:31                                      ; preds = %29
  %32 = getelementptr inbounds %struct.poll_table_struct* %wait, i64 0, i32 1
  %33 = load i64* %32, align 8
  %34 = and i64 %33, 32768
  %35 = icmp eq i64 %34, 0
  br i1 %35, label %sk_can_busy_loop.exit.thread, label %36

; <label>:36                                      ; preds = %31
  %37 = load %struct.sock** %5, align 8
  tail call void asm "addl $1, %gs:$0", "=*m,ri,*m,~{dirflag},~{fpsr},~{flags}"(i32* @__preempt_count, i32 512, i32* @__preempt_count) #1, !srcloc !37
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !38
  %38 = getelementptr inbounds %struct.sock* %37, i64 0, i32 8
  %39 = load i32* %38, align 4
  %40 = tail call %struct.napi_struct* @napi_by_id(i32 %39) #4
  %41 = icmp eq %struct.napi_struct* %40, null
  br i1 %41, label %sk_busy_loop.exit, label %42

; <label>:42                                      ; preds = %36
  %43 = getelementptr inbounds %struct.napi_struct* %40, i64 0, i32 7
  %44 = load %struct.net_device** %43, align 8
  %45 = getelementptr inbounds %struct.net_device* %44, i64 0, i32 26
  %46 = load %struct.net_device_ops** %45, align 8
  %47 = getelementptr inbounds %struct.net_device_ops* %46, i64 0, i32 22
  %48 = load i32 (%struct.napi_struct*)** %47, align 8
  %49 = icmp eq i32 (%struct.napi_struct*)* %48, null
  br i1 %49, label %sk_busy_loop.exit, label %50

; <label>:50                                      ; preds = %42
  %51 = tail call i32 %48(%struct.napi_struct* %40) #4
  %52 = icmp eq i32 %51, -1
  br i1 %52, label %sk_busy_loop.exit, label %53

; <label>:53                                      ; preds = %50
  %54 = icmp sgt i32 %51, 0
  br i1 %54, label %55, label %62

; <label>:55                                      ; preds = %53
  %56 = getelementptr inbounds %struct.sock* %37, i64 0, i32 0, i32 9
  %57 = load %struct.net** %56, align 8
  %58 = getelementptr inbounds %struct.net* %57, i64 0, i32 22, i32 2
  %59 = load %struct.linux_mib** %58, align 8
  %60 = getelementptr %struct.linux_mib* %59, i64 0, i32 0, i64 96
  %61 = sext i32 %51 to i64
  tail call void asm "addq $1, %gs:$0", "=*m,re,*m,~{dirflag},~{fpsr},~{flags}"(i64* %60, i64 %61, i64* %60) #1, !srcloc !39
  br label %62

; <label>:62                                      ; preds = %55, %53
  tail call void asm sideeffect "rep; nop", "~{memory},~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !40
  br label %sk_busy_loop.exit

sk_busy_loop.exit:                                ; preds = %62, %50, %42, %36
  tail call void @__local_bh_enable_ip(i64 1, i32 512) #4
  br label %sk_can_busy_loop.exit.thread

sk_can_busy_loop.exit.thread:                     ; preds = %sk_busy_loop.exit, %31, %29, %sk_can_busy_loop.exit, %14, %10, %0
  %busy_flag.0 = phi i32 [ 32768, %sk_busy_loop.exit ], [ 32768, %31 ], [ 32768, %29 ], [ 0, %sk_can_busy_loop.exit ], [ 0, %14 ], [ 0, %10 ], [ 0, %0 ]
  %63 = getelementptr inbounds i8* %2, i64 40
  %64 = bitcast i8* %63 to %struct.proto_ops**
  %65 = load %struct.proto_ops** %64, align 8
  %66 = getelementptr inbounds %struct.proto_ops* %65, i64 0, i32 8
  %67 = load i32 (%struct.file*, %struct.socket*, %struct.poll_table_struct*)** %66, align 8
  %68 = tail call i32 %67(%struct.file* %file, %struct.socket* %3, %struct.poll_table_struct* %wait) #4
  %69 = or i32 %68, %busy_flag.0
  ret i32 %69
}

; Function Attrs: noredzone nounwind
define internal i64 @sock_ioctl(%struct.file* nocapture readonly %file, i32 %cmd, i64 %arg) #0 {
  %1 = inttoptr i64 %arg to i8*
  %2 = getelementptr inbounds %struct.file* %file, i64 0, i32 15
  %3 = load i8** %2, align 8
  %4 = bitcast i8* %3 to %struct.socket*
  %5 = getelementptr inbounds i8* %3, i64 32
  %6 = bitcast i8* %5 to %struct.sock**
  %7 = load %struct.sock** %6, align 8
  %8 = getelementptr inbounds %struct.sock* %7, i64 0, i32 0, i32 9
  %9 = load %struct.net** %8, align 8
  %10 = and i32 %cmd, -16
  %11 = icmp eq i32 %10, 35312
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %0
  %13 = tail call i32 @dev_ioctl(%struct.net* %9, i32 %cmd, i8* %1) #4
  br label %sock_do_ioctl.exit

; <label>:14                                      ; preds = %0
  switch i32 %cmd, label %68 [
    i32 35073, label %15
    i32 35074, label %15
    i32 35075, label %28
    i32 35076, label %28
    i32 35136, label %35
    i32 35137, label %35
    i32 35232, label %35
    i32 35233, label %35
    i32 35202, label %46
    i32 35203, label %46
    i32 35200, label %57
    i32 35201, label %57
  ]

; <label>:15                                      ; preds = %14, %14
  %16 = inttoptr i64 %arg to i32*
  %17 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %16, i64 4) #1, !srcloc !41
  %18 = extractvalue { i32*, i64 } %17, 0
  %19 = ptrtoint i32* %18 to i64
  %20 = trunc i64 %19 to i32
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %sock_do_ioctl.exit

; <label>:22                                      ; preds = %15
  %23 = extractvalue { i32*, i64 } %17, 1
  %24 = getelementptr inbounds i8* %3, i64 24
  %25 = bitcast i8* %24 to %struct.file**
  %26 = load %struct.file** %25, align 8
  %sext = shl i64 %23, 32
  %27 = ashr exact i64 %sext, 32
  tail call void @f_setown(%struct.file* %26, i64 %27, i32 1) #4
  br label %sock_do_ioctl.exit

; <label>:28                                      ; preds = %14, %14
  %29 = getelementptr inbounds i8* %3, i64 24
  %30 = bitcast i8* %29 to %struct.file**
  %31 = load %struct.file** %30, align 8
  %32 = tail call i32 @f_getown(%struct.file* %31) #4
  %33 = inttoptr i64 %arg to i32*
  %34 = tail call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %32, i32* %33) #1, !srcloc !42
  br label %sock_do_ioctl.exit

; <label>:35                                      ; preds = %14, %14, %14, %14
  %36 = load i32 (%struct.net*, i32, i8*)** @br_ioctl_hook, align 8
  %37 = icmp eq i32 (%struct.net*, i32, i8*)* %36, null
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %35
  %39 = tail call i32 (i1, i8*, ...)* @__request_module(i1 zeroext true, i8* getelementptr inbounds ([7 x i8]* @.str18, i64 0, i64 0)) #4
  br label %40

; <label>:40                                      ; preds = %38, %35
  tail call void @mutex_lock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @br_ioctl_mutex to %struct.mutex*)) #4
  %41 = load i32 (%struct.net*, i32, i8*)** @br_ioctl_hook, align 8
  %42 = icmp eq i32 (%struct.net*, i32, i8*)* %41, null
  br i1 %42, label %45, label %43

; <label>:43                                      ; preds = %40
  %44 = tail call i32 %41(%struct.net* %9, i32 %cmd, i8* %1) #4
  br label %45

; <label>:45                                      ; preds = %43, %40
  %err.0 = phi i32 [ %44, %43 ], [ -65, %40 ]
  tail call void @mutex_unlock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @br_ioctl_mutex to %struct.mutex*)) #4
  br label %sock_do_ioctl.exit

; <label>:46                                      ; preds = %14, %14
  %47 = load i32 (%struct.net*, i8*)** @vlan_ioctl_hook, align 8
  %48 = icmp eq i32 (%struct.net*, i8*)* %47, null
  br i1 %48, label %49, label %51

; <label>:49                                      ; preds = %46
  %50 = tail call i32 (i1, i8*, ...)* @__request_module(i1 zeroext true, i8* getelementptr inbounds ([6 x i8]* @.str19, i64 0, i64 0)) #4
  br label %51

; <label>:51                                      ; preds = %49, %46
  tail call void @mutex_lock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @vlan_ioctl_mutex to %struct.mutex*)) #4
  %52 = load i32 (%struct.net*, i8*)** @vlan_ioctl_hook, align 8
  %53 = icmp eq i32 (%struct.net*, i8*)* %52, null
  br i1 %53, label %56, label %54

; <label>:54                                      ; preds = %51
  %55 = tail call i32 %52(%struct.net* %9, i8* %1) #4
  br label %56

; <label>:56                                      ; preds = %54, %51
  %err.1 = phi i32 [ %55, %54 ], [ -65, %51 ]
  tail call void @mutex_unlock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @vlan_ioctl_mutex to %struct.mutex*)) #4
  br label %sock_do_ioctl.exit

; <label>:57                                      ; preds = %14, %14
  %58 = load i32 (i32, i8*)** @dlci_ioctl_hook, align 8
  %59 = icmp eq i32 (i32, i8*)* %58, null
  br i1 %59, label %60, label %62

; <label>:60                                      ; preds = %57
  %61 = tail call i32 (i1, i8*, ...)* @__request_module(i1 zeroext true, i8* getelementptr inbounds ([5 x i8]* @.str20, i64 0, i64 0)) #4
  br label %62

; <label>:62                                      ; preds = %60, %57
  tail call void @mutex_lock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @dlci_ioctl_mutex to %struct.mutex*)) #4
  %63 = load i32 (i32, i8*)** @dlci_ioctl_hook, align 8
  %64 = icmp eq i32 (i32, i8*)* %63, null
  br i1 %64, label %67, label %65

; <label>:65                                      ; preds = %62
  %66 = tail call i32 %63(i32 %cmd, i8* %1) #4
  br label %67

; <label>:67                                      ; preds = %65, %62
  %err.2 = phi i32 [ %66, %65 ], [ -65, %62 ]
  tail call void @mutex_unlock(%struct.mutex* bitcast ({ %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue, [4 x i8] }* @dlci_ioctl_mutex to %struct.mutex*)) #4
  br label %sock_do_ioctl.exit

; <label>:68                                      ; preds = %14
  %69 = getelementptr inbounds i8* %3, i64 40
  %70 = bitcast i8* %69 to %struct.proto_ops**
  %71 = load %struct.proto_ops** %70, align 8
  %72 = getelementptr inbounds %struct.proto_ops* %71, i64 0, i32 9
  %73 = load i32 (%struct.socket*, i32, i64)** %72, align 8
  %74 = tail call i32 %73(%struct.socket* %4, i32 %cmd, i64 %arg) #4
  %75 = icmp eq i32 %74, -515
  br i1 %75, label %76, label %sock_do_ioctl.exit

; <label>:76                                      ; preds = %68
  %77 = tail call i32 @dev_ioctl(%struct.net* %9, i32 %cmd, i8* %1) #4
  br label %sock_do_ioctl.exit

sock_do_ioctl.exit:                               ; preds = %76, %68, %67, %56, %45, %28, %22, %15, %12
  %err.3 = phi i32 [ %13, %12 ], [ %err.2, %67 ], [ %err.1, %56 ], [ %err.0, %45 ], [ %34, %28 ], [ -14, %15 ], [ 0, %22 ], [ %77, %76 ], [ %74, %68 ]
  %78 = sext i32 %err.3 to i64
  ret i64 %78
}

; Function Attrs: noredzone nounwind
define internal i64 @compat_sock_ioctl(%struct.file* nocapture readonly %file, i32 %cmd, i64 %arg) #0 {
  %kts.i.i = alloca %struct.timespec, align 8
  %ktv.i.i = alloca %struct.timeval, align 8
  %r6.i.i = alloca %struct.in6_rtmsg, align 8
  %r4.i.i = alloca %struct.rtentry, align 8
  %devname.i.i = alloca [16 x i8], align 16
  %kifr.i.i = alloca %struct.ifreq, align 8
  %ifr.i.i = alloca %struct.ifreq, align 8
  %ifc32.i.i = alloca %struct.compat_ifconf, align 4
  %ifc.i.i = alloca %struct.ifconf, align 8
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 15
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.socket*
  %4 = getelementptr inbounds i8* %2, i64 40
  %5 = bitcast i8* %4 to %struct.proto_ops**
  %6 = load %struct.proto_ops** %5, align 8
  %7 = getelementptr inbounds %struct.proto_ops* %6, i64 0, i32 10
  %8 = load i32 (%struct.socket*, i32, i64)** %7, align 8
  %9 = icmp eq i32 (%struct.socket*, i32, i64)* %8, null
  br i1 %9, label %12, label %10

; <label>:10                                      ; preds = %0
  %11 = call i32 %8(%struct.socket* %3, i32 %cmd, i64 %arg) #4
  br label %12

; <label>:12                                      ; preds = %10, %0
  %ret.0 = phi i32 [ %11, %10 ], [ -515, %0 ]
  %13 = icmp eq i32 %ret.0, -515
  %14 = icmp ugt i32 %cmd, 35583
  %or.cond = and i1 %13, %14
  %15 = icmp ult i32 %cmd, 35840
  %or.cond3 = and i1 %or.cond, %15
  %.not = xor i1 %13, true
  %brmerge = or i1 %or.cond3, %.not
  %.mux = select i1 %or.cond3, i32 -22, i32 %ret.0
  br i1 %brmerge, label %compat_sock_ioctl_trans.exit, label %16

; <label>:16                                      ; preds = %12
  %17 = and i64 %arg, 4294967295
  %18 = inttoptr i64 %17 to i8*
  %19 = getelementptr inbounds i8* %2, i64 32
  %20 = bitcast i8* %19 to %struct.sock**
  %21 = load %struct.sock** %20, align 8
  %22 = getelementptr inbounds %struct.sock* %21, i64 0, i32 0, i32 9
  %23 = load %struct.net** %22, align 8
  %24 = and i32 %cmd, -16
  %25 = icmp eq i32 %24, 35312
  br i1 %25, label %26, label %29

; <label>:26                                      ; preds = %16
  %27 = inttoptr i64 %17 to %struct.compat_ifreq*
  %28 = call fastcc i32 @compat_ifr_data_ioctl(%struct.net* %23, i32 %cmd, %struct.compat_ifreq* %27) #4
  br label %compat_sock_ioctl_trans.exit

; <label>:29                                      ; preds = %16
  switch i32 %cmd, label %compat_sock_ioctl_trans.exit [
    i32 35137, label %30
    i32 35136, label %30
    i32 35088, label %41
    i32 35090, label %53
    i32 35142, label %140
    i32 35146, label %245
    i32 35184, label %271
    i32 35185, label %271
    i32 35216, label %369
    i32 35217, label %369
    i32 35218, label %369
    i32 35221, label %369
    i32 35083, label %390
    i32 35084, label %390
    i32 35078, label %557
    i32 35079, label %583
    i32 35219, label %609
    i32 35220, label %609
    i32 35248, label %609
    i32 35249, label %609
    i32 35073, label %612
    i32 35074, label %612
    i32 35075, label %612
    i32 35076, label %612
    i32 35232, label %612
    i32 35233, label %612
    i32 35202, label %612
    i32 35203, label %612
    i32 35200, label %612
    i32 35201, label %612
    i32 35091, label %615
    i32 35092, label %615
    i32 35101, label %615
    i32 35102, label %615
    i32 35105, label %615
    i32 35106, label %615
    i32 35103, label %615
    i32 35104, label %615
    i32 35111, label %615
    i32 35108, label %615
    i32 35121, label %615
    i32 35122, label %615
    i32 35123, label %615
    i32 35093, label %615
    i32 35094, label %615
    i32 35127, label %615
    i32 35126, label %615
    i32 35097, label %615
    i32 35098, label %615
    i32 35095, label %615
    i32 35096, label %615
    i32 35099, label %615
    i32 35100, label %615
    i32 35124, label %615
    i32 35125, label %615
    i32 35138, label %615
    i32 35139, label %615
    i32 35234, label %615
    i32 35235, label %615
    i32 35107, label %615
    i32 35143, label %615
    i32 35144, label %615
    i32 35145, label %615
    i32 35157, label %._crit_edge7
    i32 35156, label %._crit_edge7
    i32 35155, label %._crit_edge7
    i32 35077, label %._crit_edge7
  ]

; <label>:30                                      ; preds = %29, %29
  %31 = inttoptr i64 %17 to i32*
  %32 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %31, i64 4) #1, !srcloc !43
  %33 = extractvalue { i32*, i64 } %32, 0
  %34 = ptrtoint i32* %33 to i64
  %35 = trunc i64 %34 to i32
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %compat_sock_ioctl_trans.exit

; <label>:37                                      ; preds = %30
  %38 = extractvalue { i32*, i64 } %32, 1
  %39 = trunc i64 %38 to i32
  %40 = icmp eq i32 %39, 0
  %..i.i = select i1 %40, i32 2, i32 -22
  br label %compat_sock_ioctl_trans.exit

; <label>:41                                      ; preds = %29
  %42 = inttoptr i64 %17 to %struct.compat_ifreq*
  %43 = call i8* @compat_alloc_user_space(i64 40) #4
  %44 = getelementptr inbounds %struct.compat_ifreq* %42, i64 0, i32 0, i32 0, i64 0
  %45 = call i64 @copy_in_user(i8* %43, i8* %44, i32 32) #4
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %47, label %compat_sock_ioctl_trans.exit

; <label>:47                                      ; preds = %41
  %48 = call i32 @dev_ioctl(%struct.net* %23, i32 35088, i8* %43) #4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %compat_sock_ioctl_trans.exit

; <label>:50                                      ; preds = %47
  %51 = call i64 @copy_in_user(i8* %44, i8* %43, i32 32) #4
  %52 = icmp eq i64 %51, 0
  %..i2.i = select i1 %52, i32 0, i32 -14
  br label %compat_sock_ioctl_trans.exit

; <label>:53                                      ; preds = %29
  %54 = bitcast %struct.compat_ifconf* %ifc32.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %54) #1
  %55 = bitcast %struct.ifconf* %ifc.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %55) #1
  %56 = call i64 @_copy_from_user(i8* %54, i8* %18, i32 8) #4
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %58, label %compat_sock_ioctl_trans.exit

; <label>:58                                      ; preds = %53
  %59 = call i8* @memset(i8* %55, i32 0, i64 16) #4
  %60 = getelementptr inbounds %struct.compat_ifconf* %ifc32.i.i, i64 0, i32 1
  %61 = load i32* %60, align 4
  %62 = icmp eq i32 %61, 0
  %63 = getelementptr inbounds %struct.compat_ifconf* %ifc32.i.i, i64 0, i32 0
  br i1 %62, label %64, label %68

; <label>:64                                      ; preds = %58
  store i32 0, i32* %63, align 4
  %65 = getelementptr inbounds %struct.ifconf* %ifc.i.i, i64 0, i32 0
  store i32 0, i32* %65, align 8
  %66 = getelementptr inbounds %struct.ifconf* %ifc.i.i, i64 0, i32 1, i32 0
  store i8* null, i8** %66, align 8
  %67 = call i8* @compat_alloc_user_space(i64 16) #4
  br label %copy_to_user.exit.i.i

; <label>:68                                      ; preds = %58
  %69 = load i32* %63, align 4
  %70 = sext i32 %69 to i64
  %71 = lshr i64 %70, 5
  %72 = mul i64 %71, 40
  %73 = add i64 %72, 40
  %74 = add i64 %72, 56
  %75 = call i8* @compat_alloc_user_space(i64 %74) #4
  %76 = trunc i64 %73 to i32
  %77 = getelementptr inbounds %struct.ifconf* %ifc.i.i, i64 0, i32 0
  store i32 %76, i32* %77, align 8
  %78 = getelementptr i8* %75, i64 16
  %79 = getelementptr inbounds %struct.ifconf* %ifc.i.i, i64 0, i32 1, i32 0
  store i8* %78, i8** %79, align 8
  %80 = load i32* %63, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %copy_to_user.exit.i.i, label %.lr.ph24.i.i

.lr.ph24.i.i:                                     ; preds = %68
  %82 = load i32* %60, align 4
  %83 = zext i32 %82 to i64
  %84 = inttoptr i64 %83 to %struct.compat_ifreq*
  %85 = bitcast i8* %78 to %struct.ifreq*
  br label %86

; <label>:86                                      ; preds = %91, %.lr.ph24.i.i
  %i.022.i.i = phi i32 [ 0, %.lr.ph24.i.i ], [ %94, %91 ]
  %ifr.021.i.i = phi %struct.ifreq* [ %85, %.lr.ph24.i.i ], [ %92, %91 ]
  %ifr32.020.i.i = phi %struct.compat_ifreq* [ %84, %.lr.ph24.i.i ], [ %93, %91 ]
  %87 = getelementptr inbounds %struct.ifreq* %ifr.021.i.i, i64 0, i32 0, i32 0, i64 0
  %88 = getelementptr inbounds %struct.compat_ifreq* %ifr32.020.i.i, i64 0, i32 0, i32 0, i64 0
  %89 = call i64 @copy_in_user(i8* %87, i8* %88, i32 32) #4
  %90 = icmp eq i64 %89, 0
  br i1 %90, label %91, label %compat_sock_ioctl_trans.exit

; <label>:91                                      ; preds = %86
  %92 = getelementptr %struct.ifreq* %ifr.021.i.i, i64 1
  %93 = getelementptr %struct.compat_ifreq* %ifr32.020.i.i, i64 1
  %94 = add i32 %i.022.i.i, 32
  %95 = load i32* %63, align 4
  %96 = icmp ult i32 %94, %95
  br i1 %96, label %86, label %copy_to_user.exit.i.i

copy_to_user.exit.i.i:                            ; preds = %91, %68, %64
  %uifc.0.in.i.i = phi i8* [ %67, %64 ], [ %75, %68 ], [ %75, %91 ]
  %97 = call i64 @_copy_to_user(i8* %uifc.0.in.i.i, i8* %55, i32 16) #4
  %98 = icmp eq i64 %97, 0
  br i1 %98, label %99, label %compat_sock_ioctl_trans.exit

; <label>:99                                      ; preds = %copy_to_user.exit.i.i
  %100 = call i32 @dev_ioctl(%struct.net* %23, i32 35090, i8* %uifc.0.in.i.i) #4
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %copy_from_user.exit7.i.i, label %compat_sock_ioctl_trans.exit

copy_from_user.exit7.i.i:                         ; preds = %99
  %102 = call i64 @_copy_from_user(i8* %55, i8* %uifc.0.in.i.i, i32 16) #4
  %103 = icmp eq i64 %102, 0
  br i1 %103, label %104, label %compat_sock_ioctl_trans.exit

; <label>:104                                     ; preds = %copy_from_user.exit7.i.i
  %105 = load i32* %63, align 4
  %106 = icmp ult i32 %105, 32
  br i1 %106, label %split18.i.i, label %.lr.ph.i.i

.lr.ph.i.i:                                       ; preds = %104
  %107 = load i32* %60, align 4
  %108 = getelementptr inbounds %struct.ifconf* %ifc.i.i, i64 0, i32 1
  %109 = zext i32 %107 to i64
  %110 = bitcast %union.anon.109* %108 to %struct.ifreq**
  %111 = inttoptr i64 %109 to %struct.compat_ifreq*
  %112 = load %struct.ifreq** %110, align 8
  %113 = getelementptr inbounds %struct.ifconf* %ifc.i.i, i64 0, i32 0
  br label %114

; <label>:114                                     ; preds = %123, %.lr.ph.i.i
  %115 = phi i64 [ 32, %.lr.ph.i.i ], [ %129, %123 ]
  %j.017.i.i = phi i32 [ 0, %.lr.ph.i.i ], [ %127, %123 ]
  %i.116.i.i = phi i32 [ 0, %.lr.ph.i.i ], [ %126, %123 ]
  %ifr.115.i.i = phi %struct.ifreq* [ %112, %.lr.ph.i.i ], [ %125, %123 ]
  %ifr32.114.i.i = phi %struct.compat_ifreq* [ %111, %.lr.ph.i.i ], [ %124, %123 ]
  %116 = load i32* %113, align 8
  %117 = icmp ult i32 %j.017.i.i, %116
  br i1 %117, label %118, label %split18.i.i

; <label>:118                                     ; preds = %114
  %119 = getelementptr inbounds %struct.compat_ifreq* %ifr32.114.i.i, i64 0, i32 0, i32 0, i64 0
  %120 = getelementptr inbounds %struct.ifreq* %ifr.115.i.i, i64 0, i32 0, i32 0, i64 0
  %121 = call i64 @copy_in_user(i8* %119, i8* %120, i32 32) #4
  %122 = icmp eq i64 %121, 0
  br i1 %122, label %123, label %compat_sock_ioctl_trans.exit

; <label>:123                                     ; preds = %118
  %124 = getelementptr %struct.compat_ifreq* %ifr32.114.i.i, i64 1
  %125 = getelementptr %struct.ifreq* %ifr.115.i.i, i64 1
  %126 = trunc i64 %115 to i32
  %127 = add i32 %j.017.i.i, 40
  %128 = and i64 %115, 4294967295
  %129 = add i64 %128, 32
  %130 = load i32* %63, align 4
  %131 = sext i32 %130 to i64
  %132 = icmp ugt i64 %129, %131
  br i1 %132, label %split18.i.i, label %114

split18.i.i:                                      ; preds = %123, %114, %104
  %i.1.lcssa.i.i = phi i32 [ 0, %104 ], [ %126, %123 ], [ %i.116.i.i, %114 ]
  %133 = load i32* %60, align 4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %135, label %.critedge.i9.i.i

; <label>:135                                     ; preds = %split18.i.i
  %136 = getelementptr inbounds %struct.ifconf* %ifc.i.i, i64 0, i32 0
  %137 = load i32* %136, align 8
  %div.i.i = udiv i32 %137, 40
  %138 = shl nuw i32 %div.i.i, 5
  br label %.critedge.i9.i.i

.critedge.i9.i.i:                                 ; preds = %135, %split18.i.i
  %storemerge.i.i = phi i32 [ %138, %135 ], [ %i.1.lcssa.i.i, %split18.i.i ]
  store i32 %storemerge.i.i, i32* %63, align 4
  %139 = call i64 @_copy_to_user(i8* %18, i8* %54, i32 8) #4
  %phitmp.i.i = icmp eq i64 %139, 0
  %phitmp12.i.i = select i1 %phitmp.i.i, i32 0, i32 -14
  br label %compat_sock_ioctl_trans.exit

; <label>:140                                     ; preds = %29
  %141 = inttoptr i64 %17 to %struct.compat_ifreq*
  %142 = getelementptr inbounds %struct.compat_ifreq* %141, i64 0, i32 1, i32 0, i32 0
  %143 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %142, i64 4) #1, !srcloc !44
  %144 = extractvalue { i32*, i64 } %143, 0
  %145 = ptrtoint i32* %144 to i64
  %146 = trunc i64 %145 to i32
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %148, label %compat_sock_ioctl_trans.exit

; <label>:148                                     ; preds = %140
  %149 = extractvalue { i32*, i64 } %143, 1
  %150 = and i64 %149, 4294967295
  %151 = inttoptr i64 %150 to i8*
  %152 = inttoptr i64 %150 to i32*
  %153 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %152, i64 4) #1, !srcloc !45
  %154 = extractvalue { i32*, i64 } %153, 0
  %155 = extractvalue { i32*, i64 } %153, 1
  %156 = ptrtoint i32* %154 to i64
  %157 = trunc i64 %156 to i32
  %158 = trunc i64 %155 to i32
  %159 = icmp eq i32 %157, 0
  br i1 %159, label %160, label %compat_sock_ioctl_trans.exit

; <label>:160                                     ; preds = %148
  switch i32 %158, label %180 [
    i32 48, label %161
    i32 45, label %177
    i32 46, label %177
    i32 47, label %177
    i32 50, label %177
    i32 49, label %178
  ]

; <label>:161                                     ; preds = %160
  %162 = getelementptr inbounds i8* %151, i64 176
  %163 = bitcast i8* %162 to i32*
  %164 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %163, i64 4) #1, !srcloc !46
  %165 = extractvalue { i32*, i64 } %164, 0
  %166 = extractvalue { i32*, i64 } %164, 1
  %167 = ptrtoint i32* %165 to i64
  %168 = trunc i64 %167 to i32
  %169 = trunc i64 %166 to i32
  %170 = icmp eq i32 %168, 0
  br i1 %170, label %171, label %compat_sock_ioctl_trans.exit

; <label>:171                                     ; preds = %161
  %172 = and i64 %166, 4294967295
  %173 = icmp ugt i64 %172, 2097152
  br i1 %173, label %compat_sock_ioctl_trans.exit, label %174

; <label>:174                                     ; preds = %171
  %175 = shl nuw nsw i64 %172, 2
  %176 = add i64 %175, 40
  br label %177

; <label>:177                                     ; preds = %174, %160, %160, %160, %160
  %rule_cnt.0.i.i = phi i32 [ 0, %160 ], [ 0, %160 ], [ 0, %160 ], [ 0, %160 ], [ %169, %174 ]
  %buf_size.0.i.i = phi i64 [ 40, %160 ], [ 40, %160 ], [ 40, %160 ], [ 40, %160 ], [ %176, %174 ]
  br label %178

; <label>:178                                     ; preds = %177, %160
  %rule_cnt.1.i.i = phi i32 [ 0, %160 ], [ %rule_cnt.0.i.i, %177 ]
  %buf_size.1.i.i = phi i64 [ 40, %160 ], [ %buf_size.0.i.i, %177 ]
  %convert_out.0.i.i = phi i8 [ 0, %160 ], [ 1, %177 ]
  %179 = add i64 %buf_size.1.i.i, 192
  br label %180

; <label>:180                                     ; preds = %178, %160
  %rule_cnt.2.i.i = phi i32 [ 0, %160 ], [ %rule_cnt.1.i.i, %178 ]
  %buf_size.2.i.i = phi i64 [ 40, %160 ], [ %179, %178 ]
  %convert_out.1.i.i = phi i8 [ 0, %160 ], [ %convert_out.0.i.i, %178 ]
  %convert_in.0.i.i = phi i1 [ false, %160 ], [ true, %178 ]
  %181 = call i8* @compat_alloc_user_space(i64 %buf_size.2.i.i) #4
  %182 = getelementptr i8* %181, i64 40
  %183 = getelementptr inbounds %struct.compat_ifreq* %141, i64 0, i32 0, i32 0, i64 0
  %184 = call i64 @copy_in_user(i8* %181, i8* %183, i32 16) #4
  %185 = icmp eq i64 %184, 0
  br i1 %185, label %186, label %compat_sock_ioctl_trans.exit

; <label>:186                                     ; preds = %180
  %..i5.i = select i1 %convert_in.0.i.i, i8* %182, i8* %151
  %187 = getelementptr inbounds i8* %181, i64 16
  %188 = bitcast i8* %187 to i8**
  %189 = call i8* asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i8* %..i5.i, i8** %188) #1, !srcloc !47
  %190 = ptrtoint i8* %189 to i64
  %191 = trunc i64 %190 to i32
  %192 = icmp eq i32 %191, 0
  br i1 %192, label %193, label %compat_sock_ioctl_trans.exit

; <label>:193                                     ; preds = %186
  br i1 %convert_in.0.i.i, label %194, label %207

; <label>:194                                     ; preds = %193
  %195 = call i64 @copy_in_user(i8* %182, i8* %151, i32 164) #4
  %196 = icmp eq i64 %195, 0
  br i1 %196, label %197, label %compat_sock_ioctl_trans.exit

; <label>:197                                     ; preds = %194
  %198 = getelementptr inbounds i8* %181, i64 208
  %199 = getelementptr inbounds i8* %151, i64 164
  %200 = call i64 @copy_in_user(i8* %198, i8* %199, i32 12) #4
  %201 = icmp eq i64 %200, 0
  br i1 %201, label %202, label %compat_sock_ioctl_trans.exit

; <label>:202                                     ; preds = %197
  %203 = getelementptr inbounds i8* %181, i64 224
  %204 = getelementptr inbounds i8* %151, i64 176
  %205 = call i64 @copy_in_user(i8* %203, i8* %204, i32 4) #4
  %206 = icmp eq i64 %205, 0
  br i1 %206, label %207, label %compat_sock_ioctl_trans.exit

; <label>:207                                     ; preds = %202, %193
  %208 = call i32 @dev_ioctl(%struct.net* %23, i32 35142, i8* %181) #4
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %210, label %compat_sock_ioctl_trans.exit

; <label>:210                                     ; preds = %207
  %211 = and i8 %convert_out.1.i.i, 1
  %212 = icmp eq i8 %211, 0
  br i1 %212, label %244, label %213

; <label>:213                                     ; preds = %210
  %214 = call i64 @copy_in_user(i8* %151, i8* %182, i32 164) #4
  %215 = icmp eq i64 %214, 0
  br i1 %215, label %216, label %compat_sock_ioctl_trans.exit

; <label>:216                                     ; preds = %213
  %217 = getelementptr inbounds i8* %151, i64 164
  %218 = getelementptr inbounds i8* %181, i64 208
  %219 = call i64 @copy_in_user(i8* %217, i8* %218, i32 12) #4
  %220 = icmp eq i64 %219, 0
  br i1 %220, label %221, label %compat_sock_ioctl_trans.exit

; <label>:221                                     ; preds = %216
  %222 = getelementptr inbounds i8* %151, i64 176
  %223 = getelementptr inbounds i8* %181, i64 224
  %224 = bitcast i8* %223 to i32*
  %225 = call i64 @copy_in_user(i8* %222, i8* %223, i32 4) #4
  %226 = icmp eq i64 %225, 0
  br i1 %226, label %227, label %compat_sock_ioctl_trans.exit

; <label>:227                                     ; preds = %221
  %228 = icmp eq i32 %158, 48
  br i1 %228, label %229, label %244

; <label>:229                                     ; preds = %227
  %230 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %224, i64 4) #1, !srcloc !48
  %231 = extractvalue { i32*, i64 } %230, 0
  %232 = extractvalue { i32*, i64 } %230, 1
  %233 = ptrtoint i32* %231 to i64
  %234 = trunc i64 %233 to i32
  %235 = trunc i64 %232 to i32
  %236 = icmp eq i32 %234, 0
  br i1 %236, label %237, label %compat_sock_ioctl_trans.exit

; <label>:237                                     ; preds = %229
  %238 = icmp ult i32 %235, %rule_cnt.2.i.i
  %.rule_cnt.2.i.i = select i1 %238, i32 %235, i32 %rule_cnt.2.i.i
  %239 = getelementptr inbounds i8* %151, i64 180
  %240 = getelementptr inbounds i8* %181, i64 228
  %241 = shl i32 %.rule_cnt.2.i.i, 2
  %242 = call i64 @copy_in_user(i8* %239, i8* %240, i32 %241) #4
  %243 = icmp eq i64 %242, 0
  br i1 %243, label %244, label %compat_sock_ioctl_trans.exit

; <label>:244                                     ; preds = %237, %227, %210
  br label %compat_sock_ioctl_trans.exit

; <label>:245                                     ; preds = %29
  %246 = inttoptr i64 %17 to %struct.compat_ifreq*
  %247 = call i8* @compat_alloc_user_space(i64 40) #4
  %248 = getelementptr inbounds %struct.compat_ifreq* %246, i64 0, i32 0, i32 0, i64 0
  %249 = call i64 @copy_in_user(i8* %247, i8* %248, i32 32) #4
  %250 = icmp eq i64 %249, 0
  br i1 %250, label %251, label %compat_sock_ioctl_trans.exit

; <label>:251                                     ; preds = %245
  %252 = getelementptr inbounds %struct.compat_ifreq* %246, i64 0, i32 1, i32 0, i32 2
  %253 = bitcast i16* %252 to i32*
  %254 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %253, i64 4) #1, !srcloc !49
  %255 = extractvalue { i32*, i64 } %254, 0
  %256 = ptrtoint i32* %255 to i64
  %257 = trunc i64 %256 to i32
  %258 = icmp eq i32 %257, 0
  br i1 %258, label %259, label %compat_sock_ioctl_trans.exit

; <label>:259                                     ; preds = %251
  %260 = extractvalue { i32*, i64 } %254, 1
  %261 = and i64 %260, 4294967295
  %262 = inttoptr i64 %261 to %struct.raw_hdlc_proto*
  %263 = getelementptr inbounds i8* %247, i64 24
  %264 = bitcast i8* %263 to %struct.raw_hdlc_proto**
  %265 = call %struct.raw_hdlc_proto* asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(%struct.raw_hdlc_proto* %262, %struct.raw_hdlc_proto** %264) #1, !srcloc !50
  %266 = ptrtoint %struct.raw_hdlc_proto* %265 to i64
  %267 = trunc i64 %266 to i32
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %269, label %compat_sock_ioctl_trans.exit

; <label>:269                                     ; preds = %259
  %270 = call i32 @dev_ioctl(%struct.net* %23, i32 35146, i8* %247) #4
  br label %compat_sock_ioctl_trans.exit

; <label>:271                                     ; preds = %29, %29
  %272 = inttoptr i64 %17 to %struct.compat_ifreq*
  %273 = getelementptr inbounds %struct.ifreq* %ifr.i.i, i64 0, i32 0, i32 0, i64 0
  call void @llvm.lifetime.start(i64 40, i8* %273) #1
  %274 = getelementptr inbounds %struct.compat_ifreq* %272, i64 0, i32 0, i32 0, i64 0
  %275 = call i64 @_copy_from_user(i8* %273, i8* %274, i32 16) #4
  %276 = getelementptr inbounds %struct.compat_ifreq* %272, i64 0, i32 1, i32 0, i32 0
  %277 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %276, i64 4) #1, !srcloc !51
  %278 = extractvalue { i32*, i64 } %277, 0
  %279 = extractvalue { i32*, i64 } %277, 1
  %280 = ptrtoint i32* %278 to i64
  %281 = and i64 %279, 4294967295
  %282 = getelementptr inbounds %struct.ifreq* %ifr.i.i, i64 0, i32 1, i32 0, i32 0
  store i64 %281, i64* %282, align 8
  %283 = or i64 %280, %275
  %284 = getelementptr inbounds %struct.compat_ifreq* %272, i64 0, i32 1, i32 0, i32 1
  %285 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %284, i64 4) #1, !srcloc !52
  %286 = extractvalue { i32*, i64 } %285, 0
  %287 = extractvalue { i32*, i64 } %285, 1
  %288 = ptrtoint i32* %286 to i64
  %289 = and i64 %287, 4294967295
  %290 = getelementptr inbounds %struct.ifreq* %ifr.i.i, i64 0, i32 1, i32 0, i32 1
  store i64 %289, i64* %290, align 8
  %291 = or i64 %283, %288
  %292 = getelementptr inbounds %struct.compat_ifreq* %272, i64 0, i32 1, i32 0, i32 2
  %293 = call { i16*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i16* %292, i64 2) #1, !srcloc !53
  %294 = extractvalue { i16*, i64 } %293, 0
  %295 = extractvalue { i16*, i64 } %293, 1
  %296 = ptrtoint i16* %294 to i64
  %297 = trunc i64 %295 to i16
  %298 = getelementptr inbounds %struct.ifreq* %ifr.i.i, i64 0, i32 1, i32 0, i32 2
  store i16 %297, i16* %298, align 8
  %299 = or i64 %291, %296
  %300 = getelementptr inbounds %struct.compat_ifreq* %272, i64 0, i32 1, i32 0, i32 3
  %301 = call { i8*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i8* %300, i64 1) #1, !srcloc !54
  %302 = extractvalue { i8*, i64 } %301, 0
  %303 = extractvalue { i8*, i64 } %301, 1
  %304 = ptrtoint i8* %302 to i64
  %305 = trunc i64 %303 to i8
  %306 = getelementptr inbounds %struct.ifreq* %ifr.i.i, i64 0, i32 1, i32 0, i32 3
  store i8 %305, i8* %306, align 2
  %307 = or i64 %299, %304
  %308 = getelementptr inbounds %struct.compat_ifreq* %272, i64 0, i32 1, i32 0, i32 4
  %309 = call { i8*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i8* %308, i64 1) #1, !srcloc !55
  %310 = extractvalue { i8*, i64 } %309, 0
  %311 = extractvalue { i8*, i64 } %309, 1
  %312 = ptrtoint i8* %310 to i64
  %313 = trunc i64 %311 to i8
  %314 = getelementptr inbounds %struct.ifreq* %ifr.i.i, i64 0, i32 1, i32 0, i32 4
  store i8 %313, i8* %314, align 1
  %315 = or i64 %307, %312
  %316 = getelementptr inbounds %struct.compat_ifreq* %272, i64 0, i32 1, i32 0, i32 5
  %317 = call { i8*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i8* %316, i64 1) #1, !srcloc !56
  %318 = extractvalue { i8*, i64 } %317, 0
  %319 = extractvalue { i8*, i64 } %317, 1
  %320 = ptrtoint i8* %318 to i64
  %321 = trunc i64 %319 to i8
  %322 = getelementptr inbounds %struct.ifreq* %ifr.i.i, i64 0, i32 1, i32 0, i32 5
  store i8 %321, i8* %322, align 4
  %323 = or i64 %315, %320
  %324 = trunc i64 %323 to i32
  %325 = icmp eq i32 %324, 0
  br i1 %325, label %326, label %compat_sock_ioctl_trans.exit

; <label>:326                                     ; preds = %271
  %327 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %328 = add i64 %327, -16344
  %329 = inttoptr i64 %328 to %struct.thread_info*
  %330 = getelementptr inbounds %struct.thread_info* %329, i64 0, i32 6, i32 0
  %331 = load i64* %330, align 8
  %332 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %333 = add i64 %332, -16344
  %334 = inttoptr i64 %333 to %struct.thread_info*
  %335 = getelementptr inbounds %struct.thread_info* %334, i64 0, i32 6, i32 0
  store i64 -1, i64* %335, align 8
  %336 = call i32 @dev_ioctl(%struct.net* %23, i32 %cmd, i8* %273) #4
  %337 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %338 = add i64 %337, -16344
  %339 = inttoptr i64 %338 to %struct.thread_info*
  %340 = getelementptr inbounds %struct.thread_info* %339, i64 0, i32 6, i32 0
  store i64 %331, i64* %340, align 8
  %341 = icmp ne i32 %cmd, 35184
  %342 = icmp ne i32 %336, 0
  %or.cond.i.i = or i1 %341, %342
  br i1 %or.cond.i.i, label %compat_sock_ioctl_trans.exit, label %.critedge.i23.i.i

.critedge.i23.i.i:                                ; preds = %326
  %343 = call i64 @_copy_to_user(i8* %274, i8* %273, i32 16) #4
  %phitmp.i8.i = trunc i64 %343 to i32
  %344 = load i64* %282, align 8
  %345 = trunc i64 %344 to i32
  %346 = call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %345, i32* %276) #1, !srcloc !57
  %347 = or i32 %346, %phitmp.i8.i
  %348 = load i64* %290, align 8
  %349 = trunc i64 %348 to i32
  %350 = call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %349, i32* %284) #1, !srcloc !58
  %351 = or i32 %347, %350
  %352 = load i16* %298, align 8
  %353 = zext i16 %352 to i32
  %354 = call i32 asm sideeffect "call __put_user_2", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %353, i16* %292) #1, !srcloc !59
  %355 = or i32 %351, %354
  %356 = load i8* %306, align 2
  %357 = zext i8 %356 to i32
  %358 = call i32 asm sideeffect "call __put_user_1", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %357, i8* %300) #1, !srcloc !60
  %359 = or i32 %355, %358
  %360 = load i8* %314, align 1
  %361 = zext i8 %360 to i32
  %362 = call i32 asm sideeffect "call __put_user_1", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %361, i8* %308) #1, !srcloc !61
  %363 = or i32 %359, %362
  %364 = load i8* %322, align 4
  %365 = zext i8 %364 to i32
  %366 = call i32 asm sideeffect "call __put_user_1", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %365, i8* %316) #1, !srcloc !62
  %367 = or i32 %363, %366
  %368 = icmp ne i32 %367, 0
  %..i9.i = select i1 %368, i32 -14, i32 0
  br label %compat_sock_ioctl_trans.exit

; <label>:369                                     ; preds = %29, %29, %29, %29
  %370 = inttoptr i64 %17 to %struct.compat_ifreq*
  %371 = getelementptr inbounds %struct.ifreq* %kifr.i.i, i64 0, i32 0, i32 0, i64 0
  call void @llvm.lifetime.start(i64 40, i8* %371) #1
  switch i32 %cmd, label %compat_sock_ioctl_trans.exit [
    i32 35216, label %copy_from_user.exit.i.i
    i32 35217, label %copy_from_user.exit.i.i
    i32 35218, label %copy_from_user.exit.i.i
    i32 35221, label %copy_from_user.exit.i.i
  ]

copy_from_user.exit.i.i:                          ; preds = %369, %369, %369, %369
  %372 = getelementptr inbounds %struct.compat_ifreq* %370, i64 0, i32 0, i32 0, i64 0
  %373 = call i64 @_copy_from_user(i8* %371, i8* %372, i32 32) #4
  %374 = icmp eq i64 %373, 0
  br i1 %374, label %375, label %compat_sock_ioctl_trans.exit

; <label>:375                                     ; preds = %copy_from_user.exit.i.i
  %376 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %377 = add i64 %376, -16344
  %378 = inttoptr i64 %377 to %struct.thread_info*
  %379 = getelementptr inbounds %struct.thread_info* %378, i64 0, i32 6, i32 0
  %380 = load i64* %379, align 8
  %381 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %382 = add i64 %381, -16344
  %383 = inttoptr i64 %382 to %struct.thread_info*
  %384 = getelementptr inbounds %struct.thread_info* %383, i64 0, i32 6, i32 0
  store i64 -1, i64* %384, align 8
  %385 = call i32 @dev_ioctl(%struct.net* %23, i32 %cmd, i8* %371) #4
  %386 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %387 = add i64 %386, -16344
  %388 = inttoptr i64 %387 to %struct.thread_info*
  %389 = getelementptr inbounds %struct.thread_info* %388, i64 0, i32 6, i32 0
  store i64 %380, i64* %389, align 8
  br label %compat_sock_ioctl_trans.exit

; <label>:390                                     ; preds = %29, %29
  %391 = getelementptr inbounds [16 x i8]* %devname.i.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 16, i8* %391) #1
  %392 = bitcast %struct.in6_rtmsg* %r6.i.i to i8*
  call void @llvm.lifetime.start(i64 80, i8* %392) #1
  %393 = bitcast %struct.rtentry* %r4.i.i to i8*
  call void @llvm.lifetime.start(i64 120, i8* %393) #1
  %394 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %395 = add i64 %394, -16344
  %396 = inttoptr i64 %395 to %struct.thread_info*
  %397 = getelementptr inbounds %struct.thread_info* %396, i64 0, i32 6, i32 0
  %398 = load i64* %397, align 8
  %399 = icmp eq i8* %2, null
  br i1 %399, label %.critedge.i30.i.i, label %400

; <label>:400                                     ; preds = %390
  %401 = load %struct.sock** %20, align 8
  %402 = icmp eq %struct.sock* %401, null
  br i1 %402, label %.critedge.i30.i.i, label %403

; <label>:403                                     ; preds = %400
  %404 = getelementptr inbounds %struct.sock* %401, i64 0, i32 0, i32 3
  %405 = load i16* %404, align 2
  %406 = icmp eq i16 %405, 10
  br i1 %406, label %.critedge.i.i.i, label %.critedge.i30.i.i

.critedge.i.i.i:                                  ; preds = %403
  %407 = call i64 @_copy_from_user(i8* %392, i8* %18, i32 48) #4
  %408 = getelementptr inbounds i8* %18, i64 48
  %409 = bitcast i8* %408 to i32*
  %410 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %409, i64 4) #1, !srcloc !63
  %411 = extractvalue { i32*, i64 } %410, 0
  %412 = extractvalue { i32*, i64 } %410, 1
  %413 = ptrtoint i32* %411 to i64
  %414 = trunc i64 %412 to i32
  %415 = getelementptr inbounds %struct.in6_rtmsg* %r6.i.i, i64 0, i32 3
  store i32 %414, i32* %415, align 8
  %416 = or i64 %413, %407
  %417 = getelementptr inbounds i8* %18, i64 52
  %418 = bitcast i8* %417 to i16*
  %419 = call { i16*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i16* %418, i64 2) #1, !srcloc !64
  %420 = extractvalue { i16*, i64 } %419, 0
  %421 = extractvalue { i16*, i64 } %419, 1
  %422 = ptrtoint i16* %420 to i64
  %423 = trunc i64 %421 to i16
  %424 = getelementptr inbounds %struct.in6_rtmsg* %r6.i.i, i64 0, i32 4
  store i16 %423, i16* %424, align 4
  %425 = or i64 %416, %422
  %426 = getelementptr inbounds i8* %18, i64 54
  %427 = bitcast i8* %426 to i16*
  %428 = call { i16*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i16* %427, i64 2) #1, !srcloc !65
  %429 = extractvalue { i16*, i64 } %428, 0
  %430 = extractvalue { i16*, i64 } %428, 1
  %431 = ptrtoint i16* %429 to i64
  %432 = trunc i64 %430 to i16
  %433 = getelementptr inbounds %struct.in6_rtmsg* %r6.i.i, i64 0, i32 5
  store i16 %432, i16* %433, align 2
  %434 = or i64 %425, %431
  %435 = getelementptr inbounds i8* %18, i64 56
  %436 = bitcast i8* %435 to i32*
  %437 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %436, i64 4) #1, !srcloc !66
  %438 = extractvalue { i32*, i64 } %437, 0
  %439 = extractvalue { i32*, i64 } %437, 1
  %440 = ptrtoint i32* %438 to i64
  %441 = trunc i64 %439 to i32
  %442 = getelementptr inbounds %struct.in6_rtmsg* %r6.i.i, i64 0, i32 6
  store i32 %441, i32* %442, align 8
  %443 = or i64 %434, %440
  %444 = getelementptr inbounds i8* %18, i64 60
  %445 = bitcast i8* %444 to i32*
  %446 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %445, i64 4) #1, !srcloc !67
  %447 = extractvalue { i32*, i64 } %446, 0
  %448 = extractvalue { i32*, i64 } %446, 1
  %449 = ptrtoint i32* %447 to i64
  %450 = and i64 %448, 4294967295
  %451 = getelementptr inbounds %struct.in6_rtmsg* %r6.i.i, i64 0, i32 7
  store i64 %450, i64* %451, align 8
  %452 = or i64 %443, %449
  %453 = getelementptr inbounds i8* %18, i64 64
  %454 = bitcast i8* %453 to i32*
  %455 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %454, i64 4) #1, !srcloc !68
  %456 = extractvalue { i32*, i64 } %455, 0
  %457 = extractvalue { i32*, i64 } %455, 1
  %458 = ptrtoint i32* %456 to i64
  %459 = trunc i64 %457 to i32
  %460 = getelementptr inbounds %struct.in6_rtmsg* %r6.i.i, i64 0, i32 8
  store i32 %459, i32* %460, align 8
  %461 = or i64 %452, %458
  %462 = getelementptr inbounds i8* %18, i64 68
  %463 = bitcast i8* %462 to i32*
  %464 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %463, i64 4) #1, !srcloc !69
  %465 = extractvalue { i32*, i64 } %464, 0
  %466 = extractvalue { i32*, i64 } %464, 1
  %467 = ptrtoint i32* %465 to i64
  %468 = trunc i64 %466 to i32
  %469 = getelementptr inbounds %struct.in6_rtmsg* %r6.i.i, i64 0, i32 9
  store i32 %468, i32* %469, align 4
  %470 = or i64 %461, %467
  br label %538

.critedge.i30.i.i:                                ; preds = %403, %400, %390
  %471 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 1
  %472 = bitcast %struct.sockaddr* %471 to i8*
  %473 = getelementptr inbounds i8* %18, i64 4
  %474 = call i64 @_copy_from_user(i8* %472, i8* %473, i32 48) #4
  %475 = getelementptr inbounds i8* %18, i64 52
  %476 = bitcast i8* %475 to i16*
  %477 = call { i16*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i16* %476, i64 2) #1, !srcloc !70
  %478 = extractvalue { i16*, i64 } %477, 0
  %479 = extractvalue { i16*, i64 } %477, 1
  %480 = ptrtoint i16* %478 to i64
  %481 = trunc i64 %479 to i16
  %482 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 4
  store i16 %481, i16* %482, align 8
  %483 = or i64 %480, %474
  %484 = getelementptr inbounds i8* %18, i64 64
  %485 = bitcast i8* %484 to i16*
  %486 = call { i16*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i16* %485, i64 2) #1, !srcloc !71
  %487 = extractvalue { i16*, i64 } %486, 0
  %488 = extractvalue { i16*, i64 } %486, 1
  %489 = ptrtoint i16* %487 to i64
  %490 = trunc i64 %488 to i16
  %491 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 8
  store i16 %490, i16* %491, align 8
  %492 = or i64 %483, %489
  %493 = getelementptr inbounds i8* %18, i64 72
  %494 = bitcast i8* %493 to i32*
  %495 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %494, i64 4) #1, !srcloc !72
  %496 = extractvalue { i32*, i64 } %495, 0
  %497 = extractvalue { i32*, i64 } %495, 1
  %498 = ptrtoint i32* %496 to i64
  %499 = and i64 %497, 4294967295
  %500 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 10
  store i64 %499, i64* %500, align 8
  %501 = or i64 %492, %498
  %502 = getelementptr inbounds i8* %18, i64 76
  %503 = bitcast i8* %502 to i32*
  %504 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %503, i64 4) #1, !srcloc !73
  %505 = extractvalue { i32*, i64 } %504, 0
  %506 = extractvalue { i32*, i64 } %504, 1
  %507 = ptrtoint i32* %505 to i64
  %508 = and i64 %506, 4294967295
  %509 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 11
  store i64 %508, i64* %509, align 8
  %510 = or i64 %501, %507
  %511 = getelementptr inbounds i8* %18, i64 80
  %512 = bitcast i8* %511 to i16*
  %513 = call { i16*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i16* %512, i64 2) #1, !srcloc !74
  %514 = extractvalue { i16*, i64 } %513, 0
  %515 = extractvalue { i16*, i64 } %513, 1
  %516 = ptrtoint i16* %514 to i64
  %517 = trunc i64 %515 to i16
  %518 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 12
  store i16 %517, i16* %518, align 8
  %519 = or i64 %510, %516
  %520 = getelementptr inbounds i8* %18, i64 68
  %521 = bitcast i8* %520 to i32*
  %522 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %521, i64 4) #1, !srcloc !75
  %523 = extractvalue { i32*, i64 } %522, 0
  %524 = extractvalue { i32*, i64 } %522, 1
  %525 = ptrtoint i32* %523 to i64
  %526 = trunc i64 %524 to i32
  %527 = or i64 %519, %525
  %528 = icmp eq i32 %526, 0
  br i1 %528, label %536, label %.critedge.i26.i.i

.critedge.i26.i.i:                                ; preds = %.critedge.i30.i.i
  %529 = and i64 %524, 4294967295
  %530 = inttoptr i64 %529 to i8*
  %531 = call i64 @_copy_from_user(i8* %391, i8* %530, i32 15) #4
  %532 = and i64 %527, 4294967295
  %533 = or i64 %531, %532
  %534 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 9
  store i8* %391, i8** %534, align 8
  %535 = getelementptr [16 x i8]* %devname.i.i, i64 0, i64 15
  store i8 0, i8* %535, align 1
  br label %538

; <label>:536                                     ; preds = %.critedge.i30.i.i
  %537 = getelementptr inbounds %struct.rtentry* %r4.i.i, i64 0, i32 9
  store i8* null, i8** %537, align 8
  br label %538

; <label>:538                                     ; preds = %536, %.critedge.i26.i.i, %.critedge.i.i.i
  %r.0.i.i = phi i8* [ %392, %.critedge.i.i.i ], [ %393, %536 ], [ %393, %.critedge.i26.i.i ]
  %ret.1.in.i.i = phi i64 [ %470, %.critedge.i.i.i ], [ %527, %536 ], [ %533, %.critedge.i26.i.i ]
  %ret.1.i.i = trunc i64 %ret.1.in.i.i to i32
  %539 = icmp eq i32 %ret.1.i.i, 0
  br i1 %539, label %540, label %compat_sock_ioctl_trans.exit

; <label>:540                                     ; preds = %538
  %541 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %542 = add i64 %541, -16344
  %543 = inttoptr i64 %542 to %struct.thread_info*
  %544 = getelementptr inbounds %struct.thread_info* %543, i64 0, i32 6, i32 0
  store i64 -1, i64* %544, align 8
  %545 = ptrtoint i8* %r.0.i.i to i64
  %546 = load %struct.proto_ops** %5, align 8
  %547 = getelementptr inbounds %struct.proto_ops* %546, i64 0, i32 9
  %548 = load i32 (%struct.socket*, i32, i64)** %547, align 8
  %549 = call i32 %548(%struct.socket* %3, i32 %cmd, i64 %545) #4
  %550 = icmp eq i32 %549, -515
  br i1 %550, label %551, label %sock_do_ioctl.exit.i.i

; <label>:551                                     ; preds = %540
  %552 = call i32 @dev_ioctl(%struct.net* %23, i32 %cmd, i8* %r.0.i.i) #4
  br label %sock_do_ioctl.exit.i.i

sock_do_ioctl.exit.i.i:                           ; preds = %551, %540
  %err.0.i.i.i = phi i32 [ %552, %551 ], [ %549, %540 ]
  %553 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %554 = add i64 %553, -16344
  %555 = inttoptr i64 %554 to %struct.thread_info*
  %556 = getelementptr inbounds %struct.thread_info* %555, i64 0, i32 6, i32 0
  store i64 %398, i64* %556, align 8
  br label %compat_sock_ioctl_trans.exit

; <label>:557                                     ; preds = %29
  %558 = bitcast %struct.timeval* %ktv.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %558) #1
  %559 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %560 = add i64 %559, -16344
  %561 = inttoptr i64 %560 to %struct.thread_info*
  %562 = getelementptr inbounds %struct.thread_info* %561, i64 0, i32 6, i32 0
  %563 = load i64* %562, align 8
  %564 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %565 = add i64 %564, -16344
  %566 = inttoptr i64 %565 to %struct.thread_info*
  %567 = getelementptr inbounds %struct.thread_info* %566, i64 0, i32 6, i32 0
  store i64 -1, i64* %567, align 8
  %568 = ptrtoint %struct.timeval* %ktv.i.i to i64
  %569 = load %struct.proto_ops** %5, align 8
  %570 = getelementptr inbounds %struct.proto_ops* %569, i64 0, i32 9
  %571 = load i32 (%struct.socket*, i32, i64)** %570, align 8
  %572 = call i32 %571(%struct.socket* %3, i32 35078, i64 %568) #4
  %573 = icmp eq i32 %572, -515
  br i1 %573, label %574, label %sock_do_ioctl.exit.i13.i

; <label>:574                                     ; preds = %557
  %575 = call i32 @dev_ioctl(%struct.net* %23, i32 35078, i8* %558) #4
  br label %sock_do_ioctl.exit.i13.i

sock_do_ioctl.exit.i13.i:                         ; preds = %574, %557
  %err.0.i.i12.i = phi i32 [ %575, %574 ], [ %572, %557 ]
  %576 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %577 = add i64 %576, -16344
  %578 = inttoptr i64 %577 to %struct.thread_info*
  %579 = getelementptr inbounds %struct.thread_info* %578, i64 0, i32 6, i32 0
  store i64 %563, i64* %579, align 8
  %580 = icmp eq i32 %err.0.i.i12.i, 0
  br i1 %580, label %581, label %compat_sock_ioctl_trans.exit

; <label>:581                                     ; preds = %sock_do_ioctl.exit.i13.i
  %582 = call i32 @compat_put_timeval(%struct.timeval* %ktv.i.i, i8* %18) #4
  br label %compat_sock_ioctl_trans.exit

; <label>:583                                     ; preds = %29
  %584 = bitcast %struct.timespec* %kts.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %584) #1
  %585 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %586 = add i64 %585, -16344
  %587 = inttoptr i64 %586 to %struct.thread_info*
  %588 = getelementptr inbounds %struct.thread_info* %587, i64 0, i32 6, i32 0
  %589 = load i64* %588, align 8
  %590 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %591 = add i64 %590, -16344
  %592 = inttoptr i64 %591 to %struct.thread_info*
  %593 = getelementptr inbounds %struct.thread_info* %592, i64 0, i32 6, i32 0
  store i64 -1, i64* %593, align 8
  %594 = ptrtoint %struct.timespec* %kts.i.i to i64
  %595 = load %struct.proto_ops** %5, align 8
  %596 = getelementptr inbounds %struct.proto_ops* %595, i64 0, i32 9
  %597 = load i32 (%struct.socket*, i32, i64)** %596, align 8
  %598 = call i32 %597(%struct.socket* %3, i32 35079, i64 %594) #4
  %599 = icmp eq i32 %598, -515
  br i1 %599, label %600, label %sock_do_ioctl.exit.i16.i

; <label>:600                                     ; preds = %583
  %601 = call i32 @dev_ioctl(%struct.net* %23, i32 35079, i8* %584) #4
  br label %sock_do_ioctl.exit.i16.i

sock_do_ioctl.exit.i16.i:                         ; preds = %600, %583
  %err.0.i.i15.i = phi i32 [ %601, %600 ], [ %598, %583 ]
  %602 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #1, !srcloc !4
  %603 = add i64 %602, -16344
  %604 = inttoptr i64 %603 to %struct.thread_info*
  %605 = getelementptr inbounds %struct.thread_info* %604, i64 0, i32 6, i32 0
  store i64 %589, i64* %605, align 8
  %606 = icmp eq i32 %err.0.i.i15.i, 0
  br i1 %606, label %607, label %compat_sock_ioctl_trans.exit

; <label>:607                                     ; preds = %sock_do_ioctl.exit.i16.i
  %608 = call i32 @compat_put_timespec(%struct.timespec* %kts.i.i, i8* %18) #4
  br label %compat_sock_ioctl_trans.exit

; <label>:609                                     ; preds = %29, %29, %29, %29
  %610 = inttoptr i64 %17 to %struct.compat_ifreq*
  %611 = call fastcc i32 @compat_ifr_data_ioctl(%struct.net* %23, i32 %cmd, %struct.compat_ifreq* %610) #4
  br label %compat_sock_ioctl_trans.exit

; <label>:612                                     ; preds = %29, %29, %29, %29, %29, %29, %29, %29, %29, %29
  %613 = call i64 @sock_ioctl(%struct.file* %file, i32 %cmd, i64 %arg) #4
  %614 = trunc i64 %613 to i32
  br label %compat_sock_ioctl_trans.exit

; <label>:615                                     ; preds = %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29, %29
  %616 = inttoptr i64 %17 to %struct.compat_ifreq*
  %617 = call i8* @compat_alloc_user_space(i64 40) #4
  %618 = getelementptr inbounds %struct.compat_ifreq* %616, i64 0, i32 0, i32 0, i64 0
  %619 = call i64 @copy_in_user(i8* %617, i8* %618, i32 32) #4
  %620 = icmp eq i64 %619, 0
  br i1 %620, label %621, label %compat_sock_ioctl_trans.exit

; <label>:621                                     ; preds = %615
  %622 = ptrtoint i8* %617 to i64
  %623 = load %struct.proto_ops** %5, align 8
  %624 = getelementptr inbounds %struct.proto_ops* %623, i64 0, i32 9
  %625 = load i32 (%struct.socket*, i32, i64)** %624, align 8
  %626 = call i32 %625(%struct.socket* %3, i32 %cmd, i64 %622) #4
  %627 = icmp eq i32 %626, -515
  br i1 %627, label %628, label %sock_do_ioctl.exit.i19.i

; <label>:628                                     ; preds = %621
  %629 = call i32 @dev_ioctl(%struct.net* %23, i32 %cmd, i8* %617) #4
  br label %sock_do_ioctl.exit.i19.i

sock_do_ioctl.exit.i19.i:                         ; preds = %628, %621
  %err.0.i.i18.i = phi i32 [ %629, %628 ], [ %626, %621 ]
  %630 = icmp eq i32 %err.0.i.i18.i, 0
  br i1 %630, label %631, label %compat_sock_ioctl_trans.exit

; <label>:631                                     ; preds = %sock_do_ioctl.exit.i19.i
  switch i32 %cmd, label %compat_sock_ioctl_trans.exit [
    i32 35091, label %632
    i32 35101, label %632
    i32 35105, label %632
    i32 35103, label %632
    i32 35111, label %632
    i32 35123, label %632
    i32 35093, label %632
    i32 35097, label %632
    i32 35095, label %632
    i32 35099, label %632
    i32 35125, label %632
    i32 35138, label %632
    i32 35143, label %632
    i32 35144, label %632
  ]

; <label>:632                                     ; preds = %631, %631, %631, %631, %631, %631, %631, %631, %631, %631, %631, %631, %631, %631
  %633 = call i64 @copy_in_user(i8* %618, i8* %617, i32 32) #4
  %634 = icmp eq i64 %633, 0
  %..i20.i = select i1 %634, i32 0, i32 -14
  br label %compat_sock_ioctl_trans.exit

._crit_edge7:                                     ; preds = %29, %29, %29, %29
  %635 = load %struct.proto_ops** %5, align 8
  %636 = getelementptr inbounds %struct.proto_ops* %635, i64 0, i32 9
  %637 = load i32 (%struct.socket*, i32, i64)** %636, align 8
  %638 = call i32 %637(%struct.socket* %3, i32 %cmd, i64 %arg) #4
  %639 = icmp eq i32 %638, -515
  br i1 %639, label %640, label %compat_sock_ioctl_trans.exit

; <label>:640                                     ; preds = %._crit_edge7
  %641 = inttoptr i64 %arg to i8*
  %642 = call i32 @dev_ioctl(%struct.net* %23, i32 %cmd, i8* %641) #4
  br label %compat_sock_ioctl_trans.exit

compat_sock_ioctl_trans.exit:                     ; preds = %640, %._crit_edge7, %632, %631, %sock_do_ioctl.exit.i19.i, %615, %612, %609, %607, %sock_do_ioctl.exit.i16.i, %581, %sock_do_ioctl.exit.i13.i, %sock_do_ioctl.exit.i.i, %538, %375, %copy_from_user.exit.i.i, %369, %.critedge.i23.i.i, %326, %271, %269, %259, %251, %245, %244, %237, %229, %221, %216, %213, %207, %202, %197, %194, %186, %180, %171, %161, %148, %140, %.critedge.i9.i.i, %118, %copy_from_user.exit7.i.i, %99, %copy_to_user.exit.i.i, %86, %53, %50, %47, %41, %37, %30, %29, %26, %12
  %ret.2 = phi i32 [ %28, %26 ], [ %614, %612 ], [ %611, %609 ], [ -515, %29 ], [ -14, %30 ], [ %..i.i, %37 ], [ -14, %41 ], [ %48, %47 ], [ %..i2.i, %50 ], [ 0, %244 ], [ -14, %140 ], [ -14, %148 ], [ -14, %161 ], [ -12, %171 ], [ -14, %180 ], [ -14, %186 ], [ -14, %202 ], [ -14, %197 ], [ -14, %194 ], [ %208, %207 ], [ -14, %221 ], [ -14, %216 ], [ -14, %213 ], [ -14, %229 ], [ -14, %237 ], [ %270, %269 ], [ -14, %245 ], [ -14, %251 ], [ -14, %259 ], [ %..i20.i, %632 ], [ -14, %615 ], [ %err.0.i.i18.i, %sock_do_ioctl.exit.i19.i ], [ 0, %631 ], [ -14, %53 ], [ -14, %copy_to_user.exit.i.i ], [ %100, %99 ], [ -14, %copy_from_user.exit7.i.i ], [ %phitmp12.i.i, %.critedge.i9.i.i ], [ -14, %271 ], [ %336, %326 ], [ %..i9.i, %.critedge.i23.i.i ], [ %385, %375 ], [ -14, %copy_from_user.exit.i.i ], [ -515, %369 ], [ %err.0.i.i.i, %sock_do_ioctl.exit.i.i ], [ -14, %538 ], [ %err.0.i.i12.i, %sock_do_ioctl.exit.i13.i ], [ %582, %581 ], [ %err.0.i.i15.i, %sock_do_ioctl.exit.i16.i ], [ %608, %607 ], [ %642, %640 ], [ %638, %._crit_edge7 ], [ %.mux, %12 ], [ -14, %118 ], [ -14, %86 ]
  %643 = sext i32 %ret.2 to i64
  ret i64 %643
}

; Function Attrs: noredzone nounwind
define internal i32 @sock_mmap(%struct.file* %file, %struct.vm_area_struct* %vma) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 15
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.socket*
  %4 = getelementptr inbounds i8* %2, i64 40
  %5 = bitcast i8* %4 to %struct.proto_ops**
  %6 = load %struct.proto_ops** %5, align 8
  %7 = getelementptr inbounds %struct.proto_ops* %6, i64 0, i32 19
  %8 = load i32 (%struct.file*, %struct.socket*, %struct.vm_area_struct*)** %7, align 8
  %9 = tail call i32 %8(%struct.file* %file, %struct.socket* %3, %struct.vm_area_struct* %vma) #4
  ret i32 %9
}

; Function Attrs: noredzone nounwind
define internal i32 @sock_close(%struct.inode* %inode, %struct.file* nocapture readnone %filp) #0 {
  %1 = getelementptr %struct.inode* %inode, i64 -1, i32 37
  %2 = getelementptr inbounds %struct.list_head* %1, i64 2, i32 1
  %3 = load %struct.list_head** %2, align 8
  %4 = icmp eq %struct.list_head* %3, null
  br i1 %4, label %14, label %5

; <label>:5                                       ; preds = %0
  %6 = bitcast %struct.list_head* %1 to %struct.socket*
  %7 = getelementptr inbounds %struct.list_head* %3, i64 0, i32 1
  %8 = load %struct.list_head** %7, align 8
  %9 = bitcast %struct.list_head* %8 to %struct.module*
  %10 = getelementptr inbounds %struct.list_head* %3, i64 1
  %11 = bitcast %struct.list_head* %10 to i32 (%struct.socket*)**
  %12 = load i32 (%struct.socket*)** %11, align 8
  %13 = tail call i32 %12(%struct.socket* %6) #4
  store %struct.list_head* null, %struct.list_head** %2, align 8
  tail call void @module_put(%struct.module* %9) #4
  br label %14

; <label>:14                                      ; preds = %5, %0
  %15 = getelementptr inbounds %struct.list_head* %1, i64 1
  %16 = bitcast %struct.list_head* %15 to %struct.socket_wq**
  %17 = load %struct.socket_wq** %16, align 8
  %18 = getelementptr inbounds %struct.socket_wq* %17, i64 0, i32 1
  %19 = load %struct.fasync_struct** %18, align 8
  %20 = icmp eq %struct.fasync_struct* %19, null
  br i1 %20, label %23, label %21

; <label>:21                                      ; preds = %14
  %22 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @__func__.sock_release, i64 0, i64 0)) #4
  br label %23

; <label>:23                                      ; preds = %21, %14
  %24 = getelementptr %struct.inode* %inode, i64 -1, i32 37, i32 1
  %25 = bitcast %struct.list_head** %24 to i64*
  %26 = load volatile i64* %25, align 8
  %27 = and i64 %26, 32
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %sock_release.exit

; <label>:29                                      ; preds = %23
  tail call void asm "decl %gs:$0", "=*m,*m,~{dirflag},~{fpsr},~{flags}"(i32* @sockets_in_use, i32* @sockets_in_use) #1, !srcloc !3
  %30 = getelementptr inbounds %struct.list_head* %1, i64 1, i32 1
  %31 = load %struct.list_head** %30, align 8
  %32 = icmp eq %struct.list_head* %31, null
  br i1 %32, label %33, label %36

; <label>:33                                      ; preds = %29
  %34 = getelementptr inbounds %struct.list_head* %1, i64 3
  %35 = bitcast %struct.list_head* %34 to %struct.inode*
  tail call void @iput(%struct.inode* %35) #4
  br label %sock_release.exit

; <label>:36                                      ; preds = %29
  store %struct.list_head* null, %struct.list_head** %30, align 8
  br label %sock_release.exit

sock_release.exit:                                ; preds = %36, %33, %23
  ret i32 0
}

; Function Attrs: noredzone nounwind
define internal i32 @sock_fasync(i32 %fd, %struct.file* %filp, i32 %on) #0 {
  %1 = getelementptr inbounds %struct.file* %filp, i64 0, i32 15
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 32
  %4 = bitcast i8* %3 to %struct.sock**
  %5 = load %struct.sock** %4, align 8
  %6 = icmp eq %struct.sock* %5, null
  br i1 %6, label %19, label %7

; <label>:7                                       ; preds = %0
  tail call void @lock_sock_nested(%struct.sock* %5, i32 0) #4
  %8 = getelementptr inbounds i8* %2, i64 16
  %9 = bitcast i8* %8 to %struct.socket_wq**
  %10 = load %struct.socket_wq** %9, align 8
  %11 = getelementptr inbounds %struct.socket_wq* %10, i64 0, i32 1
  %12 = tail call i32 @fasync_helper(i32 %fd, %struct.file* %filp, i32 %on, %struct.fasync_struct** %11) #4
  %13 = load %struct.fasync_struct** %11, align 8
  %14 = icmp eq %struct.fasync_struct* %13, null
  %15 = getelementptr inbounds %struct.sock* %5, i64 0, i32 15
  br i1 %14, label %16, label %17

; <label>:16                                      ; preds = %7
  tail call void asm sideeffect "btr $1,$0", "=*m,Ir,*m,~{dirflag},~{fpsr},~{flags}"(i64* %15, i64 17, i64* %15) #1, !srcloc !76
  br label %18

; <label>:17                                      ; preds = %7
  tail call void asm sideeffect "bts $1,$0", "=*m,Ir,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %15, i64 17, i64* %15) #1, !srcloc !77
  br label %18

; <label>:18                                      ; preds = %17, %16
  tail call void @release_sock(%struct.sock* %5) #4
  br label %19

; <label>:19                                      ; preds = %18, %0
  %.0 = phi i32 [ 0, %18 ], [ -22, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i64 @sock_sendpage(%struct.file* nocapture readonly %file, %struct.page* %page, i32 %offset, i64 %size, i64* nocapture readnone %ppos, i32 %more) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 15
  %2 = load i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.socket*
  %4 = getelementptr inbounds %struct.file* %file, i64 0, i32 6
  %5 = load i32* %4, align 4
  %6 = lshr i32 %5, 5
  %7 = and i32 %6, 64
  %8 = or i32 %7, %more
  %9 = getelementptr inbounds i8* %2, i64 40
  %10 = bitcast i8* %9 to %struct.proto_ops**
  %11 = load %struct.proto_ops** %10, align 8
  %12 = getelementptr inbounds %struct.proto_ops* %11, i64 0, i32 20
  %13 = load i64 (%struct.socket*, %struct.page*, i32, i64, i32)** %12, align 8
  %14 = icmp eq i64 (%struct.socket*, %struct.page*, i32, i64, i32)* %13, null
  br i1 %14, label %17, label %15

; <label>:15                                      ; preds = %0
  %16 = tail call i64 %13(%struct.socket* %3, %struct.page* %page, i32 %offset, i64 %size, i32 %8) #4
  br label %kernel_sendpage.exit

; <label>:17                                      ; preds = %0
  %18 = tail call i64 @sock_no_sendpage(%struct.socket* %3, %struct.page* %page, i32 %offset, i64 %size, i32 %8) #4
  br label %kernel_sendpage.exit

kernel_sendpage.exit:                             ; preds = %17, %15
  %.0.in.i = phi i64 [ %16, %15 ], [ %18, %17 ]
  %sext = shl i64 %.0.in.i, 32
  %19 = ashr exact i64 %sext, 32
  ret i64 %19
}

; Function Attrs: noredzone
declare i64 @generic_splice_sendpage(%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32) #2

; Function Attrs: noredzone nounwind
define internal i64 @sock_splice_read(%struct.file* nocapture readonly %file, i64* %ppos, %struct.pipe_inode_info* %pipe, i64 %len, i32 %flags) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 15
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 40
  %4 = bitcast i8* %3 to %struct.proto_ops**
  %5 = load %struct.proto_ops** %4, align 8
  %6 = getelementptr inbounds %struct.proto_ops* %5, i64 0, i32 21
  %7 = load i64 (%struct.socket*, i64*, %struct.pipe_inode_info*, i64, i32)** %6, align 8
  %8 = icmp eq i64 (%struct.socket*, i64*, %struct.pipe_inode_info*, i64, i32)* %7, null
  br i1 %8, label %12, label %9, !prof !1

; <label>:9                                       ; preds = %0
  %10 = bitcast i8* %2 to %struct.socket*
  %11 = tail call i64 %7(%struct.socket* %10, i64* %ppos, %struct.pipe_inode_info* %pipe, i64 %len, i32 %flags) #4
  br label %12

; <label>:12                                      ; preds = %9, %0
  %.0 = phi i64 [ %11, %9 ], [ -22, %0 ]
  ret i64 %.0
}

; Function Attrs: noredzone
declare i32 @fasync_helper(i32, %struct.file*, i32, %struct.fasync_struct**) #2

; Function Attrs: noredzone
declare void @release_sock(%struct.sock*) #2

; Function Attrs: noredzone
declare void @lock_sock_nested(%struct.sock*, i32) #2

; Function Attrs: noredzone nounwind
define internal fastcc i32 @compat_ifr_data_ioctl(%struct.net* %net, i32 %cmd, %struct.compat_ifreq* %u_ifreq32) #0 {
copy_from_user.exit:
  %tmp_buf = alloca [16 x i8], align 16
  %0 = getelementptr [16 x i8]* %tmp_buf, i64 0, i64 0
  %1 = getelementptr %struct.compat_ifreq* %u_ifreq32, i64 0, i32 0, i32 0, i64 0
  %2 = call i64 @_copy_from_user(i8* %0, i8* %1, i32 16) #4
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %26

; <label>:4                                       ; preds = %copy_from_user.exit
  %5 = getelementptr inbounds %struct.compat_ifreq* %u_ifreq32, i64 0, i32 1, i32 0, i32 0
  %6 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %5, i64 4) #1, !srcloc !78
  %7 = extractvalue { i32*, i64 } %6, 0
  %8 = ptrtoint i32* %7 to i64
  %9 = trunc i64 %8 to i32
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %copy_to_user.exit, label %26

copy_to_user.exit:                                ; preds = %4
  %11 = call i8* @compat_alloc_user_space(i64 40) #4
  %12 = call i64 @_copy_to_user(i8* %11, i8* %0, i32 16) #4
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %copy_to_user.exit
  %15 = extractvalue { i32*, i64 } %6, 1
  %16 = and i64 %15, 4294967295
  %17 = inttoptr i64 %16 to i8*
  %18 = getelementptr inbounds i8* %11, i64 16
  %19 = bitcast i8* %18 to i8**
  %20 = call i8* asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i8* %17, i8** %19) #1, !srcloc !79
  %21 = ptrtoint i8* %20 to i64
  %22 = trunc i64 %21 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %14
  %25 = call i32 @dev_ioctl(%struct.net* %net, i32 %cmd, i8* %11) #4
  br label %26

; <label>:26                                      ; preds = %24, %14, %copy_to_user.exit, %4, %copy_from_user.exit
  %.0 = phi i32 [ %25, %24 ], [ -14, %copy_from_user.exit ], [ -14, %4 ], [ -14, %copy_to_user.exit ], [ -14, %14 ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare i32 @dev_ioctl(%struct.net*, i32, i8*) #2

; Function Attrs: noredzone
declare i8* @compat_alloc_user_space(i64) #2

; Function Attrs: noredzone
declare i64 @copy_in_user(i8*, i8*, i32) #2

; Function Attrs: noredzone
declare i32 @compat_put_timespec(%struct.timespec*, i8*) #2

; Function Attrs: noredzone
declare i32 @compat_put_timeval(%struct.timeval*, i8*) #2

; Function Attrs: noredzone
declare void @f_setown(%struct.file*, i64, i32) #2

; Function Attrs: noredzone
declare i32 @f_getown(%struct.file*) #2

; Function Attrs: noredzone
declare %struct.napi_struct* @napi_by_id(i32) #2

; Function Attrs: noredzone
declare void @__local_bh_enable_ip(i64, i32) #2

; Function Attrs: noredzone
declare i32 @__audit_sockaddr(i32, i8*) #2

; Function Attrs: noredzone
declare i64 @_copy_from_user(i8*, i8*, i32) #2

attributes #0 = { noredzone nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noredzone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nobuiltin noredzone nounwind }
attributes #5 = { nobuiltin noredzone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!1 = metadata !{metadata !"branch_weights", i32 4, i32 64}
!2 = metadata !{i32 -2146715491}
!3 = metadata !{i32 -2141713207}
!4 = metadata !{i32 -2146505598}
!5 = metadata !{i32 416715, i32 416726}
!6 = metadata !{i32 -2141729780}
!7 = metadata !{i32 -2146122485}
!8 = metadata !{i32 -2146122342}
!9 = metadata !{i32 -2146965814, i32 -2146965775, i32 -2146965754, i32 -2146965717, i32 -2146965694, i32 -2146965685}
!10 = metadata !{i32 -2141652613}
!11 = metadata !{i32 -2141651025}
!12 = metadata !{i32 -2141335564, i32 -2141335557, i32 -2141335543, i32 -2141335541, i32 -2141336271, i32 -2141335501, i32 -2141335453, i32 -2141335387, i32 -2141335325, i32 -2141335273, i32 -2141336191, i32 -2141336166, i32 -2141335065, i32 -2141336093, i32 -2141336068, i32 -2141334805, i32 -2141334881, i32 -2141334788, i32 -2141334837, i32 -2141336869, i32 -2141336828, i32 -2141333965, i32 -2141333951, i32 -2141333949, i32 -2141334679, i32 -2141333909, i32 -2141333861, i32 -2141333795, i32 -2141333733, i32 -2141333681, i32 -2141334599, i32 -2141334574, i32 -2141333473, i32 -2141334501, i32 -2141334476, i32 -2141333213, i32 -2141333289, i32 -2141333196, i32 -2141333245, i32 -2141336796, i32 -2141336757, i32 -2141336728, i32 -2141336703, i32 -2141333179, i32 -2141333135, i32 -2141333112, i32 -2141333079, i32 -2141333048}
!13 = metadata !{i32 -2141323318}
!14 = metadata !{i32 -2141295838, i32 -2141295831, i32 -2141295817, i32 -2141295815, i32 -2141296545, i32 -2141295775, i32 -2141295727, i32 -2141295661, i32 -2141295599, i32 -2141295547, i32 -2141296465, i32 -2141296440, i32 -2141295339, i32 -2141296367, i32 -2141296342, i32 -2141295079, i32 -2141295155, i32 -2141295062, i32 -2141295111, i32 -2141297351, i32 -2141297310, i32 -2141294239, i32 -2141294225, i32 -2141294223, i32 -2141294953, i32 -2141294183, i32 -2141294135, i32 -2141294069, i32 -2141294007, i32 -2141293955, i32 -2141294873, i32 -2141294848, i32 -2141293747, i32 -2141294775, i32 -2141294750, i32 -2141293487, i32 -2141293563, i32 -2141293470, i32 -2141293519, i32 -2141297278, i32 -2141297239, i32 -2141297210, i32 -2141297185, i32 -2141293453, i32 -2141293409, i32 -2141293386, i32 -2141293353, i32 -2141293322}
!15 = metadata !{i32 -2141276758, i32 -2141276751, i32 -2141276737, i32 -2141276735, i32 -2141277465, i32 -2141276695, i32 -2141276647, i32 -2141276581, i32 -2141276519, i32 -2141276467, i32 -2141277385, i32 -2141277360, i32 -2141276259, i32 -2141277287, i32 -2141277262, i32 -2141275999, i32 -2141276075, i32 -2141275982, i32 -2141276031, i32 -2141278068, i32 -2141278027, i32 -2141275159, i32 -2141275145, i32 -2141275143, i32 -2141275873, i32 -2141275103, i32 -2141275055, i32 -2141274989, i32 -2141274927, i32 -2141274875, i32 -2141275793, i32 -2141275768, i32 -2141274667, i32 -2141275695, i32 -2141275670, i32 -2141274407, i32 -2141274483, i32 -2141274390, i32 -2141274439, i32 -2141277995, i32 -2141277956, i32 -2141277927, i32 -2141277902, i32 -2141274373, i32 -2141274329, i32 -2141274306, i32 -2141274273, i32 -2141274242}
!16 = metadata !{i32 -2141254024, i32 -2141254017, i32 -2141254003, i32 -2141254001, i32 -2141254731, i32 -2141253961, i32 -2141253913, i32 -2141253847, i32 -2141253785, i32 -2141253733, i32 -2141254651, i32 -2141254626, i32 -2141253525, i32 -2141254553, i32 -2141254528, i32 -2141253265, i32 -2141253341, i32 -2141253248, i32 -2141253297, i32 -2141255415, i32 -2141255374, i32 -2141252425, i32 -2141252411, i32 -2141252409, i32 -2141253139, i32 -2141252369, i32 -2141252321, i32 -2141252255, i32 -2141252193, i32 -2141252141, i32 -2141253059, i32 -2141253034, i32 -2141251933, i32 -2141252961, i32 -2141252936, i32 -2141251673, i32 -2141251749, i32 -2141251656, i32 -2141251705, i32 -2141255342, i32 -2141255303, i32 -2141255274, i32 -2141255249, i32 -2141251639, i32 -2141251595, i32 -2141251572, i32 -2141251539, i32 -2141251508}
!17 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!18 = metadata !{i32 -2142046296}
!19 = metadata !{i32 -2141230349, i32 -2141230342, i32 -2141230328, i32 -2141230326, i32 -2141231056, i32 -2141230286, i32 -2141230238, i32 -2141230172, i32 -2141230110, i32 -2141230058, i32 -2141230976, i32 -2141230951, i32 -2141229850, i32 -2141230878, i32 -2141230853, i32 -2141229590, i32 -2141229666, i32 -2141229573, i32 -2141229622, i32 -2141231654, i32 -2141231613, i32 -2141228750, i32 -2141228736, i32 -2141228734, i32 -2141229464, i32 -2141228694, i32 -2141228646, i32 -2141228580, i32 -2141228518, i32 -2141228466, i32 -2141229384, i32 -2141229359, i32 -2141228258, i32 -2141229286, i32 -2141229261, i32 -2141227998, i32 -2141228074, i32 -2141227981, i32 -2141228030, i32 -2141231581, i32 -2141231542, i32 -2141231513, i32 -2141231488, i32 -2141227964, i32 -2141227920, i32 -2141227897, i32 -2141227864, i32 -2141227833}
!20 = metadata !{i32 -2141222156}
!21 = metadata !{i32 -2141190378}
!22 = metadata !{i32 -2146406770}
!23 = metadata !{i32 -2146384756}
!24 = metadata !{i32 -2141189104, i32 -2141189079, i32 -2141188809, i32 -2141189012, i32 -2141188981, i32 -2141188951}
!25 = metadata !{i32 -2141186173}
!26 = metadata !{i32 -2141469070, i32 -2141469063, i32 -2141469049, i32 -2141469047, i32 -2141469777, i32 -2141469007, i32 -2141468959, i32 -2141468893, i32 -2141468831, i32 -2141468779, i32 -2141469697, i32 -2141469672, i32 -2141468571, i32 -2141469599, i32 -2141469574, i32 -2141468311, i32 -2141468387, i32 -2141468294, i32 -2141468343, i32 -2141470325, i32 -2141470284, i32 -2141467471, i32 -2141467457, i32 -2141467455, i32 -2141468185, i32 -2141467415, i32 -2141467367, i32 -2141467301, i32 -2141467239, i32 -2141467187, i32 -2141468105, i32 -2141468080, i32 -2141466979, i32 -2141468007, i32 -2141467982, i32 -2141466719, i32 -2141466795, i32 -2141466702, i32 -2141466751, i32 -2141470252, i32 -2141470213, i32 -2141470184, i32 -2141470138, i32 -2141470113, i32 -2141466685, i32 -2141466641, i32 -2141466618, i32 -2141466585, i32 -2141466554}
!27 = metadata !{i32 -2141455582, i32 -2141455575, i32 -2141455561, i32 -2141455559, i32 -2141456289, i32 -2141455519, i32 -2141455471, i32 -2141455405, i32 -2141455343, i32 -2141455291, i32 -2141456209, i32 -2141456184, i32 -2141455083, i32 -2141456111, i32 -2141456086, i32 -2141454823, i32 -2141454899, i32 -2141454806, i32 -2141454855, i32 -2141456855, i32 -2141456814, i32 -2141453983, i32 -2141453969, i32 -2141453967, i32 -2141454697, i32 -2141453927, i32 -2141453879, i32 -2141453813, i32 -2141453751, i32 -2141453699, i32 -2141454617, i32 -2141454592, i32 -2141453491, i32 -2141454519, i32 -2141454494, i32 -2141453231, i32 -2141453307, i32 -2141453214, i32 -2141453263, i32 -2141456782, i32 -2141456743, i32 -2141456714, i32 -2141456668, i32 -2141456643, i32 -2141453197, i32 -2141453153, i32 -2141453130, i32 -2141453097, i32 -2141453066}
!28 = metadata !{i32 -2141434208, i32 -2141434201, i32 -2141434187, i32 -2141434185, i32 -2141434915, i32 -2141434145, i32 -2141434097, i32 -2141434031, i32 -2141433969, i32 -2141433917, i32 -2141434835, i32 -2141434810, i32 -2141433709, i32 -2141434737, i32 -2141434712, i32 -2141433449, i32 -2141433525, i32 -2141433432, i32 -2141433481, i32 -2141435461, i32 -2141435420, i32 -2141428548, i32 -2141428534, i32 -2141428532, i32 -2141429262, i32 -2141428492, i32 -2141428444, i32 -2141428378, i32 -2141428316, i32 -2141428264, i32 -2141429182, i32 -2141429157, i32 -2141428056, i32 -2141429084, i32 -2141429059, i32 -2141427796, i32 -2141427872, i32 -2141427779, i32 -2141427828, i32 -2141435388, i32 -2141435349, i32 -2141435320, i32 -2141435274, i32 -2141435249, i32 -2141427762, i32 -2141427718, i32 -2141427695, i32 -2141427662, i32 -2141427631}
!29 = metadata !{i32 -2141412771, i32 -2141412764, i32 -2141412750, i32 -2141412748, i32 -2141413478, i32 -2141412708, i32 -2141412660, i32 -2141412594, i32 -2141412532, i32 -2141412480, i32 -2141413398, i32 -2141413373, i32 -2141412272, i32 -2141413300, i32 -2141413275, i32 -2141412012, i32 -2141412088, i32 -2141411995, i32 -2141412044, i32 -2141414030, i32 -2141413989, i32 -2141411172, i32 -2141411158, i32 -2141411156, i32 -2141411886, i32 -2141411116, i32 -2141411068, i32 -2141411002, i32 -2141410940, i32 -2141410888, i32 -2141411806, i32 -2141411781, i32 -2141410680, i32 -2141411708, i32 -2141411683, i32 -2141410420, i32 -2141410496, i32 -2141410403, i32 -2141410452, i32 -2141413957, i32 -2141413918, i32 -2141413889, i32 -2141413843, i32 -2141413818, i32 -2141410386, i32 -2141410342, i32 -2141410319, i32 -2141410286, i32 -2141410255}
!30 = metadata !{i32 -2141395178, i32 -2141395171, i32 -2141395157, i32 -2141395155, i32 -2141395885, i32 -2141395115, i32 -2141395067, i32 -2141395001, i32 -2141394939, i32 -2141394887, i32 -2141395805, i32 -2141395780, i32 -2141394679, i32 -2141395707, i32 -2141395682, i32 -2141394419, i32 -2141394495, i32 -2141394402, i32 -2141394451, i32 -2141396448, i32 -2141396407, i32 -2141393579, i32 -2141393565, i32 -2141393563, i32 -2141394293, i32 -2141393523, i32 -2141393475, i32 -2141393409, i32 -2141393347, i32 -2141393295, i32 -2141394213, i32 -2141394188, i32 -2141393087, i32 -2141394115, i32 -2141394090, i32 -2141392827, i32 -2141392903, i32 -2141392810, i32 -2141392859, i32 -2141396375, i32 -2141396336, i32 -2141396307, i32 -2141396261, i32 -2141396236, i32 -2141392793, i32 -2141392749, i32 -2141392726, i32 -2141392693, i32 -2141392662}
!31 = metadata !{i32 -2141377552, i32 -2141377545, i32 -2141377531, i32 -2141377529, i32 -2141378259, i32 -2141377489, i32 -2141377441, i32 -2141377375, i32 -2141377313, i32 -2141377261, i32 -2141378179, i32 -2141378154, i32 -2141377053, i32 -2141378081, i32 -2141378056, i32 -2141376793, i32 -2141376869, i32 -2141376776, i32 -2141376825, i32 -2141378828, i32 -2141378787, i32 -2141375953, i32 -2141375939, i32 -2141375937, i32 -2141376667, i32 -2141375897, i32 -2141375849, i32 -2141375783, i32 -2141375721, i32 -2141375669, i32 -2141376587, i32 -2141376562, i32 -2141375461, i32 -2141376489, i32 -2141376464, i32 -2141375201, i32 -2141375277, i32 -2141375184, i32 -2141375233, i32 -2141378755, i32 -2141378716, i32 -2141378687, i32 -2141378641, i32 -2141378616, i32 -2141375167, i32 -2141375123, i32 -2141375100, i32 -2141375067, i32 -2141375036}
!32 = metadata !{i32 -2141364111, i32 -2141364104, i32 -2141364090, i32 -2141364088, i32 -2141364818, i32 -2141364048, i32 -2141364000, i32 -2141363934, i32 -2141363872, i32 -2141363820, i32 -2141364738, i32 -2141364713, i32 -2141363612, i32 -2141364640, i32 -2141364615, i32 -2141363352, i32 -2141363428, i32 -2141363335, i32 -2141363384, i32 -2141365380, i32 -2141365339, i32 -2141362512, i32 -2141362498, i32 -2141362496, i32 -2141363226, i32 -2141362456, i32 -2141362408, i32 -2141362342, i32 -2141362280, i32 -2141362228, i32 -2141363146, i32 -2141363121, i32 -2141362020, i32 -2141363048, i32 -2141363023, i32 -2141361760, i32 -2141361836, i32 -2141361743, i32 -2141361792, i32 -2141365307, i32 -2141365268, i32 -2141365239, i32 -2141365193, i32 -2141365168, i32 -2141361726, i32 -2141361682, i32 -2141361659, i32 -2141361626, i32 -2141361595}
!33 = metadata !{i32 -2141765572, i32 -2141765547, i32 -2141765277, i32 -2141765480, i32 -2141765449, i32 -2141765419}
!34 = metadata !{i32 -2141765048}
!35 = metadata !{i32 -2141753701, i32 -2141753694, i32 -2141753680, i32 -2141753678, i32 -2141754408, i32 -2141753638, i32 -2141753590, i32 -2141753524, i32 -2141753462, i32 -2141753410, i32 -2141754328, i32 -2141754303, i32 -2141753202, i32 -2141754230, i32 -2141754205, i32 -2141752942, i32 -2141753018, i32 -2141752925, i32 -2141752974, i32 -2141754985, i32 -2141754944, i32 -2141752102, i32 -2141752088, i32 -2141752086, i32 -2141752816, i32 -2141752046, i32 -2141751998, i32 -2141751932, i32 -2141751870, i32 -2141751818, i32 -2141752736, i32 -2141752711, i32 -2141751610, i32 -2141752638, i32 -2141752613, i32 -2141751350, i32 -2141751426, i32 -2141751333, i32 -2141751382, i32 -2141754912, i32 -2141754873, i32 -2141754844, i32 -2141754819, i32 -2141751316, i32 -2141751272, i32 -2141751249, i32 -2141751216, i32 -2141751185}
!36 = metadata !{i32 -2141693222, i32 -2141693197, i32 -2141692927, i32 -2141693130, i32 -2141693099, i32 -2141693069}
!37 = metadata !{i32 -2146494471}
!38 = metadata !{i32 -2146481795}
!39 = metadata !{i32 -2141772545}
!40 = metadata !{i32 744221}
!41 = metadata !{i32 -2141687755}
!42 = metadata !{i32 -2141686123}
!43 = metadata !{i32 -2141142601}
!44 = metadata !{i32 -2141184580}
!45 = metadata !{i32 -2141183890}
!46 = metadata !{i32 -2141183235}
!47 = metadata !{i32 -2141180569}
!48 = metadata !{i32 -2141172726}
!49 = metadata !{i32 -2141172079}
!50 = metadata !{i32 -2141169572}
!51 = metadata !{i32 -2141165908}
!52 = metadata !{i32 -2141165210}
!53 = metadata !{i32 -2141164526}
!54 = metadata !{i32 -2141163828}
!55 = metadata !{i32 -2141163172}
!56 = metadata !{i32 -2141162516}
!57 = metadata !{i32 -2141160579}
!58 = metadata !{i32 -2141158817}
!59 = metadata !{i32 -2141157220}
!60 = metadata !{i32 -2141155663}
!61 = metadata !{i32 -2141153995}
!62 = metadata !{i32 -2141152318}
!63 = metadata !{i32 -2141151189}
!64 = metadata !{i32 -2141150541}
!65 = metadata !{i32 -2141149872}
!66 = metadata !{i32 -2141149203}
!67 = metadata !{i32 -2141148541}
!68 = metadata !{i32 -2141147893}
!69 = metadata !{i32 -2141147238}
!70 = metadata !{i32 -2141146569}
!71 = metadata !{i32 -2141145935}
!72 = metadata !{i32 -2141145294}
!73 = metadata !{i32 -2141144674}
!74 = metadata !{i32 -2141144033}
!75 = metadata !{i32 -2141143406}
!76 = metadata !{i32 411741}
!77 = metadata !{i32 410569}
!78 = metadata !{i32 -2141168689}
!79 = metadata !{i32 -2141166577}
