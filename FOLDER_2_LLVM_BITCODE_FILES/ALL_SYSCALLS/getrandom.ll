; ModuleID = 'getrandom.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tracepoint = type { i8*, %struct.static_key, void ()*, void ()*, %struct.tracepoint_func* }
%struct.static_key = type { %struct.atomic_t }
%struct.atomic_t = type { i32 }
%struct.tracepoint_func = type { i8*, i8* }
%struct.ftrace_event_call = type { %struct.list_head, %struct.ftrace_event_class*, %union.anon, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }
%struct.ftrace_event_class = type { i8*, i8*, i8*, {}*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }
%union.anon = type { i8* }
%struct.trace_event = type { %struct.hlist_node, %struct.list_head, i32, %struct.trace_event_functions* }
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.trace_event_functions = type { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)*, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)*, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)*, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* }
%struct.trace_iterator = type { %struct.trace_array*, %struct.tracer*, %struct.trace_buffer*, i8*, i32, %struct.mutex, %struct.ring_buffer_iter**, i64, %struct.trace_seq, [1 x %struct.cpumask], i8, %struct.trace_seq, %struct.trace_entry*, i64, i32, i32, i32, i64, i64, i64 }
%struct.trace_array = type opaque
%struct.tracer = type opaque
%struct.trace_buffer = type opaque
%struct.mutex = type { %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue }
%struct.spinlock = type { %union.anon.0 }
%union.anon.0 = type { %struct.raw_spinlock }
%struct.raw_spinlock = type { %struct.arch_spinlock }
%struct.arch_spinlock = type { %union.anon.1 }
%union.anon.1 = type { i16 }
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
%struct.vm_area_struct = type { i64, i64, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i64, %struct.mm_struct*, %struct.pgprot, i64, %union.anon.7, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i64, %struct.file*, i8*, %struct.mempolicy* }
%struct.pgprot = type { i64 }
%union.anon.7 = type { %struct.anon.8 }
%struct.anon.8 = type { %struct.rb_node, i64 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.vm_fault*)*, void (%struct.vm_area_struct*, %struct.vm_fault*)*, i32 (%struct.vm_area_struct*, %struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i64, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.mempolicy*)*, %struct.mempolicy* (%struct.vm_area_struct*, i64)*, i32 (%struct.vm_area_struct*, i64, i64, i64)* }
%struct.vm_fault = type { i32, i64, i8*, %struct.page*, i64, %struct.pte_t* }
%struct.page = type { i64, %union.anon.9, %struct.anon.10, %union.anon.16, %union.anon.18, [8 x i8] }
%union.anon.9 = type { %struct.address_space* }
%struct.address_space = type { %struct.inode*, %struct.radix_tree_root, %struct.spinlock, %struct.atomic_t, %struct.rb_root, %struct.list_head, %struct.rw_semaphore, i64, i64, i64, %struct.address_space_operations*, i64, %struct.backing_dev_info*, %struct.spinlock, %struct.list_head, i8* }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i64, %union.anon.45, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.spinlock, i16, i32, i64, i64, %struct.mutex, i64, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.46, i64, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.file_operations*, %struct.file_lock*, %struct.address_space, %struct.list_head, %union.anon.49, i32, i32, %struct.hlist_head, i8* }
%struct.kgid_t = type { i32 }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.nameidata*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, void (%struct.dentry*, %struct.nameidata*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.vfsmount*, %struct.dentry*, %struct.kstat*)*, i32 (%struct.dentry*, i8*, i8*, i64, i32)*, i64 (%struct.dentry*, i8*, i8*, i64)*, i64 (%struct.dentry*, i8*, i64)*, i32 (%struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16, i32*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, i32 (%struct.dentry*, %struct.file*, %struct.cred*)*, [40 x i8] }
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [32 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i64, i8*, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.52 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.5, i8* }
%union.anon.5 = type { i64 }
%struct.lockref = type { %union.anon.50 }
%union.anon.50 = type { i64 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, %struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.dentry*, i1)*, [40 x i8] }
%struct.vfsmount = type opaque
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%union.anon.52 = type { %struct.hlist_node }
%struct.nameidata = type opaque
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.file* }
%struct.kstat = type { i64, i32, i16, i32, %struct.kuid_t, %struct.kgid_t, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64 }
%struct.fiemap_extent_info = type { i32, i32, i32, %struct.fiemap_extent* }
%struct.fiemap_extent = type { i64, i64, i64, [2 x i64], i32, [3 x i32] }
%struct.super_block = type { %struct.list_head, i32, i8, i64, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i64, i64, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.list_head, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, [32 x i8], [16 x i8], i8*, i32, i32, i32, %struct.mutex, i8*, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic64_t, i32, %struct.workqueue_struct*, %struct.hlist_head, [24 x i8], %struct.list_lru, [48 x i8], %struct.list_lru, %struct.callback_head, i32, [28 x i8] }
%struct.file_system_type = type { i8*, i32, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
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
%struct.sock = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.2, i8*, i16, i16, i32, %struct.kernfs_iattrs* }
%union.anon.2 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_ops = type { i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i64, i8, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)* }
%struct.seq_file = type { i8*, i64, i64, i64, i64, i64, i64, i64, %struct.mutex, %struct.seq_operations*, i32, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, i8*, %struct.mutex, i32, %struct.list_head, i8*, i64, i8, %struct.vm_operations_struct* }
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.kref = type { %struct.atomic_t }
%struct.module_param_attrs = type opaque
%struct.module_attribute = type { %struct.attribute, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*)*, i64 (%struct.module_attribute*, %struct.module_kobject*, i8*, i64)*, void (%struct.module*, i8*)*, i32 (%struct.module*)*, void (%struct.module*)* }
%struct.kernel_param = type { i8*, %struct.kernel_param_ops*, i16, i8, i8, %union.anon.53 }
%struct.kernel_param_ops = type { i32, i32 (i8*, %struct.kernel_param*)*, i32 (i8*, %struct.kernel_param*)*, void (i8*)* }
%union.anon.53 = type { i8* }
%struct.kernel_symbol = type { i64, i8* }
%struct.exception_table_entry = type { i32, i32 }
%struct.mod_arch_specific = type {}
%struct.bug_entry = type { i32, i32, i16, i16 }
%struct.elf64_sym = type { i32, i8, i8, i16, i64, i64 }
%struct.module_sect_attrs = type opaque
%struct.module_notes_attrs = type opaque
%struct.lock_class_key = type {}
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i64 (%struct.super_block*, i32)*, i64 (%struct.super_block*, i64, i32)* }
%struct.writeback_control = type { i64, i64, i64, i64, i32, i8 }
%struct.kstatfs = type opaque
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.atomic_t, %struct.__wait_queue_head, %struct.super_block*, %struct.kqid, i64, i64, %struct.mem_dqblk }
%struct.__wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.kqid = type { %union.anon.42, i32 }
%union.anon.42 = type { %struct.kuid_t }
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
%struct.xattr_handler = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, %struct.list_head, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i32, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.list_head, i64, i32, %struct.mutex }
%struct.hd_struct = type { i64, i64, %struct.seqcount, i64, i32, %struct.device, %struct.kobject*, i32, i32, %struct.partition_meta_info*, i64, [2 x %struct.atomic_t], %struct.disk_stats*, %struct.atomic_t, %struct.callback_head }
%struct.device = type { %struct.device*, %struct.device_private*, %struct.kobject, i8*, %struct.device_type*, %struct.mutex, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.dev_pm_info, %struct.dev_pm_domain*, i32, i64*, i64, i64, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.dev_archdata, %struct.device_node*, %struct.acpi_dev_node, i32, i32, %struct.spinlock, %struct.list_head, %struct.klist_node, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, i8 }
%struct.device_private = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.device_attribute*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key }
%struct.device_attribute = type { %struct.attribute, i64 (%struct.device*, %struct.device_attribute*, i8*)*, i64 (%struct.device*, %struct.device_attribute*, i8*, i64)* }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.dev_pm_ops*, %struct.driver_private* }
%struct.of_device_id = type opaque
%struct.acpi_device_id = type opaque
%struct.driver_private = type opaque
%struct.dev_pm_info = type { %struct.pm_message, [2 x i8], %struct.spinlock, %struct.list_head, %struct.completion, %struct.wakeup_source*, i8, %struct.timer_list, i64, %struct.work_struct, %struct.__wait_queue_head, %struct.atomic_t, %struct.atomic_t, [2 x i8], i32, i32, i32, i32, i64, i64, i64, i64, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.completion = type { i32, %struct.__wait_queue_head }
%struct.wakeup_source = type { i8*, %struct.list_head, %struct.spinlock, %struct.timer_list, i64, %union.ktime, %union.ktime, %union.ktime, %union.ktime, %union.ktime, i64, i64, i64, i64, i64, i8 }
%struct.timer_list = type { %struct.list_head, i64, %struct.tvec_base*, void (i64)*, i64, i32, i32, i8*, [16 x i8] }
%struct.tvec_base = type opaque
%struct.work_struct = type { %struct.atomic64_t, %struct.list_head, void (%struct.work_struct*)* }
%struct.pm_subsys_data = type { %struct.spinlock, i32 }
%struct.dev_pm_qos = type opaque
%struct.dev_pm_domain = type { %struct.dev_pm_ops, void (%struct.device*, i1)* }
%struct.device_dma_parameters = type { i32, i64 }
%struct.dma_coherent_mem = type opaque
%struct.dev_archdata = type { %struct.dma_map_ops*, i8* }
%struct.dma_map_ops = type opaque
%struct.device_node = type opaque
%struct.acpi_dev_node = type { %struct.acpi_device* }
%struct.acpi_device = type opaque
%struct.klist_node = type { i8*, %struct.list_head, %struct.kref }
%struct.class = type { i8*, %struct.module*, %struct.class_attribute*, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.class_attribute = type { %struct.attribute, i64 (%struct.class*, %struct.class_attribute*, i8*)*, i64 (%struct.class*, %struct.class_attribute*, i8*, i64)* }
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.bin_attribute = type { %struct.attribute, i64, i8*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.iommu_group = type opaque
%struct.partition_meta_info = type { [37 x i8], [64 x i8] }
%struct.disk_stats = type { [2 x i64], [2 x i64], [2 x i64], [2 x i64], i64, i64 }
%struct.gendisk = type { i32, i32, i32, [32 x i8], i8* (%struct.gendisk*, i16*)*, i32, i32, %struct.disk_part_tbl*, %struct.hd_struct, %struct.block_device_operations*, %struct.request_queue*, i8*, i32, %struct.device*, %struct.kobject*, %struct.timer_rand_state*, %struct.atomic_t, %struct.disk_events*, i32 }
%struct.disk_part_tbl = type { %struct.callback_head, i32, %struct.hd_struct*, [0 x %struct.hd_struct*] }
%struct.block_device_operations = type opaque
%struct.timer_rand_state = type { i64, i64, i64, i8 }
%struct.disk_events = type opaque
%struct.request_queue = type opaque
%struct.mtd_info = type opaque
%struct.quota_info = type { i32, %struct.mutex, %struct.mutex, [2 x %struct.inode*], [2 x %struct.mem_dqinfo], [2 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i64, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)* }
%struct.sb_writers = type { [3 x %struct.percpu_counter], %struct.__wait_queue_head, i32, %struct.__wait_queue_head }
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.shrinker = type { i64 (%struct.shrinker*, %struct.shrink_control*)*, i64 (%struct.shrinker*, %struct.shrink_control*)*, i32, i64, i64, %struct.list_head, %struct.atomic64_t* }
%struct.shrink_control = type { i32, i64, i32 }
%struct.workqueue_struct = type opaque
%struct.list_lru = type { %struct.list_lru_node*, %struct.nodemask_t }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_head, i64, [32 x i8] }
%union.anon.45 = type { i32 }
%struct.timespec = type { i64, i64 }
%union.anon.46 = type { %struct.callback_head }
%struct.file_operations = type { %struct.module*, i64 (%struct.file*, i64, i32)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, void (%struct.file*, %struct.vm_area_struct*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (%struct.kiocb*, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)* }
%struct.kiocb = type opaque
%struct.iovec = type opaque
%struct.iov_iter = type opaque
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.poll_table_struct = type { void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)*, i64 }
%struct.file_lock = type { %struct.file_lock*, %struct.hlist_node, %struct.list_head, i8*, i32, i8, i32, i32, %struct.pid*, %struct.__wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i64, i64, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.47 }
%struct.pid = type { %struct.atomic_t, i32, [3 x %struct.hlist_head], %struct.callback_head, [1 x %struct.upid] }
%struct.upid = type { i32, %struct.pid_namespace*, %struct.hlist_node }
%struct.pid_namespace = type { %struct.kref, [128 x %struct.pidmap], %struct.callback_head, i32, i32, %struct.task_struct*, %struct.kmem_cache*, i32, %struct.pid_namespace*, %struct.vfsmount*, %struct.dentry*, %struct.dentry*, %struct.bsd_acct_struct*, %struct.user_namespace*, %struct.work_struct, %struct.kgid_t, i32, i32, %struct.ns_common }
%struct.pidmap = type { %struct.atomic_t, i8* }
%struct.kmem_cache = type opaque
%struct.bsd_acct_struct = type opaque
%struct.user_namespace = type opaque
%struct.ns_common = type { %struct.atomic64_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
%struct.fasync_struct = type { %struct.spinlock, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i32 (%struct.file_lock*, %struct.file_lock*)*, i64 (%struct.file_lock*)*, void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock**, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)* }
%union.anon.47 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%union.anon.49 = type { %struct.pipe_inode_info* }
%struct.hlist_head = type { %struct.hlist_node* }
%struct.radix_tree_root = type { i32, i32, %struct.radix_tree_node* }
%struct.radix_tree_node = type { i32, i32, %union.anon.43, %struct.list_head, [64 x i8*], [3 x [1 x i64]] }
%union.anon.43 = type { %struct.anon.44 }
%struct.anon.44 = type { %struct.radix_tree_node*, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i64 (i32, %struct.kiocb*, %struct.iov_iter*, i64)*, i32 (%struct.address_space*, i64, i32, i8**, i64*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i32 (%struct.page*)*, i32 (%struct.page*, i64, i64)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.swap_info_struct = type opaque
%struct.anon.10 = type { %union.anon.11, %union.anon.12 }
%union.anon.11 = type { i64 }
%union.anon.12 = type { i64 }
%union.anon.16 = type { %struct.list_head }
%union.anon.18 = type { i64 }
%struct.pte_t = type { i64 }
%struct.pgd_t = type { i64 }
%struct.atomic64_t = type { i64 }
%struct.rw_semaphore = type { i64, %struct.list_head, %struct.raw_spinlock, %struct.optimistic_spin_queue, %struct.task_struct* }
%struct.mm_rss_stat = type { [3 x %struct.atomic64_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i8*, i32, i16, %struct.mutex, i8* }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.kioctx_table = type opaque
%struct.file = type { %union.anon.4, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, %struct.atomic64_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space* }
%union.anon.4 = type { %struct.callback_head }
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.rwlock_t = type { %struct.qrwlock }
%struct.qrwlock = type { %struct.atomic_t, %struct.arch_spinlock }
%struct.file_ra_state = type { i64, i32, i32, i32, i32, i64 }
%struct.uprobes_state = type {}
%struct.task_rss_stat = type { i32, [3 x i32] }
%struct.pid_link = type { %struct.hlist_node, %struct.pid* }
%struct.cputime = type { i64, i64 }
%struct.task_cputime = type { i64, i64, i64 }
%struct.cred = type { %struct.atomic_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %struct.callback_head }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.key = type { %struct.atomic_t, i32, %union.anon.6, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.36, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i64, %union.anon.37, %union.anon.39, %union.anon.40 }
%union.anon.6 = type { %struct.rb_node }
%struct.key_user = type opaque
%union.anon.36 = type { i64 }
%union.anon.37 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { %struct.key_type*, i8*, i64 }
%struct.key_type = type opaque
%union.anon.39 = type { %struct.list_head }
%union.anon.40 = type { %union.anon.41 }
%union.anon.41 = type { [2 x i8*] }
%struct.user_struct = type { %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i64, i64, %struct.key*, %struct.key*, %struct.hlist_node, %struct.kuid_t, %struct.atomic64_t }
%struct.group_info = type { %struct.atomic_t, i32, i32, [32 x %struct.kgid_t], [0 x %struct.kgid_t*] }
%struct.sysv_sem = type { %struct.sem_undo_list* }
%struct.sem_undo_list = type opaque
%struct.sysv_shm = type { %struct.list_head }
%struct.thread_struct = type { [3 x %struct.desc_struct], i64, i64, i64, i16, i16, i16, i16, i64, i64, [4 x %struct.perf_event*], i64, i64, i64, i64, i64, %struct.fpu, i64*, i64, i32, i8 }
%struct.desc_struct = type <{ %union.anon.19 }>
%union.anon.19 = type { %struct.anon.20 }
%struct.anon.20 = type { i32, i32 }
%struct.perf_event = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, i32, i32, %struct.perf_event*, %struct.pmu*, i32, i32, %struct.local64_t, %struct.atomic64_t, i64, i64, i64, i64, i64, i64, %struct.perf_event_attr, i16, i16, i16, %struct.hw_perf_event, %struct.perf_event_context*, %struct.atomic64_t, %struct.atomic64_t, %struct.atomic64_t, %struct.mutex, %struct.list_head, %struct.perf_event*, i32, i32, %struct.list_head, %struct.task_struct*, %struct.mutex, %struct.atomic_t, %struct.ring_buffer*, %struct.list_head, i64, i32, %struct.__wait_queue_head, %struct.fasync_struct*, i32, i32, i32, %struct.irq_work, %struct.atomic_t, void (%struct.perf_event*)*, %struct.callback_head, %struct.pid_namespace*, i64, void (%struct.perf_event*, %struct.perf_sample_data*, %struct.pt_regs*)*, i8*, %struct.ftrace_event_call*, %struct.event_filter* }
%struct.pmu = type { %struct.list_head, %struct.module*, %struct.device*, %struct.attribute_group**, i8*, i32, i32, i32*, %struct.perf_cpu_context*, i32, i32, void (%struct.pmu*)*, void (%struct.pmu*)*, i32 (%struct.perf_event*)*, i32 (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*)*, void (%struct.pmu*)*, i32 (%struct.pmu*)*, void (%struct.pmu*)*, i32 (%struct.perf_event*)*, void ()* }
%struct.perf_cpu_context = type { %struct.perf_event_context, %struct.perf_event_context*, i32, i32, %struct.hrtimer, %union.ktime, %struct.list_head, %struct.pmu*, %struct.perf_cgroup* }
%struct.perf_event_context = type { %struct.pmu*, i32, %struct.raw_spinlock, %struct.mutex, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i32, i32, i32, i32, %struct.atomic_t, %struct.task_struct*, i64, i64, %struct.perf_event_context*, i64, i64, i32, i32, i32, %struct.callback_head, %struct.delayed_work, i8 }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.perf_cgroup = type opaque
%struct.local64_t = type { %struct.local_t }
%struct.local_t = type { %struct.atomic64_t }
%struct.perf_event_attr = type { i32, i32, i64, %union.anon.54, i64, i64, [8 x i8], %union.anon.55, i32, %union.anon.56, %union.anon.57, i64, i64, i32, i32, i64 }
%union.anon.54 = type { i64 }
%union.anon.55 = type { i32 }
%union.anon.56 = type { i64 }
%union.anon.57 = type { i64 }
%struct.hw_perf_event = type { %union.anon.58, i32, %struct.local64_t, i64, i64, %struct.local64_t, i64, i64, i64, i64 }
%union.anon.58 = type { %struct.anon.59 }
%struct.anon.59 = type { i64, i64, i64, i64, i32, i32, i32, i32, %struct.hw_perf_event_extra, %struct.hw_perf_event_extra, %struct.event_constraint* }
%struct.hw_perf_event_extra = type { i64, i32, i32, i32 }
%struct.event_constraint = type opaque
%struct.ring_buffer = type opaque
%struct.irq_work = type { i64, %struct.llist_node, void (%struct.irq_work*)* }
%struct.perf_sample_data = type { i64, %struct.perf_raw_record*, %struct.perf_branch_stack*, i64, i64, i64, %union.perf_mem_data_src, i64, i64, %struct.anon.64, i64, i64, i64, %struct.anon.65, %struct.perf_callchain_entry*, %struct.perf_regs, %struct.pt_regs, %struct.perf_regs, i64, [56 x i8] }
%struct.perf_raw_record = type { i32, i8* }
%struct.perf_branch_stack = type { i64, [0 x %struct.perf_branch_entry] }
%struct.perf_branch_entry = type { i64, i64, [8 x i8] }
%union.perf_mem_data_src = type { i64 }
%struct.anon.64 = type { i32, i32 }
%struct.anon.65 = type { i32, i32 }
%struct.perf_callchain_entry = type { i64, [127 x i64] }
%struct.pt_regs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.perf_regs = type { i64, %struct.pt_regs* }
%struct.fpu = type { i32, i32, %union.thread_xstate* }
%union.thread_xstate = type { %struct.i387_fxsave_struct, [576 x i8] }
%struct.i387_fxsave_struct = type { i16, i16, i16, i16, %union.anon.22, i32, i32, [32 x i32], [64 x i32], [12 x i32], %union.anon.25 }
%union.anon.22 = type { %struct.anon.23 }
%struct.anon.23 = type { i64, i64 }
%union.anon.25 = type { [12 x i32] }
%struct.fs_struct = type opaque
%struct.files_struct = type opaque
%struct.nsproxy = type { %struct.atomic_t, %struct.uts_namespace*, %struct.ipc_namespace*, %struct.mnt_namespace*, %struct.pid_namespace*, %struct.net* }
%struct.uts_namespace = type { %struct.kref, %struct.new_utsname, %struct.user_namespace*, %struct.ns_common }
%struct.new_utsname = type { [65 x i8], [65 x i8], [65 x i8], [65 x i8], [65 x i8], [65 x i8] }
%struct.ipc_namespace = type opaque
%struct.mnt_namespace = type opaque
%struct.net = type opaque
%struct.signal_struct = type { %struct.atomic_t, %struct.atomic_t, i32, %struct.list_head, %struct.__wait_queue_head, %struct.task_struct*, %struct.sigpending, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, %struct.pid*, %union.ktime, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.task_cputime, [3 x %struct.list_head], %struct.pid*, i32, %struct.tty_struct*, %struct.seqlock_t, i64, i64, i64, i64, i64, i64, %struct.cputime, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.task_io_accounting, i64, [16 x %struct.rlimit], %struct.pacct_struct, %struct.taskstats*, i32, i32, %struct.tty_audit_buf*, %struct.rw_semaphore, i32, i16, i16, %struct.mutex }
%struct.cpu_itimer = type { i64, i64, i32, i32 }
%struct.thread_group_cputimer = type { %struct.task_cputime, i32, %struct.raw_spinlock }
%struct.tty_struct = type opaque
%struct.seqlock_t = type { %struct.seqcount, %struct.spinlock }
%struct.rlimit = type { i64, i64 }
%struct.pacct_struct = type { i32, i64, i64, i64, i64, i64, i64 }
%struct.taskstats = type opaque
%struct.tty_audit_buf = type opaque
%struct.sighand_struct = type { %struct.atomic_t, [64 x %struct.k_sigaction], %struct.spinlock, %struct.__wait_queue_head }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i64, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [1 x i64] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.audit_context = type opaque
%struct.kuid_t = type { i32 }
%struct.seccomp = type { i32, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.rb_root = type { %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.backing_dev_info = type opaque
%struct.io_context = type opaque
%struct.siginfo = type { i32, i32, i32, %union.anon.27 }
%union.anon.27 = type { %struct.anon.31, [80 x i8] }
%struct.anon.31 = type { i32, i32, i32, i64, i64 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [1 x i64] }
%struct.seqcount = type { i32 }
%struct.css_set = type opaque
%struct.robust_list_head = type opaque
%struct.compat_robust_list_head = type opaque
%struct.futex_pi_state = type opaque
%struct.mempolicy = type opaque
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.pipe_inode_info = type opaque
%struct.page_frag = type { %struct.page*, i32, i32 }
%struct.task_delay_info = type { %struct.spinlock, i32, i64, i64, i64, i32, i32, i64, i64, i32 }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
%struct.ring_buffer_iter = type opaque
%struct.trace_seq = type { [4096 x i8], %struct.seq_buf, i32 }
%struct.seq_buf = type { i8*, i64, i64, i64 }
%struct.trace_entry = type { i16, i8, i8, i32 }
%struct.event_filter = type opaque
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.poolinfo = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.fast_pool = type { [4 x i32], i64, i16, i8 }
%struct.ctl_table = type { i8*, i8*, i32, i16, %struct.ctl_table*, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)*, %struct.ctl_table_poll*, i8*, i8* }
%struct.ctl_table_poll = type { %struct.atomic_t, %struct.__wait_queue_head }
%struct.entropy_store = type { %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8] }
%struct.ftrace_event_buffer = type { %struct.ring_buffer*, %struct.ring_buffer_event*, %struct.ftrace_event_file*, i8*, i64, i32 }
%struct.ring_buffer_event = type { [4 x i8], [0 x i32] }
%struct.ftrace_event_file = type { %struct.list_head, %struct.ftrace_event_call*, %struct.event_filter*, %struct.dentry*, %struct.trace_array*, %struct.ftrace_subsystem_dir*, %struct.list_head, i64, %struct.atomic_t, %struct.atomic_t }
%struct.ftrace_subsystem_dir = type opaque
%struct.stack_frame = type { %struct.stack_frame*, i64 }
%struct.anon.71 = type { i64, i32, i32 }
%struct.__wait_queue = type { i32, i8*, i32 (%struct.__wait_queue*, i32, i32, i8*)*, %struct.list_head }
%struct.thread_info = type { %struct.task_struct*, %struct.exec_domain*, i32, i32, i32, i32, %struct.mm_segment_t, %struct.restart_block, i8*, i8 }
%struct.exec_domain = type { i8*, void (i32, %struct.pt_regs*)*, i8, i8, i64*, i64*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.module*, %struct.exec_domain* }
%struct.map_segment = type opaque
%struct.mm_segment_t = type { i64 }
%struct.restart_block = type { i64 (%struct.restart_block*)*, %union.anon.66 }
%union.anon.66 = type { %struct.anon.67 }
%struct.anon.67 = type { i32*, i32, i32, i32, i64, i32* }
%union.anon.70 = type { [3 x i64] }

@__tpstrtab_add_device_randomness = internal constant [22 x i8] c"add_device_randomness\00", section "__tracepoints_strings", align 16
@__tracepoint_add_device_randomness = global %struct.tracepoint { i8* getelementptr inbounds ([22 x i8]* @__tpstrtab_add_device_randomness, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_add_device_randomness = internal constant %struct.tracepoint* @__tracepoint_add_device_randomness, section "__tracepoints_ptrs", align 8
@__tpstrtab_mix_pool_bytes = internal constant [15 x i8] c"mix_pool_bytes\00", section "__tracepoints_strings", align 1
@__tracepoint_mix_pool_bytes = global %struct.tracepoint { i8* getelementptr inbounds ([15 x i8]* @__tpstrtab_mix_pool_bytes, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_mix_pool_bytes = internal constant %struct.tracepoint* @__tracepoint_mix_pool_bytes, section "__tracepoints_ptrs", align 8
@__tpstrtab_mix_pool_bytes_nolock = internal constant [22 x i8] c"mix_pool_bytes_nolock\00", section "__tracepoints_strings", align 16
@__tracepoint_mix_pool_bytes_nolock = global %struct.tracepoint { i8* getelementptr inbounds ([22 x i8]* @__tpstrtab_mix_pool_bytes_nolock, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_mix_pool_bytes_nolock = internal constant %struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, section "__tracepoints_ptrs", align 8
@__tpstrtab_credit_entropy_bits = internal constant [20 x i8] c"credit_entropy_bits\00", section "__tracepoints_strings", align 16
@__tracepoint_credit_entropy_bits = global %struct.tracepoint { i8* getelementptr inbounds ([20 x i8]* @__tpstrtab_credit_entropy_bits, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_credit_entropy_bits = internal constant %struct.tracepoint* @__tracepoint_credit_entropy_bits, section "__tracepoints_ptrs", align 8
@__tpstrtab_push_to_pool = internal constant [13 x i8] c"push_to_pool\00", section "__tracepoints_strings", align 1
@__tracepoint_push_to_pool = global %struct.tracepoint { i8* getelementptr inbounds ([13 x i8]* @__tpstrtab_push_to_pool, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_push_to_pool = internal constant %struct.tracepoint* @__tracepoint_push_to_pool, section "__tracepoints_ptrs", align 8
@__tpstrtab_debit_entropy = internal constant [14 x i8] c"debit_entropy\00", section "__tracepoints_strings", align 1
@__tracepoint_debit_entropy = global %struct.tracepoint { i8* getelementptr inbounds ([14 x i8]* @__tpstrtab_debit_entropy, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_debit_entropy = internal constant %struct.tracepoint* @__tracepoint_debit_entropy, section "__tracepoints_ptrs", align 8
@__tpstrtab_add_input_randomness = internal constant [21 x i8] c"add_input_randomness\00", section "__tracepoints_strings", align 16
@__tracepoint_add_input_randomness = global %struct.tracepoint { i8* getelementptr inbounds ([21 x i8]* @__tpstrtab_add_input_randomness, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_add_input_randomness = internal constant %struct.tracepoint* @__tracepoint_add_input_randomness, section "__tracepoints_ptrs", align 8
@__tpstrtab_add_disk_randomness = internal constant [20 x i8] c"add_disk_randomness\00", section "__tracepoints_strings", align 16
@__tracepoint_add_disk_randomness = global %struct.tracepoint { i8* getelementptr inbounds ([20 x i8]* @__tpstrtab_add_disk_randomness, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_add_disk_randomness = internal constant %struct.tracepoint* @__tracepoint_add_disk_randomness, section "__tracepoints_ptrs", align 8
@__tpstrtab_xfer_secondary_pool = internal constant [20 x i8] c"xfer_secondary_pool\00", section "__tracepoints_strings", align 16
@__tracepoint_xfer_secondary_pool = global %struct.tracepoint { i8* getelementptr inbounds ([20 x i8]* @__tpstrtab_xfer_secondary_pool, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_xfer_secondary_pool = internal constant %struct.tracepoint* @__tracepoint_xfer_secondary_pool, section "__tracepoints_ptrs", align 8
@__tpstrtab_get_random_bytes = internal constant [17 x i8] c"get_random_bytes\00", section "__tracepoints_strings", align 16
@__tracepoint_get_random_bytes = global %struct.tracepoint { i8* getelementptr inbounds ([17 x i8]* @__tpstrtab_get_random_bytes, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_get_random_bytes = internal constant %struct.tracepoint* @__tracepoint_get_random_bytes, section "__tracepoints_ptrs", align 8
@__tpstrtab_get_random_bytes_arch = internal constant [22 x i8] c"get_random_bytes_arch\00", section "__tracepoints_strings", align 16
@__tracepoint_get_random_bytes_arch = global %struct.tracepoint { i8* getelementptr inbounds ([22 x i8]* @__tpstrtab_get_random_bytes_arch, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_get_random_bytes_arch = internal constant %struct.tracepoint* @__tracepoint_get_random_bytes_arch, section "__tracepoints_ptrs", align 8
@__tpstrtab_extract_entropy = internal constant [16 x i8] c"extract_entropy\00", section "__tracepoints_strings", align 16
@__tracepoint_extract_entropy = global %struct.tracepoint { i8* getelementptr inbounds ([16 x i8]* @__tpstrtab_extract_entropy, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_extract_entropy = internal constant %struct.tracepoint* @__tracepoint_extract_entropy, section "__tracepoints_ptrs", align 8
@__tpstrtab_extract_entropy_user = internal constant [21 x i8] c"extract_entropy_user\00", section "__tracepoints_strings", align 16
@__tracepoint_extract_entropy_user = global %struct.tracepoint { i8* getelementptr inbounds ([21 x i8]* @__tpstrtab_extract_entropy_user, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_extract_entropy_user = internal constant %struct.tracepoint* @__tracepoint_extract_entropy_user, section "__tracepoints_ptrs", align 8
@__tpstrtab_random_read = internal constant [12 x i8] c"random_read\00", section "__tracepoints_strings", align 1
@__tracepoint_random_read = global %struct.tracepoint { i8* getelementptr inbounds ([12 x i8]* @__tpstrtab_random_read, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_random_read = internal constant %struct.tracepoint* @__tracepoint_random_read, section "__tracepoints_ptrs", align 8
@__tpstrtab_urandom_read = internal constant [13 x i8] c"urandom_read\00", section "__tracepoints_strings", align 1
@__tracepoint_urandom_read = global %struct.tracepoint { i8* getelementptr inbounds ([13 x i8]* @__tpstrtab_urandom_read, i32 0, i32 0), %struct.static_key zeroinitializer, void ()* null, void ()* null, %struct.tracepoint_func* null }, section "__tracepoints", align 8
@__tracepoint_ptr_urandom_read = internal constant %struct.tracepoint* @__tracepoint_urandom_read, section "__tracepoints_ptrs", align 8
@.str = private unnamed_addr constant [7 x i8] c"random\00", align 1
@event_class_add_device_randomness = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i32, i64)* @ftrace_raw_event_add_device_randomness to i8*), i8* bitcast (void (i8*, i32, i64)* @perf_trace_add_device_randomness to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_add_device_randomness, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_device_randomness to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_device_randomness to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_add_device_randomness = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_add_device_randomness, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_add_device_randomness = internal constant [51 x i8] c"\22bytes %d caller %pF\22, REC->bytes, (void *)REC->IP\00", align 16
@event_add_device_randomness = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_device_randomness to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_add_device_randomness }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_add_device_randomness }, i8* getelementptr inbounds ([51 x i8]* @print_fmt_add_device_randomness, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_add_device_randomness = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_device_randomness to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_random__mix_pool_bytes = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i64)* @ftrace_raw_event_random__mix_pool_bytes to i8*), i8* bitcast (void (i8*, i8*, i32, i64)* @perf_trace_random__mix_pool_bytes to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_random__mix_pool_bytes, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__mix_pool_bytes to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__mix_pool_bytes to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_random__mix_pool_bytes = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_random__mix_pool_bytes, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_random__mix_pool_bytes = internal constant [76 x i8] c"\22%s pool: bytes %d caller %pF\22, REC->pool_name, REC->bytes, (void *)REC->IP\00", align 16
@event_mix_pool_bytes = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__mix_pool_bytes to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_mix_pool_bytes }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_random__mix_pool_bytes }, i8* getelementptr inbounds ([76 x i8]* @print_fmt_random__mix_pool_bytes, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_mix_pool_bytes = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_mix_pool_bytes to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_mix_pool_bytes_nolock = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__mix_pool_bytes to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_random__mix_pool_bytes }, i8* getelementptr inbounds ([76 x i8]* @print_fmt_random__mix_pool_bytes, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_mix_pool_bytes_nolock = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_mix_pool_bytes_nolock to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_credit_entropy_bits = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i32, i32, i64)* @ftrace_raw_event_credit_entropy_bits to i8*), i8* bitcast (void (i8*, i8*, i32, i32, i32, i64)* @perf_trace_credit_entropy_bits to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_credit_entropy_bits, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_credit_entropy_bits to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_credit_entropy_bits to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_credit_entropy_bits = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_credit_entropy_bits, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_credit_entropy_bits = internal constant [148 x i8] c"\22%s pool: bits %d entropy_count %d entropy_total %d caller %pF\22, REC->pool_name, REC->bits, REC->entropy_count, REC->entropy_total, (void *)REC->IP\00", align 16
@event_credit_entropy_bits = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_credit_entropy_bits to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_credit_entropy_bits }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_credit_entropy_bits }, i8* getelementptr inbounds ([148 x i8]* @print_fmt_credit_entropy_bits, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_credit_entropy_bits = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_credit_entropy_bits to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_push_to_pool = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i32)* @ftrace_raw_event_push_to_pool to i8*), i8* bitcast (void (i8*, i8*, i32, i32)* @perf_trace_push_to_pool to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_push_to_pool, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_push_to_pool to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_push_to_pool to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_push_to_pool = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_push_to_pool, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_push_to_pool = internal constant [87 x i8] c"\22%s: pool_bits %d input_pool_bits %d\22, REC->pool_name, REC->pool_bits, REC->input_bits\00", align 16
@event_push_to_pool = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_push_to_pool to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_push_to_pool }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_push_to_pool }, i8* getelementptr inbounds ([87 x i8]* @print_fmt_push_to_pool, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_push_to_pool = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_push_to_pool to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_debit_entropy = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32)* @ftrace_raw_event_debit_entropy to i8*), i8* bitcast (void (i8*, i8*, i32)* @perf_trace_debit_entropy to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_debit_entropy, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_debit_entropy to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_debit_entropy to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_debit_entropy = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_debit_entropy, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_debit_entropy = internal constant [53 x i8] c"\22%s: debit_bits %d\22, REC->pool_name, REC->debit_bits\00", align 16
@event_debit_entropy = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_debit_entropy to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_debit_entropy }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_debit_entropy }, i8* getelementptr inbounds ([53 x i8]* @print_fmt_debit_entropy, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_debit_entropy = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_debit_entropy to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_add_input_randomness = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i32)* @ftrace_raw_event_add_input_randomness to i8*), i8* bitcast (void (i8*, i32)* @perf_trace_add_input_randomness to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_add_input_randomness, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_input_randomness to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_input_randomness to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_add_input_randomness = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_add_input_randomness, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_add_input_randomness = internal constant [38 x i8] c"\22input_pool_bits %d\22, REC->input_bits\00", align 16
@event_add_input_randomness = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_input_randomness to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_add_input_randomness }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_add_input_randomness }, i8* getelementptr inbounds ([38 x i8]* @print_fmt_add_input_randomness, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_add_input_randomness = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_input_randomness to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_add_disk_randomness = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32)* @ftrace_raw_event_add_disk_randomness to i8*), i8* bitcast (void (i8*, i32, i32)* @perf_trace_add_disk_randomness to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_add_disk_randomness, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_disk_randomness to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_disk_randomness to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_add_disk_randomness = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_add_disk_randomness, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_add_disk_randomness = internal constant [135 x i8] c"\22dev %d,%d input_pool_bits %d\22, ((unsigned int) ((REC->dev) >> 20)), ((unsigned int) ((REC->dev) & ((1U << 20) - 1))), REC->input_bits\00", align 16
@event_add_disk_randomness = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_disk_randomness to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_add_disk_randomness }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_add_disk_randomness }, i8* getelementptr inbounds ([135 x i8]* @print_fmt_add_disk_randomness, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_add_disk_randomness = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_disk_randomness to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_xfer_secondary_pool = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i32, i32, i32)* @ftrace_raw_event_xfer_secondary_pool to i8*), i8* bitcast (void (i8*, i8*, i32, i32, i32, i32)* @perf_trace_xfer_secondary_pool to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_xfer_secondary_pool, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_xfer_secondary_pool to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_xfer_secondary_pool to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_xfer_secondary_pool = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_xfer_secondary_pool, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_xfer_secondary_pool = internal constant [162 x i8] c"\22pool %s xfer_bits %d request_bits %d pool_entropy %d input_entropy %d\22, REC->pool_name, REC->xfer_bits, REC->request_bits, REC->pool_entropy, REC->input_entropy\00", align 16
@event_xfer_secondary_pool = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_xfer_secondary_pool to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_xfer_secondary_pool }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_xfer_secondary_pool }, i8* getelementptr inbounds ([162 x i8]* @print_fmt_xfer_secondary_pool, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_xfer_secondary_pool = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_xfer_secondary_pool to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_random__get_random_bytes = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i32, i64)* @ftrace_raw_event_random__get_random_bytes to i8*), i8* bitcast (void (i8*, i32, i64)* @perf_trace_random__get_random_bytes to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_random__get_random_bytes, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__get_random_bytes to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__get_random_bytes to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_random__get_random_bytes = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_random__get_random_bytes, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_random__get_random_bytes = internal constant [53 x i8] c"\22nbytes %d caller %pF\22, REC->nbytes, (void *)REC->IP\00", align 16
@event_get_random_bytes = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__get_random_bytes to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_get_random_bytes }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_random__get_random_bytes }, i8* getelementptr inbounds ([53 x i8]* @print_fmt_random__get_random_bytes, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_get_random_bytes = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_get_random_bytes to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_get_random_bytes_arch = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__get_random_bytes to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_get_random_bytes_arch }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_random__get_random_bytes }, i8* getelementptr inbounds ([53 x i8]* @print_fmt_random__get_random_bytes, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_get_random_bytes_arch = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_get_random_bytes_arch to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_random__extract_entropy = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i32, i64)* @ftrace_raw_event_random__extract_entropy to i8*), i8* bitcast (void (i8*, i8*, i32, i32, i64)* @perf_trace_random__extract_entropy to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_random__extract_entropy, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__extract_entropy to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__extract_entropy to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_random__extract_entropy = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_random__extract_entropy, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_random__extract_entropy = internal constant [115 x i8] c"\22%s pool: nbytes %d entropy_count %d caller %pF\22, REC->pool_name, REC->nbytes, REC->entropy_count, (void *)REC->IP\00", align 16
@event_extract_entropy = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__extract_entropy to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_extract_entropy }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_random__extract_entropy }, i8* getelementptr inbounds ([115 x i8]* @print_fmt_random__extract_entropy, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_extract_entropy = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_extract_entropy to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_extract_entropy_user = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__extract_entropy to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_extract_entropy_user }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_random__extract_entropy }, i8* getelementptr inbounds ([115 x i8]* @print_fmt_random__extract_entropy, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_extract_entropy_user = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_extract_entropy_user to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_random_read = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32, i32, i32)* @ftrace_raw_event_random_read to i8*), i8* bitcast (void (i8*, i32, i32, i32, i32)* @perf_trace_random_read to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_random_read, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random_read to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random_read to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_random_read = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_random_read, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_random_read = internal constant [150 x i8] c"\22got_bits %d still_needed_bits %d blocking_pool_entropy_left %d input_entropy_left %d\22, REC->got_bits, REC->got_bits, REC->pool_left, REC->input_left\00", align 16
@event_random_read = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random_read to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_random_read }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_random_read }, i8* getelementptr inbounds ([150 x i8]* @print_fmt_random_read, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_random_read = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_random_read to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@event_class_urandom_read = internal global { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* } { i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32, i32)* @ftrace_raw_event_urandom_read to i8*), i8* bitcast (void (i8*, i32, i32, i32)* @perf_trace_urandom_read to i8*), i32 (%struct.ftrace_event_call*, i32, i8*)* @ftrace_event_reg, i32 (%struct.ftrace_event_call*)* @ftrace_define_fields_urandom_read, %struct.list_head* (%struct.ftrace_event_call*)* null, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_urandom_read to i8*), i64 48) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_urandom_read to i8*), i64 48) to %struct.list_head*) }, i32 (%struct.ftrace_event_call*)* @trace_event_raw_init }, section ".ref.data", align 8
@ftrace_event_type_funcs_urandom_read = internal global %struct.trace_event_functions { i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* @ftrace_raw_output_urandom_read, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null, i32 (%struct.trace_iterator*, i32, %struct.trace_event*)* null }, align 8
@print_fmt_urandom_read = internal constant [117 x i8] c"\22got_bits %d nonblocking_pool_entropy_left %d input_entropy_left %d\22, REC->got_bits, REC->pool_left, REC->input_left\00", align 16
@event_urandom_read = internal global { %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* } { %struct.list_head zeroinitializer, %struct.ftrace_event_class* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_urandom_read to %struct.ftrace_event_class*), { %struct.tracepoint* } { %struct.tracepoint* @__tracepoint_urandom_read }, %struct.trace_event { %struct.hlist_node zeroinitializer, %struct.list_head zeroinitializer, i32 0, %struct.trace_event_functions* @ftrace_event_type_funcs_urandom_read }, i8* getelementptr inbounds ([117 x i8]* @print_fmt_urandom_read, i32 0, i32 0), %struct.event_filter* null, i8* null, i8* null, i32 64, i32 0, %struct.hlist_head* null, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* null }, align 4
@__event_urandom_read = internal global %struct.ftrace_event_call* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_urandom_read to %struct.ftrace_event_call*), section "_ftrace_events", align 8
@poolinfo_table = internal global [2 x %struct.poolinfo] [%struct.poolinfo { i32 12, i32 128, i32 512, i32 4096, i32 32768, i32 104, i32 76, i32 51, i32 25, i32 1 }, %struct.poolinfo { i32 10, i32 32, i32 128, i32 1024, i32 8192, i32 26, i32 19, i32 14, i32 7, i32 1 }], align 16
@jiffies = external global i64
@__kstrtab_add_device_randomness = internal constant [22 x i8] c"add_device_randomness\00", section "__ksymtab_strings", align 1
@__ksymtab_add_device_randomness = constant %struct.kernel_symbol { i64 ptrtoint (void (i8*, i32)* @add_device_randomness to i64), i8* getelementptr inbounds ([22 x i8]* @__kstrtab_add_device_randomness, i32 0, i32 0) }, section "___ksymtab+add_device_randomness", align 8
@add_input_randomness.last_value = internal unnamed_addr global i8 0, align 1
@__kstrtab_add_input_randomness = internal constant [21 x i8] c"add_input_randomness\00", section "__ksymtab_strings", align 1
@__ksymtab_add_input_randomness = constant %struct.kernel_symbol { i64 ptrtoint (void (i32, i32, i32)* @add_input_randomness to i64), i8* getelementptr inbounds ([21 x i8]* @__kstrtab_add_input_randomness, i32 0, i32 0) }, section "___ksymtab_gpl+add_input_randomness", align 8
@this_cpu_off = external global i64
@irq_randomness = internal global %struct.fast_pool zeroinitializer, section ".data..percpu", align 8
@__kstrtab_add_disk_randomness = internal constant [20 x i8] c"add_disk_randomness\00", section "__ksymtab_strings", align 1
@__ksymtab_add_disk_randomness = constant %struct.kernel_symbol { i64 ptrtoint (void (%struct.gendisk*)* @add_disk_randomness to i64), i8* getelementptr inbounds ([20 x i8]* @__kstrtab_add_disk_randomness, i32 0, i32 0) }, section "___ksymtab_gpl+add_disk_randomness", align 8
@__kstrtab_get_random_bytes = internal constant [17 x i8] c"get_random_bytes\00", section "__ksymtab_strings", align 1
@__ksymtab_get_random_bytes = constant %struct.kernel_symbol { i64 ptrtoint (void (i8*, i32)* @get_random_bytes to i64), i8* getelementptr inbounds ([17 x i8]* @__kstrtab_get_random_bytes, i32 0, i32 0) }, section "___ksymtab+get_random_bytes", align 8
@__kstrtab_get_random_bytes_arch = internal constant [22 x i8] c"get_random_bytes_arch\00", section "__ksymtab_strings", align 1
@__ksymtab_get_random_bytes_arch = constant %struct.kernel_symbol { i64 ptrtoint (void (i8*, i32)* @get_random_bytes_arch to i64), i8* getelementptr inbounds ([22 x i8]* @__kstrtab_get_random_bytes_arch, i32 0, i32 0) }, section "___ksymtab+get_random_bytes_arch", align 8
@__initcall_rand_initializeearly = internal global i32 ()* @rand_initialize, section ".initcallearly.init", align 8
@random_fops = constant %struct.file_operations { %struct.module* null, i64 (%struct.file*, i64, i32)* @noop_llseek, i64 (%struct.file*, i8*, i64, i64*)* @random_read, i64 (%struct.file*, i8*, i64, i64*)* @random_write, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* null, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* null, i64 (%struct.kiocb*, %struct.iov_iter*)* null, i64 (%struct.kiocb*, %struct.iov_iter*)* null, i32 (%struct.file*, %struct.dir_context*)* null, i32 (%struct.file*, %struct.poll_table_struct*)* @random_poll, i64 (%struct.file*, i32, i64)* @random_ioctl, i64 (%struct.file*, i32, i64)* null, i32 (%struct.file*, %struct.vm_area_struct*)* null, void (%struct.file*, %struct.vm_area_struct*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i8*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i64, i64, i32)* null, i32 (%struct.kiocb*, i32)* null, i32 (i32, %struct.file*, i32)* @random_fasync, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)* null, i64 (%struct.file*, i64, i64, i64, i64)* null, i32 (i32)* null, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)* null, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)* null, i32 (%struct.file*, i64, %struct.file_lock**, i8**)* null, i64 (%struct.file*, i32, i64, i64)* null, void (%struct.seq_file*, %struct.file*)* null }, align 8
@urandom_fops = constant %struct.file_operations { %struct.module* null, i64 (%struct.file*, i64, i32)* @noop_llseek, i64 (%struct.file*, i8*, i64, i64*)* @urandom_read, i64 (%struct.file*, i8*, i64, i64*)* @random_write, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* null, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* null, i64 (%struct.kiocb*, %struct.iov_iter*)* null, i64 (%struct.kiocb*, %struct.iov_iter*)* null, i32 (%struct.file*, %struct.dir_context*)* null, i32 (%struct.file*, %struct.poll_table_struct*)* null, i64 (%struct.file*, i32, i64)* @random_ioctl, i64 (%struct.file*, i32, i64)* null, i32 (%struct.file*, %struct.vm_area_struct*)* null, void (%struct.file*, %struct.vm_area_struct*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i8*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i64, i64, i32)* null, i32 (%struct.kiocb*, i32)* null, i32 (i32, %struct.file*, i32)* @random_fasync, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)* null, i64 (%struct.file*, i64, i64, i64, i64)* null, i32 (i32)* null, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)* null, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)* null, i32 (%struct.file*, i64, %struct.file_lock**, i8**)* null, i64 (%struct.file*, i32, i64, i64)* null, void (%struct.seq_file*, %struct.file*)* null }, align 8
@__kstrtab_generate_random_uuid = internal constant [21 x i8] c"generate_random_uuid\00", section "__ksymtab_strings", align 1
@__ksymtab_generate_random_uuid = constant %struct.kernel_symbol { i64 ptrtoint (void (i8*)* @generate_random_uuid to i64), i8* getelementptr inbounds ([21 x i8]* @__kstrtab_generate_random_uuid, i32 0, i32 0) }, section "___ksymtab+generate_random_uuid", align 8
@.str1 = private unnamed_addr constant [9 x i8] c"poolsize\00", align 1
@sysctl_poolsize = internal global i32 4096, align 4
@.str2 = private unnamed_addr constant [14 x i8] c"entropy_avail\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"read_wakeup_threshold\00", align 1
@random_read_wakeup_bits = internal global i32 64, align 4
@min_read_thresh = internal global i32 8, align 4
@max_read_thresh = internal global i32 1024, align 4
@.str4 = private unnamed_addr constant [23 x i8] c"write_wakeup_threshold\00", align 1
@random_write_wakeup_bits = internal global i32 896, align 4
@min_write_thresh = internal global i32 0, align 4
@max_write_thresh = internal global i32 4096, align 4
@.str5 = private unnamed_addr constant [24 x i8] c"urandom_min_reseed_secs\00", align 1
@random_min_urandom_seed = internal global i32 60, align 4
@.str6 = private unnamed_addr constant [8 x i8] c"boot_id\00", align 1
@sysctl_bootid = internal global [16 x i8] zeroinitializer, align 16
@.str7 = private unnamed_addr constant [5 x i8] c"uuid\00", align 1
@random_table = global [8 x %struct.ctl_table] [%struct.ctl_table { i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8* bitcast (i32* @sysctl_poolsize to i8*), i32 4, i16 292, %struct.ctl_table* null, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)* @proc_dointvec, %struct.ctl_table_poll* null, i8* null, i8* null }, %struct.ctl_table { i8* getelementptr inbounds ([14 x i8]* @.str2, i32 0, i32 0), i8* getelementptr (i8* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to i8*), i64 80), i32 4, i16 292, %struct.ctl_table* null, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)* @proc_do_entropy, %struct.ctl_table_poll* null, i8* null, i8* null }, %struct.ctl_table { i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i8* bitcast (i32* @random_read_wakeup_bits to i8*), i32 4, i16 420, %struct.ctl_table* null, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)* @proc_dointvec_minmax, %struct.ctl_table_poll* null, i8* bitcast (i32* @min_read_thresh to i8*), i8* bitcast (i32* @max_read_thresh to i8*) }, %struct.ctl_table { i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i8* bitcast (i32* @random_write_wakeup_bits to i8*), i32 4, i16 420, %struct.ctl_table* null, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)* @proc_dointvec_minmax, %struct.ctl_table_poll* null, i8* bitcast (i32* @min_write_thresh to i8*), i8* bitcast (i32* @max_write_thresh to i8*) }, %struct.ctl_table { i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8* bitcast (i32* @random_min_urandom_seed to i8*), i32 4, i16 420, %struct.ctl_table* null, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)* @proc_dointvec, %struct.ctl_table_poll* null, i8* null, i8* null }, %struct.ctl_table { i8* getelementptr inbounds ([8 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @sysctl_bootid, i32 0, i32 0), i32 16, i16 292, %struct.ctl_table* null, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)* @proc_do_uuid, %struct.ctl_table_poll* null, i8* null, i8* null }, %struct.ctl_table { i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0), i8* null, i32 16, i16 292, %struct.ctl_table* null, i32 (%struct.ctl_table*, i32, i8*, i64*, i64*)* @proc_do_uuid, %struct.ctl_table_poll* null, i8* null, i8* null }, %struct.ctl_table zeroinitializer], align 16
@random_int_secret = internal global [16 x i32] zeroinitializer, align 64
@get_random_int_hash = internal global [4 x i32] zeroinitializer, section ".data..percpu", align 16
@__kstrtab_get_random_int = internal constant [15 x i8] c"get_random_int\00", section "__ksymtab_strings", align 1
@__ksymtab_get_random_int = constant %struct.kernel_symbol { i64 ptrtoint (i32 ()* @get_random_int to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_get_random_int, i32 0, i32 0) }, section "___ksymtab+get_random_int", align 8
@random_write_wait = internal global %struct.__wait_queue_head { %struct.spinlock zeroinitializer, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast (%struct.__wait_queue_head* @random_write_wait to i8*), i64 8) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast (%struct.__wait_queue_head* @random_write_wait to i8*), i64 8) to %struct.list_head*) } }, align 8
@__kstrtab_add_hwgenerator_randomness = internal constant [27 x i8] c"add_hwgenerator_randomness\00", section "__ksymtab_strings", align 1
@__ksymtab_add_hwgenerator_randomness = constant %struct.kernel_symbol { i64 ptrtoint (void (i8*, i64, i64)* @add_hwgenerator_randomness to i64), i8* getelementptr inbounds ([27 x i8]* @__kstrtab_add_hwgenerator_randomness, i32 0, i32 0) }, section "___ksymtab_gpl+add_hwgenerator_randomness", align 8
@current_task = external global %struct.task_struct*
@proc_do_uuid.bootid_spinlock = internal global %struct.spinlock zeroinitializer, align 2
@.str8 = private unnamed_addr constant [4 x i8] c"%pU\00", align 1
@urandom_init_wait = internal global %struct.__wait_queue_head { %struct.spinlock zeroinitializer, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast (%struct.__wait_queue_head* @urandom_init_wait to i8*), i64 8) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast (%struct.__wait_queue_head* @urandom_init_wait to i8*), i64 8) to %struct.list_head*) } }, align 8
@random_read_wait = internal global %struct.__wait_queue_head { %struct.spinlock zeroinitializer, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast (%struct.__wait_queue_head* @random_read_wait to i8*), i64 8) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast (%struct.__wait_queue_head* @random_read_wait to i8*), i64 8) to %struct.list_head*) } }, align 8
@blocking_pool_data = internal global [32 x i32] zeroinitializer, align 16
@.str9 = private unnamed_addr constant [9 x i8] c"blocking\00", align 1
@blocking_pool = internal global { %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] } { %struct.poolinfo* bitcast (i8* getelementptr (i8* bitcast ([2 x %struct.poolinfo]* @poolinfo_table to i8*), i64 40) to %struct.poolinfo*), i32* getelementptr inbounds ([32 x i32]* @blocking_pool_data, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), %struct.work_struct { %struct.atomic64_t { i64 68719476704 }, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to i8*), i64 40) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to i8*), i64 40) to %struct.list_head*) }, void (%struct.work_struct*)* @push_to_pool }, i64 0, %struct.spinlock zeroinitializer, i16 0, i16 0, i32 0, i32 0, i8 2, [10 x i8] zeroinitializer, [5 x i8] undef }, align 8
@.str10 = private unnamed_addr constant [22 x i8] c"drivers/char/random.c\00", align 1
@.str11 = private unnamed_addr constant [33 x i8] c"./arch/x86/include/asm/uaccess.h\00", align 1
@.str12 = private unnamed_addr constant [38 x i8] c"Buffer overflow detected (%d < %lu)!\0A\00", align 1
@kernel_stack = external global i64
@.str13 = private unnamed_addr constant [52 x i8] c"\014random: negative entropy count: pool %s count %d\0A\00", align 1
@fasync = internal global %struct.fasync_struct* null, align 8
@urandom_read.__print_once = internal unnamed_addr global i1 false
@.str14 = private unnamed_addr constant [61 x i8] c"\015random: %s urandom read with %d bits of entropy available\0A\00", align 1
@.str15 = private unnamed_addr constant [55 x i8] c"\014random: negative entropy/overflow: pool %s count %d\0A\00", align 1
@.str16 = private unnamed_addr constant [34 x i8] c"\015random: %s pool is initialized\0A\00", align 1
@credit_entropy_bits.last = internal unnamed_addr global %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*), align 8
@system_wq = external global %struct.workqueue_struct*
@irq_regs = external global %struct.pt_regs*
@input_timer_state = internal global { i64, i64, i64, i8, [7 x i8] } { i64 4294667296, i64 0, i64 0, i8 0, [7 x i8] undef }, align 8
@nonblocking_pool_data = internal global [32 x i32] zeroinitializer, align 16
@.str17 = private unnamed_addr constant [12 x i8] c"nonblocking\00", align 1
@nonblocking_pool = internal global { %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] } { %struct.poolinfo* bitcast (i8* getelementptr (i8* bitcast ([2 x %struct.poolinfo]* @poolinfo_table to i8*), i64 40) to %struct.poolinfo*), i32* getelementptr inbounds ([32 x i32]* @nonblocking_pool_data, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str17, i32 0, i32 0), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), %struct.work_struct { %struct.atomic64_t { i64 68719476704 }, %struct.list_head { %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to i8*), i64 40) to %struct.list_head*), %struct.list_head* bitcast (i8* getelementptr (i8* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to i8*), i64 40) to %struct.list_head*) }, void (%struct.work_struct*)* @push_to_pool }, i64 0, %struct.spinlock zeroinitializer, i16 0, i16 0, i32 0, i32 0, i8 0, [10 x i8] zeroinitializer, [5 x i8] undef }, align 8
@twist_table = internal unnamed_addr constant [8 x i32] [i32 0, i32 997073096, i32 1994146192, i32 1303535960, i32 -306674912, i32 -690576408, i32 -1687895376, i32 -1609899400], align 16
@input_pool_data = internal global [128 x i32] zeroinitializer, align 16
@.str18 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@input_pool = internal global { %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] } { %struct.poolinfo* getelementptr inbounds ([2 x %struct.poolinfo]* @poolinfo_table, i32 0, i32 0), i32* getelementptr inbounds ([128 x i32]* @input_pool_data, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str18, i32 0, i32 0), %struct.entropy_store* null, %struct.work_struct zeroinitializer, i64 0, %struct.spinlock zeroinitializer, i16 0, i16 0, i32 0, i32 0, i8 2, [10 x i8] zeroinitializer, [5 x i8] undef }, align 8
@.str19 = private unnamed_addr constant [68 x i8] c"got_bits %d nonblocking_pool_entropy_left %d input_entropy_left %d\0A\00", align 1
@.str20 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str21 = private unnamed_addr constant [9 x i8] c"got_bits\00", align 1
@.str22 = private unnamed_addr constant [10 x i8] c"pool_left\00", align 1
@.str23 = private unnamed_addr constant [11 x i8] c"input_left\00", align 1
@.str24 = private unnamed_addr constant [86 x i8] c"got_bits %d still_needed_bits %d blocking_pool_entropy_left %d input_entropy_left %d\0A\00", align 1
@.str25 = private unnamed_addr constant [10 x i8] c"need_bits\00", align 1
@.str26 = private unnamed_addr constant [48 x i8] c"%s pool: nbytes %d entropy_count %d caller %pF\0A\00", align 1
@.str27 = private unnamed_addr constant [13 x i8] c"const char *\00", align 1
@.str28 = private unnamed_addr constant [10 x i8] c"pool_name\00", align 1
@.str29 = private unnamed_addr constant [7 x i8] c"nbytes\00", align 1
@.str30 = private unnamed_addr constant [14 x i8] c"entropy_count\00", align 1
@.str31 = private unnamed_addr constant [14 x i8] c"unsigned long\00", align 1
@.str32 = private unnamed_addr constant [3 x i8] c"IP\00", align 1
@.str33 = private unnamed_addr constant [22 x i8] c"nbytes %d caller %pF\0A\00", align 1
@.str34 = private unnamed_addr constant [71 x i8] c"pool %s xfer_bits %d request_bits %d pool_entropy %d input_entropy %d\0A\00", align 1
@.str35 = private unnamed_addr constant [10 x i8] c"xfer_bits\00", align 1
@.str36 = private unnamed_addr constant [13 x i8] c"request_bits\00", align 1
@.str37 = private unnamed_addr constant [13 x i8] c"pool_entropy\00", align 1
@.str38 = private unnamed_addr constant [14 x i8] c"input_entropy\00", align 1
@.str39 = private unnamed_addr constant [30 x i8] c"dev %d,%d input_pool_bits %d\0A\00", align 1
@.str40 = private unnamed_addr constant [6 x i8] c"dev_t\00", align 1
@.str41 = private unnamed_addr constant [4 x i8] c"dev\00", align 1
@.str42 = private unnamed_addr constant [11 x i8] c"input_bits\00", align 1
@.str43 = private unnamed_addr constant [20 x i8] c"input_pool_bits %d\0A\00", align 1
@.str44 = private unnamed_addr constant [19 x i8] c"%s: debit_bits %d\0A\00", align 1
@.str45 = private unnamed_addr constant [11 x i8] c"debit_bits\00", align 1
@.str46 = private unnamed_addr constant [37 x i8] c"%s: pool_bits %d input_pool_bits %d\0A\00", align 1
@.str47 = private unnamed_addr constant [10 x i8] c"pool_bits\00", align 1
@.str48 = private unnamed_addr constant [63 x i8] c"%s pool: bits %d entropy_count %d entropy_total %d caller %pF\0A\00", align 1
@.str49 = private unnamed_addr constant [5 x i8] c"bits\00", align 1
@.str50 = private unnamed_addr constant [14 x i8] c"entropy_total\00", align 1
@.str51 = private unnamed_addr constant [30 x i8] c"%s pool: bytes %d caller %pF\0A\00", align 1
@.str52 = private unnamed_addr constant [6 x i8] c"bytes\00", align 1
@.str53 = private unnamed_addr constant [21 x i8] c"bytes %d caller %pF\0A\00", align 1
@llvm.used = appending global [66 x i8*] [i8* bitcast (%struct.ftrace_event_call** @__event_mix_pool_bytes to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_push_to_pool to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_disk_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_debit_entropy to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_urandom_read to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_extract_entropy_user to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_get_random_bytes_arch to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_credit_entropy_bits to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_xfer_secondary_pool to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_xfer_secondary_pool to i8*), i8* bitcast (i32 ()** @__initcall_rand_initializeearly to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_random_read to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_extract_entropy_user to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_mix_pool_bytes to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_debit_entropy to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_get_random_bytes to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_add_disk_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_add_input_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_extract_entropy to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_input_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_debit_entropy to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_push_to_pool to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__get_random_bytes to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_mix_pool_bytes_nolock to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random_read to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_urandom_read to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_get_random_bytes to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_extract_entropy to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_device_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_get_random_bytes_arch to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_mix_pool_bytes to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_credit_entropy_bits to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_input_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_disk_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_extract_entropy to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_push_to_pool to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_urandom_read to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__mix_pool_bytes to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_mix_pool_bytes_nolock to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_extract_entropy_user to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_add_device_randomness to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_credit_entropy_bits to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_get_random_bytes to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_generate_random_uuid to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_get_random_bytes_arch to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_xfer_secondary_pool to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_get_random_bytes to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_get_random_bytes_arch to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_add_device_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_input_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_random_read to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__extract_entropy to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_get_random_int to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_device_randomness to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_mix_pool_bytes_nolock to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_credit_entropy_bits to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_urandom_read to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_random_read to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_debit_entropy to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_xfer_secondary_pool to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_push_to_pool to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_device_randomness to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_hwgenerator_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_add_disk_randomness to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_add_input_randomness to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_disk_randomness to i8*)], section "llvm.metadata"

@sys_getrandom = alias bitcast (i64 (i64, i64, i64)* @SyS_getrandom to i64 (i8*, i64, i32)*)

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_add_device_randomness(i8* %__data, i32 %bytes, i64 %IP) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 24) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i32*
  store i32 %bytes, i32* %20, align 4
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i64*
  store i64 %IP, i64* %22, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_add_device_randomness(i8* nocapture readonly %__data, i32 %bytes, i64 %IP) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !1
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %31, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i32*
  store i32 %bytes, i32* %26, align 4
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i64*
  store i64 %IP, i64* %28, align 8
  %29 = load i32* %rctx, align 4
  %30 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %30, i32 %29, %struct.task_struct* null) #4
  br label %31

; <label>:31                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone
declare i32 @ftrace_event_reg(%struct.ftrace_event_call*, i32, i8*) #1

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_add_device_randomness(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str52, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 16, i32 8, i32 0, i32 0) #4
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.0 = phi i32 [ %4, %3 ], [ %1, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare i32 @trace_event_raw_init(%struct.ftrace_event_call*) #1

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random__mix_pool_bytes(i8* %__data, i8* %pool_name, i32 %bytes, i64 %IP) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 32) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %pool_name, i8** %20, align 8
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i32*
  store i32 %bytes, i32* %22, align 4
  %23 = getelementptr inbounds i8* %16, i64 24
  %24 = bitcast i8* %23 to i64*
  store i64 %IP, i64* %24, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random__mix_pool_bytes(i8* nocapture readonly %__data, i8* %pool_name, i32 %bytes, i64 %IP) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !4
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 36, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %33, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i8**
  store i8* %pool_name, i8** %26, align 8
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i32*
  store i32 %bytes, i32* %28, align 4
  %29 = getelementptr inbounds i8* %22, i64 24
  %30 = bitcast i8* %29 to i64*
  store i64 %IP, i64* %30, align 8
  %31 = load i32* %rctx, align 4
  %32 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 36, %struct.pt_regs* %__regs, %struct.hlist_head* %32, i32 %31, %struct.task_struct* null) #4
  br label %33

; <label>:33                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random__mix_pool_bytes(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %8

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str52, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %3
  %7 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 24, i32 8, i32 0, i32 0) #4
  br label %8

; <label>:8                                       ; preds = %6, %3, %0
  %.0 = phi i32 [ %7, %6 ], [ %1, %0 ], [ %4, %3 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_credit_entropy_bits(i8* %__data, i8* %pool_name, i32 %bits, i32 %entropy_count, i32 %entropy_total, i64 %IP) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 40) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %pool_name, i8** %20, align 8
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i32*
  store i32 %bits, i32* %22, align 4
  %23 = getelementptr inbounds i8* %16, i64 20
  %24 = bitcast i8* %23 to i32*
  store i32 %entropy_count, i32* %24, align 4
  %25 = getelementptr inbounds i8* %16, i64 24
  %26 = bitcast i8* %25 to i32*
  store i32 %entropy_total, i32* %26, align 4
  %27 = getelementptr inbounds i8* %16, i64 32
  %28 = bitcast i8* %27 to i64*
  store i64 %IP, i64* %28, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_credit_entropy_bits(i8* nocapture readonly %__data, i8* %pool_name, i32 %bits, i32 %entropy_count, i32 %entropy_total, i64 %IP) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !5
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 44, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %37, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i8**
  store i8* %pool_name, i8** %26, align 8
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i32*
  store i32 %bits, i32* %28, align 4
  %29 = getelementptr inbounds i8* %22, i64 20
  %30 = bitcast i8* %29 to i32*
  store i32 %entropy_count, i32* %30, align 4
  %31 = getelementptr inbounds i8* %22, i64 24
  %32 = bitcast i8* %31 to i32*
  store i32 %entropy_total, i32* %32, align 4
  %33 = getelementptr inbounds i8* %22, i64 32
  %34 = bitcast i8* %33 to i64*
  store i64 %IP, i64* %34, align 8
  %35 = load i32* %rctx, align 4
  %36 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 44, %struct.pt_regs* %__regs, %struct.hlist_head* %36, i32 %35, %struct.task_struct* null) #4
  br label %37

; <label>:37                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_credit_entropy_bits(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %14

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str49, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %3
  %7 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str30, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %6
  %10 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str50, i64 0, i64 0), i32 24, i32 4, i32 1, i32 0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %9
  %13 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 32, i32 8, i32 0, i32 0) #4
  br label %14

; <label>:14                                      ; preds = %12, %9, %6, %3, %0
  %.0 = phi i32 [ %13, %12 ], [ %1, %0 ], [ %4, %3 ], [ %7, %6 ], [ %10, %9 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_push_to_pool(i8* %__data, i8* %pool_name, i32 %pool_bits, i32 %input_bits) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 24) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %pool_name, i8** %20, align 8
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i32*
  store i32 %pool_bits, i32* %22, align 4
  %23 = getelementptr inbounds i8* %16, i64 20
  %24 = bitcast i8* %23 to i32*
  store i32 %input_bits, i32* %24, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_push_to_pool(i8* nocapture readonly %__data, i8* %pool_name, i32 %pool_bits, i32 %input_bits) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !6
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %33, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i8**
  store i8* %pool_name, i8** %26, align 8
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i32*
  store i32 %pool_bits, i32* %28, align 4
  %29 = getelementptr inbounds i8* %22, i64 20
  %30 = bitcast i8* %29 to i32*
  store i32 %input_bits, i32* %30, align 4
  %31 = load i32* %rctx, align 4
  %32 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %32, i32 %31, %struct.task_struct* null) #4
  br label %33

; <label>:33                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_push_to_pool(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %8

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str47, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %3
  %7 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str42, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  br label %8

; <label>:8                                       ; preds = %6, %3, %0
  %.0 = phi i32 [ %7, %6 ], [ %1, %0 ], [ %4, %3 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_debit_entropy(i8* %__data, i8* %pool_name, i32 %debit_bits) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 24) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %pool_name, i8** %20, align 8
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i32*
  store i32 %debit_bits, i32* %22, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_debit_entropy(i8* nocapture readonly %__data, i8* %pool_name, i32 %debit_bits) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !7
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %31, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i8**
  store i8* %pool_name, i8** %26, align 8
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i32*
  store i32 %debit_bits, i32* %28, align 4
  %29 = load i32* %rctx, align 4
  %30 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %30, i32 %29, %struct.task_struct* null) #4
  br label %31

; <label>:31                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_debit_entropy(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str45, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.0 = phi i32 [ %4, %3 ], [ %1, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_add_input_randomness(i8* %__data, i32 %input_bits) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 12) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i32*
  store i32 %input_bits, i32* %20, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_add_input_randomness(i8* nocapture readonly %__data, i32 %input_bits) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !8
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 12, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %29, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i32*
  store i32 %input_bits, i32* %26, align 4
  %27 = load i32* %rctx, align 4
  %28 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 12, %struct.pt_regs* %__regs, %struct.hlist_head* %28, i32 %27, %struct.task_struct* null) #4
  br label %29

; <label>:29                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_add_input_randomness(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str42, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  ret i32 %1
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_add_disk_randomness(i8* %__data, i32 %dev, i32 %input_bits) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 16) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i32*
  store i32 %dev, i32* %20, align 4
  %21 = getelementptr inbounds i8* %16, i64 12
  %22 = bitcast i8* %21 to i32*
  store i32 %input_bits, i32* %22, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_add_disk_randomness(i8* nocapture readonly %__data, i32 %dev, i32 %input_bits) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !9
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 20, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %31, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i32*
  store i32 %dev, i32* %26, align 4
  %27 = getelementptr inbounds i8* %22, i64 12
  %28 = bitcast i8* %27 to i32*
  store i32 %input_bits, i32* %28, align 4
  %29 = load i32* %rctx, align 4
  %30 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 20, %struct.pt_regs* %__regs, %struct.hlist_head* %30, i32 %29, %struct.task_struct* null) #4
  br label %31

; <label>:31                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_add_disk_randomness(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([6 x i8]* @.str40, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str41, i64 0, i64 0), i32 8, i32 4, i32 0, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str42, i64 0, i64 0), i32 12, i32 4, i32 1, i32 0) #4
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.0 = phi i32 [ %4, %3 ], [ %1, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_xfer_secondary_pool(i8* %__data, i8* %pool_name, i32 %xfer_bits, i32 %request_bits, i32 %pool_entropy, i32 %input_entropy) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 32) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %pool_name, i8** %20, align 8
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i32*
  store i32 %xfer_bits, i32* %22, align 4
  %23 = getelementptr inbounds i8* %16, i64 20
  %24 = bitcast i8* %23 to i32*
  store i32 %request_bits, i32* %24, align 4
  %25 = getelementptr inbounds i8* %16, i64 24
  %26 = bitcast i8* %25 to i32*
  store i32 %pool_entropy, i32* %26, align 4
  %27 = getelementptr inbounds i8* %16, i64 28
  %28 = bitcast i8* %27 to i32*
  store i32 %input_entropy, i32* %28, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_xfer_secondary_pool(i8* nocapture readonly %__data, i8* %pool_name, i32 %xfer_bits, i32 %request_bits, i32 %pool_entropy, i32 %input_entropy) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !10
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 36, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %37, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i8**
  store i8* %pool_name, i8** %26, align 8
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i32*
  store i32 %xfer_bits, i32* %28, align 4
  %29 = getelementptr inbounds i8* %22, i64 20
  %30 = bitcast i8* %29 to i32*
  store i32 %request_bits, i32* %30, align 4
  %31 = getelementptr inbounds i8* %22, i64 24
  %32 = bitcast i8* %31 to i32*
  store i32 %pool_entropy, i32* %32, align 4
  %33 = getelementptr inbounds i8* %22, i64 28
  %34 = bitcast i8* %33 to i32*
  store i32 %input_entropy, i32* %34, align 4
  %35 = load i32* %rctx, align 4
  %36 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 36, %struct.pt_regs* %__regs, %struct.hlist_head* %36, i32 %35, %struct.task_struct* null) #4
  br label %37

; <label>:37                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_xfer_secondary_pool(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %14

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str35, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %3
  %7 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str36, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %6
  %10 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str37, i64 0, i64 0), i32 24, i32 4, i32 1, i32 0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %9
  %13 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str38, i64 0, i64 0), i32 28, i32 4, i32 1, i32 0) #4
  br label %14

; <label>:14                                      ; preds = %12, %9, %6, %3, %0
  %.0 = phi i32 [ %13, %12 ], [ %1, %0 ], [ %4, %3 ], [ %7, %6 ], [ %10, %9 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random__get_random_bytes(i8* %__data, i32 %nbytes, i64 %IP) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 24) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i32*
  store i32 %nbytes, i32* %20, align 4
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i64*
  store i64 %IP, i64* %22, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random__get_random_bytes(i8* nocapture readonly %__data, i32 %nbytes, i64 %IP) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !11
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %31, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i32*
  store i32 %nbytes, i32* %26, align 4
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i64*
  store i64 %IP, i64* %28, align 8
  %29 = load i32* %rctx, align 4
  %30 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %30, i32 %29, %struct.task_struct* null) #4
  br label %31

; <label>:31                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random__get_random_bytes(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str29, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 16, i32 8, i32 0, i32 0) #4
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.0 = phi i32 [ %4, %3 ], [ %1, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random__extract_entropy(i8* %__data, i8* %pool_name, i32 %nbytes, i32 %entropy_count, i64 %IP) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 32) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i8**
  store i8* %pool_name, i8** %20, align 8
  %21 = getelementptr inbounds i8* %16, i64 16
  %22 = bitcast i8* %21 to i32*
  store i32 %nbytes, i32* %22, align 4
  %23 = getelementptr inbounds i8* %16, i64 20
  %24 = bitcast i8* %23 to i32*
  store i32 %entropy_count, i32* %24, align 4
  %25 = getelementptr inbounds i8* %16, i64 24
  %26 = bitcast i8* %25 to i64*
  store i64 %IP, i64* %26, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random__extract_entropy(i8* nocapture readonly %__data, i8* %pool_name, i32 %nbytes, i32 %entropy_count, i64 %IP) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !12
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 36, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %35, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i8**
  store i8* %pool_name, i8** %26, align 8
  %27 = getelementptr inbounds i8* %22, i64 16
  %28 = bitcast i8* %27 to i32*
  store i32 %nbytes, i32* %28, align 4
  %29 = getelementptr inbounds i8* %22, i64 20
  %30 = bitcast i8* %29 to i32*
  store i32 %entropy_count, i32* %30, align 4
  %31 = getelementptr inbounds i8* %22, i64 24
  %32 = bitcast i8* %31 to i64*
  store i64 %IP, i64* %32, align 8
  %33 = load i32* %rctx, align 4
  %34 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 36, %struct.pt_regs* %__regs, %struct.hlist_head* %34, i32 %33, %struct.task_struct* null) #4
  br label %35

; <label>:35                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random__extract_entropy(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %11

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str29, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %3
  %7 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str30, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %6
  %10 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 24, i32 8, i32 0, i32 0) #4
  br label %11

; <label>:11                                      ; preds = %9, %6, %3, %0
  %.0 = phi i32 [ %10, %9 ], [ %1, %0 ], [ %4, %3 ], [ %7, %6 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random_read(i8* %__data, i32 %got_bits, i32 %need_bits, i32 %pool_left, i32 %input_left) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 24) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i32*
  store i32 %got_bits, i32* %20, align 4
  %21 = getelementptr inbounds i8* %16, i64 12
  %22 = bitcast i8* %21 to i32*
  store i32 %need_bits, i32* %22, align 4
  %23 = getelementptr inbounds i8* %16, i64 16
  %24 = bitcast i8* %23 to i32*
  store i32 %pool_left, i32* %24, align 4
  %25 = getelementptr inbounds i8* %16, i64 20
  %26 = bitcast i8* %25 to i32*
  store i32 %input_left, i32* %26, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random_read(i8* nocapture readonly %__data, i32 %got_bits, i32 %need_bits, i32 %pool_left, i32 %input_left) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !13
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %35, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i32*
  store i32 %got_bits, i32* %26, align 4
  %27 = getelementptr inbounds i8* %22, i64 12
  %28 = bitcast i8* %27 to i32*
  store i32 %need_bits, i32* %28, align 4
  %29 = getelementptr inbounds i8* %22, i64 16
  %30 = bitcast i8* %29 to i32*
  store i32 %pool_left, i32* %30, align 4
  %31 = getelementptr inbounds i8* %22, i64 20
  %32 = bitcast i8* %31 to i32*
  store i32 %input_left, i32* %32, align 4
  %33 = load i32* %rctx, align 4
  %34 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %34, i32 %33, %struct.task_struct* null) #4
  br label %35

; <label>:35                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random_read(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str21, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %11

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str25, i64 0, i64 0), i32 12, i32 4, i32 1, i32 0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %3
  %7 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %6
  %10 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str23, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  br label %11

; <label>:11                                      ; preds = %9, %6, %3, %0
  %.0 = phi i32 [ %10, %9 ], [ %1, %0 ], [ %4, %3 ], [ %7, %6 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_urandom_read(i8* %__data, i32 %got_bits, i32 %pool_left, i32 %input_left) #0 {
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %1 = bitcast i8* %__data to %struct.ftrace_event_file*
  %2 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %2) #3
  %3 = getelementptr inbounds i8* %__data, i64 72
  %4 = bitcast i8* %3 to i64*
  %5 = load i64* %4, align 8
  %6 = and i64 %5, 128
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %ftrace_trigger_soft_disabled.exit

; <label>:8                                       ; preds = %0
  %9 = and i64 %5, 64
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = call i32 @event_triggers_call(%struct.ftrace_event_file* %1, i8* null) #4
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = and i64 %5, 32
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %13, %0
  %16 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %1, i64 20) #4
  %17 = icmp eq i8* %16, null
  br i1 %17, label %ftrace_trigger_soft_disabled.exit.thread, label %18

; <label>:18                                      ; preds = %ftrace_trigger_soft_disabled.exit
  %19 = getelementptr inbounds i8* %16, i64 8
  %20 = bitcast i8* %19 to i32*
  store i32 %got_bits, i32* %20, align 4
  %21 = getelementptr inbounds i8* %16, i64 12
  %22 = bitcast i8* %21 to i32*
  store i32 %pool_left, i32* %22, align 4
  %23 = getelementptr inbounds i8* %16, i64 16
  %24 = bitcast i8* %23 to i32*
  store i32 %input_left, i32* %24, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %18, %ftrace_trigger_soft_disabled.exit, %13
  call void @llvm.lifetime.end(i64 48, i8* %2) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_urandom_read(i8* nocapture readonly %__data, i32 %got_bits, i32 %pool_left, i32 %input_left) #0 {
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %1 = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %1) #3
  %2 = getelementptr inbounds i8* %__data, i64 120
  %3 = bitcast i8* %2 to %struct.hlist_head**
  %4 = load %struct.hlist_head** %3, align 8
  %5 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %4) #3, !srcloc !14
  %6 = call i8* @memset(i8* %1, i32 0, i64 168) #4
  %7 = call i8* @llvm.returnaddress(i32 0) #3
  %8 = ptrtoint i8* %7 to i64
  %9 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %8, i64* %9, align 8
  %10 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %11 = getelementptr inbounds %struct.stack_frame* %10, i64 0, i32 0
  %12 = load %struct.stack_frame** %11, align 8
  %13 = ptrtoint %struct.stack_frame* %12 to i64
  %14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %15, align 8
  %16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %16, align 8
  %17 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %17) #3, !srcloc !3
  %18 = getelementptr inbounds i8* %__data, i64 64
  %19 = bitcast i8* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = trunc i32 %20 to i16
  %22 = call i8* @perf_trace_buf_prepare(i32 20, i16 zeroext %21, %struct.pt_regs* %__regs, i32* %rctx) #4
  %23 = icmp eq i8* %22, null
  br i1 %23, label %33, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds i8* %22, i64 8
  %26 = bitcast i8* %25 to i32*
  store i32 %got_bits, i32* %26, align 4
  %27 = getelementptr inbounds i8* %22, i64 12
  %28 = bitcast i8* %27 to i32*
  store i32 %pool_left, i32* %28, align 4
  %29 = getelementptr inbounds i8* %22, i64 16
  %30 = bitcast i8* %29 to i32*
  store i32 %input_left, i32* %30, align 4
  %31 = load i32* %rctx, align 4
  %32 = inttoptr i64 %5 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %22, i32 20, %struct.pt_regs* %__regs, %struct.hlist_head* %32, i32 %31, %struct.task_struct* null) #4
  br label %33

; <label>:33                                      ; preds = %24, %0
  call void @llvm.lifetime.end(i64 168, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_urandom_read(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
  %1 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str21, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %8

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0), i32 12, i32 4, i32 1, i32 0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %3
  %7 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str23, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  br label %8

; <label>:8                                       ; preds = %6, %3, %0
  %.0 = phi i32 [ %7, %6 ], [ %1, %0 ], [ %4, %3 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define void @add_device_randomness(i8* nocapture readonly %buf, i32 %size) #0 {
  %time = alloca i64, align 8
  %1 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %2 = extractvalue { i32, i32 } %1, 0
  %3 = extractvalue { i32, i32 } %1, 1
  %4 = zext i32 %2 to i64
  %5 = zext i32 %3 to i64
  %6 = shl nuw i64 %5, 32
  %7 = or i64 %6, %4
  %8 = load volatile i64* @jiffies, align 8
  %9 = xor i64 %7, %8
  store i64 %9, i64* %time, align 8
  %10 = tail call i8* @llvm.returnaddress(i32 0)
  %11 = ptrtoint i8* %10 to i64
  %12 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_device_randomness, i64 0, i32 1, i32 0, i32 0), align 8
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %trace_add_device_randomness.exit

; <label>:14                                      ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %15 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_device_randomness, i64 0, i32 4), align 8
  %16 = icmp eq %struct.tracepoint_func* %15, null
  br i1 %16, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %14
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %15, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %17

; <label>:17                                      ; preds = %17, %.preheader.i
  %18 = phi i8* [ %24, %17 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %22, %17 ], [ %15, %.preheader.i ]
  %19 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %20 = load i8** %19, align 8
  %21 = bitcast i8* %18 to void (i8*, i32, i64)*
  tail call void %21(i8* %20, i32 %size, i64 %11) #4
  %22 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %23 = getelementptr inbounds %struct.tracepoint_func* %22, i64 0, i32 0
  %24 = load i8** %23, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %.loopexit.i, label %17

.loopexit.i:                                      ; preds = %17, %14
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_add_device_randomness.exit

trace_add_device_randomness.exit:                 ; preds = %.loopexit.i, %0
  %26 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0)) #4
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %buf, i32 %size) #5
  %27 = bitcast i64* %time to i8*
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %27, i32 8) #5
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0), i64 %26) #4
  %28 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 6, i32 0, i32 0)) #4
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buf, i32 %size) #5
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %27, i32 8) #5
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 6, i32 0, i32 0), i64 %28) #4
  ret void
}

; Function Attrs: nounwind readnone
declare i8* @llvm.returnaddress(i32) #2

; Function Attrs: noredzone
declare i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock*) #1 section ".spinlock.text"

; Function Attrs: noredzone nounwind
define internal fastcc void @_mix_pool_bytes(%struct.entropy_store* nocapture %r, i8* nocapture readonly %in, i32 %nbytes) #0 {
  %1 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %2 = load %struct.poolinfo** %1, align 8
  %3 = getelementptr inbounds %struct.poolinfo* %2, i64 0, i32 5
  %4 = load i32* %3, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %struct.poolinfo* %2, i64 0, i32 6
  %7 = load i32* %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds %struct.poolinfo* %2, i64 0, i32 7
  %10 = load i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.poolinfo* %2, i64 0, i32 8
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.poolinfo* %2, i64 0, i32 9
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 8
  %19 = load i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 7
  %22 = load i16* %21, align 2
  %23 = zext i16 %22 to i64
  %24 = icmp eq i32 %nbytes, 0
  br i1 %24, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %0
  %25 = getelementptr inbounds %struct.poolinfo* %2, i64 0, i32 1
  %26 = load i32* %25, align 4
  %27 = add i32 %26, -1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 1
  br label %30

; <label>:30                                      ; preds = %30, %.lr.ph
  %.04 = phi i32 [ %nbytes, %.lr.ph ], [ %31, %30 ]
  %bytes.03 = phi i8* [ %in, %.lr.ph ], [ %32, %30 ]
  %i.02 = phi i64 [ %23, %.lr.ph ], [ %40, %30 ]
  %input_rotate.01 = phi i32 [ %20, %.lr.ph ], [ %79, %30 ]
  %31 = add i32 %.04, -1
  %32 = getelementptr i8* %bytes.03, i64 1
  %33 = load i8* %bytes.03, align 1
  %34 = sext i8 %33 to i32
  %35 = shl i32 %34, %input_rotate.01
  %36 = sub i32 32, %input_rotate.01
  %37 = lshr i32 %34, %36
  %38 = or i32 %37, %35
  %39 = add i64 %i.02, -1
  %40 = and i64 %39, %28
  %41 = load i32** %29, align 8
  %42 = getelementptr i32* %41, i64 %40
  %43 = load i32* %42, align 4
  %44 = xor i32 %38, %43
  %45 = add i64 %40, %5
  %46 = and i64 %45, %28
  %47 = getelementptr i32* %41, i64 %46
  %48 = load i32* %47, align 4
  %49 = xor i32 %44, %48
  %50 = add i64 %40, %8
  %51 = and i64 %50, %28
  %52 = getelementptr i32* %41, i64 %51
  %53 = load i32* %52, align 4
  %54 = xor i32 %49, %53
  %55 = add i64 %40, %11
  %56 = and i64 %55, %28
  %57 = getelementptr i32* %41, i64 %56
  %58 = load i32* %57, align 4
  %59 = xor i32 %54, %58
  %60 = add i64 %40, %14
  %61 = and i64 %60, %28
  %62 = getelementptr i32* %41, i64 %61
  %63 = load i32* %62, align 4
  %64 = xor i32 %59, %63
  %65 = add i64 %40, %17
  %66 = and i64 %65, %28
  %67 = getelementptr i32* %41, i64 %66
  %68 = load i32* %67, align 4
  %69 = xor i32 %64, %68
  %70 = lshr i32 %69, 3
  %71 = and i32 %69, 7
  %72 = zext i32 %71 to i64
  %73 = getelementptr [8 x i32]* @twist_table, i64 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = xor i32 %70, %74
  store i32 %75, i32* %42, align 4
  %76 = icmp ne i64 %40, 0
  %77 = select i1 %76, i32 7, i32 14
  %78 = add i32 %77, %input_rotate.01
  %79 = and i32 %78, 31
  %80 = icmp eq i32 %31, 0
  br i1 %80, label %._crit_edge, label %30

._crit_edge:                                      ; preds = %30, %0
  %i.0.lcssa = phi i64 [ %23, %0 ], [ %40, %30 ]
  %input_rotate.0.lcssa = phi i32 [ %20, %0 ], [ %79, %30 ]
  %81 = trunc i32 %input_rotate.0.lcssa to i16
  store i16 %81, i16* %18, align 2
  %82 = trunc i64 %i.0.lcssa to i16
  store i16 %82, i16* %21, align 2
  ret void
}

; Function Attrs: noredzone nounwind
define void @add_input_randomness(i32 %type, i32 %code, i32 %value) #0 {
  %1 = load i8* @add_input_randomness.last_value, align 1
  %2 = zext i8 %1 to i32
  %3 = icmp eq i32 %2, %value
  br i1 %3, label %trace_add_input_randomness.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = trunc i32 %value to i8
  store i8 %5, i8* @add_input_randomness.last_value, align 1
  %6 = shl i32 %type, 4
  %7 = xor i32 %6, %code
  %8 = lshr i32 %code, 4
  %9 = xor i32 %7, %8
  %10 = xor i32 %9, %value
  tail call fastcc void @add_timer_randomness(%struct.timer_rand_state* bitcast ({ i64, i64, i64, i8, [7 x i8] }* @input_timer_state to %struct.timer_rand_state*), i32 %10) #5
  %11 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %12 = ashr i32 %11, 3
  %13 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_input_randomness, i64 0, i32 1, i32 0, i32 0), align 8
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %trace_add_input_randomness.exit

; <label>:15                                      ; preds = %4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %16 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_input_randomness, i64 0, i32 4), align 8
  %17 = icmp eq %struct.tracepoint_func* %16, null
  br i1 %17, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %15
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %16, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %18

; <label>:18                                      ; preds = %18, %.preheader.i
  %19 = phi i8* [ %25, %18 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %23, %18 ], [ %16, %.preheader.i ]
  %20 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %21 = load i8** %20, align 8
  %22 = bitcast i8* %19 to void (i8*, i32)*
  tail call void %22(i8* %21, i32 %12) #4
  %23 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %24 = getelementptr inbounds %struct.tracepoint_func* %23, i64 0, i32 0
  %25 = load i8** %24, align 8
  %26 = icmp eq i8* %25, null
  br i1 %26, label %.loopexit.i, label %18

.loopexit.i:                                      ; preds = %18, %15
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_add_input_randomness.exit

trace_add_input_randomness.exit:                  ; preds = %.loopexit.i, %4, %0
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc void @add_timer_randomness(%struct.timer_rand_state* nocapture %state, i32 %num) #0 {
  %sample = alloca %struct.anon.71, align 8
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !18
  %1 = load volatile i64* @jiffies, align 8
  %2 = getelementptr inbounds %struct.anon.71* %sample, i64 0, i32 0
  store i64 %1, i64* %2, align 8
  %3 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %4 = extractvalue { i32, i32 } %3, 0
  %5 = getelementptr inbounds %struct.anon.71* %sample, i64 0, i32 1
  store i32 %4, i32* %5, align 8
  %6 = getelementptr inbounds %struct.anon.71* %sample, i64 0, i32 2
  store i32 %num, i32* %6, align 4
  %7 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %8 = and i8 %7, 1
  %9 = icmp ne i8 %8, 0
  %10 = select i1 %9, %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)
  %11 = bitcast %struct.anon.71* %sample to i8*
  %12 = getelementptr inbounds %struct.entropy_store* %10, i64 0, i32 2
  %13 = load i8** %12, align 8
  %14 = tail call i8* @llvm.returnaddress(i32 0) #3
  %15 = ptrtoint i8* %14 to i64
  %16 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %mix_pool_bytes.exit

; <label>:18                                      ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %19 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %20 = icmp eq %struct.tracepoint_func* %19, null
  br i1 %20, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %18
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %19, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %21

; <label>:21                                      ; preds = %21, %.preheader.i.i
  %22 = phi i8* [ %28, %21 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %26, %21 ], [ %19, %.preheader.i.i ]
  %23 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %24 = load i8** %23, align 8
  %25 = bitcast i8* %22 to void (i8*, i8*, i32, i64)*
  tail call void %25(i8* %24, i8* %13, i32 16, i64 %15) #4
  %26 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %27 = getelementptr inbounds %struct.tracepoint_func* %26, i64 0, i32 0
  %28 = load i8** %27, align 8
  %29 = icmp eq i8* %28, null
  br i1 %29, label %.loopexit.i.i, label %21

.loopexit.i.i:                                    ; preds = %21, %18
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %0
  %30 = getelementptr inbounds %struct.entropy_store* %10, i64 0, i32 6, i32 0, i32 0
  %31 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %30) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %10, i8* %11, i32 16) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %30, i64 %31) #4
  %32 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 3
  %33 = load i8* %32, align 8
  %34 = and i8 %33, 1
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %36, label %61

; <label>:36                                      ; preds = %mix_pool_bytes.exit
  %37 = load i64* %2, align 8
  %38 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 0
  %39 = load i64* %38, align 8
  %40 = sub i64 %37, %39
  store i64 %37, i64* %38, align 8
  %41 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 1
  %42 = load i64* %41, align 8
  %43 = sub i64 %40, %42
  store i64 %40, i64* %41, align 8
  %44 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 2
  %45 = load i64* %44, align 8
  %46 = sub i64 %43, %45
  store i64 %43, i64* %44, align 8
  %47 = icmp slt i64 %40, 0
  %48 = sub i64 0, %40
  %. = select i1 %47, i64 %48, i64 %40
  %49 = icmp slt i64 %43, 0
  %50 = sub i64 0, %43
  %delta2.0 = select i1 %49, i64 %50, i64 %43
  %51 = icmp slt i64 %46, 0
  %52 = sub i64 0, %46
  %.1 = select i1 %51, i64 %52, i64 %46
  %53 = icmp sgt i64 %., %delta2.0
  %delta.1 = select i1 %53, i64 %delta2.0, i64 %.
  %54 = icmp sgt i64 %delta.1, %.1
  %.1.delta.1 = select i1 %54, i64 %.1, i64 %delta.1
  %55 = lshr i64 %.1.delta.1, 1
  %56 = trunc i64 %55 to i32
  %57 = tail call i32 asm "bsrl $1,$0", "=r,rm,0,~{dirflag},~{fpsr},~{flags}"(i32 %56, i32 -1) #3, !srcloc !19
  %58 = add i32 %57, 1
  %59 = icmp slt i32 %58, 11
  %60 = select i1 %59, i32 %58, i32 11
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* %10, i32 %60) #5
  br label %61

; <label>:61                                      ; preds = %36, %mix_pool_bytes.exit
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !20
  ret void
}

; Function Attrs: noredzone nounwind
define void @add_interrupt_randomness(i32 %irq, i32 %irq_flags) #0 {
  %seed = alloca i64, align 8
  %1 = tail call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.fast_pool* @irq_randomness) #3, !srcloc !21
  %2 = inttoptr i64 %1 to %struct.fast_pool*
  %3 = tail call %struct.pt_regs* asm "movq %gs:$1,$0", "=r,*m,~{dirflag},~{fpsr},~{flags}"(%struct.pt_regs** @irq_regs) #3, !srcloc !22
  %4 = load volatile i64* @jiffies, align 8
  %5 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %6 = extractvalue { i32, i32 } %5, 0
  %7 = extractvalue { i32, i32 } %5, 1
  %8 = zext i32 %6 to i64
  %9 = zext i32 %7 to i64
  %10 = shl nuw i64 %9, 32
  %11 = or i64 %10, %8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %get_reg.exit

; <label>:13                                      ; preds = %0
  %14 = bitcast %struct.pt_regs* %3 to i32*
  %15 = icmp eq %struct.pt_regs* %3, null
  br i1 %15, label %get_reg.exit, label %16

; <label>:16                                      ; preds = %13
  %17 = getelementptr inbounds %struct.fast_pool* %2, i64 0, i32 2
  %18 = load i16* %17, align 2
  %19 = icmp ugt i16 %18, 41
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  store i16 0, i16* %17, align 2
  br label %21

; <label>:21                                      ; preds = %20, %16
  %22 = phi i16 [ 0, %20 ], [ %18, %16 ]
  %23 = add i16 %22, 1
  store i16 %23, i16* %17, align 2
  %24 = zext i16 %22 to i64
  %25 = getelementptr i32* %14, i64 %24
  %26 = load i32* %25, align 4
  %phitmp = zext i32 %26 to i64
  br label %get_reg.exit

get_reg.exit:                                     ; preds = %21, %13, %0
  %cycles.0 = phi i64 [ %11, %0 ], [ %phitmp, %21 ], [ 0, %13 ]
  %27 = lshr i64 %cycles.0, 32
  %28 = lshr i64 %4, 32
  %29 = zext i32 %irq to i64
  %30 = getelementptr %struct.fast_pool* %2, i64 0, i32 0, i64 0
  %31 = load i32* %30, align 4
  %32 = zext i32 %31 to i64
  %33 = xor i64 %28, %29
  %34 = xor i64 %33, %cycles.0
  %35 = xor i64 %34, %32
  %36 = trunc i64 %35 to i32
  store i32 %36, i32* %30, align 4
  %37 = xor i64 %27, %4
  %38 = getelementptr %struct.fast_pool* %2, i64 0, i32 0, i64 1
  %39 = load i32* %38, align 4
  %40 = zext i32 %39 to i64
  %41 = xor i64 %37, %40
  %42 = trunc i64 %41 to i32
  store i32 %42, i32* %38, align 4
  %43 = icmp eq %struct.pt_regs* %3, null
  br i1 %43, label %47, label %44

; <label>:44                                      ; preds = %get_reg.exit
  %45 = getelementptr inbounds %struct.pt_regs* %3, i64 0, i32 16
  %46 = load i64* %45, align 8
  br label %50

; <label>:47                                      ; preds = %get_reg.exit
  %48 = tail call i8* @llvm.returnaddress(i32 0)
  %49 = ptrtoint i8* %48 to i64
  br label %50

; <label>:50                                      ; preds = %47, %44
  %51 = phi i64 [ %46, %44 ], [ %49, %47 ]
  %52 = getelementptr %struct.fast_pool* %2, i64 0, i32 0, i64 2
  %53 = load i32* %52, align 4
  %54 = zext i32 %53 to i64
  %55 = xor i64 %54, %51
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %51, 32
  %58 = getelementptr %struct.fast_pool* %2, i64 0, i32 0, i64 3
  %59 = load i32* %58, align 4
  %60 = zext i32 %59 to i64
  %61 = xor i64 %60, %57
  %62 = trunc i64 %61 to i32
  %63 = add i32 %42, %36
  %64 = add i32 %62, %56
  %65 = shl i32 %63, 6
  %66 = lshr i32 %63, 26
  %67 = or i32 %66, %65
  %68 = shl i32 %64, 27
  %69 = lshr i32 %64, 5
  %70 = or i32 %69, %68
  %71 = xor i32 %70, %63
  %72 = xor i32 %67, %64
  %73 = add i32 %72, %63
  %74 = add i32 %71, %64
  %75 = shl i32 %73, 16
  %76 = lshr i32 %73, 16
  %77 = or i32 %76, %75
  %78 = shl i32 %74, 14
  %79 = lshr i32 %74, 18
  %80 = or i32 %79, %78
  %81 = xor i32 %80, %73
  %82 = xor i32 %77, %74
  %83 = add i32 %82, %73
  %84 = add i32 %81, %74
  %85 = shl i32 %83, 6
  %86 = lshr i32 %83, 26
  %87 = or i32 %86, %85
  %88 = shl i32 %84, 27
  %89 = lshr i32 %84, 5
  %90 = or i32 %89, %88
  %91 = xor i32 %90, %83
  %92 = xor i32 %87, %84
  %93 = add i32 %92, %83
  %94 = add i32 %91, %84
  %95 = shl i32 %93, 16
  %96 = lshr i32 %93, 16
  %97 = or i32 %96, %95
  %98 = shl i32 %94, 14
  %99 = lshr i32 %94, 18
  %100 = or i32 %99, %98
  %101 = xor i32 %100, %93
  %102 = xor i32 %97, %94
  store i32 %93, i32* %30, align 4
  store i32 %102, i32* %38, align 4
  store i32 %94, i32* %52, align 4
  store i32 %101, i32* %58, align 4
  %103 = getelementptr inbounds %struct.fast_pool* %2, i64 0, i32 3
  %104 = load i8* %103, align 1
  %105 = add i8 %104, 1
  store i8 %105, i8* %103, align 1
  %106 = icmp ult i8 %105, 64
  br i1 %106, label %107, label %113

; <label>:107                                     ; preds = %50
  %108 = getelementptr inbounds %struct.fast_pool* %2, i64 0, i32 1
  %109 = load i64* %108, align 8
  %110 = sub i64 1000, %4
  %111 = add i64 %110, %109
  %112 = icmp slt i64 %111, 0
  br i1 %112, label %113, label %166

; <label>:113                                     ; preds = %107, %50
  %114 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %115 = and i8 %114, 1
  %116 = icmp ne i8 %115, 0
  %117 = select i1 %116, %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)
  %118 = getelementptr inbounds %struct.entropy_store* %117, i64 0, i32 6
  %119 = getelementptr inbounds %struct.spinlock* %118, i64 0, i32 0, i32 0
  %120 = tail call i32 @_raw_spin_trylock(%struct.raw_spinlock* %119) #4
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %166, label %122

; <label>:122                                     ; preds = %113
  %123 = getelementptr inbounds %struct.fast_pool* %2, i64 0, i32 1
  store i64 %4, i64* %123, align 8
  %124 = inttoptr i64 %1 to i8*
  %125 = getelementptr inbounds %struct.entropy_store* %117, i64 0, i32 2
  %126 = load i8** %125, align 8
  %127 = tail call i8* @llvm.returnaddress(i32 0) #3
  %128 = ptrtoint i8* %127 to i64
  %129 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 1, i32 0, i32 0), align 8
  %130 = icmp sgt i32 %129, 0
  br i1 %130, label %131, label %__mix_pool_bytes.exit

; <label>:131                                     ; preds = %122
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %132 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 4), align 8
  %133 = icmp eq %struct.tracepoint_func* %132, null
  br i1 %133, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %131
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %132, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %134

; <label>:134                                     ; preds = %134, %.preheader.i.i
  %135 = phi i8* [ %141, %134 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %139, %134 ], [ %132, %.preheader.i.i ]
  %136 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %137 = load i8** %136, align 8
  %138 = bitcast i8* %135 to void (i8*, i8*, i32, i64)*
  tail call void %138(i8* %137, i8* %126, i32 16, i64 %128) #4
  %139 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %140 = getelementptr inbounds %struct.tracepoint_func* %139, i64 0, i32 0
  %141 = load i8** %140, align 8
  %142 = icmp eq i8* %141, null
  br i1 %142, label %.loopexit.i.i, label %134

.loopexit.i.i:                                    ; preds = %134, %131
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %__mix_pool_bytes.exit

__mix_pool_bytes.exit:                            ; preds = %.loopexit.i.i, %122
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* %117, i8* %124, i32 16) #4
  %143 = tail call { i8, i64 } asm sideeffect "661:\0A\09movb $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+18)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x48,0x0f,0xc7,0xf8\0A\09setc $0\0A6641:\0A\09.popsection", "=q,={ax},i,~{dirflag},~{fpsr},~{flags}"(i32 0) #3, !srcloc !23
  %144 = extractvalue { i8, i64 } %143, 0
  %145 = extractvalue { i8, i64 } %143, 1
  store i64 %145, i64* %seed, align 8
  %146 = icmp eq i8 %144, 0
  br i1 %146, label %164, label %147

; <label>:147                                     ; preds = %__mix_pool_bytes.exit
  %148 = bitcast i64* %seed to i8*
  %149 = load i8** %125, align 8
  %150 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 1, i32 0, i32 0), align 8
  %151 = icmp sgt i32 %150, 0
  br i1 %151, label %152, label %__mix_pool_bytes.exit8

; <label>:152                                     ; preds = %147
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %153 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 4), align 8
  %154 = icmp eq %struct.tracepoint_func* %153, null
  br i1 %154, label %.loopexit.i.i7, label %.preheader.i.i5

.preheader.i.i5:                                  ; preds = %152
  %.phi.trans.insert.i.i3 = getelementptr inbounds %struct.tracepoint_func* %153, i64 0, i32 0
  %.pre.i.i4 = load i8** %.phi.trans.insert.i.i3, align 8
  br label %155

; <label>:155                                     ; preds = %155, %.preheader.i.i5
  %156 = phi i8* [ %162, %155 ], [ %.pre.i.i4, %.preheader.i.i5 ]
  %it_func_ptr.0.i.i6 = phi %struct.tracepoint_func* [ %160, %155 ], [ %153, %.preheader.i.i5 ]
  %157 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i6, i64 0, i32 1
  %158 = load i8** %157, align 8
  %159 = bitcast i8* %156 to void (i8*, i8*, i32, i64)*
  tail call void %159(i8* %158, i8* %149, i32 8, i64 %128) #4
  %160 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i6, i64 1
  %161 = getelementptr inbounds %struct.tracepoint_func* %160, i64 0, i32 0
  %162 = load i8** %161, align 8
  %163 = icmp eq i8* %162, null
  br i1 %163, label %.loopexit.i.i7, label %155

.loopexit.i.i7:                                   ; preds = %155, %152
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %__mix_pool_bytes.exit8

__mix_pool_bytes.exit8:                           ; preds = %.loopexit.i.i7, %147
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %117, i8* %148, i32 8) #4
  br label %164

; <label>:164                                     ; preds = %__mix_pool_bytes.exit8, %__mix_pool_bytes.exit
  %credit.0 = phi i32 [ 2, %__mix_pool_bytes.exit8 ], [ 1, %__mix_pool_bytes.exit ]
  %165 = bitcast %struct.spinlock* %118 to i8*
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* %165, i8 1, i8* %165) #3, !srcloc !24
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !25
  store i8 0, i8* %103, align 1
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* %117, i32 %credit.0) #5
  br label %166

; <label>:166                                     ; preds = %164, %113, %107
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc void @credit_entropy_bits(%struct.entropy_store* %r, i32 %nbits) #0 {
  %1 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %2 = load %struct.poolinfo** %1, align 8
  %3 = getelementptr inbounds %struct.poolinfo* %2, i64 0, i32 4
  %4 = load i32* %3, align 4
  %5 = shl i32 %nbits, 3
  %6 = icmp eq i32 %nbits, 0
  br i1 %6, label %121, label %.preheader

.preheader:                                       ; preds = %0
  %7 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %8 = icmp slt i32 %5, 0
  %9 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %10 = sdiv i32 %4, 2
  %11 = add i32 %4, -2
  br label %12

; <label>:12                                      ; preds = %38, %.preheader
  %13 = load volatile i32* %7, align 4
  br i1 %8, label %14, label %16

; <label>:14                                      ; preds = %12
  %15 = add i32 %13, %5
  br label %.loopexit

; <label>:16                                      ; preds = %12
  %17 = load %struct.poolinfo** %1, align 8
  %18 = getelementptr inbounds %struct.poolinfo* %17, i64 0, i32 0
  %19 = load i32* %18, align 4
  %20 = add i32 %19, 5
  br label %21

; <label>:21                                      ; preds = %21, %16
  %pnfrac.0 = phi i32 [ %5, %16 ], [ %29, %21 ]
  %entropy_count.0 = phi i32 [ %13, %16 ], [ %28, %21 ]
  %22 = icmp slt i32 %pnfrac.0, %10
  %23 = select i1 %22, i32 %pnfrac.0, i32 %10
  %24 = sub i32 %4, %entropy_count.0
  %25 = mul i32 %24, 3
  %26 = mul i32 %25, %23
  %27 = lshr i32 %26, %20
  %28 = add i32 %27, %entropy_count.0
  %29 = sub i32 %pnfrac.0, %23
  %30 = icmp slt i32 %28, %11
  %31 = icmp ne i32 %pnfrac.0, %23
  %.1 = and i1 %30, %31
  br i1 %.1, label %21, label %.loopexit, !prof !26

.loopexit:                                        ; preds = %21, %14
  %entropy_count.1 = phi i32 [ %15, %14 ], [ %28, %21 ]
  %32 = icmp slt i32 %entropy_count.1, 0
  br i1 %32, label %33, label %36, !prof !26

; <label>:33                                      ; preds = %.loopexit
  %34 = load i8** %9, align 8
  %35 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([55 x i8]* @.str15, i64 0, i64 0), i8* %34, i32 %entropy_count.1) #4
  tail call void @warn_slowpath_null(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 650) #4
  br label %38

; <label>:36                                      ; preds = %.loopexit
  %37 = icmp sgt i32 %entropy_count.1, %4
  %.entropy_count.1 = select i1 %37, i32 %4, i32 %entropy_count.1
  br label %38

; <label>:38                                      ; preds = %36, %33
  %entropy_count.2 = phi i32 [ 0, %33 ], [ %.entropy_count.1, %36 ]
  %39 = tail call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; cmpxchgl $2,$1", "={ax},=*m,r,0,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* %7, i32 %entropy_count.2, i32 %13, i32* %7) #3, !srcloc !27
  %40 = icmp eq i32 %39, %13
  br i1 %40, label %41, label %12

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 10
  %43 = load i32* %42, align 4
  %44 = add i32 %43, %nbits
  store i32 %44, i32* %42, align 4
  %45 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %46 = load i8* %45, align 8
  %47 = and i8 %46, 1
  %48 = icmp eq i8 %47, 0
  %49 = icmp sgt i32 %44, 128
  %or.cond = and i1 %48, %49
  br i1 %or.cond, label %50, label %56

; <label>:50                                      ; preds = %41
  %51 = or i8 %46, 1
  store i8 %51, i8* %45, align 8
  store i32 0, i32* %42, align 4
  %52 = icmp eq %struct.entropy_store* %r, bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)
  br i1 %52, label %53, label %56

; <label>:53                                      ; preds = %50
  tail call void @prandom_reseed_late() #4
  tail call void @__wake_up(%struct.__wait_queue_head* @urandom_init_wait, i32 1, i32 1, i8* null) #4
  %54 = load i8** getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 2), align 8
  %55 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([34 x i8]* @.str16, i64 0, i64 0), i8* %54) #4
  %.pre = load i32* %42, align 4
  br label %56

; <label>:56                                      ; preds = %53, %50, %41
  %57 = phi i32 [ %44, %41 ], [ 0, %50 ], [ %.pre, %53 ]
  %58 = load i8** %9, align 8
  %59 = ashr i32 %entropy_count.2, 3
  %60 = tail call i8* @llvm.returnaddress(i32 0)
  %61 = ptrtoint i8* %60 to i64
  %62 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_credit_entropy_bits, i64 0, i32 1, i32 0, i32 0), align 8
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %64, label %trace_credit_entropy_bits.exit

; <label>:64                                      ; preds = %56
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %65 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_credit_entropy_bits, i64 0, i32 4), align 8
  %66 = icmp eq %struct.tracepoint_func* %65, null
  br i1 %66, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %64
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %65, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %67

; <label>:67                                      ; preds = %67, %.preheader.i
  %68 = phi i8* [ %74, %67 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %72, %67 ], [ %65, %.preheader.i ]
  %69 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %70 = load i8** %69, align 8
  %71 = bitcast i8* %68 to void (i8*, i8*, i32, i32, i32, i64)*
  tail call void %71(i8* %70, i8* %58, i32 %nbits, i32 %59, i32 %57, i64 %61) #4
  %72 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %73 = getelementptr inbounds %struct.tracepoint_func* %72, i64 0, i32 0
  %74 = load i8** %73, align 8
  %75 = icmp eq i8* %74, null
  br i1 %75, label %.loopexit.i, label %67

.loopexit.i:                                      ; preds = %67, %64
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_credit_entropy_bits.exit

trace_credit_entropy_bits.exit:                   ; preds = %.loopexit.i, %56
  %76 = icmp eq %struct.entropy_store* %r, bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*)
  br i1 %76, label %77, label %121

; <label>:77                                      ; preds = %trace_credit_entropy_bits.exit
  %78 = load i32* @random_read_wakeup_bits, align 4
  %79 = icmp slt i32 %59, %78
  br i1 %79, label %81, label %80

; <label>:80                                      ; preds = %77
  tail call void @__wake_up(%struct.__wait_queue_head* @random_read_wait, i32 1, i32 1, i8* null) #4
  tail call void @kill_fasync(%struct.fasync_struct** @fasync, i32 29, i32 131073) #4
  br label %81

; <label>:81                                      ; preds = %80, %77
  %82 = load i32* @random_write_wakeup_bits, align 4
  %83 = icmp sgt i32 %59, %82
  br i1 %83, label %84, label %121

; <label>:84                                      ; preds = %81
  %85 = load i8* %45, align 8
  %86 = and i8 %85, 1
  %87 = icmp eq i8 %86, 0
  br i1 %87, label %121, label %88

; <label>:88                                      ; preds = %84
  %89 = load i32* %42, align 4
  %90 = load i32* @random_read_wakeup_bits, align 4
  %91 = shl i32 %90, 1
  %92 = icmp slt i32 %89, %91
  br i1 %92, label %121, label %93

; <label>:93                                      ; preds = %88
  %94 = load %struct.entropy_store** @credit_entropy_bits.last, align 8
  %95 = icmp eq %struct.entropy_store* %94, bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*)
  %. = select i1 %95, %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*)
  %96 = getelementptr inbounds %struct.entropy_store* %., i64 0, i32 9
  %97 = load i32* %96, align 8
  %98 = getelementptr inbounds %struct.entropy_store* %., i64 0, i32 0
  %99 = load %struct.poolinfo** %98, align 8
  %100 = getelementptr inbounds %struct.poolinfo* %99, i64 0, i32 4
  %101 = load i32* %100, align 4
  %102 = mul i32 %101, 3
  %103 = sdiv i32 %102, 4
  %104 = icmp sgt i32 %97, %103
  br i1 %104, label %106, label %105

; <label>:105                                     ; preds = %93
  store %struct.entropy_store* %., %struct.entropy_store** @credit_entropy_bits.last, align 8
  br label %106

; <label>:106                                     ; preds = %105, %93
  %107 = phi %struct.entropy_store* [ %94, %93 ], [ %., %105 ]
  %108 = getelementptr inbounds %struct.entropy_store* %107, i64 0, i32 9
  %109 = load i32* %108, align 4
  %110 = getelementptr inbounds %struct.entropy_store* %107, i64 0, i32 0
  %111 = load %struct.poolinfo** %110, align 8
  %112 = getelementptr inbounds %struct.poolinfo* %111, i64 0, i32 4
  %113 = load i32* %112, align 4
  %114 = mul i32 %113, 3
  %115 = sdiv i32 %114, 4
  %116 = icmp sgt i32 %109, %115
  br i1 %116, label %121, label %117

; <label>:117                                     ; preds = %106
  %118 = getelementptr inbounds %struct.entropy_store* %107, i64 0, i32 4
  %119 = load %struct.workqueue_struct** @system_wq, align 8
  %120 = tail call zeroext i1 @queue_work_on(i32 64, %struct.workqueue_struct* %119, %struct.work_struct* %118) #4
  store i32 0, i32* %42, align 4
  br label %121

; <label>:121                                     ; preds = %117, %106, %88, %84, %81, %trace_credit_entropy_bits.exit, %0
  ret void
}

; Function Attrs: noredzone nounwind
define void @add_disk_randomness(%struct.gendisk* readonly %disk) #0 {
  %1 = icmp eq %struct.gendisk* %disk, null
  br i1 %1, label %trace_add_disk_randomness.exit, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.gendisk* %disk, i64 0, i32 15
  %4 = load %struct.timer_rand_state** %3, align 8
  %5 = icmp eq %struct.timer_rand_state* %4, null
  br i1 %5, label %trace_add_disk_randomness.exit, label %6

; <label>:6                                       ; preds = %2
  %7 = getelementptr inbounds %struct.gendisk* %disk, i64 0, i32 8, i32 5, i32 22
  %8 = load i32* %7, align 4
  %9 = add i32 %8, 256
  tail call fastcc void @add_timer_randomness(%struct.timer_rand_state* %4, i32 %9) #5
  %10 = load i32* %7, align 4
  %11 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %12 = ashr i32 %11, 3
  %13 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_disk_randomness, i64 0, i32 1, i32 0, i32 0), align 8
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %trace_add_disk_randomness.exit

; <label>:15                                      ; preds = %6
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %16 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_disk_randomness, i64 0, i32 4), align 8
  %17 = icmp eq %struct.tracepoint_func* %16, null
  br i1 %17, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %15
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %16, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %18

; <label>:18                                      ; preds = %18, %.preheader.i
  %19 = phi i8* [ %25, %18 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %23, %18 ], [ %16, %.preheader.i ]
  %20 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %21 = load i8** %20, align 8
  %22 = bitcast i8* %19 to void (i8*, i32, i32)*
  tail call void %22(i8* %21, i32 %10, i32 %12) #4
  %23 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %24 = getelementptr inbounds %struct.tracepoint_func* %23, i64 0, i32 0
  %25 = load i8** %24, align 8
  %26 = icmp eq i8* %25, null
  br i1 %26, label %.loopexit.i, label %18

.loopexit.i:                                      ; preds = %18, %15
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_add_disk_randomness.exit

trace_add_disk_randomness.exit:                   ; preds = %.loopexit.i, %6, %2, %0
  ret void
}

; Function Attrs: noredzone nounwind
define void @get_random_bytes(i8* nocapture %buf, i32 %nbytes) #0 {
  %1 = tail call i8* @llvm.returnaddress(i32 0)
  %2 = ptrtoint i8* %1 to i64
  %3 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %trace_get_random_bytes.exit

; <label>:5                                       ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %6 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %7 = icmp eq %struct.tracepoint_func* %6, null
  br i1 %7, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %5
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %6, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %8

; <label>:8                                       ; preds = %8, %.preheader.i
  %9 = phi i8* [ %15, %8 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %13, %8 ], [ %6, %.preheader.i ]
  %10 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %11 = load i8** %10, align 8
  %12 = bitcast i8* %9 to void (i8*, i32, i64)*
  tail call void %12(i8* %11, i32 %nbytes, i64 %2) #4
  %13 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %14 = getelementptr inbounds %struct.tracepoint_func* %13, i64 0, i32 0
  %15 = load i8** %14, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %.loopexit.i, label %8

.loopexit.i:                                      ; preds = %8, %5
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_get_random_bytes.exit

trace_get_random_bytes.exit:                      ; preds = %.loopexit.i, %0
  %17 = sext i32 %nbytes to i64
  %18 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buf, i64 %17, i32 0, i32 0) #5
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @extract_entropy(%struct.entropy_store* %r, i8* nocapture %buf, i64 %nbytes, i32 %min, i32 %reserved) #0 {
  %tmp = alloca [10 x i8], align 1
  %1 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %2 = load i8** %1, align 8
  %3 = trunc i64 %nbytes to i32
  %4 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %5 = load i32* %4, align 4
  %6 = ashr i32 %5, 3
  %7 = call i8* @llvm.returnaddress(i32 0)
  %8 = ptrtoint i8* %7 to i64
  %9 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy, i64 0, i32 1, i32 0, i32 0), align 8
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %trace_extract_entropy.exit

; <label>:11                                      ; preds = %0
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %12 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy, i64 0, i32 4), align 8
  %13 = icmp eq %struct.tracepoint_func* %12, null
  br i1 %13, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %11
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %12, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %14

; <label>:14                                      ; preds = %14, %.preheader.i
  %15 = phi i8* [ %21, %14 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %19, %14 ], [ %12, %.preheader.i ]
  %16 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %17 = load i8** %16, align 8
  %18 = bitcast i8* %15 to void (i8*, i8*, i32, i32, i64)*
  call void %18(i8* %17, i8* %2, i32 %3, i32 %6, i64 %8) #4
  %19 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %20 = getelementptr inbounds %struct.tracepoint_func* %19, i64 0, i32 0
  %21 = load i8** %20, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %.loopexit.i, label %14

.loopexit.i:                                      ; preds = %14, %11
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_extract_entropy.exit

trace_extract_entropy.exit:                       ; preds = %.loopexit.i, %0
  %23 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 3
  %24 = load %struct.entropy_store** %23, align 8
  %25 = icmp eq %struct.entropy_store* %24, null
  br i1 %25, label %xfer_secondary_pool.exit, label %26

; <label>:26                                      ; preds = %trace_extract_entropy.exit
  %27 = load i32* %4, align 4
  %28 = sext i32 %27 to i64
  %29 = shl i64 %nbytes, 6
  %30 = icmp ult i64 %28, %29
  br i1 %30, label %31, label %xfer_secondary_pool.exit

; <label>:31                                      ; preds = %26
  %32 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %33 = load %struct.poolinfo** %32, align 8
  %34 = getelementptr inbounds %struct.poolinfo* %33, i64 0, i32 4
  %35 = load i32* %34, align 4
  %36 = icmp sgt i32 %27, %35
  br i1 %36, label %xfer_secondary_pool.exit, label %37

; <label>:37                                      ; preds = %31
  %38 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %39 = load i8* %38, align 8
  %40 = and i8 %39, 2
  %41 = icmp eq i8 %40, 0
  %42 = load i32* @random_min_urandom_seed, align 4
  %43 = icmp ne i32 %42, 0
  %or.cond.i = and i1 %41, %43
  br i1 %or.cond.i, label %44, label %53

; <label>:44                                      ; preds = %37
  %45 = load volatile i64* @jiffies, align 8
  %46 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 5
  %47 = load i64* %46, align 8
  %48 = mul i32 %42, 1000
  %49 = sext i32 %48 to i64
  %.neg3 = sub i64 %45, %49
  %50 = sub i64 %.neg3, %47
  %51 = icmp slt i64 %50, 0
  br i1 %51, label %xfer_secondary_pool.exit, label %52

; <label>:52                                      ; preds = %44
  store i64 %45, i64* %46, align 8
  br label %53

; <label>:53                                      ; preds = %52, %37
  call fastcc void @_xfer_secondary_pool(%struct.entropy_store* %r, i64 %nbytes) #4
  br label %xfer_secondary_pool.exit

xfer_secondary_pool.exit:                         ; preds = %53, %44, %31, %26, %trace_extract_entropy.exit
  %54 = call fastcc i64 @account(%struct.entropy_store* %r, i64 %nbytes, i32 %min, i32 %reserved) #5
  %55 = icmp eq i64 %54, 0
  %56 = getelementptr inbounds [10 x i8]* %tmp, i64 0, i64 0
  br i1 %55, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %xfer_secondary_pool.exit
  %.06 = phi i8* [ %62, %.lr.ph ], [ %buf, %xfer_secondary_pool.exit ]
  %.015 = phi i64 [ %61, %.lr.ph ], [ %54, %xfer_secondary_pool.exit ]
  %ret.04 = phi i64 [ %63, %.lr.ph ], [ 0, %xfer_secondary_pool.exit ]
  call fastcc void @extract_buf(%struct.entropy_store* %r, i8* %56) #5
  %57 = trunc i64 %.015 to i32
  %58 = icmp slt i32 %57, 10
  %sext = shl i64 %.015, 32
  %59 = ashr exact i64 %sext, 32
  %60 = select i1 %58, i64 %59, i64 10
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %.06, i8* %56, i64 %60, i32 1, i1 false)
  %61 = sub i64 %.015, %60
  %62 = getelementptr i8* %.06, i64 %60
  %63 = add i64 %60, %ret.04
  %64 = icmp eq i64 %.015, %60
  br i1 %64, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %xfer_secondary_pool.exit
  %ret.0.lcssa = phi i64 [ 0, %xfer_secondary_pool.exit ], [ %63, %.lr.ph ]
  call void @memzero_explicit(i8* %56, i64 10) #4
  ret i64 %ret.0.lcssa
}

; Function Attrs: noredzone nounwind
define void @get_random_bytes_arch(i8* nocapture %buf, i32 %nbytes) #0 {
  %v = alloca i64, align 8
  %1 = tail call i8* @llvm.returnaddress(i32 0)
  %2 = ptrtoint i8* %1 to i64
  %3 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes_arch, i64 0, i32 1, i32 0, i32 0), align 8
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %trace_get_random_bytes_arch.exit.preheader

; <label>:5                                       ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %6 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes_arch, i64 0, i32 4), align 8
  %7 = icmp eq %struct.tracepoint_func* %6, null
  br i1 %7, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %5
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %6, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %8

; <label>:8                                       ; preds = %8, %.preheader.i
  %9 = phi i8* [ %15, %8 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %13, %8 ], [ %6, %.preheader.i ]
  %10 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %11 = load i8** %10, align 8
  %12 = bitcast i8* %9 to void (i8*, i32, i64)*
  tail call void %12(i8* %11, i32 %nbytes, i64 %2) #4
  %13 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %14 = getelementptr inbounds %struct.tracepoint_func* %13, i64 0, i32 0
  %15 = load i8** %14, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %.loopexit.i, label %8

.loopexit.i:                                      ; preds = %8, %5
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_get_random_bytes_arch.exit.preheader

trace_get_random_bytes_arch.exit.preheader:       ; preds = %.loopexit.i, %0
  %17 = icmp eq i32 %nbytes, 0
  br i1 %17, label %.critedge, label %.lr.ph

.lr.ph:                                           ; preds = %trace_get_random_bytes_arch.exit.preheader
  %18 = bitcast i64* %v to i8*
  br label %19

; <label>:19                                      ; preds = %trace_get_random_bytes_arch.exit, %.lr.ph
  %.04 = phi i32 [ %nbytes, %.lr.ph ], [ %28, %trace_get_random_bytes_arch.exit ]
  %p.03 = phi i8* [ %buf, %.lr.ph ], [ %27, %trace_get_random_bytes_arch.exit ]
  %20 = icmp slt i32 %.04, 8
  %21 = select i1 %20, i32 %.04, i32 8
  %22 = tail call { i32, i64 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x48,0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !28
  %23 = extractvalue { i32, i64 } %22, 0
  %24 = extractvalue { i32, i64 } %22, 1
  store i64 %24, i64* %v, align 8
  %25 = icmp eq i32 %23, 0
  br i1 %25, label %30, label %trace_get_random_bytes_arch.exit

trace_get_random_bytes_arch.exit:                 ; preds = %19
  %26 = sext i32 %21 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %p.03, i8* %18, i64 %26, i32 1, i1 false)
  %27 = getelementptr i8* %p.03, i64 %26
  %28 = sub i32 %.04, %21
  %29 = icmp eq i32 %.04, %21
  br i1 %29, label %.critedge, label %19

; <label>:30                                      ; preds = %19
  %31 = sext i32 %.04 to i64
  %32 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %p.03, i64 %31, i32 0, i32 0) #5
  br label %.critedge

.critedge:                                        ; preds = %30, %trace_get_random_bytes_arch.exit, %trace_get_random_bytes_arch.exit.preheader
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noredzone nounwind
define internal i32 @rand_initialize() #0 {
  tail call fastcc void @init_std_data(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*)) #5
  tail call fastcc void @init_std_data(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*)) #5
  tail call fastcc void @init_std_data(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)) #5
  ret i32 0
}

; Function Attrs: noredzone nounwind
define void @rand_initialize_disk(%struct.gendisk* nocapture %disk) #0 {
  %1 = tail call i8* @__kmalloc(i64 32, i32 32976) #4
  %2 = icmp eq i8* %1, null
  br i1 %2, label %7, label %3

; <label>:3                                       ; preds = %0
  %4 = bitcast i8* %1 to %struct.timer_rand_state*
  %5 = bitcast i8* %1 to i64*
  store i64 4294667296, i64* %5, align 8
  %6 = getelementptr inbounds %struct.gendisk* %disk, i64 0, i32 15
  store %struct.timer_rand_state* %4, %struct.timer_rand_state** %6, align 8
  br label %7

; <label>:7                                       ; preds = %3, %0
  ret void
}

; Function Attrs: noredzone
declare i64 @noop_llseek(%struct.file*, i64, i32) #1

; Function Attrs: noredzone nounwind
define internal i64 @random_read(%struct.file* nocapture readonly %file, i8* %buf, i64 %nbytes, i64* nocapture readnone %ppos) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 6
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 2048
  %4 = tail call fastcc i64 @_random_read(i32 %3, i8* %buf, i64 %nbytes) #5
  ret i64 %4
}

; Function Attrs: noredzone nounwind
define internal i64 @random_write(%struct.file* nocapture readnone %file, i8* %buffer, i64 %count, i64* nocapture readnone %ppos) #0 {
  %1 = tail call fastcc i32 @write_pool(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*), i8* %buffer, i64 %count) #5
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = sext i32 %1 to i64
  ret i64 %4

; <label>:5                                       ; preds = %0
  %6 = tail call fastcc i32 @write_pool(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buffer, i64 %count) #5
  %7 = icmp eq i32 %6, 0
  %8 = sext i32 %6 to i64
  %count. = select i1 %7, i64 %count, i64 %8
  ret i64 %count.
}

; Function Attrs: noredzone nounwind
define internal i32 @random_poll(%struct.file* %file, %struct.poll_table_struct* %wait) #0 {
  %1 = icmp eq %struct.poll_table_struct* %wait, null
  br i1 %1, label %poll_wait.exit1, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.poll_table_struct* %wait, i64 0, i32 0
  %4 = load void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)** %3, align 8
  %5 = icmp eq void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)* %4, null
  br i1 %5, label %poll_wait.exit1, label %6

; <label>:6                                       ; preds = %2
  tail call void %4(%struct.file* %file, %struct.__wait_queue_head* @random_read_wait, %struct.poll_table_struct* %wait) #4
  %.pre = load void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)** %3, align 8
  %7 = icmp eq void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)* %.pre, null
  br i1 %7, label %poll_wait.exit1, label %8

; <label>:8                                       ; preds = %6
  tail call void %.pre(%struct.file* %file, %struct.__wait_queue_head* @random_write_wait, %struct.poll_table_struct* %wait) #4
  br label %poll_wait.exit1

poll_wait.exit1:                                  ; preds = %8, %6, %2, %0
  %9 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %10 = ashr i32 %9, 3
  %11 = load i32* @random_read_wakeup_bits, align 4
  %12 = icmp slt i32 %10, %11
  %. = select i1 %12, i32 0, i32 65
  %13 = load i32* @random_write_wakeup_bits, align 4
  %14 = icmp slt i32 %10, %13
  %15 = or i32 %., 260
  %mask.1 = select i1 %14, i32 %15, i32 %.
  ret i32 %mask.1
}

; Function Attrs: noredzone nounwind
define internal i64 @random_ioctl(%struct.file* nocapture readnone %f, i32 %cmd, i64 %arg) #0 {
  %1 = inttoptr i64 %arg to i32*
  switch i32 %cmd, label %58 [
    i32 -2147200512, label %2
    i32 1074024961, label %7
    i32 1074287107, label %22
    i32 20996, label %55
    i32 20998, label %55
  ]

; <label>:2                                       ; preds = %0
  %3 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %4 = ashr i32 %3, 3
  %5 = tail call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %4, i32* %1) #3, !srcloc !29
  %6 = icmp eq i32 %5, 0
  %. = select i1 %6, i64 0, i64 -14
  br label %58

; <label>:7                                       ; preds = %0
  %8 = tail call zeroext i1 @capable(i32 21) #4
  br i1 %8, label %9, label %58

; <label>:9                                       ; preds = %7
  %10 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %1, i64 4) #3, !srcloc !30
  %11 = extractvalue { i32*, i64 } %10, 0
  %12 = ptrtoint i32* %11 to i64
  %13 = trunc i64 %12 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %58

; <label>:15                                      ; preds = %9
  %16 = extractvalue { i32*, i64 } %10, 1
  %17 = trunc i64 %16 to i32
  %18 = icmp slt i32 %17, 268435455
  %19 = select i1 %18, i32 %17, i32 268435455
  %20 = icmp sgt i32 %19, -268435455
  %21 = select i1 %20, i32 %19, i32 -268435455
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i32 %21) #4
  br label %58

; <label>:22                                      ; preds = %0
  %23 = tail call zeroext i1 @capable(i32 21) #4
  br i1 %23, label %24, label %58

; <label>:24                                      ; preds = %22
  %25 = getelementptr i32* %1, i64 1
  %26 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %1, i64 4) #3, !srcloc !31
  %27 = extractvalue { i32*, i64 } %26, 0
  %28 = extractvalue { i32*, i64 } %26, 1
  %29 = ptrtoint i32* %27 to i64
  %30 = trunc i64 %29 to i32
  %31 = trunc i64 %28 to i32
  %32 = icmp eq i32 %30, 0
  br i1 %32, label %33, label %58

; <label>:33                                      ; preds = %24
  %34 = icmp slt i32 %31, 0
  br i1 %34, label %58, label %35

; <label>:35                                      ; preds = %33
  %36 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %25, i64 4) #3, !srcloc !32
  %37 = extractvalue { i32*, i64 } %36, 0
  %38 = ptrtoint i32* %37 to i64
  %39 = trunc i64 %38 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %58

; <label>:41                                      ; preds = %35
  %42 = extractvalue { i32*, i64 } %36, 1
  %43 = getelementptr i32* %1, i64 2
  %44 = bitcast i32* %43 to i8*
  %sext = shl i64 %42, 32
  %45 = ashr exact i64 %sext, 32
  %46 = tail call fastcc i32 @write_pool(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %44, i64 %45) #5
  %47 = icmp slt i32 %46, 0
  br i1 %47, label %48, label %50

; <label>:48                                      ; preds = %41
  %49 = sext i32 %46 to i64
  br label %58

; <label>:50                                      ; preds = %41
  %51 = icmp slt i32 %31, 268435455
  %52 = select i1 %51, i32 %31, i32 268435455
  %53 = icmp sgt i32 %52, -268435455
  %54 = select i1 %53, i32 %52, i32 -268435455
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i32 %54) #4
  br label %58

; <label>:55                                      ; preds = %0, %0
  %56 = tail call zeroext i1 @capable(i32 21) #4
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %55
  store i32 0, i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  store i32 0, i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 9), align 8
  store i32 0, i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool, i64 0, i32 9), align 8
  br label %58

; <label>:58                                      ; preds = %57, %55, %50, %48, %35, %33, %24, %22, %15, %9, %7, %2, %0
  %.0 = phi i64 [ 0, %57 ], [ %49, %48 ], [ 0, %50 ], [ 0, %15 ], [ %., %2 ], [ -1, %7 ], [ -14, %9 ], [ -1, %22 ], [ -14, %24 ], [ -22, %33 ], [ -14, %35 ], [ -1, %55 ], [ -22, %0 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @random_fasync(i32 %fd, %struct.file* %filp, i32 %on) #0 {
  %1 = tail call i32 @fasync_helper(i32 %fd, %struct.file* %filp, i32 %on, %struct.fasync_struct** @fasync) #4
  ret i32 %1
}

; Function Attrs: noredzone nounwind
define internal i64 @urandom_read(%struct.file* nocapture readnone %file, i8* %buf, i64 %nbytes, i64* nocapture readnone %ppos) #0 {
  %1 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %2 = and i8 %1, 1
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %10, !prof !26

; <label>:4                                       ; preds = %0
  %.b = load i1* @urandom_read.__print_once, align 1
  br i1 %.b, label %10, label %5

; <label>:5                                       ; preds = %4
  store i1 true, i1* @urandom_read.__print_once, align 1
  %6 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %7 = getelementptr inbounds %struct.task_struct* %6, i64 0, i32 73, i64 0
  %8 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 10), align 4
  %9 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([61 x i8]* @.str14, i64 0, i64 0), i8* %7, i32 %8) #4
  br label %10

; <label>:10                                      ; preds = %5, %4, %0
  %11 = icmp ult i64 %nbytes, 33554431
  %12 = select i1 %11, i64 %nbytes, i64 33554431
  %13 = tail call fastcc i64 @extract_entropy_user(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buf, i64 %12) #5
  %14 = shl i64 %12, 3
  %15 = trunc i64 %14 to i32
  %16 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 9), align 8
  %17 = ashr i32 %16, 3
  %18 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %19 = ashr i32 %18, 3
  %20 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_urandom_read, i64 0, i32 1, i32 0, i32 0), align 8
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %trace_urandom_read.exit

; <label>:22                                      ; preds = %10
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %23 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_urandom_read, i64 0, i32 4), align 8
  %24 = icmp eq %struct.tracepoint_func* %23, null
  br i1 %24, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %22
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %23, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %25

; <label>:25                                      ; preds = %25, %.preheader.i
  %26 = phi i8* [ %32, %25 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %30, %25 ], [ %23, %.preheader.i ]
  %27 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %28 = load i8** %27, align 8
  %29 = bitcast i8* %26 to void (i8*, i32, i32, i32)*
  tail call void %29(i8* %28, i32 %15, i32 %17, i32 %19) #4
  %30 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %31 = getelementptr inbounds %struct.tracepoint_func* %30, i64 0, i32 0
  %32 = load i8** %31, align 8
  %33 = icmp eq i8* %32, null
  br i1 %33, label %.loopexit.i, label %25

.loopexit.i:                                      ; preds = %25, %22
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_urandom_read.exit

trace_urandom_read.exit:                          ; preds = %.loopexit.i, %10
  %sext = shl i64 %13, 32
  %34 = ashr exact i64 %sext, 32
  ret i64 %34
}

; Function Attrs: noredzone nounwind
define i64 @SyS_getrandom(i64 %buf, i64 %count, i64 %flags) #0 {
  %__wait.i = alloca %struct.__wait_queue, align 8
  %1 = inttoptr i64 %buf to i8*
  %2 = trunc i64 %flags to i32
  %3 = icmp ugt i32 %2, 3
  br i1 %3, label %SYSC_getrandom.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = icmp ugt i64 %count, 2147483647
  %.count.i = select i1 %5, i64 2147483647, i64 %count
  %6 = and i32 %2, 2
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %11, label %8

; <label>:8                                       ; preds = %4
  %9 = and i32 %2, 1
  %10 = call fastcc i64 @_random_read(i32 %9, i8* %1, i64 %.count.i) #4
  br label %SYSC_getrandom.exit

; <label>:11                                      ; preds = %4
  %12 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %13 = and i8 %12, 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %47, !prof !26

; <label>:15                                      ; preds = %11
  %16 = and i32 %2, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %SYSC_getrandom.exit

; <label>:18                                      ; preds = %15
  %19 = call i32 @_cond_resched() #4
  %20 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %21 = and i8 %20, 1
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %23, label %39

; <label>:23                                      ; preds = %18
  %24 = bitcast %struct.__wait_queue* %__wait.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %24) #3
  %25 = getelementptr inbounds %struct.__wait_queue* %__wait.i, i64 0, i32 3
  %26 = getelementptr inbounds %struct.list_head* %25, i64 0, i32 0
  store %struct.list_head* %25, %struct.list_head** %26, align 8
  %27 = getelementptr inbounds %struct.__wait_queue* %__wait.i, i64 0, i32 3, i32 1
  store %struct.list_head* %25, %struct.list_head** %27, align 8
  %28 = getelementptr inbounds %struct.__wait_queue* %__wait.i, i64 0, i32 0
  store i32 0, i32* %28, align 8
  %29 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @urandom_init_wait, %struct.__wait_queue* %__wait.i, i32 1) #4
  %30 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %31 = and i8 %30, 1
  %32 = icmp eq i8 %31, 0
  %33 = icmp eq i64 %29, 0
  %or.cond3.i = and i1 %32, %33
  br i1 %or.cond3.i, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %23
  call void @schedule() #4
  %34 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @urandom_init_wait, %struct.__wait_queue* %__wait.i, i32 1) #4
  %35 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %36 = and i8 %35, 1
  %37 = icmp eq i8 %36, 0
  %38 = icmp eq i64 %34, 0
  %or.cond.i = and i1 %37, %38
  br i1 %or.cond.i, label %.lr.ph.i, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %23
  call void @finish_wait(%struct.__wait_queue_head* @urandom_init_wait, %struct.__wait_queue* %__wait.i) #4
  call void @llvm.lifetime.end(i64 40, i8* %24) #3
  br label %39

; <label>:39                                      ; preds = %._crit_edge.i, %18
  %40 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %41 = getelementptr inbounds %struct.task_struct* %40, i64 0, i32 1
  %42 = load i8** %41, align 8
  %43 = getelementptr inbounds i8* %42, i64 16
  %44 = bitcast i8* %43 to i64*
  %45 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %44, i64 2) #3, !srcloc !34
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %SYSC_getrandom.exit

; <label>:47                                      ; preds = %39, %11
  %48 = call i64 @urandom_read(%struct.file* null, i8* %1, i64 %.count.i, i64* null) #4
  br label %SYSC_getrandom.exit

SYSC_getrandom.exit:                              ; preds = %47, %39, %15, %8, %0
  %.0.i = phi i64 [ %10, %8 ], [ %48, %47 ], [ -22, %0 ], [ -11, %15 ], [ -512, %39 ]
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define void @generate_random_uuid(i8* nocapture %uuid_out) #0 {
  %1 = tail call i8* @llvm.returnaddress(i32 0) #3
  %2 = ptrtoint i8* %1 to i64
  %3 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %get_random_bytes.exit

; <label>:5                                       ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %6 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %7 = icmp eq %struct.tracepoint_func* %6, null
  br i1 %7, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %5
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %6, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %8

; <label>:8                                       ; preds = %8, %.preheader.i.i
  %9 = phi i8* [ %15, %8 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %13, %8 ], [ %6, %.preheader.i.i ]
  %10 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %11 = load i8** %10, align 8
  %12 = bitcast i8* %9 to void (i8*, i32, i64)*
  tail call void %12(i8* %11, i32 16, i64 %2) #4
  %13 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %14 = getelementptr inbounds %struct.tracepoint_func* %13, i64 0, i32 0
  %15 = load i8** %14, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %.loopexit.i.i, label %8

.loopexit.i.i:                                    ; preds = %8, %5
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %get_random_bytes.exit

get_random_bytes.exit:                            ; preds = %.loopexit.i.i, %0
  %17 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %uuid_out, i64 16, i32 0, i32 0) #4
  %18 = getelementptr i8* %uuid_out, i64 6
  %19 = load i8* %18, align 1
  %20 = and i8 %19, 15
  %21 = or i8 %20, 64
  store i8 %21, i8* %18, align 1
  %22 = getelementptr i8* %uuid_out, i64 8
  %23 = load i8* %22, align 1
  %24 = and i8 %23, 63
  %25 = or i8 %24, -128
  store i8 %25, i8* %22, align 1
  ret void
}

; Function Attrs: noredzone
declare i32 @proc_dointvec(%struct.ctl_table*, i32, i8*, i64*, i64*) #1

; Function Attrs: noredzone nounwind
define internal i32 @proc_do_entropy(%struct.ctl_table* nocapture readonly %table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #0 {
  %fake_table = alloca %struct.ctl_table, align 8
  %entropy_count = alloca i32, align 4
  %1 = bitcast %struct.ctl_table* %fake_table to i8*
  call void @llvm.lifetime.start(i64 64, i8* %1) #3
  %2 = getelementptr inbounds %struct.ctl_table* %table, i64 0, i32 1
  %3 = load i8** %2, align 8
  %4 = bitcast i8* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = ashr i32 %5, 3
  store i32 %6, i32* %entropy_count, align 4
  %7 = bitcast i32* %entropy_count to i8*
  %8 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 1
  store i8* %7, i8** %8, align 8
  %9 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 2
  store i32 4, i32* %9, align 8
  %10 = call i32 @proc_dointvec(%struct.ctl_table* %fake_table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #4
  call void @llvm.lifetime.end(i64 64, i8* %1) #3
  ret i32 %10
}

; Function Attrs: noredzone
declare i32 @proc_dointvec_minmax(%struct.ctl_table*, i32, i8*, i64*, i64*) #1

; Function Attrs: noredzone nounwind
define internal i32 @proc_do_uuid(%struct.ctl_table* nocapture readonly %table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #0 {
  %fake_table = alloca %struct.ctl_table, align 8
  %buf = alloca [64 x i8], align 16
  %tmp_uuid = alloca [16 x i8], align 16
  %1 = bitcast %struct.ctl_table* %fake_table to i8*
  call void @llvm.lifetime.start(i64 64, i8* %1) #3
  %2 = getelementptr inbounds [64 x i8]* %buf, i64 0, i64 0
  call void @llvm.lifetime.start(i64 64, i8* %2) #3
  %3 = getelementptr inbounds %struct.ctl_table* %table, i64 0, i32 1
  %4 = load i8** %3, align 8
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %33

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [16 x i8]* %tmp_uuid, i64 0, i64 0
  %8 = call i8* @llvm.returnaddress(i32 0) #3
  %9 = ptrtoint i8* %8 to i64
  %10 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %generate_random_uuid.exit

; <label>:12                                      ; preds = %6
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %13 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %14 = icmp eq %struct.tracepoint_func* %13, null
  br i1 %14, label %.loopexit.i.i.i, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %12
  %.phi.trans.insert.i.i.i = getelementptr inbounds %struct.tracepoint_func* %13, i64 0, i32 0
  %.pre.i.i.i = load i8** %.phi.trans.insert.i.i.i, align 8
  br label %15

; <label>:15                                      ; preds = %15, %.preheader.i.i.i
  %16 = phi i8* [ %22, %15 ], [ %.pre.i.i.i, %.preheader.i.i.i ]
  %it_func_ptr.0.i.i.i = phi %struct.tracepoint_func* [ %20, %15 ], [ %13, %.preheader.i.i.i ]
  %17 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i.i, i64 0, i32 1
  %18 = load i8** %17, align 8
  %19 = bitcast i8* %16 to void (i8*, i32, i64)*
  call void %19(i8* %18, i32 16, i64 %9) #4
  %20 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i.i, i64 1
  %21 = getelementptr inbounds %struct.tracepoint_func* %20, i64 0, i32 0
  %22 = load i8** %21, align 8
  %23 = icmp eq i8* %22, null
  br i1 %23, label %.loopexit.i.i.i, label %15

.loopexit.i.i.i:                                  ; preds = %15, %12
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %generate_random_uuid.exit

generate_random_uuid.exit:                        ; preds = %.loopexit.i.i.i, %6
  %24 = call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %7, i64 16, i32 0, i32 0) #4
  %25 = getelementptr [16 x i8]* %tmp_uuid, i64 0, i64 6
  %26 = load i8* %25, align 2
  %27 = and i8 %26, 15
  %28 = or i8 %27, 64
  store i8 %28, i8* %25, align 2
  %29 = getelementptr [16 x i8]* %tmp_uuid, i64 0, i64 8
  %30 = load i8* %29, align 8
  %31 = and i8 %30, 63
  %32 = or i8 %31, -128
  store i8 %32, i8* %29, align 8
  br label %63

; <label>:33                                      ; preds = %0
  call void @_raw_spin_lock(%struct.raw_spinlock* getelementptr inbounds (%struct.spinlock* @proc_do_uuid.bootid_spinlock, i64 0, i32 0, i32 0)) #4
  %34 = getelementptr i8* %4, i64 8
  %35 = load i8* %34, align 1
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %37, label %62

; <label>:37                                      ; preds = %33
  %38 = call i8* @llvm.returnaddress(i32 0) #3
  %39 = ptrtoint i8* %38 to i64
  %40 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %generate_random_uuid.exit6

; <label>:42                                      ; preds = %37
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %43 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %44 = icmp eq %struct.tracepoint_func* %43, null
  br i1 %44, label %.loopexit.i.i.i5, label %.preheader.i.i.i3

.preheader.i.i.i3:                                ; preds = %42
  %.phi.trans.insert.i.i.i1 = getelementptr inbounds %struct.tracepoint_func* %43, i64 0, i32 0
  %.pre.i.i.i2 = load i8** %.phi.trans.insert.i.i.i1, align 8
  br label %45

; <label>:45                                      ; preds = %45, %.preheader.i.i.i3
  %46 = phi i8* [ %52, %45 ], [ %.pre.i.i.i2, %.preheader.i.i.i3 ]
  %it_func_ptr.0.i.i.i4 = phi %struct.tracepoint_func* [ %50, %45 ], [ %43, %.preheader.i.i.i3 ]
  %47 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i.i4, i64 0, i32 1
  %48 = load i8** %47, align 8
  %49 = bitcast i8* %46 to void (i8*, i32, i64)*
  call void %49(i8* %48, i32 16, i64 %39) #4
  %50 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i.i4, i64 1
  %51 = getelementptr inbounds %struct.tracepoint_func* %50, i64 0, i32 0
  %52 = load i8** %51, align 8
  %53 = icmp eq i8* %52, null
  br i1 %53, label %.loopexit.i.i.i5, label %45

.loopexit.i.i.i5:                                 ; preds = %45, %42
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %generate_random_uuid.exit6

generate_random_uuid.exit6:                       ; preds = %.loopexit.i.i.i5, %37
  %54 = call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %4, i64 16, i32 0, i32 0) #4
  %55 = getelementptr i8* %4, i64 6
  %56 = load i8* %55, align 1
  %57 = and i8 %56, 15
  %58 = or i8 %57, 64
  store i8 %58, i8* %55, align 1
  %59 = load i8* %34, align 1
  %60 = and i8 %59, 63
  %61 = or i8 %60, -128
  store i8 %61, i8* %34, align 1
  br label %62

; <label>:62                                      ; preds = %generate_random_uuid.exit6, %33
  call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* bitcast (%struct.spinlock* @proc_do_uuid.bootid_spinlock to i8*), i8 1, i8* bitcast (%struct.spinlock* @proc_do_uuid.bootid_spinlock to i8*)) #3, !srcloc !24
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !25
  br label %63

; <label>:63                                      ; preds = %62, %generate_random_uuid.exit
  %uuid.0 = phi i8* [ %4, %62 ], [ %7, %generate_random_uuid.exit ]
  %64 = call i32 (i8*, i8*, ...)* @sprintf(i8* %2, i8* getelementptr inbounds ([4 x i8]* @.str8, i64 0, i64 0), i8* %uuid.0) #4
  %65 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 1
  store i8* %2, i8** %65, align 8
  %66 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 2
  store i32 64, i32* %66, align 8
  %67 = call i32 @proc_dostring(%struct.ctl_table* %fake_table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #4
  call void @llvm.lifetime.end(i64 64, i8* %2) #3
  call void @llvm.lifetime.end(i64 64, i8* %1) #3
  ret i32 %67
}

; Function Attrs: noredzone nounwind
define i32 @random_int_secret_init() #0 {
  %1 = tail call i8* @llvm.returnaddress(i32 0) #3
  %2 = ptrtoint i8* %1 to i64
  %3 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %get_random_bytes.exit

; <label>:5                                       ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %6 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %7 = icmp eq %struct.tracepoint_func* %6, null
  br i1 %7, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %5
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %6, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %8

; <label>:8                                       ; preds = %8, %.preheader.i.i
  %9 = phi i8* [ %15, %8 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %13, %8 ], [ %6, %.preheader.i.i ]
  %10 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %11 = load i8** %10, align 8
  %12 = bitcast i8* %9 to void (i8*, i32, i64)*
  tail call void %12(i8* %11, i32 64, i64 %2) #4
  %13 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %14 = getelementptr inbounds %struct.tracepoint_func* %13, i64 0, i32 0
  %15 = load i8** %14, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %.loopexit.i.i, label %8

.loopexit.i.i:                                    ; preds = %8, %5
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %get_random_bytes.exit

get_random_bytes.exit:                            ; preds = %.loopexit.i.i, %0
  %17 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* bitcast ([16 x i32]* @random_int_secret to i8*), i64 64, i32 0, i32 0) #4
  ret i32 0
}

; Function Attrs: noredzone nounwind
define i32 @get_random_int() #0 {
  %1 = tail call { i32, i32 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !35
  %2 = extractvalue { i32, i32 } %1, 0
  %3 = extractvalue { i32, i32 } %1, 1
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !36
  %6 = tail call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, [4 x i32]* @get_random_int_hash) #3, !srcloc !37
  %7 = inttoptr i64 %6 to [4 x i32]*
  %8 = getelementptr inbounds [4 x i32]* %7, i64 0, i64 0
  %9 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %10 = getelementptr inbounds %struct.task_struct* %9, i64 0, i32 42
  %11 = load i32* %10, align 4
  %12 = zext i32 %11 to i64
  %13 = load volatile i64* @jiffies, align 8
  %14 = add i64 %12, %13
  %15 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %16 = extractvalue { i32, i32 } %15, 0
  %17 = zext i32 %16 to i64
  %18 = add i64 %14, %17
  %19 = load i32* %8, align 4
  %20 = zext i32 %19 to i64
  %21 = add i64 %18, %20
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %8, align 4
  tail call void @md5_transform(i32* %8, i32* getelementptr inbounds ([16 x i32]* @random_int_secret, i64 0, i64 0)) #4
  %23 = load i32* %8, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !38
  br label %24

; <label>:24                                      ; preds = %5, %0
  %25 = phi i32 [ %3, %0 ], [ %23, %5 ]
  ret i32 %25
}

; Function Attrs: noredzone
declare void @md5_transform(i32*, i32*) #1

; Function Attrs: noredzone nounwind
define i64 @randomize_range(i64 %start, i64 %end, i64 %len) #0 {
  %1 = add i64 %len, %start
  %2 = icmp ult i64 %1, %end
  br i1 %2, label %3, label %35

; <label>:3                                       ; preds = %0
  %4 = sub i64 %end, %start
  %5 = sub i64 %4, %len
  %6 = tail call { i32, i32 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !35
  %7 = extractvalue { i32, i32 } %6, 0
  %8 = extractvalue { i32, i32 } %6, 1
  %9 = icmp eq i32 %7, 0
  br i1 %9, label %10, label %get_random_int.exit

; <label>:10                                      ; preds = %3
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !36
  %11 = tail call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, [4 x i32]* @get_random_int_hash) #3, !srcloc !37
  %12 = inttoptr i64 %11 to [4 x i32]*
  %13 = getelementptr inbounds [4 x i32]* %12, i64 0, i64 0
  %14 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %15 = getelementptr inbounds %struct.task_struct* %14, i64 0, i32 42
  %16 = load i32* %15, align 4
  %17 = zext i32 %16 to i64
  %18 = load volatile i64* @jiffies, align 8
  %19 = add i64 %17, %18
  %20 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %21 = extractvalue { i32, i32 } %20, 0
  %22 = zext i32 %21 to i64
  %23 = add i64 %19, %22
  %24 = load i32* %13, align 4
  %25 = zext i32 %24 to i64
  %26 = add i64 %23, %25
  %27 = trunc i64 %26 to i32
  store i32 %27, i32* %13, align 4
  tail call void @md5_transform(i32* %13, i32* getelementptr inbounds ([16 x i32]* @random_int_secret, i64 0, i64 0)) #4
  %28 = load i32* %13, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !38
  br label %get_random_int.exit

get_random_int.exit:                              ; preds = %10, %3
  %29 = phi i32 [ %8, %3 ], [ %28, %10 ]
  %30 = zext i32 %29 to i64
  %31 = urem i64 %30, %5
  %32 = add i64 %start, 4095
  %33 = add i64 %32, %31
  %34 = and i64 %33, -4096
  br label %35

; <label>:35                                      ; preds = %get_random_int.exit, %0
  %.0 = phi i64 [ %34, %get_random_int.exit ], [ 0, %0 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define void @add_hwgenerator_randomness(i8* nocapture readonly %buffer, i64 %count, i64 %entropy) #0 {
  %__wait = alloca %struct.__wait_queue, align 8
  %1 = call i32 @_cond_resched() #4
  %2 = call zeroext i1 @kthread_should_stop() #4
  br i1 %2, label %25, label %3

; <label>:3                                       ; preds = %0
  %4 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %5 = ashr i32 %4, 3
  %6 = load i32* @random_write_wakeup_bits, align 4
  %7 = icmp sgt i32 %5, %6
  br i1 %7, label %8, label %25

; <label>:8                                       ; preds = %3
  %9 = bitcast %struct.__wait_queue* %__wait to i8*
  call void @llvm.lifetime.start(i64 40, i8* %9) #3
  %10 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3
  %11 = getelementptr inbounds %struct.list_head* %10, i64 0, i32 0
  store %struct.list_head* %10, %struct.list_head** %11, align 8
  %12 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3, i32 1
  store %struct.list_head* %10, %struct.list_head** %12, align 8
  %13 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 0
  store i32 0, i32* %13, align 8
  %14 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_write_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %15 = call zeroext i1 @kthread_should_stop() #4
  br i1 %15, label %split, label %.lr.ph

.lr.ph:                                           ; preds = %22, %8
  %16 = phi i64 [ %23, %22 ], [ %14, %8 ]
  %17 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %18 = ashr i32 %17, 3
  %19 = load i32* @random_write_wakeup_bits, align 4
  %20 = icmp sgt i32 %18, %19
  %21 = icmp eq i64 %16, 0
  %or.cond = and i1 %20, %21
  br i1 %or.cond, label %22, label %split

; <label>:22                                      ; preds = %.lr.ph
  call void @schedule() #4
  %23 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_write_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %24 = call zeroext i1 @kthread_should_stop() #4
  br i1 %24, label %split, label %.lr.ph

split:                                            ; preds = %22, %.lr.ph, %8
  call void @finish_wait(%struct.__wait_queue_head* @random_write_wait, %struct.__wait_queue* %__wait) #4
  call void @llvm.lifetime.end(i64 40, i8* %9) #3
  br label %25

; <label>:25                                      ; preds = %split, %3, %0
  %26 = trunc i64 %count to i32
  %27 = load i8** getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 2), align 8
  %28 = call i8* @llvm.returnaddress(i32 0) #3
  %29 = ptrtoint i8* %28 to i64
  %30 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %mix_pool_bytes.exit

; <label>:32                                      ; preds = %25
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %33 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %34 = icmp eq %struct.tracepoint_func* %33, null
  br i1 %34, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %32
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %33, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %35

; <label>:35                                      ; preds = %35, %.preheader.i.i
  %36 = phi i8* [ %42, %35 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %40, %35 ], [ %33, %.preheader.i.i ]
  %37 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %38 = load i8** %37, align 8
  %39 = bitcast i8* %36 to void (i8*, i8*, i32, i64)*
  call void %39(i8* %38, i8* %27, i32 %26, i64 %29) #4
  %40 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %41 = getelementptr inbounds %struct.tracepoint_func* %40, i64 0, i32 0
  %42 = load i8** %41, align 8
  %43 = icmp eq i8* %42, null
  br i1 %43, label %.loopexit.i.i, label %35

.loopexit.i.i:                                    ; preds = %35, %32
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %25
  %44 = call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0)) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %buffer, i32 %26) #4
  call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0), i64 %44) #4
  %45 = trunc i64 %entropy to i32
  call fastcc void @credit_entropy_bits(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i32 %45) #5
  ret void
}

; Function Attrs: noredzone
declare i32 @_cond_resched() #1

; Function Attrs: noredzone
declare zeroext i1 @kthread_should_stop() #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: noredzone
declare i64 @prepare_to_wait_event(%struct.__wait_queue_head*, %struct.__wait_queue*, i32) #1

; Function Attrs: noredzone
declare void @schedule() #1

; Function Attrs: noredzone
declare void @finish_wait(%struct.__wait_queue_head*, %struct.__wait_queue*) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: noredzone
declare i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: noredzone
declare i32 @proc_dostring(%struct.ctl_table*, i32, i8*, i64*, i64*) #1

; Function Attrs: noredzone
declare void @_raw_spin_lock(%struct.raw_spinlock*) #1 section ".spinlock.text"

; Function Attrs: noredzone nounwind
define internal fastcc i64 @_random_read(i32 %nonblock, i8* %buf, i64 %nbytes) #0 {
  %__wait = alloca %struct.__wait_queue, align 8
  %1 = icmp eq i64 %nbytes, 0
  br i1 %1, label %.loopexit, label %2

; <label>:2                                       ; preds = %0
  %3 = icmp ult i64 %nbytes, 512
  %4 = select i1 %3, i64 %nbytes, i64 512
  %5 = bitcast %struct.__wait_queue* %__wait to i8*
  %6 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3
  %7 = getelementptr inbounds %struct.list_head* %6, i64 0, i32 0
  %8 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3, i32 1
  %9 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 0
  br label %10

; <label>:10                                      ; preds = %57, %2
  %11 = call fastcc i64 @extract_entropy_user(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*), i8* %buf, i64 %4) #5
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %.loopexit, label %13

; <label>:13                                      ; preds = %10
  %14 = shl i64 %11, 3
  %15 = trunc i64 %14 to i32
  %16 = sub i64 %4, %11
  %17 = shl i64 %16, 3
  %18 = trunc i64 %17 to i32
  %19 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool, i64 0, i32 9), align 8
  %20 = ashr i32 %19, 3
  %21 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %22 = ashr i32 %21, 3
  %23 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_random_read, i64 0, i32 1, i32 0, i32 0), align 8
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %trace_random_read.exit

; <label>:25                                      ; preds = %13
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %26 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_random_read, i64 0, i32 4), align 8
  %27 = icmp eq %struct.tracepoint_func* %26, null
  br i1 %27, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %25
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %26, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %28

; <label>:28                                      ; preds = %28, %.preheader.i
  %29 = phi i8* [ %35, %28 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %33, %28 ], [ %26, %.preheader.i ]
  %30 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %31 = load i8** %30, align 8
  %32 = bitcast i8* %29 to void (i8*, i32, i32, i32, i32)*
  call void %32(i8* %31, i32 %15, i32 %18, i32 %20, i32 %22) #4
  %33 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %34 = getelementptr inbounds %struct.tracepoint_func* %33, i64 0, i32 0
  %35 = load i8** %34, align 8
  %36 = icmp eq i8* %35, null
  br i1 %36, label %.loopexit.i, label %28

.loopexit.i:                                      ; preds = %28, %25
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_random_read.exit

trace_random_read.exit:                           ; preds = %.loopexit.i, %13
  %37 = icmp sgt i64 %11, 0
  %.not = icmp ne i32 %nonblock, 0
  %brmerge = or i1 %37, %.not
  %.mux = select i1 %37, i64 %11, i64 -11
  br i1 %brmerge, label %.loopexit, label %38

; <label>:38                                      ; preds = %trace_random_read.exit
  %39 = call i32 @_cond_resched() #4
  %40 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %41 = ashr i32 %40, 3
  %42 = load i32* @random_read_wakeup_bits, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %57

; <label>:44                                      ; preds = %38
  call void @llvm.lifetime.start(i64 40, i8* %5) #3
  store %struct.list_head* %6, %struct.list_head** %7, align 8
  store %struct.list_head* %6, %struct.list_head** %8, align 8
  store i32 0, i32* %9, align 8
  %45 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_read_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %46 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %47 = ashr i32 %46, 3
  %48 = load i32* @random_read_wakeup_bits, align 4
  %49 = icmp slt i32 %47, %48
  %50 = icmp eq i64 %45, 0
  %or.cond2 = and i1 %49, %50
  br i1 %or.cond2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %44
  call void @schedule() #4
  %51 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_read_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %52 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %53 = ashr i32 %52, 3
  %54 = load i32* @random_read_wakeup_bits, align 4
  %55 = icmp slt i32 %53, %54
  %56 = icmp eq i64 %51, 0
  %or.cond = and i1 %55, %56
  br i1 %or.cond, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %44
  call void @finish_wait(%struct.__wait_queue_head* @random_read_wait, %struct.__wait_queue* %__wait) #4
  call void @llvm.lifetime.end(i64 40, i8* %5) #3
  br label %57

; <label>:57                                      ; preds = %._crit_edge, %38
  %58 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %59 = getelementptr inbounds %struct.task_struct* %58, i64 0, i32 1
  %60 = load i8** %59, align 8
  %61 = getelementptr inbounds i8* %60, i64 16
  %62 = bitcast i8* %61 to i64*
  %63 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %62, i64 2) #3, !srcloc !34
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %10, label %.loopexit

.loopexit:                                        ; preds = %57, %trace_random_read.exit, %10, %0
  %.0 = phi i64 [ 0, %0 ], [ %.mux, %trace_random_read.exit ], [ -512, %57 ], [ %11, %10 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @extract_entropy_user(%struct.entropy_store* %r, i8* %buf, i64 %nbytes) #0 {
  %tmp = alloca [10 x i8], align 1
  %1 = icmp ugt i64 %nbytes, 256
  %2 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %3 = load i8** %2, align 8
  %4 = trunc i64 %nbytes to i32
  %5 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %6 = load i32* %5, align 4
  %7 = ashr i32 %6, 3
  %8 = call i8* @llvm.returnaddress(i32 0)
  %9 = ptrtoint i8* %8 to i64
  %10 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy_user, i64 0, i32 1, i32 0, i32 0), align 8
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %trace_extract_entropy_user.exit

; <label>:12                                      ; preds = %0
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %13 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy_user, i64 0, i32 4), align 8
  %14 = icmp eq %struct.tracepoint_func* %13, null
  br i1 %14, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %12
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %13, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %15

; <label>:15                                      ; preds = %15, %.preheader.i
  %16 = phi i8* [ %22, %15 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %20, %15 ], [ %13, %.preheader.i ]
  %17 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %18 = load i8** %17, align 8
  %19 = bitcast i8* %16 to void (i8*, i8*, i32, i32, i64)*
  call void %19(i8* %18, i8* %3, i32 %4, i32 %7, i64 %9) #4
  %20 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %21 = getelementptr inbounds %struct.tracepoint_func* %20, i64 0, i32 0
  %22 = load i8** %21, align 8
  %23 = icmp eq i8* %22, null
  br i1 %23, label %.loopexit.i, label %15

.loopexit.i:                                      ; preds = %15, %12
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_extract_entropy_user.exit

trace_extract_entropy_user.exit:                  ; preds = %.loopexit.i, %0
  %24 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 3
  %25 = load %struct.entropy_store** %24, align 8
  %26 = icmp eq %struct.entropy_store* %25, null
  br i1 %26, label %xfer_secondary_pool.exit, label %27

; <label>:27                                      ; preds = %trace_extract_entropy_user.exit
  %28 = load i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = shl i64 %nbytes, 6
  %31 = icmp ult i64 %29, %30
  br i1 %31, label %32, label %xfer_secondary_pool.exit

; <label>:32                                      ; preds = %27
  %33 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %34 = load %struct.poolinfo** %33, align 8
  %35 = getelementptr inbounds %struct.poolinfo* %34, i64 0, i32 4
  %36 = load i32* %35, align 4
  %37 = icmp sgt i32 %28, %36
  br i1 %37, label %xfer_secondary_pool.exit, label %38

; <label>:38                                      ; preds = %32
  %39 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %40 = load i8* %39, align 8
  %41 = and i8 %40, 2
  %42 = icmp eq i8 %41, 0
  %43 = load i32* @random_min_urandom_seed, align 4
  %44 = icmp ne i32 %43, 0
  %or.cond.i = and i1 %42, %44
  br i1 %or.cond.i, label %45, label %54

; <label>:45                                      ; preds = %38
  %46 = load volatile i64* @jiffies, align 8
  %47 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 5
  %48 = load i64* %47, align 8
  %49 = mul i32 %43, 1000
  %50 = sext i32 %49 to i64
  %.neg5.i = sub i64 %46, %50
  %51 = sub i64 %.neg5.i, %48
  %52 = icmp slt i64 %51, 0
  br i1 %52, label %xfer_secondary_pool.exit, label %53

; <label>:53                                      ; preds = %45
  store i64 %46, i64* %47, align 8
  br label %54

; <label>:54                                      ; preds = %53, %38
  call fastcc void @_xfer_secondary_pool(%struct.entropy_store* %r, i64 %nbytes) #4
  br label %xfer_secondary_pool.exit

xfer_secondary_pool.exit:                         ; preds = %54, %45, %32, %27, %trace_extract_entropy_user.exit
  %55 = call fastcc i64 @account(%struct.entropy_store* %r, i64 %nbytes, i32 0, i32 0) #5
  %56 = icmp eq i64 %55, 0
  %.pre.pre = getelementptr inbounds [10 x i8]* %tmp, i64 0, i64 0
  br i1 %56, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %85, %xfer_secondary_pool.exit
  %.07 = phi i8* [ %87, %85 ], [ %buf, %xfer_secondary_pool.exit ]
  %.016 = phi i64 [ %86, %85 ], [ %55, %xfer_secondary_pool.exit ]
  %ret.05 = phi i64 [ %88, %85 ], [ 0, %xfer_secondary_pool.exit ]
  br i1 %1, label %57, label %76

; <label>:57                                      ; preds = %.lr.ph
  %58 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #3, !srcloc !39
  %59 = add i64 %58, -16344
  %60 = inttoptr i64 %59 to %struct.thread_info*
  %61 = getelementptr inbounds %struct.thread_info* %60, i64 0, i32 2
  %62 = bitcast i32* %61 to i64*
  %63 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %62, i64 3) #3, !srcloc !34
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %76, label %65

; <label>:65                                      ; preds = %57
  %66 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %67 = getelementptr inbounds %struct.task_struct* %66, i64 0, i32 1
  %68 = load i8** %67, align 8
  %69 = getelementptr inbounds i8* %68, i64 16
  %70 = bitcast i8* %69 to i64*
  %71 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %70, i64 2) #3, !srcloc !34
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %75, label %73

; <label>:73                                      ; preds = %65
  %74 = icmp eq i64 %ret.05, 0
  %.ret.0 = select i1 %74, i64 -512, i64 %ret.05
  br label %.loopexit

; <label>:75                                      ; preds = %65
  call void @schedule() #4
  br label %76

; <label>:76                                      ; preds = %75, %57, %.lr.ph
  call fastcc void @extract_buf(%struct.entropy_store* %r, i8* %.pre.pre) #5
  %77 = trunc i64 %.016 to i32
  %78 = icmp slt i32 %77, 10
  %sext = shl i64 %.016, 32
  %79 = ashr exact i64 %sext, 32
  %80 = select i1 %78, i64 %79, i64 10
  %81 = icmp ugt i64 %80, 10
  br i1 %81, label %copy_to_user.exit.thread, label %copy_to_user.exit, !prof !26

copy_to_user.exit.thread:                         ; preds = %76
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str12, i64 0, i64 0), i32 10, i64 %80) #4
  br label %.loopexit

copy_to_user.exit:                                ; preds = %76
  %82 = trunc i64 %80 to i32
  %83 = call i64 @_copy_to_user(i8* %.07, i8* %.pre.pre, i32 %82) #4
  %84 = icmp eq i64 %83, 0
  br i1 %84, label %85, label %.loopexit

; <label>:85                                      ; preds = %copy_to_user.exit
  %86 = sub i64 %.016, %80
  %87 = getelementptr i8* %.07, i64 %80
  %88 = add i64 %80, %ret.05
  %89 = icmp eq i64 %.016, %80
  br i1 %89, label %.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %85, %copy_to_user.exit, %copy_to_user.exit.thread, %73, %xfer_secondary_pool.exit
  %ret.1 = phi i64 [ %.ret.0, %73 ], [ -14, %copy_to_user.exit.thread ], [ 0, %xfer_secondary_pool.exit ], [ -14, %copy_to_user.exit ], [ %88, %85 ]
  call void @memzero_explicit(i8* %.pre.pre, i64 10) #4
  ret i64 %ret.1
}

; Function Attrs: noredzone nounwind
define internal void @push_to_pool(%struct.work_struct* %work) #0 {
  %1 = getelementptr %struct.work_struct* %work, i64 -1
  %2 = icmp eq %struct.work_struct* %1, null
  br i1 %2, label %3, label %5, !prof !26

; <label>:3                                       ; preds = %0
  tail call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 1006, i64 12) #3, !srcloc !40
  br label %4

; <label>:4                                       ; preds = %4, %3
  br label %4

; <label>:5                                       ; preds = %0
  %6 = bitcast %struct.work_struct* %1 to %struct.entropy_store*
  %7 = load i32* @random_read_wakeup_bits, align 4
  %8 = sdiv i32 %7, 8
  %9 = sext i32 %8 to i64
  tail call fastcc void @_xfer_secondary_pool(%struct.entropy_store* %6, i64 %9) #5
  %10 = getelementptr inbounds %struct.work_struct* %work, i64 -1, i32 1, i32 1
  %11 = load %struct.list_head** %10, align 8
  %12 = bitcast %struct.list_head* %11 to i8*
  %13 = getelementptr inbounds %struct.work_struct* %work, i64 1, i32 1, i32 1
  %14 = bitcast %struct.list_head** %13 to i32*
  %15 = load i32* %14, align 4
  %16 = ashr i32 %15, 3
  %17 = getelementptr inbounds %struct.work_struct* %work, i64 -1, i32 2
  %18 = load void (%struct.work_struct*)** %17, align 8
  %19 = bitcast void (%struct.work_struct*)* %18 to %struct.entropy_store*
  %20 = getelementptr inbounds %struct.entropy_store* %19, i64 0, i32 9
  %21 = load i32* %20, align 4
  %22 = ashr i32 %21, 3
  %23 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_push_to_pool, i64 0, i32 1, i32 0, i32 0), align 8
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %trace_push_to_pool.exit

; <label>:25                                      ; preds = %5
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %26 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_push_to_pool, i64 0, i32 4), align 8
  %27 = icmp eq %struct.tracepoint_func* %26, null
  br i1 %27, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %25
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %26, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %28

; <label>:28                                      ; preds = %28, %.preheader.i
  %29 = phi i8* [ %35, %28 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %33, %28 ], [ %26, %.preheader.i ]
  %30 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %31 = load i8** %30, align 8
  %32 = bitcast i8* %29 to void (i8*, i8*, i32, i32)*
  tail call void %32(i8* %31, i8* %12, i32 %16, i32 %22) #4
  %33 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %34 = getelementptr inbounds %struct.tracepoint_func* %33, i64 0, i32 0
  %35 = load i8** %34, align 8
  %36 = icmp eq i8* %35, null
  br i1 %36, label %.loopexit.i, label %28

.loopexit.i:                                      ; preds = %28, %25
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_push_to_pool.exit

trace_push_to_pool.exit:                          ; preds = %.loopexit.i, %5
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc void @_xfer_secondary_pool(%struct.entropy_store* %r, i64 %nbytes) #0 {
  %tmp = alloca [32 x i32], align 16
  %1 = bitcast [32 x i32]* %tmp to i8*
  call void @llvm.lifetime.start(i64 128, i8* %1) #3
  %2 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %3 = load i8* %2, align 8
  %4 = and i8 %3, 2
  %5 = icmp eq i8 %4, 0
  %6 = load i32* @random_read_wakeup_bits, align 4
  br i1 %5, label %7, label %._crit_edge

; <label>:7                                       ; preds = %0
  %8 = sdiv i32 %6, 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %0
  %9 = phi i32 [ %8, %7 ], [ 0, %0 ]
  %10 = trunc i64 %nbytes to i32
  %11 = sdiv i32 %6, 8
  %12 = icmp sgt i32 %10, %11
  %13 = select i1 %12, i32 %10, i32 %11
  %14 = icmp slt i32 %13, 128
  %15 = select i1 %14, i32 %13, i32 128
  %16 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %17 = load i8** %16, align 8
  %18 = shl i32 %15, 3
  %19 = shl i64 %nbytes, 3
  %20 = trunc i64 %19 to i32
  %21 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %22 = load i32* %21, align 4
  %23 = ashr i32 %22, 3
  %24 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 3
  %25 = load %struct.entropy_store** %24, align 8
  %26 = getelementptr inbounds %struct.entropy_store* %25, i64 0, i32 9
  %27 = load i32* %26, align 4
  %28 = ashr i32 %27, 3
  %29 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_xfer_secondary_pool, i64 0, i32 1, i32 0, i32 0), align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %trace_xfer_secondary_pool.exit

; <label>:31                                      ; preds = %._crit_edge
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %32 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_xfer_secondary_pool, i64 0, i32 4), align 8
  %33 = icmp eq %struct.tracepoint_func* %32, null
  br i1 %33, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %31
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %32, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %34

; <label>:34                                      ; preds = %34, %.preheader.i
  %35 = phi i8* [ %41, %34 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %39, %34 ], [ %32, %.preheader.i ]
  %36 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %37 = load i8** %36, align 8
  %38 = bitcast i8* %35 to void (i8*, i8*, i32, i32, i32, i32)*
  tail call void %38(i8* %37, i8* %17, i32 %18, i32 %20, i32 %23, i32 %28) #4
  %39 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %40 = getelementptr inbounds %struct.tracepoint_func* %39, i64 0, i32 0
  %41 = load i8** %40, align 8
  %42 = icmp eq i8* %41, null
  br i1 %42, label %.loopexit.i, label %34

.loopexit.i:                                      ; preds = %34, %31
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_xfer_secondary_pool.exit

trace_xfer_secondary_pool.exit:                   ; preds = %.loopexit.i, %._crit_edge
  %43 = load %struct.entropy_store** %24, align 8
  %44 = sext i32 %15 to i64
  %45 = load i32* @random_read_wakeup_bits, align 4
  %46 = sdiv i32 %45, 8
  %47 = call fastcc i64 @extract_entropy(%struct.entropy_store* %43, i8* %1, i64 %44, i32 %46, i32 %9) #5
  %48 = trunc i64 %47 to i32
  %49 = load i8** %16, align 8
  %50 = tail call i8* @llvm.returnaddress(i32 0) #3
  %51 = ptrtoint i8* %50 to i64
  %52 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %mix_pool_bytes.exit

; <label>:54                                      ; preds = %trace_xfer_secondary_pool.exit
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %55 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %56 = icmp eq %struct.tracepoint_func* %55, null
  br i1 %56, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %54
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %55, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %57

; <label>:57                                      ; preds = %57, %.preheader.i.i
  %58 = phi i8* [ %64, %57 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %62, %57 ], [ %55, %.preheader.i.i ]
  %59 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %60 = load i8** %59, align 8
  %61 = bitcast i8* %58 to void (i8*, i8*, i32, i64)*
  tail call void %61(i8* %60, i8* %49, i32 %48, i64 %51) #4
  %62 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %63 = getelementptr inbounds %struct.tracepoint_func* %62, i64 0, i32 0
  %64 = load i8** %63, align 8
  %65 = icmp eq i8* %64, null
  br i1 %65, label %.loopexit.i.i, label %57

.loopexit.i.i:                                    ; preds = %57, %54
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %trace_xfer_secondary_pool.exit
  %66 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  %67 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %66) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %1, i32 %48) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %66, i64 %67) #4
  %68 = shl i32 %48, 3
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* %r, i32 %68) #5
  call void @llvm.lifetime.end(i64 128, i8* %1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @account(%struct.entropy_store* %r, i64 %nbytes, i32 %min, i32 %reserved) #0 {
  %1 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %2 = load i32* %1, align 4
  %3 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %4 = load %struct.poolinfo** %3, align 8
  %5 = getelementptr inbounds %struct.poolinfo* %4, i64 0, i32 4
  %6 = load i32* %5, align 4
  %7 = icmp sgt i32 %2, %6
  br i1 %7, label %11, label %.preheader, !prof !26

.preheader:                                       ; preds = %0
  %8 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %9 = sext i32 %min to i64
  %10 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  br label %13

; <label>:11                                      ; preds = %0
  tail call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 1022, i64 12) #3, !srcloc !41
  br label %12

; <label>:12                                      ; preds = %12, %11
  br label %12

; <label>:13                                      ; preds = %39, %.preheader
  %14 = load volatile i32* %1, align 4
  %15 = load i8* %8, align 8
  %16 = and i8 %15, 2
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %26, label %18

; <label>:18                                      ; preds = %13
  %19 = ashr i32 %14, 6
  %20 = sub i32 %19, %reserved
  %21 = icmp slt i32 %20, 0
  %22 = sext i32 %20 to i64
  %23 = select i1 %21, i64 0, i64 %22
  %24 = icmp ugt i64 %23, %nbytes
  %25 = select i1 %24, i64 %nbytes, i64 %23
  br label %26

; <label>:26                                      ; preds = %18, %13
  %ibytes.0 = phi i64 [ %25, %18 ], [ %nbytes, %13 ]
  %27 = icmp ult i64 %ibytes.0, %9
  %.ibytes.0 = select i1 %27, i64 0, i64 %ibytes.0
  %28 = icmp slt i32 %14, 0
  br i1 %28, label %29, label %32, !prof !26

; <label>:29                                      ; preds = %26
  %30 = load i8** %10, align 8
  %31 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([52 x i8]* @.str13, i64 0, i64 0), i8* %30, i32 %14) #4
  tail call void @warn_slowpath_null(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 1042) #4
  br label %32

; <label>:32                                      ; preds = %29, %26
  %entropy_count.0 = phi i32 [ 0, %29 ], [ %14, %26 ]
  %33 = shl i64 %.ibytes.0, 6
  %34 = sext i32 %entropy_count.0 to i64
  %35 = icmp ugt i64 %34, %33
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %32
  %37 = sub i64 %34, %33
  %38 = trunc i64 %37 to i32
  br label %39

; <label>:39                                      ; preds = %36, %32
  %entropy_count.1 = phi i32 [ %38, %36 ], [ 0, %32 ]
  %40 = tail call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; cmpxchgl $2,$1", "={ax},=*m,r,0,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* %1, i32 %entropy_count.1, i32 %14, i32* %1) #3, !srcloc !42
  %41 = icmp eq i32 %40, %14
  br i1 %41, label %42, label %13

; <label>:42                                      ; preds = %39
  %43 = load i8** %10, align 8
  %44 = shl i64 %.ibytes.0, 3
  %45 = trunc i64 %44 to i32
  %46 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_debit_entropy, i64 0, i32 1, i32 0, i32 0), align 8
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %48, label %trace_debit_entropy.exit

; <label>:48                                      ; preds = %42
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %49 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_debit_entropy, i64 0, i32 4), align 8
  %50 = icmp eq %struct.tracepoint_func* %49, null
  br i1 %50, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %48
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %49, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %51

; <label>:51                                      ; preds = %51, %.preheader.i
  %52 = phi i8* [ %58, %51 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %56, %51 ], [ %49, %.preheader.i ]
  %53 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %54 = load i8** %53, align 8
  %55 = bitcast i8* %52 to void (i8*, i8*, i32)*
  tail call void %55(i8* %54, i8* %43, i32 %45) #4
  %56 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %57 = getelementptr inbounds %struct.tracepoint_func* %56, i64 0, i32 0
  %58 = load i8** %57, align 8
  %59 = icmp eq i8* %58, null
  br i1 %59, label %.loopexit.i, label %51

.loopexit.i:                                      ; preds = %51, %48
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_debit_entropy.exit

trace_debit_entropy.exit:                         ; preds = %.loopexit.i, %42
  %60 = icmp eq i64 %.ibytes.0, 0
  br i1 %60, label %67, label %61

; <label>:61                                      ; preds = %trace_debit_entropy.exit
  %62 = load i32* %1, align 4
  %63 = ashr i32 %62, 3
  %64 = load i32* @random_write_wakeup_bits, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %61
  tail call void @__wake_up(%struct.__wait_queue_head* @random_write_wait, i32 1, i32 1, i8* null) #4
  tail call void @kill_fasync(%struct.fasync_struct** @fasync, i32 29, i32 131074) #4
  br label %67

; <label>:67                                      ; preds = %66, %61, %trace_debit_entropy.exit
  ret i64 %.ibytes.0
}

; Function Attrs: noredzone nounwind
define internal fastcc void @extract_buf(%struct.entropy_store* %r, i8* nocapture %out) #0 {
  %hash = alloca %union.anon.70, align 8
  %workspace = alloca [16 x i32], align 16
  %1 = bitcast [16 x i32]* %workspace to i8*
  call void @llvm.lifetime.start(i64 64, i8* %1) #3
  %2 = bitcast %union.anon.70* %hash to [5 x i32]*
  %3 = bitcast %union.anon.70* %hash to i32*
  call void @sha_init(i32* %3) #4
  br label %4

; <label>:4                                       ; preds = %8, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %8 ]
  %5 = call { i32, i64 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x48,0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !28
  %6 = extractvalue { i32, i64 } %5, 0
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %4
  %9 = extractvalue { i32, i64 } %5, 1
  %10 = getelementptr %union.anon.70* %hash, i64 0, i32 0, i64 %indvars.iv
  store i64 %9, i64* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = icmp ult i32 %11, 3
  br i1 %12, label %4, label %13

; <label>:13                                      ; preds = %8, %4
  %14 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  %15 = call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %14) #4
  %16 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %17 = load %struct.poolinfo** %16, align 8
  %18 = getelementptr inbounds %struct.poolinfo* %17, i64 0, i32 1
  %19 = load i32* %18, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %13
  %21 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 1
  %22 = getelementptr inbounds [16 x i32]* %workspace, i64 0, i64 0
  br label %23

; <label>:23                                      ; preds = %23, %.lr.ph
  %i.11 = phi i32 [ 0, %.lr.ph ], [ %28, %23 ]
  %24 = load i32** %21, align 8
  %25 = sext i32 %i.11 to i64
  %26 = getelementptr i32* %24, i64 %25
  %27 = bitcast i32* %26 to i8*
  call void @sha_transform(i32* %3, i8* %27, i32* %22) #4
  %28 = add i32 %i.11, 16
  %29 = load %struct.poolinfo** %16, align 8
  %30 = getelementptr inbounds %struct.poolinfo* %29, i64 0, i32 1
  %31 = load i32* %30, align 4
  %32 = icmp slt i32 %28, %31
  br i1 %32, label %23, label %._crit_edge

._crit_edge:                                      ; preds = %23, %13
  %33 = bitcast %union.anon.70* %hash to i8*
  %34 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %35 = load i8** %34, align 8
  %36 = call i8* @llvm.returnaddress(i32 0) #3
  %37 = ptrtoint i8* %36 to i64
  %38 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 1, i32 0, i32 0), align 8
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %__mix_pool_bytes.exit

; <label>:40                                      ; preds = %._crit_edge
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %41 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 4), align 8
  %42 = icmp eq %struct.tracepoint_func* %41, null
  br i1 %42, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %40
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %41, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %43

; <label>:43                                      ; preds = %43, %.preheader.i.i
  %44 = phi i8* [ %50, %43 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %48, %43 ], [ %41, %.preheader.i.i ]
  %45 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %46 = load i8** %45, align 8
  %47 = bitcast i8* %44 to void (i8*, i8*, i32, i64)*
  call void %47(i8* %46, i8* %35, i32 20, i64 %37) #4
  %48 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %49 = getelementptr inbounds %struct.tracepoint_func* %48, i64 0, i32 0
  %50 = load i8** %49, align 8
  %51 = icmp eq i8* %50, null
  br i1 %51, label %.loopexit.i.i, label %43

.loopexit.i.i:                                    ; preds = %43, %40
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %__mix_pool_bytes.exit

__mix_pool_bytes.exit:                            ; preds = %.loopexit.i.i, %._crit_edge
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %33, i32 20) #4
  call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %14, i64 %15) #4
  call void @memzero_explicit(i8* %1, i64 64) #4
  %52 = getelementptr [5 x i32]* %2, i64 0, i64 3
  %53 = load i32* %52, align 4
  %54 = getelementptr inbounds %union.anon.70* %hash, i64 0, i32 0, i64 0
  %55 = load i64* %54, align 8
  %56 = trunc i64 %55 to i32
  %57 = xor i32 %56, %53
  store i32 %57, i32* %3, align 8
  %58 = getelementptr %union.anon.70* %hash, i64 0, i32 0, i64 2
  %59 = bitcast i64* %58 to i32*
  %60 = load i32* %59, align 8
  %61 = getelementptr [5 x i32]* %2, i64 0, i64 1
  %62 = lshr i64 %55, 32
  %63 = trunc i64 %62 to i32
  %64 = xor i32 %63, %60
  store i32 %64, i32* %61, align 4
  %65 = getelementptr %union.anon.70* %hash, i64 0, i32 0, i64 1
  %66 = bitcast i64* %65 to i32*
  %67 = load i32* %66, align 8
  %68 = shl i32 %67, 16
  %69 = lshr i32 %67, 16
  %70 = or i32 %69, %68
  %71 = xor i32 %70, %67
  store i32 %71, i32* %66, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %out, i8* %33, i64 10, i32 1, i1 false)
  call void @memzero_explicit(i8* %33, i64 24) #4
  call void @llvm.lifetime.end(i64 64, i8* %1) #3
  ret void
}

; Function Attrs: noredzone
declare void @memzero_explicit(i8*, i64) #1

; Function Attrs: noredzone
declare i64 @_copy_to_user(i8*, i8*, i32) #1

; Function Attrs: noredzone
declare void @warn_slowpath_fmt(i8*, i32, i8*, ...) #1

; Function Attrs: noredzone
declare void @sha_init(i32*) #1

; Function Attrs: noredzone
declare void @sha_transform(i32*, i8*, i32*) #1

; Function Attrs: noredzone
declare i32 @printk(i8*, ...) #1

; Function Attrs: noredzone
declare void @warn_slowpath_null(i8*, i32) #1

; Function Attrs: noredzone
declare void @__wake_up(%struct.__wait_queue_head*, i32, i32, i8*) #1

; Function Attrs: noredzone
declare void @kill_fasync(%struct.fasync_struct**, i32, i32) #1

; Function Attrs: noredzone
declare i32 @fasync_helper(i32, %struct.file*, i32, %struct.fasync_struct**) #1

; Function Attrs: noredzone
declare zeroext i1 @capable(i32) #1

; Function Attrs: noredzone nounwind
define internal fastcc i32 @write_pool(%struct.entropy_store* %r, i8* %buffer, i64 %count) #0 {
  %buf = alloca [16 x i32], align 16
  %1 = bitcast [16 x i32]* %buf to i8*
  call void @llvm.lifetime.start(i64 64, i8* %1) #3
  %2 = icmp eq i64 %count, 0
  br i1 %2, label %split4, label %.critedge.i.lr.ph

.critedge.i.lr.ph:                                ; preds = %0
  %3 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %4 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  br label %.critedge.i

.critedge.i:                                      ; preds = %mix_pool_bytes.exit, %.critedge.i.lr.ph
  %.013 = phi i64 [ %count, %.critedge.i.lr.ph ], [ %11, %mix_pool_bytes.exit ]
  %p.02 = phi i8* [ %buffer, %.critedge.i.lr.ph ], [ %12, %mix_pool_bytes.exit ]
  %5 = icmp ult i64 %.013, 64
  %6 = select i1 %5, i64 %.013, i64 64
  %7 = trunc i64 %6 to i32
  %8 = call i64 @_copy_from_user(i8* %1, i8* %p.02, i32 %7) #4
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %split4

; <label>:10                                      ; preds = %.critedge.i
  %11 = sub i64 %.013, %6
  %12 = getelementptr i8* %p.02, i64 %6
  %13 = load i8** %3, align 8
  %14 = call i8* @llvm.returnaddress(i32 0) #3
  %15 = ptrtoint i8* %14 to i64
  %16 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %mix_pool_bytes.exit

; <label>:18                                      ; preds = %10
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %19 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %20 = icmp eq %struct.tracepoint_func* %19, null
  br i1 %20, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %18
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %19, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %21

; <label>:21                                      ; preds = %21, %.preheader.i.i
  %22 = phi i8* [ %28, %21 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %26, %21 ], [ %19, %.preheader.i.i ]
  %23 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %24 = load i8** %23, align 8
  %25 = bitcast i8* %22 to void (i8*, i8*, i32, i64)*
  call void %25(i8* %24, i8* %13, i32 %7, i64 %15) #4
  %26 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %27 = getelementptr inbounds %struct.tracepoint_func* %26, i64 0, i32 0
  %28 = load i8** %27, align 8
  %29 = icmp eq i8* %28, null
  br i1 %29, label %.loopexit.i.i, label %21

.loopexit.i.i:                                    ; preds = %21, %18
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %10
  %30 = call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %4) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %1, i32 %7) #4
  call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %4, i64 %30) #4
  %31 = call i32 @_cond_resched() #4
  %32 = icmp eq i64 %.013, %6
  br i1 %32, label %split4, label %.critedge.i

split4:                                           ; preds = %mix_pool_bytes.exit, %.critedge.i, %0
  %.0 = phi i32 [ 0, %0 ], [ 0, %mix_pool_bytes.exit ], [ -14, %.critedge.i ]
  call void @llvm.lifetime.end(i64 64, i8* %1) #3
  ret i32 %.0
}

; Function Attrs: noredzone
declare i64 @_copy_from_user(i8*, i8*, i32) #1

; Function Attrs: noredzone
declare i8* @__kmalloc(i64, i32) #1

; Function Attrs: noredzone nounwind
define internal fastcc void @init_std_data(%struct.entropy_store* %r) #0 {
  %now = alloca %union.ktime, align 8
  %rv = alloca i64, align 8
  %1 = tail call i64 @ktime_get_with_offset(i32 0) #4
  %2 = getelementptr %union.ktime* %now, i64 0, i32 0
  store i64 %1, i64* %2, align 8
  %3 = load volatile i64* @jiffies, align 8
  %4 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 5
  store i64 %3, i64* %4, align 8
  %5 = bitcast %union.ktime* %now to i8*
  %6 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %7 = load i8** %6, align 8
  %8 = tail call i8* @llvm.returnaddress(i32 0) #3
  %9 = ptrtoint i8* %8 to i64
  %10 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %mix_pool_bytes.exit

; <label>:12                                      ; preds = %0
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %13 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %14 = icmp eq %struct.tracepoint_func* %13, null
  br i1 %14, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %12
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %13, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %15

; <label>:15                                      ; preds = %15, %.preheader.i.i
  %16 = phi i8* [ %22, %15 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %20, %15 ], [ %13, %.preheader.i.i ]
  %17 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %18 = load i8** %17, align 8
  %19 = bitcast i8* %16 to void (i8*, i8*, i32, i64)*
  tail call void %19(i8* %18, i8* %7, i32 8, i64 %9) #4
  %20 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %21 = getelementptr inbounds %struct.tracepoint_func* %20, i64 0, i32 0
  %22 = load i8** %21, align 8
  %23 = icmp eq i8* %22, null
  br i1 %23, label %.loopexit.i.i, label %15

.loopexit.i.i:                                    ; preds = %15, %12
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %0
  %24 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  %25 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %24) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %5, i32 8) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %24, i64 %25) #4
  %26 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %27 = load %struct.poolinfo** %26, align 8
  %28 = getelementptr inbounds %struct.poolinfo* %27, i64 0, i32 2
  %29 = load i32* %28, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %mix_pool_bytes.exit
  %31 = bitcast i64* %rv to i8*
  br label %32

; <label>:32                                      ; preds = %mix_pool_bytes.exit6, %.lr.ph
  %i.013 = phi i32 [ %29, %.lr.ph ], [ %67, %mix_pool_bytes.exit6 ]
  %33 = tail call { i8, i64 } asm sideeffect "661:\0A\09movb $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+18)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x48,0x0f,0xc7,0xf8\0A\09setc $0\0A6641:\0A\09.popsection", "=q,={ax},i,~{dirflag},~{fpsr},~{flags}"(i32 0) #3, !srcloc !23
  %34 = extractvalue { i8, i64 } %33, 0
  %35 = extractvalue { i8, i64 } %33, 1
  store i64 %35, i64* %rv, align 8
  %36 = icmp eq i8 %34, 0
  br i1 %36, label %37, label %50

; <label>:37                                      ; preds = %32
  %38 = tail call { i32, i64 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x48,0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !28
  %39 = extractvalue { i32, i64 } %38, 0
  %40 = extractvalue { i32, i64 } %38, 1
  store i64 %40, i64* %rv, align 8
  %41 = icmp eq i32 %39, 0
  br i1 %41, label %42, label %50

; <label>:42                                      ; preds = %37
  %43 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %44 = extractvalue { i32, i32 } %43, 0
  %45 = extractvalue { i32, i32 } %43, 1
  %46 = zext i32 %44 to i64
  %47 = zext i32 %45 to i64
  %48 = shl nuw i64 %47, 32
  %49 = or i64 %48, %46
  store i64 %49, i64* %rv, align 8
  br label %50

; <label>:50                                      ; preds = %42, %37, %32
  %51 = load i8** %6, align 8
  %52 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %mix_pool_bytes.exit6

; <label>:54                                      ; preds = %50
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %55 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %56 = icmp eq %struct.tracepoint_func* %55, null
  br i1 %56, label %.loopexit.i.i5, label %.preheader.i.i3

.preheader.i.i3:                                  ; preds = %54
  %.phi.trans.insert.i.i1 = getelementptr inbounds %struct.tracepoint_func* %55, i64 0, i32 0
  %.pre.i.i2 = load i8** %.phi.trans.insert.i.i1, align 8
  br label %57

; <label>:57                                      ; preds = %57, %.preheader.i.i3
  %58 = phi i8* [ %64, %57 ], [ %.pre.i.i2, %.preheader.i.i3 ]
  %it_func_ptr.0.i.i4 = phi %struct.tracepoint_func* [ %62, %57 ], [ %55, %.preheader.i.i3 ]
  %59 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i4, i64 0, i32 1
  %60 = load i8** %59, align 8
  %61 = bitcast i8* %58 to void (i8*, i8*, i32, i64)*
  tail call void %61(i8* %60, i8* %51, i32 8, i64 %9) #4
  %62 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i4, i64 1
  %63 = getelementptr inbounds %struct.tracepoint_func* %62, i64 0, i32 0
  %64 = load i8** %63, align 8
  %65 = icmp eq i8* %64, null
  br i1 %65, label %.loopexit.i.i5, label %57

.loopexit.i.i5:                                   ; preds = %57, %54
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit6

mix_pool_bytes.exit6:                             ; preds = %.loopexit.i.i5, %50
  %66 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %24) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %31, i32 8) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %24, i64 %66) #4
  %67 = add i32 %i.013, -8
  %68 = icmp sgt i32 %67, 0
  br i1 %68, label %32, label %._crit_edge

._crit_edge:                                      ; preds = %mix_pool_bytes.exit6, %mix_pool_bytes.exit
  %69 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %70 = getelementptr inbounds %struct.task_struct* %69, i64 0, i32 81
  %71 = load %struct.nsproxy** %70, align 8
  %72 = getelementptr inbounds %struct.nsproxy* %71, i64 0, i32 1
  %73 = load %struct.uts_namespace** %72, align 8
  %74 = getelementptr inbounds %struct.uts_namespace* %73, i64 0, i32 1, i32 0, i64 0
  %75 = load i8** %6, align 8
  %76 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %77 = icmp sgt i32 %76, 0
  br i1 %77, label %78, label %mix_pool_bytes.exit12

; <label>:78                                      ; preds = %._crit_edge
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %79 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %80 = icmp eq %struct.tracepoint_func* %79, null
  br i1 %80, label %.loopexit.i.i11, label %.preheader.i.i9

.preheader.i.i9:                                  ; preds = %78
  %.phi.trans.insert.i.i7 = getelementptr inbounds %struct.tracepoint_func* %79, i64 0, i32 0
  %.pre.i.i8 = load i8** %.phi.trans.insert.i.i7, align 8
  br label %81

; <label>:81                                      ; preds = %81, %.preheader.i.i9
  %82 = phi i8* [ %88, %81 ], [ %.pre.i.i8, %.preheader.i.i9 ]
  %it_func_ptr.0.i.i10 = phi %struct.tracepoint_func* [ %86, %81 ], [ %79, %.preheader.i.i9 ]
  %83 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i10, i64 0, i32 1
  %84 = load i8** %83, align 8
  %85 = bitcast i8* %82 to void (i8*, i8*, i32, i64)*
  tail call void %85(i8* %84, i8* %75, i32 390, i64 %9) #4
  %86 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i10, i64 1
  %87 = getelementptr inbounds %struct.tracepoint_func* %86, i64 0, i32 0
  %88 = load i8** %87, align 8
  %89 = icmp eq i8* %88, null
  br i1 %89, label %.loopexit.i.i11, label %81

.loopexit.i.i11:                                  ; preds = %81, %78
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit12

mix_pool_bytes.exit12:                            ; preds = %.loopexit.i.i11, %._crit_edge
  %90 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %24) #4
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %74, i32 390) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %24, i64 %90) #4
  ret void
}

; Function Attrs: noredzone
declare i64 @ktime_get_with_offset(i32) #1

; Function Attrs: noredzone
declare void @prandom_reseed_late() #1

; Function Attrs: noredzone
declare zeroext i1 @queue_work_on(i32, %struct.workqueue_struct*, %struct.work_struct*) #1

; Function Attrs: noredzone
declare i32 @_raw_spin_trylock(%struct.raw_spinlock*) #1 section ".spinlock.text"

; Function Attrs: noredzone
declare void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock*, i64) #1 section ".spinlock.text"

; Function Attrs: noredzone
declare i8* @perf_trace_buf_prepare(i32, i16 zeroext, %struct.pt_regs*, i32*) #1

; Function Attrs: noredzone
declare void @perf_tp_event(i64, i64, i8*, i32, %struct.pt_regs*, %struct.hlist_head*, i32, %struct.task_struct*) #1

; Function Attrs: noredzone
declare i8* @memset(i8*, i32, i64) #1

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_urandom_read(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %27

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i32*
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 1, i32 3
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %13 = bitcast %struct.trace_entry* %12 to i32*
  %14 = load i32* %13, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([68 x i8]* @.str19, i64 0, i64 0), i32 %9, i32 %11, i32 %14) #4
  %15 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %trace_handle_return.exit

; <label>:18                                      ; preds = %5
  %19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %20 = load i64* %19, align 8
  %21 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %22 = load i64* %21, align 8
  %23 = icmp ugt i64 %20, %22
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %18, %5
  %24 = phi i1 [ true, %5 ], [ %23, %18 ]
  %25 = zext i1 %24 to i32
  %26 = xor i32 %25, 1
  br label %27

; <label>:27                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %26, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare i32 @ftrace_raw_output_prep(%struct.trace_iterator*, %struct.trace_event*) #1

; Function Attrs: noredzone
declare void @trace_seq_printf(%struct.trace_seq*, i8*, ...) #1

; Function Attrs: noredzone
declare i32 @trace_define_field(%struct.ftrace_event_call*, i8*, i8*, i32, i32, i32, i32) #1

; Function Attrs: noredzone
declare i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer*, %struct.ftrace_event_file*, i64) #1

; Function Attrs: noredzone
declare void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer*) #1

; Function Attrs: noredzone
declare i32 @event_triggers_call(%struct.ftrace_event_file*, i8*) #1

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_random_read(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %27

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i32*
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = getelementptr inbounds %struct.trace_entry* %2, i64 2, i32 3
  %14 = load i32* %13, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([86 x i8]* @.str24, i64 0, i64 0), i32 %9, i32 %9, i32 %12, i32 %14) #4
  %15 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %trace_handle_return.exit

; <label>:18                                      ; preds = %5
  %19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %20 = load i64* %19, align 8
  %21 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %22 = load i64* %21, align 8
  %23 = icmp ugt i64 %20, %22
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %18, %5
  %24 = phi i1 [ true, %5 ], [ %23, %18 ]
  %25 = zext i1 %24 to i32
  %26 = xor i32 %25, 1
  br label %27

; <label>:27                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %26, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_random__extract_entropy(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %31

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i8**
  %9 = load i8** %8, align 8
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = getelementptr inbounds %struct.trace_entry* %2, i64 2, i32 3
  %14 = load i32* %13, align 4
  %15 = getelementptr inbounds %struct.trace_entry* %2, i64 3
  %16 = bitcast %struct.trace_entry* %15 to i64*
  %17 = load i64* %16, align 8
  %18 = inttoptr i64 %17 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([48 x i8]* @.str26, i64 0, i64 0), i8* %9, i32 %12, i32 %14, i8* %18) #4
  %19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %20 = load i32* %19, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %trace_handle_return.exit

; <label>:22                                      ; preds = %5
  %23 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %24 = load i64* %23, align 8
  %25 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %26 = load i64* %25, align 8
  %27 = icmp ugt i64 %24, %26
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %22, %5
  %28 = phi i1 [ true, %5 ], [ %27, %22 ]
  %29 = zext i1 %28 to i32
  %30 = xor i32 %29, 1
  br label %31

; <label>:31                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %30, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_random__get_random_bytes(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %26

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i32*
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i64*
  %12 = load i64* %11, align 8
  %13 = inttoptr i64 %12 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([22 x i8]* @.str33, i64 0, i64 0), i32 %9, i8* %13) #4
  %14 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %trace_handle_return.exit

; <label>:17                                      ; preds = %5
  %18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %19 = load i64* %18, align 8
  %20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %21 = load i64* %20, align 8
  %22 = icmp ugt i64 %19, %21
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %17, %5
  %23 = phi i1 [ true, %5 ], [ %22, %17 ]
  %24 = zext i1 %23 to i32
  %25 = xor i32 %24, 1
  br label %26

; <label>:26                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %25, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_xfer_secondary_pool(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %32

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i8**
  %9 = load i8** %8, align 8
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = getelementptr inbounds %struct.trace_entry* %2, i64 2, i32 3
  %14 = load i32* %13, align 4
  %15 = getelementptr inbounds %struct.trace_entry* %2, i64 3
  %16 = bitcast %struct.trace_entry* %15 to i32*
  %17 = load i32* %16, align 4
  %18 = getelementptr inbounds %struct.trace_entry* %2, i64 3, i32 3
  %19 = load i32* %18, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([71 x i8]* @.str34, i64 0, i64 0), i8* %9, i32 %12, i32 %14, i32 %17, i32 %19) #4
  %20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %21 = load i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %trace_handle_return.exit

; <label>:23                                      ; preds = %5
  %24 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %25 = load i64* %24, align 8
  %26 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %27 = load i64* %26, align 8
  %28 = icmp ugt i64 %25, %27
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %23, %5
  %29 = phi i1 [ true, %5 ], [ %28, %23 ]
  %30 = zext i1 %29 to i32
  %31 = xor i32 %30, 1
  br label %32

; <label>:32                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %31, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_add_disk_randomness(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %26

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i32*
  %9 = load i32* %8, align 4
  %10 = lshr i32 %9, 20
  %11 = and i32 %9, 1048575
  %12 = getelementptr inbounds %struct.trace_entry* %2, i64 1, i32 3
  %13 = load i32* %12, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([30 x i8]* @.str39, i64 0, i64 0), i32 %10, i32 %11, i32 %13) #4
  %14 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %trace_handle_return.exit

; <label>:17                                      ; preds = %5
  %18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %19 = load i64* %18, align 8
  %20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %21 = load i64* %20, align 8
  %22 = icmp ugt i64 %19, %21
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %17, %5
  %23 = phi i1 [ true, %5 ], [ %22, %17 ]
  %24 = zext i1 %23 to i32
  %25 = xor i32 %24, 1
  br label %26

; <label>:26                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %25, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_add_input_randomness(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %22

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i32*
  %9 = load i32* %8, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([20 x i8]* @.str43, i64 0, i64 0), i32 %9) #4
  %10 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %11 = load i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %trace_handle_return.exit

; <label>:13                                      ; preds = %5
  %14 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %15 = load i64* %14, align 8
  %16 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %17 = load i64* %16, align 8
  %18 = icmp ugt i64 %15, %17
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %13, %5
  %19 = phi i1 [ true, %5 ], [ %18, %13 ]
  %20 = zext i1 %19 to i32
  %21 = xor i32 %20, 1
  br label %22

; <label>:22                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %21, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_debit_entropy(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %25

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i8**
  %9 = load i8** %8, align 8
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i32*
  %12 = load i32* %11, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([19 x i8]* @.str44, i64 0, i64 0), i8* %9, i32 %12) #4
  %13 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %14 = load i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %trace_handle_return.exit

; <label>:16                                      ; preds = %5
  %17 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %18 = load i64* %17, align 8
  %19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %20 = load i64* %19, align 8
  %21 = icmp ugt i64 %18, %20
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %16, %5
  %22 = phi i1 [ true, %5 ], [ %21, %16 ]
  %23 = zext i1 %22 to i32
  %24 = xor i32 %23, 1
  br label %25

; <label>:25                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %24, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_push_to_pool(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %27

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i8**
  %9 = load i8** %8, align 8
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = getelementptr inbounds %struct.trace_entry* %2, i64 2, i32 3
  %14 = load i32* %13, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([37 x i8]* @.str46, i64 0, i64 0), i8* %9, i32 %12, i32 %14) #4
  %15 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %trace_handle_return.exit

; <label>:18                                      ; preds = %5
  %19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %20 = load i64* %19, align 8
  %21 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %22 = load i64* %21, align 8
  %23 = icmp ugt i64 %20, %22
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %18, %5
  %24 = phi i1 [ true, %5 ], [ %23, %18 ]
  %25 = zext i1 %24 to i32
  %26 = xor i32 %25, 1
  br label %27

; <label>:27                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %26, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_credit_entropy_bits(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %34

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i8**
  %9 = load i8** %8, align 8
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = getelementptr inbounds %struct.trace_entry* %2, i64 2, i32 3
  %14 = load i32* %13, align 4
  %15 = getelementptr inbounds %struct.trace_entry* %2, i64 3
  %16 = bitcast %struct.trace_entry* %15 to i32*
  %17 = load i32* %16, align 4
  %18 = getelementptr inbounds %struct.trace_entry* %2, i64 4
  %19 = bitcast %struct.trace_entry* %18 to i64*
  %20 = load i64* %19, align 8
  %21 = inttoptr i64 %20 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([63 x i8]* @.str48, i64 0, i64 0), i8* %9, i32 %12, i32 %14, i32 %17, i8* %21) #4
  %22 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %23 = load i32* %22, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %trace_handle_return.exit

; <label>:25                                      ; preds = %5
  %26 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %27 = load i64* %26, align 8
  %28 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %29 = load i64* %28, align 8
  %30 = icmp ugt i64 %27, %29
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %25, %5
  %31 = phi i1 [ true, %5 ], [ %30, %25 ]
  %32 = zext i1 %31 to i32
  %33 = xor i32 %32, 1
  br label %34

; <label>:34                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %33, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_random__mix_pool_bytes(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %29

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i8**
  %9 = load i8** %8, align 8
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = getelementptr inbounds %struct.trace_entry* %2, i64 3
  %14 = bitcast %struct.trace_entry* %13 to i64*
  %15 = load i64* %14, align 8
  %16 = inttoptr i64 %15 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([30 x i8]* @.str51, i64 0, i64 0), i8* %9, i32 %12, i8* %16) #4
  %17 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %18 = load i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %trace_handle_return.exit

; <label>:20                                      ; preds = %5
  %21 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %22 = load i64* %21, align 8
  %23 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %24 = load i64* %23, align 8
  %25 = icmp ugt i64 %22, %24
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %20, %5
  %26 = phi i1 [ true, %5 ], [ %25, %20 ]
  %27 = zext i1 %26 to i32
  %28 = xor i32 %27, 1
  br label %29

; <label>:29                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %28, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_add_device_randomness(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
  %1 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %2 = load %struct.trace_entry** %1, align 8
  %3 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %26

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %7 = getelementptr inbounds %struct.trace_entry* %2, i64 1
  %8 = bitcast %struct.trace_entry* %7 to i32*
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.trace_entry* %2, i64 2
  %11 = bitcast %struct.trace_entry* %10 to i64*
  %12 = load i64* %11, align 8
  %13 = inttoptr i64 %12 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %6, i8* getelementptr inbounds ([21 x i8]* @.str53, i64 0, i64 0), i32 %9, i8* %13) #4
  %14 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %trace_handle_return.exit

; <label>:17                                      ; preds = %5
  %18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %19 = load i64* %18, align 8
  %20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %21 = load i64* %20, align 8
  %22 = icmp ugt i64 %19, %21
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %17, %5
  %23 = phi i1 [ true, %5 ], [ %22, %17 ]
  %24 = zext i1 %23 to i32
  %25 = xor i32 %24, 1
  br label %26

; <label>:26                                      ; preds = %trace_handle_return.exit, %0
  %.0 = phi i32 [ %25, %trace_handle_return.exit ], [ %3, %0 ]
  ret i32 %.0
}

attributes #0 = { noredzone nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noredzone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { nobuiltin noredzone nounwind }
attributes #5 = { nobuiltin noredzone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!1 = metadata !{i32 -2143194561}
!2 = metadata !{i32 -2143987671}
!3 = metadata !{i32 -2143912720}
!4 = metadata !{i32 -2143190982}
!5 = metadata !{i32 -2143185021}
!6 = metadata !{i32 -2143180277}
!7 = metadata !{i32 -2143175940}
!8 = metadata !{i32 -2143171898}
!9 = metadata !{i32 -2143166862}
!10 = metadata !{i32 -2143161064}
!11 = metadata !{i32 -2143157609}
!12 = metadata !{i32 -2143149394}
!13 = metadata !{i32 -2143143874}
!14 = metadata !{i32 -2143139172}
!15 = metadata !{i32 772924}
!16 = metadata !{i32 -2145834594}
!17 = metadata !{i32 -2145834210}
!18 = metadata !{i32 -2143119471}
!19 = metadata !{i32 319628}
!20 = metadata !{i32 -2143119292}
!21 = metadata !{i32 -2143117659}
!22 = metadata !{i32 -2144628031}
!23 = metadata !{i32 -2145173329, i32 -2145173322, i32 -2145173284, i32 -2145173308, i32 -2145173306, i32 -2145173785, i32 -2145173238, i32 -2145173190, i32 -2145173124, i32 -2145173062, i32 -2145173010, i32 -2145173705, i32 -2145173680, i32 -2145172802, i32 -2145173607, i32 -2145173582, i32 -2145172506, i32 -2145172618, i32 -2145172537, i32 -2145172489, i32 -2145172574}
!24 = metadata !{i32 -2146426030}
!25 = metadata !{i32 -2146404016}
!26 = metadata !{metadata !"branch_weights", i32 4, i32 64}
!27 = metadata !{i32 -2143122411, i32 -2143122372, i32 -2143122351, i32 -2143122314, i32 -2143122291, i32 -2143122282}
!28 = metadata !{i32 -2145178639, i32 -2145178632, i32 -2145178594, i32 -2145178618, i32 -2145178616, i32 -2145179150, i32 -2145178548, i32 -2145178500, i32 -2145178434, i32 -2145178372, i32 -2145178320, i32 -2145179070, i32 -2145179045, i32 -2145178112, i32 -2145178972, i32 -2145178947, i32 -2145177761, i32 -2145177928, i32 -2145177875, i32 -2145177839, i32 -2145177814, i32 -2145177786, i32 -2145177773, i32 -2145177744, i32 -2145177884}
!29 = metadata !{i32 -2143098841}
!30 = metadata !{i32 -2143097444}
!31 = metadata !{i32 -2143096085}
!32 = metadata !{i32 -2143095525}
!33 = metadata !{i32 -2146734751}
!34 = metadata !{i32 316375, i32 316386}
!35 = metadata !{i32 -2145175872, i32 -2145175865, i32 -2145175827, i32 -2145175851, i32 -2145175849, i32 -2145176373, i32 -2145175786, i32 -2145175738, i32 -2145175672, i32 -2145175610, i32 -2145175558, i32 -2145176293, i32 -2145176268, i32 -2145175350, i32 -2145176195, i32 -2145176170, i32 -2145175004, i32 -2145175166, i32 -2145175113, i32 -2145175082, i32 -2145175057, i32 -2145175029, i32 -2145175016, i32 -2145174987, i32 -2145175122}
!36 = metadata !{i32 -2143081603}
!37 = metadata !{i32 -2143081146}
!38 = metadata !{i32 -2143080666}
!39 = metadata !{i32 -2146524858}
!40 = metadata !{i32 -2143114617, i32 -2143114592, i32 -2143114322, i32 -2143114525, i32 -2143114494, i32 -2143114464}
!41 = metadata !{i32 -2143114045, i32 -2143114020, i32 -2143113750, i32 -2143113953, i32 -2143113922, i32 -2143113892}
!42 = metadata !{i32 -2143110463, i32 -2143110424, i32 -2143110403, i32 -2143110366, i32 -2143110343, i32 -2143110334}
