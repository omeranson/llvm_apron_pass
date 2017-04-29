; ModuleID = '/home/oren/GIT/llvm_apron_pass/FOLDER_2_LLVM_BITCODE_FILES/Input.O3.MergeReturn.InstNamer.bc'
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
@llvm.used = appending global [66 x i8*] [i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_device_randomness to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_get_random_bytes_arch to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_get_random_bytes to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_mix_pool_bytes_nolock to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_random_read to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_get_random_bytes to i8*), i8* bitcast (i32 ()** @__initcall_rand_initializeearly to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_credit_entropy_bits to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_extract_entropy_user to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_get_random_bytes to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__extract_entropy to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_get_random_int to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_get_random_bytes_arch to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_add_input_randomness to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_urandom_read to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_credit_entropy_bits to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_get_random_bytes_arch to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_credit_entropy_bits to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_urandom_read to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_add_disk_randomness to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_device_randomness to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_push_to_pool to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__mix_pool_bytes to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_extract_entropy to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_hwgenerator_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_extract_entropy to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_urandom_read to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_xfer_secondary_pool to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_generate_random_uuid to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_debit_entropy to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_add_device_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_extract_entropy_user to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_debit_entropy to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_add_device_randomness to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_input_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_debit_entropy to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_push_to_pool to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_extract_entropy_user to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_debit_entropy to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_push_to_pool to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_xfer_secondary_pool to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_add_disk_randomness to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random_read to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_input_randomness to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_push_to_pool to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_get_random_bytes_arch to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_credit_entropy_bits to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_device_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_disk_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_random_read to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_add_disk_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_xfer_secondary_pool to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_add_input_randomness to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_random_read to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_add_input_randomness to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_mix_pool_bytes to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_get_random_bytes to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_urandom_read to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_add_disk_randomness to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_mix_pool_bytes to i8*), i8* bitcast ({ i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }* @event_class_random__get_random_bytes to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_extract_entropy to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_mix_pool_bytes to i8*), i8* bitcast ({ %struct.list_head, %struct.ftrace_event_class*, { %struct.tracepoint* }, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }* @event_mix_pool_bytes_nolock to i8*), i8* bitcast (%struct.tracepoint** @__tracepoint_ptr_mix_pool_bytes_nolock to i8*), i8* bitcast (%struct.ftrace_event_call** @__event_xfer_secondary_pool to i8*)], section "llvm.metadata"

@sys_getrandom = alias bitcast (i64 (i64, i64, i64)* @SyS_getrandom to i64 (i8*, i64, i32)*)

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_add_device_randomness(i8* %__data, i32 %bytes, i64 %IP) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 24) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i32*
  store i32 %bytes, i32* %tmp19, align 4
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i64*
  store i64 %IP, i64* %tmp21, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_add_device_randomness(i8* nocapture readonly %__data, i32 %bytes, i64 %IP) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !1
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb30, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %bytes, i32* %tmp25, align 4
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i64*
  store i64 %IP, i64* %tmp27, align 8
  %tmp28 = load i32* %rctx, align 4
  %tmp29 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp29, i32 %tmp28, %struct.task_struct* null) #4
  br label %bb30

bb30:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone
declare i32 @ftrace_event_reg(%struct.ftrace_event_call*, i32, i8*) #1

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_add_device_randomness(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str52, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb4

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 16, i32 8, i32 0, i32 0) #4
  br label %bb4

bb4:                                              ; preds = %bb2, %bb
  %.0 = phi i32 [ %tmp3, %bb2 ], [ %tmp, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare i32 @trace_event_raw_init(%struct.ftrace_event_call*) #1

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random__mix_pool_bytes(i8* %__data, i8* %pool_name, i32 %bytes, i64 %IP) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 32) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i8**
  store i8* %pool_name, i8** %tmp19, align 8
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %bytes, i32* %tmp21, align 4
  %tmp22 = getelementptr inbounds i8* %tmp15, i64 24
  %tmp23 = bitcast i8* %tmp22 to i64*
  store i64 %IP, i64* %tmp23, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random__mix_pool_bytes(i8* nocapture readonly %__data, i8* %pool_name, i32 %bytes, i64 %IP) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !4
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 36, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb32, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i8**
  store i8* %pool_name, i8** %tmp25, align 8
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %bytes, i32* %tmp27, align 4
  %tmp28 = getelementptr inbounds i8* %tmp21, i64 24
  %tmp29 = bitcast i8* %tmp28 to i64*
  store i64 %IP, i64* %tmp29, align 8
  %tmp30 = load i32* %rctx, align 4
  %tmp31 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 36, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp31, i32 %tmp30, %struct.task_struct* null) #4
  br label %bb32

bb32:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random__mix_pool_bytes(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb7

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str52, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %tmp4 = icmp eq i32 %tmp3, 0
  br i1 %tmp4, label %bb5, label %bb7

bb5:                                              ; preds = %bb2
  %tmp6 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 24, i32 8, i32 0, i32 0) #4
  br label %bb7

bb7:                                              ; preds = %bb5, %bb2, %bb
  %.0 = phi i32 [ %tmp6, %bb5 ], [ %tmp, %bb ], [ %tmp3, %bb2 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_credit_entropy_bits(i8* %__data, i8* %pool_name, i32 %bits, i32 %entropy_count, i32 %entropy_total, i64 %IP) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 40) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i8**
  store i8* %pool_name, i8** %tmp19, align 8
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %bits, i32* %tmp21, align 4
  %tmp22 = getelementptr inbounds i8* %tmp15, i64 20
  %tmp23 = bitcast i8* %tmp22 to i32*
  store i32 %entropy_count, i32* %tmp23, align 4
  %tmp24 = getelementptr inbounds i8* %tmp15, i64 24
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %entropy_total, i32* %tmp25, align 4
  %tmp26 = getelementptr inbounds i8* %tmp15, i64 32
  %tmp27 = bitcast i8* %tmp26 to i64*
  store i64 %IP, i64* %tmp27, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_credit_entropy_bits(i8* nocapture readonly %__data, i8* %pool_name, i32 %bits, i32 %entropy_count, i32 %entropy_total, i64 %IP) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !5
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 44, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb36, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i8**
  store i8* %pool_name, i8** %tmp25, align 8
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %bits, i32* %tmp27, align 4
  %tmp28 = getelementptr inbounds i8* %tmp21, i64 20
  %tmp29 = bitcast i8* %tmp28 to i32*
  store i32 %entropy_count, i32* %tmp29, align 4
  %tmp30 = getelementptr inbounds i8* %tmp21, i64 24
  %tmp31 = bitcast i8* %tmp30 to i32*
  store i32 %entropy_total, i32* %tmp31, align 4
  %tmp32 = getelementptr inbounds i8* %tmp21, i64 32
  %tmp33 = bitcast i8* %tmp32 to i64*
  store i64 %IP, i64* %tmp33, align 8
  %tmp34 = load i32* %rctx, align 4
  %tmp35 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 44, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp35, i32 %tmp34, %struct.task_struct* null) #4
  br label %bb36

bb36:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_credit_entropy_bits(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb13

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str49, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %tmp4 = icmp eq i32 %tmp3, 0
  br i1 %tmp4, label %bb5, label %bb13

bb5:                                              ; preds = %bb2
  %tmp6 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str30, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  %tmp7 = icmp eq i32 %tmp6, 0
  br i1 %tmp7, label %bb8, label %bb13

bb8:                                              ; preds = %bb5
  %tmp9 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str50, i64 0, i64 0), i32 24, i32 4, i32 1, i32 0) #4
  %tmp10 = icmp eq i32 %tmp9, 0
  br i1 %tmp10, label %bb11, label %bb13

bb11:                                             ; preds = %bb8
  %tmp12 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 32, i32 8, i32 0, i32 0) #4
  br label %bb13

bb13:                                             ; preds = %bb11, %bb8, %bb5, %bb2, %bb
  %.0 = phi i32 [ %tmp12, %bb11 ], [ %tmp, %bb ], [ %tmp3, %bb2 ], [ %tmp6, %bb5 ], [ %tmp9, %bb8 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_push_to_pool(i8* %__data, i8* %pool_name, i32 %pool_bits, i32 %input_bits) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 24) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i8**
  store i8* %pool_name, i8** %tmp19, align 8
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %pool_bits, i32* %tmp21, align 4
  %tmp22 = getelementptr inbounds i8* %tmp15, i64 20
  %tmp23 = bitcast i8* %tmp22 to i32*
  store i32 %input_bits, i32* %tmp23, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_push_to_pool(i8* nocapture readonly %__data, i8* %pool_name, i32 %pool_bits, i32 %input_bits) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !6
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb32, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i8**
  store i8* %pool_name, i8** %tmp25, align 8
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %pool_bits, i32* %tmp27, align 4
  %tmp28 = getelementptr inbounds i8* %tmp21, i64 20
  %tmp29 = bitcast i8* %tmp28 to i32*
  store i32 %input_bits, i32* %tmp29, align 4
  %tmp30 = load i32* %rctx, align 4
  %tmp31 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp31, i32 %tmp30, %struct.task_struct* null) #4
  br label %bb32

bb32:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_push_to_pool(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb7

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str47, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %tmp4 = icmp eq i32 %tmp3, 0
  br i1 %tmp4, label %bb5, label %bb7

bb5:                                              ; preds = %bb2
  %tmp6 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str42, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  br label %bb7

bb7:                                              ; preds = %bb5, %bb2, %bb
  %.0 = phi i32 [ %tmp6, %bb5 ], [ %tmp, %bb ], [ %tmp3, %bb2 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_debit_entropy(i8* %__data, i8* %pool_name, i32 %debit_bits) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 24) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i8**
  store i8* %pool_name, i8** %tmp19, align 8
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %debit_bits, i32* %tmp21, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_debit_entropy(i8* nocapture readonly %__data, i8* %pool_name, i32 %debit_bits) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !7
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb30, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i8**
  store i8* %pool_name, i8** %tmp25, align 8
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %debit_bits, i32* %tmp27, align 4
  %tmp28 = load i32* %rctx, align 4
  %tmp29 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp29, i32 %tmp28, %struct.task_struct* null) #4
  br label %bb30

bb30:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_debit_entropy(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb4

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str45, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  br label %bb4

bb4:                                              ; preds = %bb2, %bb
  %.0 = phi i32 [ %tmp3, %bb2 ], [ %tmp, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_add_input_randomness(i8* %__data, i32 %input_bits) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 12) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i32*
  store i32 %input_bits, i32* %tmp19, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_add_input_randomness(i8* nocapture readonly %__data, i32 %input_bits) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !8
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 12, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb28, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %input_bits, i32* %tmp25, align 4
  %tmp26 = load i32* %rctx, align 4
  %tmp27 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 12, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp27, i32 %tmp26, %struct.task_struct* null) #4
  br label %bb28

bb28:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_add_input_randomness(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str42, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  ret i32 %tmp
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_add_disk_randomness(i8* %__data, i32 %dev, i32 %input_bits) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 16) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i32*
  store i32 %dev, i32* %tmp19, align 4
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 12
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %input_bits, i32* %tmp21, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_add_disk_randomness(i8* nocapture readonly %__data, i32 %dev, i32 %input_bits) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !9
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 20, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb30, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %dev, i32* %tmp25, align 4
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 12
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %input_bits, i32* %tmp27, align 4
  %tmp28 = load i32* %rctx, align 4
  %tmp29 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 20, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp29, i32 %tmp28, %struct.task_struct* null) #4
  br label %bb30

bb30:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_add_disk_randomness(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([6 x i8]* @.str40, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str41, i64 0, i64 0), i32 8, i32 4, i32 0, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb4

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str42, i64 0, i64 0), i32 12, i32 4, i32 1, i32 0) #4
  br label %bb4

bb4:                                              ; preds = %bb2, %bb
  %.0 = phi i32 [ %tmp3, %bb2 ], [ %tmp, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_xfer_secondary_pool(i8* %__data, i8* %pool_name, i32 %xfer_bits, i32 %request_bits, i32 %pool_entropy, i32 %input_entropy) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 32) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i8**
  store i8* %pool_name, i8** %tmp19, align 8
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %xfer_bits, i32* %tmp21, align 4
  %tmp22 = getelementptr inbounds i8* %tmp15, i64 20
  %tmp23 = bitcast i8* %tmp22 to i32*
  store i32 %request_bits, i32* %tmp23, align 4
  %tmp24 = getelementptr inbounds i8* %tmp15, i64 24
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %pool_entropy, i32* %tmp25, align 4
  %tmp26 = getelementptr inbounds i8* %tmp15, i64 28
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %input_entropy, i32* %tmp27, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_xfer_secondary_pool(i8* nocapture readonly %__data, i8* %pool_name, i32 %xfer_bits, i32 %request_bits, i32 %pool_entropy, i32 %input_entropy) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !10
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 36, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb36, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i8**
  store i8* %pool_name, i8** %tmp25, align 8
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %xfer_bits, i32* %tmp27, align 4
  %tmp28 = getelementptr inbounds i8* %tmp21, i64 20
  %tmp29 = bitcast i8* %tmp28 to i32*
  store i32 %request_bits, i32* %tmp29, align 4
  %tmp30 = getelementptr inbounds i8* %tmp21, i64 24
  %tmp31 = bitcast i8* %tmp30 to i32*
  store i32 %pool_entropy, i32* %tmp31, align 4
  %tmp32 = getelementptr inbounds i8* %tmp21, i64 28
  %tmp33 = bitcast i8* %tmp32 to i32*
  store i32 %input_entropy, i32* %tmp33, align 4
  %tmp34 = load i32* %rctx, align 4
  %tmp35 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 36, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp35, i32 %tmp34, %struct.task_struct* null) #4
  br label %bb36

bb36:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_xfer_secondary_pool(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb13

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str35, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %tmp4 = icmp eq i32 %tmp3, 0
  br i1 %tmp4, label %bb5, label %bb13

bb5:                                              ; preds = %bb2
  %tmp6 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str36, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  %tmp7 = icmp eq i32 %tmp6, 0
  br i1 %tmp7, label %bb8, label %bb13

bb8:                                              ; preds = %bb5
  %tmp9 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @.str37, i64 0, i64 0), i32 24, i32 4, i32 1, i32 0) #4
  %tmp10 = icmp eq i32 %tmp9, 0
  br i1 %tmp10, label %bb11, label %bb13

bb11:                                             ; preds = %bb8
  %tmp12 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str38, i64 0, i64 0), i32 28, i32 4, i32 1, i32 0) #4
  br label %bb13

bb13:                                             ; preds = %bb11, %bb8, %bb5, %bb2, %bb
  %.0 = phi i32 [ %tmp12, %bb11 ], [ %tmp, %bb ], [ %tmp3, %bb2 ], [ %tmp6, %bb5 ], [ %tmp9, %bb8 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random__get_random_bytes(i8* %__data, i32 %nbytes, i64 %IP) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 24) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i32*
  store i32 %nbytes, i32* %tmp19, align 4
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i64*
  store i64 %IP, i64* %tmp21, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random__get_random_bytes(i8* nocapture readonly %__data, i32 %nbytes, i64 %IP) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !11
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb30, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %nbytes, i32* %tmp25, align 4
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i64*
  store i64 %IP, i64* %tmp27, align 8
  %tmp28 = load i32* %rctx, align 4
  %tmp29 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp29, i32 %tmp28, %struct.task_struct* null) #4
  br label %bb30

bb30:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random__get_random_bytes(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str29, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb4

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 16, i32 8, i32 0, i32 0) #4
  br label %bb4

bb4:                                              ; preds = %bb2, %bb
  %.0 = phi i32 [ %tmp3, %bb2 ], [ %tmp, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random__extract_entropy(i8* %__data, i8* %pool_name, i32 %nbytes, i32 %entropy_count, i64 %IP) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 32) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i8**
  store i8* %pool_name, i8** %tmp19, align 8
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %nbytes, i32* %tmp21, align 4
  %tmp22 = getelementptr inbounds i8* %tmp15, i64 20
  %tmp23 = bitcast i8* %tmp22 to i32*
  store i32 %entropy_count, i32* %tmp23, align 4
  %tmp24 = getelementptr inbounds i8* %tmp15, i64 24
  %tmp25 = bitcast i8* %tmp24 to i64*
  store i64 %IP, i64* %tmp25, align 8
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random__extract_entropy(i8* nocapture readonly %__data, i8* %pool_name, i32 %nbytes, i32 %entropy_count, i64 %IP) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !12
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 36, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb34, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i8**
  store i8* %pool_name, i8** %tmp25, align 8
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %nbytes, i32* %tmp27, align 4
  %tmp28 = getelementptr inbounds i8* %tmp21, i64 20
  %tmp29 = bitcast i8* %tmp28 to i32*
  store i32 %entropy_count, i32* %tmp29, align 4
  %tmp30 = getelementptr inbounds i8* %tmp21, i64 24
  %tmp31 = bitcast i8* %tmp30 to i64*
  store i64 %IP, i64* %tmp31, align 8
  %tmp32 = load i32* %rctx, align 4
  %tmp33 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 36, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp33, i32 %tmp32, %struct.task_struct* null) #4
  br label %bb34

bb34:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random__extract_entropy(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([13 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str28, i64 0, i64 0), i32 8, i32 8, i32 0, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb10

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str29, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %tmp4 = icmp eq i32 %tmp3, 0
  br i1 %tmp4, label %bb5, label %bb10

bb5:                                              ; preds = %bb2
  %tmp6 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str30, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  %tmp7 = icmp eq i32 %tmp6, 0
  br i1 %tmp7, label %bb8, label %bb10

bb8:                                              ; preds = %bb5
  %tmp9 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([14 x i8]* @.str31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str32, i64 0, i64 0), i32 24, i32 8, i32 0, i32 0) #4
  br label %bb10

bb10:                                             ; preds = %bb8, %bb5, %bb2, %bb
  %.0 = phi i32 [ %tmp9, %bb8 ], [ %tmp, %bb ], [ %tmp3, %bb2 ], [ %tmp6, %bb5 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_random_read(i8* %__data, i32 %got_bits, i32 %need_bits, i32 %pool_left, i32 %input_left) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 24) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i32*
  store i32 %got_bits, i32* %tmp19, align 4
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 12
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %need_bits, i32* %tmp21, align 4
  %tmp22 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp23 = bitcast i8* %tmp22 to i32*
  store i32 %pool_left, i32* %tmp23, align 4
  %tmp24 = getelementptr inbounds i8* %tmp15, i64 20
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %input_left, i32* %tmp25, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_random_read(i8* nocapture readonly %__data, i32 %got_bits, i32 %need_bits, i32 %pool_left, i32 %input_left) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !13
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 28, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb34, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %got_bits, i32* %tmp25, align 4
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 12
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %need_bits, i32* %tmp27, align 4
  %tmp28 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp29 = bitcast i8* %tmp28 to i32*
  store i32 %pool_left, i32* %tmp29, align 4
  %tmp30 = getelementptr inbounds i8* %tmp21, i64 20
  %tmp31 = bitcast i8* %tmp30 to i32*
  store i32 %input_left, i32* %tmp31, align 4
  %tmp32 = load i32* %rctx, align 4
  %tmp33 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 28, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp33, i32 %tmp32, %struct.task_struct* null) #4
  br label %bb34

bb34:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_random_read(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str21, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb10

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str25, i64 0, i64 0), i32 12, i32 4, i32 1, i32 0) #4
  %tmp4 = icmp eq i32 %tmp3, 0
  br i1 %tmp4, label %bb5, label %bb10

bb5:                                              ; preds = %bb2
  %tmp6 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  %tmp7 = icmp eq i32 %tmp6, 0
  br i1 %tmp7, label %bb8, label %bb10

bb8:                                              ; preds = %bb5
  %tmp9 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str23, i64 0, i64 0), i32 20, i32 4, i32 1, i32 0) #4
  br label %bb10

bb10:                                             ; preds = %bb8, %bb5, %bb2, %bb
  %.0 = phi i32 [ %tmp9, %bb8 ], [ %tmp, %bb ], [ %tmp3, %bb2 ], [ %tmp6, %bb5 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal void @ftrace_raw_event_urandom_read(i8* %__data, i32 %got_bits, i32 %pool_left, i32 %input_left) #0 {
bb:
  %fbuffer = alloca %struct.ftrace_event_buffer, align 8
  %tmp = bitcast i8* %__data to %struct.ftrace_event_file*
  %tmp1 = bitcast %struct.ftrace_event_buffer* %fbuffer to i8*
  call void @llvm.lifetime.start(i64 48, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds i8* %__data, i64 72
  %tmp3 = bitcast i8* %tmp2 to i64*
  %tmp4 = load i64* %tmp3, align 8
  %tmp5 = and i64 %tmp4, 128
  %tmp6 = icmp eq i64 %tmp5, 0
  br i1 %tmp6, label %bb7, label %ftrace_trigger_soft_disabled.exit

bb7:                                              ; preds = %bb
  %tmp8 = and i64 %tmp4, 64
  %tmp9 = icmp eq i64 %tmp8, 0
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb7
  %tmp11 = call i32 @event_triggers_call(%struct.ftrace_event_file* %tmp, i8* null) #4
  br label %bb12

bb12:                                             ; preds = %bb10, %bb7
  %tmp13 = and i64 %tmp4, 32
  %tmp14 = icmp eq i64 %tmp13, 0
  br i1 %tmp14, label %ftrace_trigger_soft_disabled.exit, label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit:                ; preds = %bb12, %bb
  %tmp15 = call i8* @ftrace_event_buffer_reserve(%struct.ftrace_event_buffer* %fbuffer, %struct.ftrace_event_file* %tmp, i64 20) #4
  %tmp16 = icmp eq i8* %tmp15, null
  br i1 %tmp16, label %ftrace_trigger_soft_disabled.exit.thread, label %bb17

bb17:                                             ; preds = %ftrace_trigger_soft_disabled.exit
  %tmp18 = getelementptr inbounds i8* %tmp15, i64 8
  %tmp19 = bitcast i8* %tmp18 to i32*
  store i32 %got_bits, i32* %tmp19, align 4
  %tmp20 = getelementptr inbounds i8* %tmp15, i64 12
  %tmp21 = bitcast i8* %tmp20 to i32*
  store i32 %pool_left, i32* %tmp21, align 4
  %tmp22 = getelementptr inbounds i8* %tmp15, i64 16
  %tmp23 = bitcast i8* %tmp22 to i32*
  store i32 %input_left, i32* %tmp23, align 4
  call void @ftrace_event_buffer_commit(%struct.ftrace_event_buffer* %fbuffer) #4
  br label %ftrace_trigger_soft_disabled.exit.thread

ftrace_trigger_soft_disabled.exit.thread:         ; preds = %bb17, %ftrace_trigger_soft_disabled.exit, %bb12
  call void @llvm.lifetime.end(i64 48, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal void @perf_trace_urandom_read(i8* nocapture readonly %__data, i32 %got_bits, i32 %pool_left, i32 %input_left) #0 {
bb:
  %__regs = alloca %struct.pt_regs, align 8
  %rctx = alloca i32, align 4
  %tmp = bitcast %struct.pt_regs* %__regs to i8*
  call void @llvm.lifetime.start(i64 168, i8* %tmp) #3
  %tmp1 = getelementptr inbounds i8* %__data, i64 120
  %tmp2 = bitcast i8* %tmp1 to %struct.hlist_head**
  %tmp3 = load %struct.hlist_head** %tmp2, align 8
  %tmp4 = call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.hlist_head* %tmp3) #3, !srcloc !14
  %tmp5 = call i8* @memset(i8* %tmp, i32 0, i64 168) #4
  %tmp6 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp7 = ptrtoint i8* %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 16
  store i64 %tmp7, i64* %tmp8, align 8
  %tmp9 = call %struct.stack_frame* asm "movq %rbp, $0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !2
  %tmp10 = getelementptr inbounds %struct.stack_frame* %tmp9, i64 0, i32 0
  %tmp11 = load %struct.stack_frame** %tmp10, align 8
  %tmp12 = ptrtoint %struct.stack_frame* %tmp11 to i64
  %tmp13 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 4
  store i64 %tmp12, i64* %tmp13, align 8
  %tmp14 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 17
  store i64 16, i64* %tmp14, align 8
  %tmp15 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 18
  store i64 0, i64* %tmp15, align 8
  %tmp16 = getelementptr inbounds %struct.pt_regs* %__regs, i64 0, i32 19
  call void asm sideeffect " movq %rsp, $0\0A", "=*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %tmp16) #3, !srcloc !3
  %tmp17 = getelementptr inbounds i8* %__data, i64 64
  %tmp18 = bitcast i8* %tmp17 to i32*
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = trunc i32 %tmp19 to i16
  %tmp21 = call i8* @perf_trace_buf_prepare(i32 20, i16 zeroext %tmp20, %struct.pt_regs* %__regs, i32* %rctx) #4
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %bb32, label %bb23

bb23:                                             ; preds = %bb
  %tmp24 = getelementptr inbounds i8* %tmp21, i64 8
  %tmp25 = bitcast i8* %tmp24 to i32*
  store i32 %got_bits, i32* %tmp25, align 4
  %tmp26 = getelementptr inbounds i8* %tmp21, i64 12
  %tmp27 = bitcast i8* %tmp26 to i32*
  store i32 %pool_left, i32* %tmp27, align 4
  %tmp28 = getelementptr inbounds i8* %tmp21, i64 16
  %tmp29 = bitcast i8* %tmp28 to i32*
  store i32 %input_left, i32* %tmp29, align 4
  %tmp30 = load i32* %rctx, align 4
  %tmp31 = inttoptr i64 %tmp4 to %struct.hlist_head*
  call void @perf_tp_event(i64 0, i64 1, i8* %tmp21, i32 20, %struct.pt_regs* %__regs, %struct.hlist_head* %tmp31, i32 %tmp30, %struct.task_struct* null) #4
  br label %bb32

bb32:                                             ; preds = %bb23, %bb
  call void @llvm.lifetime.end(i64 168, i8* %tmp) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_define_fields_urandom_read(%struct.ftrace_event_call* %event_call) #0 section ".init.text" {
bb:
  %tmp = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str21, i64 0, i64 0), i32 8, i32 4, i32 1, i32 0) #4
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb2, label %bb7

bb2:                                              ; preds = %bb
  %tmp3 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0), i32 12, i32 4, i32 1, i32 0) #4
  %tmp4 = icmp eq i32 %tmp3, 0
  br i1 %tmp4, label %bb5, label %bb7

bb5:                                              ; preds = %bb2
  %tmp6 = tail call i32 @trace_define_field(%struct.ftrace_event_call* %event_call, i8* getelementptr inbounds ([4 x i8]* @.str20, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str23, i64 0, i64 0), i32 16, i32 4, i32 1, i32 0) #4
  br label %bb7

bb7:                                              ; preds = %bb5, %bb2, %bb
  %.0 = phi i32 [ %tmp6, %bb5 ], [ %tmp, %bb ], [ %tmp3, %bb2 ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define void @add_device_randomness(i8* nocapture readonly %buf, i32 %size) #0 {
bb:
  %time = alloca i64, align 8
  %tmp = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %tmp1 = extractvalue { i32, i32 } %tmp, 0
  %tmp2 = extractvalue { i32, i32 } %tmp, 1
  %tmp3 = zext i32 %tmp1 to i64
  %tmp4 = zext i32 %tmp2 to i64
  %tmp5 = shl nuw i64 %tmp4, 32
  %tmp6 = or i64 %tmp5, %tmp3
  %tmp7 = load volatile i64* @jiffies, align 8
  %tmp8 = xor i64 %tmp6, %tmp7
  store i64 %tmp8, i64* %time, align 8
  %tmp9 = tail call i8* @llvm.returnaddress(i32 0)
  %tmp10 = ptrtoint i8* %tmp9 to i64
  %tmp11 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_device_randomness, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp12 = icmp sgt i32 %tmp11, 0
  br i1 %tmp12, label %bb13, label %trace_add_device_randomness.exit

bb13:                                             ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp14 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_device_randomness, i64 0, i32 4), align 8
  %tmp15 = icmp eq %struct.tracepoint_func* %tmp14, null
  br i1 %tmp15, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb13
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp14, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb16

bb16:                                             ; preds = %bb16, %.preheader.i
  %tmp17 = phi i8* [ %tmp23, %bb16 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp21, %bb16 ], [ %tmp14, %.preheader.i ]
  %tmp18 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp19 = load i8** %tmp18, align 8
  %tmp20 = bitcast i8* %tmp17 to void (i8*, i32, i64)*
  tail call void %tmp20(i8* %tmp19, i32 %size, i64 %tmp10) #4
  %tmp21 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp22 = getelementptr inbounds %struct.tracepoint_func* %tmp21, i64 0, i32 0
  %tmp23 = load i8** %tmp22, align 8
  %tmp24 = icmp eq i8* %tmp23, null
  br i1 %tmp24, label %.loopexit.i, label %bb16

.loopexit.i:                                      ; preds = %bb16, %bb13
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_add_device_randomness.exit

trace_add_device_randomness.exit:                 ; preds = %.loopexit.i, %bb
  %tmp25 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0)) #4
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %buf, i32 %size) #5
  %tmp26 = bitcast i64* %time to i8*
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %tmp26, i32 8) #5
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0), i64 %tmp25) #4
  %tmp27 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 6, i32 0, i32 0)) #4
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buf, i32 %size) #5
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %tmp26, i32 8) #5
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 6, i32 0, i32 0), i64 %tmp27) #4
  ret void
}

; Function Attrs: nounwind readnone
declare i8* @llvm.returnaddress(i32) #2

; Function Attrs: noredzone
declare i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock*) #1 section ".spinlock.text"

; Function Attrs: noredzone nounwind
define internal fastcc void @_mix_pool_bytes(%struct.entropy_store* nocapture %r, i8* nocapture readonly %in, i32 %nbytes) #0 {
bb:
  %tmp = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %tmp1 = load %struct.poolinfo** %tmp, align 8
  %tmp2 = getelementptr inbounds %struct.poolinfo* %tmp1, i64 0, i32 5
  %tmp3 = load i32* %tmp2, align 4
  %tmp4 = sext i32 %tmp3 to i64
  %tmp5 = getelementptr inbounds %struct.poolinfo* %tmp1, i64 0, i32 6
  %tmp6 = load i32* %tmp5, align 4
  %tmp7 = sext i32 %tmp6 to i64
  %tmp8 = getelementptr inbounds %struct.poolinfo* %tmp1, i64 0, i32 7
  %tmp9 = load i32* %tmp8, align 4
  %tmp10 = sext i32 %tmp9 to i64
  %tmp11 = getelementptr inbounds %struct.poolinfo* %tmp1, i64 0, i32 8
  %tmp12 = load i32* %tmp11, align 4
  %tmp13 = sext i32 %tmp12 to i64
  %tmp14 = getelementptr inbounds %struct.poolinfo* %tmp1, i64 0, i32 9
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = sext i32 %tmp15 to i64
  %tmp17 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 8
  %tmp18 = load i16* %tmp17, align 2
  %tmp19 = zext i16 %tmp18 to i32
  %tmp20 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 7
  %tmp21 = load i16* %tmp20, align 2
  %tmp22 = zext i16 %tmp21 to i64
  %tmp23 = icmp eq i32 %nbytes, 0
  br i1 %tmp23, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %bb
  %tmp24 = getelementptr inbounds %struct.poolinfo* %tmp1, i64 0, i32 1
  %tmp25 = load i32* %tmp24, align 4
  %tmp26 = add i32 %tmp25, -1
  %tmp27 = sext i32 %tmp26 to i64
  %tmp28 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 1
  br label %bb29

bb29:                                             ; preds = %bb29, %.lr.ph
  %.04 = phi i32 [ %nbytes, %.lr.ph ], [ %tmp30, %bb29 ]
  %bytes.03 = phi i8* [ %in, %.lr.ph ], [ %tmp31, %bb29 ]
  %i.02 = phi i64 [ %tmp22, %.lr.ph ], [ %tmp39, %bb29 ]
  %input_rotate.01 = phi i32 [ %tmp19, %.lr.ph ], [ %tmp78, %bb29 ]
  %tmp30 = add i32 %.04, -1
  %tmp31 = getelementptr i8* %bytes.03, i64 1
  %tmp32 = load i8* %bytes.03, align 1
  %tmp33 = sext i8 %tmp32 to i32
  %tmp34 = shl i32 %tmp33, %input_rotate.01
  %tmp35 = sub i32 32, %input_rotate.01
  %tmp36 = lshr i32 %tmp33, %tmp35
  %tmp37 = or i32 %tmp36, %tmp34
  %tmp38 = add i64 %i.02, -1
  %tmp39 = and i64 %tmp38, %tmp27
  %tmp40 = load i32** %tmp28, align 8
  %tmp41 = getelementptr i32* %tmp40, i64 %tmp39
  %tmp42 = load i32* %tmp41, align 4
  %tmp43 = xor i32 %tmp37, %tmp42
  %tmp44 = add i64 %tmp39, %tmp4
  %tmp45 = and i64 %tmp44, %tmp27
  %tmp46 = getelementptr i32* %tmp40, i64 %tmp45
  %tmp47 = load i32* %tmp46, align 4
  %tmp48 = xor i32 %tmp43, %tmp47
  %tmp49 = add i64 %tmp39, %tmp7
  %tmp50 = and i64 %tmp49, %tmp27
  %tmp51 = getelementptr i32* %tmp40, i64 %tmp50
  %tmp52 = load i32* %tmp51, align 4
  %tmp53 = xor i32 %tmp48, %tmp52
  %tmp54 = add i64 %tmp39, %tmp10
  %tmp55 = and i64 %tmp54, %tmp27
  %tmp56 = getelementptr i32* %tmp40, i64 %tmp55
  %tmp57 = load i32* %tmp56, align 4
  %tmp58 = xor i32 %tmp53, %tmp57
  %tmp59 = add i64 %tmp39, %tmp13
  %tmp60 = and i64 %tmp59, %tmp27
  %tmp61 = getelementptr i32* %tmp40, i64 %tmp60
  %tmp62 = load i32* %tmp61, align 4
  %tmp63 = xor i32 %tmp58, %tmp62
  %tmp64 = add i64 %tmp39, %tmp16
  %tmp65 = and i64 %tmp64, %tmp27
  %tmp66 = getelementptr i32* %tmp40, i64 %tmp65
  %tmp67 = load i32* %tmp66, align 4
  %tmp68 = xor i32 %tmp63, %tmp67
  %tmp69 = lshr i32 %tmp68, 3
  %tmp70 = and i32 %tmp68, 7
  %tmp71 = zext i32 %tmp70 to i64
  %tmp72 = getelementptr [8 x i32]* @twist_table, i64 0, i64 %tmp71
  %tmp73 = load i32* %tmp72, align 4
  %tmp74 = xor i32 %tmp69, %tmp73
  store i32 %tmp74, i32* %tmp41, align 4
  %tmp75 = icmp ne i64 %tmp39, 0
  %tmp76 = select i1 %tmp75, i32 7, i32 14
  %tmp77 = add i32 %tmp76, %input_rotate.01
  %tmp78 = and i32 %tmp77, 31
  %tmp79 = icmp eq i32 %tmp30, 0
  br i1 %tmp79, label %._crit_edge, label %bb29

._crit_edge:                                      ; preds = %bb29, %bb
  %i.0.lcssa = phi i64 [ %tmp22, %bb ], [ %tmp39, %bb29 ]
  %input_rotate.0.lcssa = phi i32 [ %tmp19, %bb ], [ %tmp78, %bb29 ]
  %tmp80 = trunc i32 %input_rotate.0.lcssa to i16
  store i16 %tmp80, i16* %tmp17, align 2
  %tmp81 = trunc i64 %i.0.lcssa to i16
  store i16 %tmp81, i16* %tmp20, align 2
  ret void
}

; Function Attrs: noredzone nounwind
define void @add_input_randomness(i32 %type, i32 %code, i32 %value) #0 {
bb:
  %tmp = load i8* @add_input_randomness.last_value, align 1
  %tmp1 = zext i8 %tmp to i32
  %tmp2 = icmp eq i32 %tmp1, %value
  br i1 %tmp2, label %trace_add_input_randomness.exit, label %bb3

bb3:                                              ; preds = %bb
  %tmp4 = trunc i32 %value to i8
  store i8 %tmp4, i8* @add_input_randomness.last_value, align 1
  %tmp5 = shl i32 %type, 4
  %tmp6 = xor i32 %tmp5, %code
  %tmp7 = lshr i32 %code, 4
  %tmp8 = xor i32 %tmp6, %tmp7
  %tmp9 = xor i32 %tmp8, %value
  tail call fastcc void @add_timer_randomness(%struct.timer_rand_state* bitcast ({ i64, i64, i64, i8, [7 x i8] }* @input_timer_state to %struct.timer_rand_state*), i32 %tmp9) #5
  %tmp10 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp11 = ashr i32 %tmp10, 3
  %tmp12 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_input_randomness, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp13 = icmp sgt i32 %tmp12, 0
  br i1 %tmp13, label %bb14, label %trace_add_input_randomness.exit

bb14:                                             ; preds = %bb3
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp15 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_input_randomness, i64 0, i32 4), align 8
  %tmp16 = icmp eq %struct.tracepoint_func* %tmp15, null
  br i1 %tmp16, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb14
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp15, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb17

bb17:                                             ; preds = %bb17, %.preheader.i
  %tmp18 = phi i8* [ %tmp24, %bb17 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp22, %bb17 ], [ %tmp15, %.preheader.i ]
  %tmp19 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp20 = load i8** %tmp19, align 8
  %tmp21 = bitcast i8* %tmp18 to void (i8*, i32)*
  tail call void %tmp21(i8* %tmp20, i32 %tmp11) #4
  %tmp22 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp23 = getelementptr inbounds %struct.tracepoint_func* %tmp22, i64 0, i32 0
  %tmp24 = load i8** %tmp23, align 8
  %tmp25 = icmp eq i8* %tmp24, null
  br i1 %tmp25, label %.loopexit.i, label %bb17

.loopexit.i:                                      ; preds = %bb17, %bb14
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_add_input_randomness.exit

trace_add_input_randomness.exit:                  ; preds = %.loopexit.i, %bb3, %bb
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc void @add_timer_randomness(%struct.timer_rand_state* nocapture %state, i32 %num) #0 {
bb:
  %sample = alloca %struct.anon.71, align 8
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !18
  %tmp = load volatile i64* @jiffies, align 8
  %tmp1 = getelementptr inbounds %struct.anon.71* %sample, i64 0, i32 0
  store i64 %tmp, i64* %tmp1, align 8
  %tmp2 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %tmp3 = extractvalue { i32, i32 } %tmp2, 0
  %tmp4 = getelementptr inbounds %struct.anon.71* %sample, i64 0, i32 1
  store i32 %tmp3, i32* %tmp4, align 8
  %tmp5 = getelementptr inbounds %struct.anon.71* %sample, i64 0, i32 2
  store i32 %num, i32* %tmp5, align 4
  %tmp6 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %tmp7 = and i8 %tmp6, 1
  %tmp8 = icmp ne i8 %tmp7, 0
  %tmp9 = select i1 %tmp8, %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)
  %tmp10 = bitcast %struct.anon.71* %sample to i8*
  %tmp11 = getelementptr inbounds %struct.entropy_store* %tmp9, i64 0, i32 2
  %tmp12 = load i8** %tmp11, align 8
  %tmp13 = tail call i8* @llvm.returnaddress(i32 0) #3
  %tmp14 = ptrtoint i8* %tmp13 to i64
  %tmp15 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp16 = icmp sgt i32 %tmp15, 0
  br i1 %tmp16, label %bb17, label %mix_pool_bytes.exit

bb17:                                             ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp18 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %tmp19 = icmp eq %struct.tracepoint_func* %tmp18, null
  br i1 %tmp19, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb17
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp18, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb20

bb20:                                             ; preds = %bb20, %.preheader.i.i
  %tmp21 = phi i8* [ %tmp27, %bb20 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp25, %bb20 ], [ %tmp18, %.preheader.i.i ]
  %tmp22 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp23 = load i8** %tmp22, align 8
  %tmp24 = bitcast i8* %tmp21 to void (i8*, i8*, i32, i64)*
  tail call void %tmp24(i8* %tmp23, i8* %tmp12, i32 16, i64 %tmp14) #4
  %tmp25 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp26 = getelementptr inbounds %struct.tracepoint_func* %tmp25, i64 0, i32 0
  %tmp27 = load i8** %tmp26, align 8
  %tmp28 = icmp eq i8* %tmp27, null
  br i1 %tmp28, label %.loopexit.i.i, label %bb20

.loopexit.i.i:                                    ; preds = %bb20, %bb17
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %bb
  %tmp29 = getelementptr inbounds %struct.entropy_store* %tmp9, i64 0, i32 6, i32 0, i32 0
  %tmp30 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %tmp29) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %tmp9, i8* %tmp10, i32 16) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %tmp29, i64 %tmp30) #4
  %tmp31 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 3
  %tmp32 = load i8* %tmp31, align 8
  %tmp33 = and i8 %tmp32, 1
  %tmp34 = icmp eq i8 %tmp33, 0
  br i1 %tmp34, label %bb35, label %bb60

bb35:                                             ; preds = %mix_pool_bytes.exit
  %tmp36 = load i64* %tmp1, align 8
  %tmp37 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 0
  %tmp38 = load i64* %tmp37, align 8
  %tmp39 = sub i64 %tmp36, %tmp38
  store i64 %tmp36, i64* %tmp37, align 8
  %tmp40 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 1
  %tmp41 = load i64* %tmp40, align 8
  %tmp42 = sub i64 %tmp39, %tmp41
  store i64 %tmp39, i64* %tmp40, align 8
  %tmp43 = getelementptr inbounds %struct.timer_rand_state* %state, i64 0, i32 2
  %tmp44 = load i64* %tmp43, align 8
  %tmp45 = sub i64 %tmp42, %tmp44
  store i64 %tmp42, i64* %tmp43, align 8
  %tmp46 = icmp slt i64 %tmp39, 0
  %tmp47 = sub i64 0, %tmp39
  %. = select i1 %tmp46, i64 %tmp47, i64 %tmp39
  %tmp48 = icmp slt i64 %tmp42, 0
  %tmp49 = sub i64 0, %tmp42
  %delta2.0 = select i1 %tmp48, i64 %tmp49, i64 %tmp42
  %tmp50 = icmp slt i64 %tmp45, 0
  %tmp51 = sub i64 0, %tmp45
  %.1 = select i1 %tmp50, i64 %tmp51, i64 %tmp45
  %tmp52 = icmp sgt i64 %., %delta2.0
  %delta.1 = select i1 %tmp52, i64 %delta2.0, i64 %.
  %tmp53 = icmp sgt i64 %delta.1, %.1
  %.1.delta.1 = select i1 %tmp53, i64 %.1, i64 %delta.1
  %tmp54 = lshr i64 %.1.delta.1, 1
  %tmp55 = trunc i64 %tmp54 to i32
  %tmp56 = tail call i32 asm "bsrl $1,$0", "=r,rm,0,~{dirflag},~{fpsr},~{flags}"(i32 %tmp55, i32 -1) #3, !srcloc !19
  %tmp57 = add i32 %tmp56, 1
  %tmp58 = icmp slt i32 %tmp57, 11
  %tmp59 = select i1 %tmp58, i32 %tmp57, i32 11
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* %tmp9, i32 %tmp59) #5
  br label %bb60

bb60:                                             ; preds = %bb35, %mix_pool_bytes.exit
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !20
  ret void
}

; Function Attrs: noredzone nounwind
define void @add_interrupt_randomness(i32 %irq, i32 %irq_flags) #0 {
bb:
  %seed = alloca i64, align 8
  %tmp = tail call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, %struct.fast_pool* @irq_randomness) #3, !srcloc !21
  %tmp1 = inttoptr i64 %tmp to %struct.fast_pool*
  %tmp2 = tail call %struct.pt_regs* asm "movq %gs:$1,$0", "=r,*m,~{dirflag},~{fpsr},~{flags}"(%struct.pt_regs** @irq_regs) #3, !srcloc !22
  %tmp3 = load volatile i64* @jiffies, align 8
  %tmp4 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %tmp5 = extractvalue { i32, i32 } %tmp4, 0
  %tmp6 = extractvalue { i32, i32 } %tmp4, 1
  %tmp7 = zext i32 %tmp5 to i64
  %tmp8 = zext i32 %tmp6 to i64
  %tmp9 = shl nuw i64 %tmp8, 32
  %tmp10 = or i64 %tmp9, %tmp7
  %tmp11 = icmp eq i64 %tmp10, 0
  br i1 %tmp11, label %bb12, label %get_reg.exit

bb12:                                             ; preds = %bb
  %tmp13 = bitcast %struct.pt_regs* %tmp2 to i32*
  %tmp14 = icmp eq %struct.pt_regs* %tmp2, null
  br i1 %tmp14, label %get_reg.exit, label %bb15

bb15:                                             ; preds = %bb12
  %tmp16 = getelementptr inbounds %struct.fast_pool* %tmp1, i64 0, i32 2
  %tmp17 = load i16* %tmp16, align 2
  %tmp18 = icmp ugt i16 %tmp17, 41
  br i1 %tmp18, label %bb19, label %bb20

bb19:                                             ; preds = %bb15
  store i16 0, i16* %tmp16, align 2
  br label %bb20

bb20:                                             ; preds = %bb19, %bb15
  %tmp21 = phi i16 [ 0, %bb19 ], [ %tmp17, %bb15 ]
  %tmp22 = add i16 %tmp21, 1
  store i16 %tmp22, i16* %tmp16, align 2
  %tmp23 = zext i16 %tmp21 to i64
  %tmp24 = getelementptr i32* %tmp13, i64 %tmp23
  %tmp25 = load i32* %tmp24, align 4
  %phitmp = zext i32 %tmp25 to i64
  br label %get_reg.exit

get_reg.exit:                                     ; preds = %bb20, %bb12, %bb
  %cycles.0 = phi i64 [ %tmp10, %bb ], [ %phitmp, %bb20 ], [ 0, %bb12 ]
  %tmp26 = lshr i64 %cycles.0, 32
  %tmp27 = lshr i64 %tmp3, 32
  %tmp28 = zext i32 %irq to i64
  %tmp29 = getelementptr %struct.fast_pool* %tmp1, i64 0, i32 0, i64 0
  %tmp30 = load i32* %tmp29, align 4
  %tmp31 = zext i32 %tmp30 to i64
  %tmp32 = xor i64 %tmp27, %tmp28
  %tmp33 = xor i64 %tmp32, %cycles.0
  %tmp34 = xor i64 %tmp33, %tmp31
  %tmp35 = trunc i64 %tmp34 to i32
  store i32 %tmp35, i32* %tmp29, align 4
  %tmp36 = xor i64 %tmp26, %tmp3
  %tmp37 = getelementptr %struct.fast_pool* %tmp1, i64 0, i32 0, i64 1
  %tmp38 = load i32* %tmp37, align 4
  %tmp39 = zext i32 %tmp38 to i64
  %tmp40 = xor i64 %tmp36, %tmp39
  %tmp41 = trunc i64 %tmp40 to i32
  store i32 %tmp41, i32* %tmp37, align 4
  %tmp42 = icmp eq %struct.pt_regs* %tmp2, null
  br i1 %tmp42, label %bb46, label %bb43

bb43:                                             ; preds = %get_reg.exit
  %tmp44 = getelementptr inbounds %struct.pt_regs* %tmp2, i64 0, i32 16
  %tmp45 = load i64* %tmp44, align 8
  br label %bb49

bb46:                                             ; preds = %get_reg.exit
  %tmp47 = tail call i8* @llvm.returnaddress(i32 0)
  %tmp48 = ptrtoint i8* %tmp47 to i64
  br label %bb49

bb49:                                             ; preds = %bb46, %bb43
  %tmp50 = phi i64 [ %tmp45, %bb43 ], [ %tmp48, %bb46 ]
  %tmp51 = getelementptr %struct.fast_pool* %tmp1, i64 0, i32 0, i64 2
  %tmp52 = load i32* %tmp51, align 4
  %tmp53 = zext i32 %tmp52 to i64
  %tmp54 = xor i64 %tmp53, %tmp50
  %tmp55 = trunc i64 %tmp54 to i32
  %tmp56 = lshr i64 %tmp50, 32
  %tmp57 = getelementptr %struct.fast_pool* %tmp1, i64 0, i32 0, i64 3
  %tmp58 = load i32* %tmp57, align 4
  %tmp59 = zext i32 %tmp58 to i64
  %tmp60 = xor i64 %tmp59, %tmp56
  %tmp61 = trunc i64 %tmp60 to i32
  %tmp62 = add i32 %tmp41, %tmp35
  %tmp63 = add i32 %tmp61, %tmp55
  %tmp64 = shl i32 %tmp62, 6
  %tmp65 = lshr i32 %tmp62, 26
  %tmp66 = or i32 %tmp65, %tmp64
  %tmp67 = shl i32 %tmp63, 27
  %tmp68 = lshr i32 %tmp63, 5
  %tmp69 = or i32 %tmp68, %tmp67
  %tmp70 = xor i32 %tmp69, %tmp62
  %tmp71 = xor i32 %tmp63, %tmp66
  %tmp72 = add i32 %tmp71, %tmp62
  %tmp73 = add i32 %tmp70, %tmp63
  %tmp74 = shl i32 %tmp72, 16
  %tmp75 = lshr i32 %tmp72, 16
  %tmp76 = or i32 %tmp75, %tmp74
  %tmp77 = shl i32 %tmp73, 14
  %tmp78 = lshr i32 %tmp73, 18
  %tmp79 = or i32 %tmp78, %tmp77
  %tmp80 = xor i32 %tmp79, %tmp72
  %tmp81 = xor i32 %tmp76, %tmp73
  %tmp82 = add i32 %tmp81, %tmp72
  %tmp83 = add i32 %tmp80, %tmp73
  %tmp84 = shl i32 %tmp82, 6
  %tmp85 = lshr i32 %tmp82, 26
  %tmp86 = or i32 %tmp85, %tmp84
  %tmp87 = shl i32 %tmp83, 27
  %tmp88 = lshr i32 %tmp83, 5
  %tmp89 = or i32 %tmp88, %tmp87
  %tmp90 = xor i32 %tmp89, %tmp82
  %tmp91 = xor i32 %tmp86, %tmp83
  %tmp92 = add i32 %tmp91, %tmp82
  %tmp93 = add i32 %tmp90, %tmp83
  %tmp94 = shl i32 %tmp92, 16
  %tmp95 = lshr i32 %tmp92, 16
  %tmp96 = or i32 %tmp95, %tmp94
  %tmp97 = shl i32 %tmp93, 14
  %tmp98 = lshr i32 %tmp93, 18
  %tmp99 = or i32 %tmp98, %tmp97
  %tmp100 = xor i32 %tmp99, %tmp92
  %tmp101 = xor i32 %tmp96, %tmp93
  store i32 %tmp92, i32* %tmp29, align 4
  store i32 %tmp101, i32* %tmp37, align 4
  store i32 %tmp93, i32* %tmp51, align 4
  store i32 %tmp100, i32* %tmp57, align 4
  %tmp102 = getelementptr inbounds %struct.fast_pool* %tmp1, i64 0, i32 3
  %tmp103 = load i8* %tmp102, align 1
  %tmp104 = add i8 %tmp103, 1
  store i8 %tmp104, i8* %tmp102, align 1
  %tmp105 = icmp ult i8 %tmp104, 64
  br i1 %tmp105, label %bb106, label %bb112

bb106:                                            ; preds = %bb49
  %tmp107 = getelementptr inbounds %struct.fast_pool* %tmp1, i64 0, i32 1
  %tmp108 = load i64* %tmp107, align 8
  %tmp109 = sub i64 1000, %tmp3
  %tmp110 = add i64 %tmp109, %tmp108
  %tmp111 = icmp slt i64 %tmp110, 0
  br i1 %tmp111, label %bb112, label %bb165

bb112:                                            ; preds = %bb106, %bb49
  %tmp113 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %tmp114 = and i8 %tmp113, 1
  %tmp115 = icmp ne i8 %tmp114, 0
  %tmp116 = select i1 %tmp115, %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)
  %tmp117 = getelementptr inbounds %struct.entropy_store* %tmp116, i64 0, i32 6
  %tmp118 = getelementptr inbounds %struct.spinlock* %tmp117, i64 0, i32 0, i32 0
  %tmp119 = tail call i32 @_raw_spin_trylock(%struct.raw_spinlock* %tmp118) #4
  %tmp120 = icmp eq i32 %tmp119, 0
  br i1 %tmp120, label %bb165, label %bb121

bb121:                                            ; preds = %bb112
  %tmp122 = getelementptr inbounds %struct.fast_pool* %tmp1, i64 0, i32 1
  store i64 %tmp3, i64* %tmp122, align 8
  %tmp123 = inttoptr i64 %tmp to i8*
  %tmp124 = getelementptr inbounds %struct.entropy_store* %tmp116, i64 0, i32 2
  %tmp125 = load i8** %tmp124, align 8
  %tmp126 = tail call i8* @llvm.returnaddress(i32 0) #3
  %tmp127 = ptrtoint i8* %tmp126 to i64
  %tmp128 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp129 = icmp sgt i32 %tmp128, 0
  br i1 %tmp129, label %bb130, label %__mix_pool_bytes.exit

bb130:                                            ; preds = %bb121
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp131 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 4), align 8
  %tmp132 = icmp eq %struct.tracepoint_func* %tmp131, null
  br i1 %tmp132, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb130
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp131, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb133

bb133:                                            ; preds = %bb133, %.preheader.i.i
  %tmp134 = phi i8* [ %tmp140, %bb133 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp138, %bb133 ], [ %tmp131, %.preheader.i.i ]
  %tmp135 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp136 = load i8** %tmp135, align 8
  %tmp137 = bitcast i8* %tmp134 to void (i8*, i8*, i32, i64)*
  tail call void %tmp137(i8* %tmp136, i8* %tmp125, i32 16, i64 %tmp127) #4
  %tmp138 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp139 = getelementptr inbounds %struct.tracepoint_func* %tmp138, i64 0, i32 0
  %tmp140 = load i8** %tmp139, align 8
  %tmp141 = icmp eq i8* %tmp140, null
  br i1 %tmp141, label %.loopexit.i.i, label %bb133

.loopexit.i.i:                                    ; preds = %bb133, %bb130
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %__mix_pool_bytes.exit

__mix_pool_bytes.exit:                            ; preds = %.loopexit.i.i, %bb121
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* %tmp116, i8* %tmp123, i32 16) #4
  %tmp142 = tail call { i8, i64 } asm sideeffect "661:\0A\09movb $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+18)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x48,0x0f,0xc7,0xf8\0A\09setc $0\0A6641:\0A\09.popsection", "=q,={ax},i,~{dirflag},~{fpsr},~{flags}"(i32 0) #3, !srcloc !23
  %tmp143 = extractvalue { i8, i64 } %tmp142, 0
  %tmp144 = extractvalue { i8, i64 } %tmp142, 1
  store i64 %tmp144, i64* %seed, align 8
  %tmp145 = icmp eq i8 %tmp143, 0
  br i1 %tmp145, label %bb163, label %bb146

bb146:                                            ; preds = %__mix_pool_bytes.exit
  %tmp147 = bitcast i64* %seed to i8*
  %tmp148 = load i8** %tmp124, align 8
  %tmp149 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp150 = icmp sgt i32 %tmp149, 0
  br i1 %tmp150, label %bb151, label %__mix_pool_bytes.exit8

bb151:                                            ; preds = %bb146
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp152 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 4), align 8
  %tmp153 = icmp eq %struct.tracepoint_func* %tmp152, null
  br i1 %tmp153, label %.loopexit.i.i7, label %.preheader.i.i5

.preheader.i.i5:                                  ; preds = %bb151
  %.phi.trans.insert.i.i3 = getelementptr inbounds %struct.tracepoint_func* %tmp152, i64 0, i32 0
  %.pre.i.i4 = load i8** %.phi.trans.insert.i.i3, align 8
  br label %bb154

bb154:                                            ; preds = %bb154, %.preheader.i.i5
  %tmp155 = phi i8* [ %tmp161, %bb154 ], [ %.pre.i.i4, %.preheader.i.i5 ]
  %it_func_ptr.0.i.i6 = phi %struct.tracepoint_func* [ %tmp159, %bb154 ], [ %tmp152, %.preheader.i.i5 ]
  %tmp156 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i6, i64 0, i32 1
  %tmp157 = load i8** %tmp156, align 8
  %tmp158 = bitcast i8* %tmp155 to void (i8*, i8*, i32, i64)*
  tail call void %tmp158(i8* %tmp157, i8* %tmp148, i32 8, i64 %tmp127) #4
  %tmp159 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i6, i64 1
  %tmp160 = getelementptr inbounds %struct.tracepoint_func* %tmp159, i64 0, i32 0
  %tmp161 = load i8** %tmp160, align 8
  %tmp162 = icmp eq i8* %tmp161, null
  br i1 %tmp162, label %.loopexit.i.i7, label %bb154

.loopexit.i.i7:                                   ; preds = %bb154, %bb151
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %__mix_pool_bytes.exit8

__mix_pool_bytes.exit8:                           ; preds = %.loopexit.i.i7, %bb146
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %tmp116, i8* %tmp147, i32 8) #4
  br label %bb163

bb163:                                            ; preds = %__mix_pool_bytes.exit8, %__mix_pool_bytes.exit
  %credit.0 = phi i32 [ 2, %__mix_pool_bytes.exit8 ], [ 1, %__mix_pool_bytes.exit ]
  %tmp164 = bitcast %struct.spinlock* %tmp117 to i8*
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* %tmp164, i8 1, i8* %tmp164) #3, !srcloc !24
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !25
  store i8 0, i8* %tmp102, align 1
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* %tmp116, i32 %credit.0) #5
  br label %bb165

bb165:                                            ; preds = %bb163, %bb112, %bb106
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc void @credit_entropy_bits(%struct.entropy_store* %r, i32 %nbits) #0 {
bb:
  %tmp = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %tmp1 = load %struct.poolinfo** %tmp, align 8
  %tmp2 = getelementptr inbounds %struct.poolinfo* %tmp1, i64 0, i32 4
  %tmp3 = load i32* %tmp2, align 4
  %tmp4 = shl i32 %nbits, 3
  %tmp5 = icmp eq i32 %nbits, 0
  br i1 %tmp5, label %bb126, label %.preheader

.preheader:                                       ; preds = %bb
  %tmp6 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %tmp7 = icmp slt i32 %tmp4, 0
  %tmp8 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %tmp9 = sdiv i32 %tmp3, 2
  %tmp10 = add i32 %tmp3, -2
  br i1 %tmp7, label %.loopexit.us, label %.preheader2

.loopexit.us:                                     ; preds = %bb19, %.preheader
  %tmp11 = load volatile i32* %tmp6, align 4
  %tmp12 = add i32 %tmp11, %tmp4
  %tmp13 = icmp slt i32 %tmp12, 0
  br i1 %tmp13, label %bb16, label %bb14, !prof !26

bb14:                                             ; preds = %.loopexit.us
  %tmp15 = icmp sgt i32 %tmp12, %tmp3
  %.entropy_count.1.us = select i1 %tmp15, i32 %tmp3, i32 %tmp12
  br label %bb19

bb16:                                             ; preds = %.loopexit.us
  %tmp17 = load i8** %tmp8, align 8
  %tmp18 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([55 x i8]* @.str15, i64 0, i64 0), i8* %tmp17, i32 %tmp12) #4
  tail call void @warn_slowpath_null(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 650) #4
  br label %bb19

bb19:                                             ; preds = %bb16, %bb14
  %entropy_count.2.us = phi i32 [ 0, %bb16 ], [ %.entropy_count.1.us, %bb14 ]
  %tmp20 = tail call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; cmpxchgl $2,$1", "={ax},=*m,r,0,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* %tmp6, i32 %entropy_count.2.us, i32 %tmp11, i32* %tmp6) #3, !srcloc !27
  %tmp21 = icmp eq i32 %tmp20, %tmp11
  br i1 %tmp21, label %.us-lcssa.us, label %.loopexit.us

.preheader2:                                      ; preds = %bb44, %.preheader
  %tmp22 = load volatile i32* %tmp6, align 4
  %tmp23 = load %struct.poolinfo** %tmp, align 8
  %tmp24 = getelementptr inbounds %struct.poolinfo* %tmp23, i64 0, i32 0
  %tmp25 = load i32* %tmp24, align 4
  %tmp26 = add i32 %tmp25, 5
  br label %bb27

bb27:                                             ; preds = %bb27, %.preheader2
  %pnfrac.0 = phi i32 [ %tmp4, %.preheader2 ], [ %tmp35, %bb27 ]
  %entropy_count.0 = phi i32 [ %tmp22, %.preheader2 ], [ %tmp34, %bb27 ]
  %tmp28 = icmp slt i32 %pnfrac.0, %tmp9
  %tmp29 = select i1 %tmp28, i32 %pnfrac.0, i32 %tmp9
  %tmp30 = sub i32 %tmp3, %entropy_count.0
  %tmp31 = mul i32 %tmp30, 3
  %tmp32 = mul i32 %tmp31, %tmp29
  %tmp33 = lshr i32 %tmp32, %tmp26
  %tmp34 = add i32 %tmp33, %entropy_count.0
  %tmp35 = sub i32 %pnfrac.0, %tmp29
  %tmp36 = icmp slt i32 %tmp34, %tmp10
  %tmp37 = icmp ne i32 %pnfrac.0, %tmp29
  %.1 = and i1 %tmp36, %tmp37
  br i1 %.1, label %bb27, label %.loopexit, !prof !26

.loopexit:                                        ; preds = %bb27
  %tmp38 = icmp slt i32 %tmp34, 0
  br i1 %tmp38, label %bb39, label %bb42, !prof !26

bb39:                                             ; preds = %.loopexit
  %tmp40 = load i8** %tmp8, align 8
  %tmp41 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([55 x i8]* @.str15, i64 0, i64 0), i8* %tmp40, i32 %tmp34) #4
  tail call void @warn_slowpath_null(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 650) #4
  br label %bb44

bb42:                                             ; preds = %.loopexit
  %tmp43 = icmp sgt i32 %tmp34, %tmp3
  %.entropy_count.1 = select i1 %tmp43, i32 %tmp3, i32 %tmp34
  br label %bb44

bb44:                                             ; preds = %bb42, %bb39
  %entropy_count.2 = phi i32 [ 0, %bb39 ], [ %.entropy_count.1, %bb42 ]
  %tmp45 = tail call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; cmpxchgl $2,$1", "={ax},=*m,r,0,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* %tmp6, i32 %entropy_count.2, i32 %tmp22, i32* %tmp6) #3, !srcloc !27
  %tmp46 = icmp eq i32 %tmp45, %tmp22
  br i1 %tmp46, label %.us-lcssa.us, label %.preheader2

.us-lcssa.us:                                     ; preds = %bb44, %bb19
  %entropy_count.2.lcssa = phi i32 [ %entropy_count.2.us, %bb19 ], [ %entropy_count.2, %bb44 ]
  %tmp47 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 10
  %tmp48 = load i32* %tmp47, align 4
  %tmp49 = add i32 %tmp48, %nbits
  store i32 %tmp49, i32* %tmp47, align 4
  %tmp50 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %tmp51 = load i8* %tmp50, align 8
  %tmp52 = and i8 %tmp51, 1
  %tmp53 = icmp eq i8 %tmp52, 0
  %tmp54 = icmp sgt i32 %tmp49, 128
  %or.cond = and i1 %tmp53, %tmp54
  br i1 %or.cond, label %bb55, label %bb61

bb55:                                             ; preds = %.us-lcssa.us
  %tmp56 = or i8 %tmp51, 1
  store i8 %tmp56, i8* %tmp50, align 8
  store i32 0, i32* %tmp47, align 4
  %tmp57 = icmp eq %struct.entropy_store* %r, bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)
  br i1 %tmp57, label %bb58, label %bb61

bb58:                                             ; preds = %bb55
  tail call void @prandom_reseed_late() #4
  tail call void @__wake_up(%struct.__wait_queue_head* @urandom_init_wait, i32 1, i32 1, i8* null) #4
  %tmp59 = load i8** getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 2), align 8
  %tmp60 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([34 x i8]* @.str16, i64 0, i64 0), i8* %tmp59) #4
  %.pre = load i32* %tmp47, align 4
  br label %bb61

bb61:                                             ; preds = %bb58, %bb55, %.us-lcssa.us
  %tmp62 = phi i32 [ %tmp49, %.us-lcssa.us ], [ 0, %bb55 ], [ %.pre, %bb58 ]
  %tmp63 = load i8** %tmp8, align 8
  %tmp64 = ashr i32 %entropy_count.2.lcssa, 3
  %tmp65 = tail call i8* @llvm.returnaddress(i32 0)
  %tmp66 = ptrtoint i8* %tmp65 to i64
  %tmp67 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_credit_entropy_bits, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp68 = icmp sgt i32 %tmp67, 0
  br i1 %tmp68, label %bb69, label %trace_credit_entropy_bits.exit

bb69:                                             ; preds = %bb61
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp70 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_credit_entropy_bits, i64 0, i32 4), align 8
  %tmp71 = icmp eq %struct.tracepoint_func* %tmp70, null
  br i1 %tmp71, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb69
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp70, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb72

bb72:                                             ; preds = %bb72, %.preheader.i
  %tmp73 = phi i8* [ %tmp79, %bb72 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp77, %bb72 ], [ %tmp70, %.preheader.i ]
  %tmp74 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp75 = load i8** %tmp74, align 8
  %tmp76 = bitcast i8* %tmp73 to void (i8*, i8*, i32, i32, i32, i64)*
  tail call void %tmp76(i8* %tmp75, i8* %tmp63, i32 %nbits, i32 %tmp64, i32 %tmp62, i64 %tmp66) #4
  %tmp77 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp78 = getelementptr inbounds %struct.tracepoint_func* %tmp77, i64 0, i32 0
  %tmp79 = load i8** %tmp78, align 8
  %tmp80 = icmp eq i8* %tmp79, null
  br i1 %tmp80, label %.loopexit.i, label %bb72

.loopexit.i:                                      ; preds = %bb72, %bb69
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_credit_entropy_bits.exit

trace_credit_entropy_bits.exit:                   ; preds = %.loopexit.i, %bb61
  %tmp81 = icmp eq %struct.entropy_store* %r, bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*)
  br i1 %tmp81, label %bb82, label %bb126

bb82:                                             ; preds = %trace_credit_entropy_bits.exit
  %tmp83 = load i32* @random_read_wakeup_bits, align 4
  %tmp84 = icmp slt i32 %tmp64, %tmp83
  br i1 %tmp84, label %bb86, label %bb85

bb85:                                             ; preds = %bb82
  tail call void @__wake_up(%struct.__wait_queue_head* @random_read_wait, i32 1, i32 1, i8* null) #4
  tail call void @kill_fasync(%struct.fasync_struct** @fasync, i32 29, i32 131073) #4
  br label %bb86

bb86:                                             ; preds = %bb85, %bb82
  %tmp87 = load i32* @random_write_wakeup_bits, align 4
  %tmp88 = icmp sgt i32 %tmp64, %tmp87
  br i1 %tmp88, label %bb89, label %bb126

bb89:                                             ; preds = %bb86
  %tmp90 = load i8* %tmp50, align 8
  %tmp91 = and i8 %tmp90, 1
  %tmp92 = icmp eq i8 %tmp91, 0
  br i1 %tmp92, label %bb126, label %bb93

bb93:                                             ; preds = %bb89
  %tmp94 = load i32* %tmp47, align 4
  %tmp95 = load i32* @random_read_wakeup_bits, align 4
  %tmp96 = shl i32 %tmp95, 1
  %tmp97 = icmp slt i32 %tmp94, %tmp96
  br i1 %tmp97, label %bb126, label %bb98

bb98:                                             ; preds = %bb93
  %tmp99 = load %struct.entropy_store** @credit_entropy_bits.last, align 8
  %tmp100 = icmp eq %struct.entropy_store* %tmp99, bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*)
  %. = select i1 %tmp100, %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), %struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*)
  %tmp101 = getelementptr inbounds %struct.entropy_store* %., i64 0, i32 9
  %tmp102 = load i32* %tmp101, align 8
  %tmp103 = getelementptr inbounds %struct.entropy_store* %., i64 0, i32 0
  %tmp104 = load %struct.poolinfo** %tmp103, align 8
  %tmp105 = getelementptr inbounds %struct.poolinfo* %tmp104, i64 0, i32 4
  %tmp106 = load i32* %tmp105, align 4
  %tmp107 = mul i32 %tmp106, 3
  %tmp108 = sdiv i32 %tmp107, 4
  %tmp109 = icmp sgt i32 %tmp102, %tmp108
  br i1 %tmp109, label %bb111, label %bb110

bb110:                                            ; preds = %bb98
  store %struct.entropy_store* %., %struct.entropy_store** @credit_entropy_bits.last, align 8
  br label %bb111

bb111:                                            ; preds = %bb110, %bb98
  %tmp112 = phi %struct.entropy_store* [ %tmp99, %bb98 ], [ %., %bb110 ]
  %tmp113 = getelementptr inbounds %struct.entropy_store* %tmp112, i64 0, i32 9
  %tmp114 = load i32* %tmp113, align 4
  %tmp115 = getelementptr inbounds %struct.entropy_store* %tmp112, i64 0, i32 0
  %tmp116 = load %struct.poolinfo** %tmp115, align 8
  %tmp117 = getelementptr inbounds %struct.poolinfo* %tmp116, i64 0, i32 4
  %tmp118 = load i32* %tmp117, align 4
  %tmp119 = mul i32 %tmp118, 3
  %tmp120 = sdiv i32 %tmp119, 4
  %tmp121 = icmp sgt i32 %tmp114, %tmp120
  br i1 %tmp121, label %bb126, label %bb122

bb122:                                            ; preds = %bb111
  %tmp123 = getelementptr inbounds %struct.entropy_store* %tmp112, i64 0, i32 4
  %tmp124 = load %struct.workqueue_struct** @system_wq, align 8
  %tmp125 = tail call zeroext i1 @queue_work_on(i32 64, %struct.workqueue_struct* %tmp124, %struct.work_struct* %tmp123) #4
  store i32 0, i32* %tmp47, align 4
  br label %bb126

bb126:                                            ; preds = %bb122, %bb111, %bb93, %bb89, %bb86, %trace_credit_entropy_bits.exit, %bb
  ret void
}

; Function Attrs: noredzone nounwind
define void @add_disk_randomness(%struct.gendisk* readonly %disk) #0 {
bb:
  %tmp = icmp eq %struct.gendisk* %disk, null
  br i1 %tmp, label %trace_add_disk_randomness.exit, label %bb1

bb1:                                              ; preds = %bb
  %tmp2 = getelementptr inbounds %struct.gendisk* %disk, i64 0, i32 15
  %tmp3 = load %struct.timer_rand_state** %tmp2, align 8
  %tmp4 = icmp eq %struct.timer_rand_state* %tmp3, null
  br i1 %tmp4, label %trace_add_disk_randomness.exit, label %bb5

bb5:                                              ; preds = %bb1
  %tmp6 = getelementptr inbounds %struct.gendisk* %disk, i64 0, i32 8, i32 5, i32 22
  %tmp7 = load i32* %tmp6, align 4
  %tmp8 = add i32 %tmp7, 256
  tail call fastcc void @add_timer_randomness(%struct.timer_rand_state* %tmp3, i32 %tmp8) #5
  %tmp9 = load i32* %tmp6, align 4
  %tmp10 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp11 = ashr i32 %tmp10, 3
  %tmp12 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_disk_randomness, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp13 = icmp sgt i32 %tmp12, 0
  br i1 %tmp13, label %bb14, label %trace_add_disk_randomness.exit

bb14:                                             ; preds = %bb5
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp15 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_add_disk_randomness, i64 0, i32 4), align 8
  %tmp16 = icmp eq %struct.tracepoint_func* %tmp15, null
  br i1 %tmp16, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb14
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp15, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb17

bb17:                                             ; preds = %bb17, %.preheader.i
  %tmp18 = phi i8* [ %tmp24, %bb17 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp22, %bb17 ], [ %tmp15, %.preheader.i ]
  %tmp19 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp20 = load i8** %tmp19, align 8
  %tmp21 = bitcast i8* %tmp18 to void (i8*, i32, i32)*
  tail call void %tmp21(i8* %tmp20, i32 %tmp9, i32 %tmp11) #4
  %tmp22 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp23 = getelementptr inbounds %struct.tracepoint_func* %tmp22, i64 0, i32 0
  %tmp24 = load i8** %tmp23, align 8
  %tmp25 = icmp eq i8* %tmp24, null
  br i1 %tmp25, label %.loopexit.i, label %bb17

.loopexit.i:                                      ; preds = %bb17, %bb14
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_add_disk_randomness.exit

trace_add_disk_randomness.exit:                   ; preds = %.loopexit.i, %bb5, %bb1, %bb
  ret void
}

; Function Attrs: noredzone nounwind
define void @get_random_bytes(i8* nocapture %buf, i32 %nbytes) #0 {
bb:
  %tmp = tail call i8* @llvm.returnaddress(i32 0)
  %tmp1 = ptrtoint i8* %tmp to i64
  %tmp2 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp3 = icmp sgt i32 %tmp2, 0
  br i1 %tmp3, label %bb4, label %trace_get_random_bytes.exit

bb4:                                              ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp5 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %tmp6 = icmp eq %struct.tracepoint_func* %tmp5, null
  br i1 %tmp6, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb4
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp5, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb7

bb7:                                              ; preds = %bb7, %.preheader.i
  %tmp8 = phi i8* [ %tmp14, %bb7 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp12, %bb7 ], [ %tmp5, %.preheader.i ]
  %tmp9 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp10 = load i8** %tmp9, align 8
  %tmp11 = bitcast i8* %tmp8 to void (i8*, i32, i64)*
  tail call void %tmp11(i8* %tmp10, i32 %nbytes, i64 %tmp1) #4
  %tmp12 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp13 = getelementptr inbounds %struct.tracepoint_func* %tmp12, i64 0, i32 0
  %tmp14 = load i8** %tmp13, align 8
  %tmp15 = icmp eq i8* %tmp14, null
  br i1 %tmp15, label %.loopexit.i, label %bb7

.loopexit.i:                                      ; preds = %bb7, %bb4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_get_random_bytes.exit

trace_get_random_bytes.exit:                      ; preds = %.loopexit.i, %bb
  %tmp16 = sext i32 %nbytes to i64
  %tmp17 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buf, i64 %tmp16, i32 0, i32 0) #5
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @extract_entropy(%struct.entropy_store* %r, i8* nocapture %buf, i64 %nbytes, i32 %min, i32 %reserved) #0 {
bb:
  %tmp = alloca [10 x i8], align 1
  %tmp1 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %tmp2 = load i8** %tmp1, align 8
  %tmp3 = trunc i64 %nbytes to i32
  %tmp4 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %tmp5 = load i32* %tmp4, align 4
  %tmp6 = ashr i32 %tmp5, 3
  %tmp7 = call i8* @llvm.returnaddress(i32 0)
  %tmp8 = ptrtoint i8* %tmp7 to i64
  %tmp9 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp10 = icmp sgt i32 %tmp9, 0
  br i1 %tmp10, label %bb11, label %trace_extract_entropy.exit

bb11:                                             ; preds = %bb
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp12 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy, i64 0, i32 4), align 8
  %tmp13 = icmp eq %struct.tracepoint_func* %tmp12, null
  br i1 %tmp13, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb11
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp12, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb14

bb14:                                             ; preds = %bb14, %.preheader.i
  %tmp15 = phi i8* [ %tmp21, %bb14 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp19, %bb14 ], [ %tmp12, %.preheader.i ]
  %tmp16 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp17 = load i8** %tmp16, align 8
  %tmp18 = bitcast i8* %tmp15 to void (i8*, i8*, i32, i32, i64)*
  call void %tmp18(i8* %tmp17, i8* %tmp2, i32 %tmp3, i32 %tmp6, i64 %tmp8) #4
  %tmp19 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp20 = getelementptr inbounds %struct.tracepoint_func* %tmp19, i64 0, i32 0
  %tmp21 = load i8** %tmp20, align 8
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %.loopexit.i, label %bb14

.loopexit.i:                                      ; preds = %bb14, %bb11
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_extract_entropy.exit

trace_extract_entropy.exit:                       ; preds = %.loopexit.i, %bb
  %tmp23 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 3
  %tmp24 = load %struct.entropy_store** %tmp23, align 8
  %tmp25 = icmp eq %struct.entropy_store* %tmp24, null
  br i1 %tmp25, label %xfer_secondary_pool.exit, label %bb26

bb26:                                             ; preds = %trace_extract_entropy.exit
  %tmp27 = load i32* %tmp4, align 4
  %tmp28 = sext i32 %tmp27 to i64
  %tmp29 = shl i64 %nbytes, 6
  %tmp30 = icmp ult i64 %tmp28, %tmp29
  br i1 %tmp30, label %bb31, label %xfer_secondary_pool.exit

bb31:                                             ; preds = %bb26
  %tmp32 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %tmp33 = load %struct.poolinfo** %tmp32, align 8
  %tmp34 = getelementptr inbounds %struct.poolinfo* %tmp33, i64 0, i32 4
  %tmp35 = load i32* %tmp34, align 4
  %tmp36 = icmp sgt i32 %tmp27, %tmp35
  br i1 %tmp36, label %xfer_secondary_pool.exit, label %bb37

bb37:                                             ; preds = %bb31
  %tmp38 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %tmp39 = load i8* %tmp38, align 8
  %tmp40 = and i8 %tmp39, 2
  %tmp41 = icmp eq i8 %tmp40, 0
  %tmp42 = load i32* @random_min_urandom_seed, align 4
  %tmp43 = icmp ne i32 %tmp42, 0
  %or.cond.i = and i1 %tmp41, %tmp43
  br i1 %or.cond.i, label %bb44, label %bb53

bb44:                                             ; preds = %bb37
  %tmp45 = load volatile i64* @jiffies, align 8
  %tmp46 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 5
  %tmp47 = load i64* %tmp46, align 8
  %tmp48 = mul i32 %tmp42, 1000
  %tmp49 = sext i32 %tmp48 to i64
  %.neg3 = sub i64 %tmp45, %tmp49
  %tmp50 = sub i64 %.neg3, %tmp47
  %tmp51 = icmp slt i64 %tmp50, 0
  br i1 %tmp51, label %xfer_secondary_pool.exit, label %bb52

bb52:                                             ; preds = %bb44
  store i64 %tmp45, i64* %tmp46, align 8
  br label %bb53

bb53:                                             ; preds = %bb52, %bb37
  call fastcc void @_xfer_secondary_pool(%struct.entropy_store* %r, i64 %nbytes) #4
  br label %xfer_secondary_pool.exit

xfer_secondary_pool.exit:                         ; preds = %bb53, %bb44, %bb31, %bb26, %trace_extract_entropy.exit
  %tmp54 = call fastcc i64 @account(%struct.entropy_store* %r, i64 %nbytes, i32 %min, i32 %reserved) #5
  %tmp55 = icmp eq i64 %tmp54, 0
  %tmp56 = getelementptr inbounds [10 x i8]* %tmp, i64 0, i64 0
  br i1 %tmp55, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %xfer_secondary_pool.exit
  %.06 = phi i8* [ %tmp62, %.lr.ph ], [ %buf, %xfer_secondary_pool.exit ]
  %.015 = phi i64 [ %tmp61, %.lr.ph ], [ %tmp54, %xfer_secondary_pool.exit ]
  %ret.04 = phi i64 [ %tmp63, %.lr.ph ], [ 0, %xfer_secondary_pool.exit ]
  call fastcc void @extract_buf(%struct.entropy_store* %r, i8* %tmp56) #5
  %tmp57 = trunc i64 %.015 to i32
  %tmp58 = icmp slt i32 %tmp57, 10
  %sext = shl i64 %.015, 32
  %tmp59 = ashr exact i64 %sext, 32
  %tmp60 = select i1 %tmp58, i64 %tmp59, i64 10
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %.06, i8* %tmp56, i64 %tmp60, i32 1, i1 false)
  %tmp61 = sub i64 %.015, %tmp60
  %tmp62 = getelementptr i8* %.06, i64 %tmp60
  %tmp63 = add i64 %tmp60, %ret.04
  %tmp64 = icmp eq i64 %.015, %tmp60
  br i1 %tmp64, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %xfer_secondary_pool.exit
  %ret.0.lcssa = phi i64 [ 0, %xfer_secondary_pool.exit ], [ %tmp63, %.lr.ph ]
  call void @memzero_explicit(i8* %tmp56, i64 10) #4
  ret i64 %ret.0.lcssa
}

; Function Attrs: noredzone nounwind
define void @get_random_bytes_arch(i8* nocapture %buf, i32 %nbytes) #0 {
bb:
  %v = alloca i64, align 8
  %tmp = tail call i8* @llvm.returnaddress(i32 0)
  %tmp1 = ptrtoint i8* %tmp to i64
  %tmp2 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes_arch, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp3 = icmp sgt i32 %tmp2, 0
  br i1 %tmp3, label %bb4, label %trace_get_random_bytes_arch.exit.preheader

bb4:                                              ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp5 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes_arch, i64 0, i32 4), align 8
  %tmp6 = icmp eq %struct.tracepoint_func* %tmp5, null
  br i1 %tmp6, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb4
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp5, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb7

bb7:                                              ; preds = %bb7, %.preheader.i
  %tmp8 = phi i8* [ %tmp14, %bb7 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp12, %bb7 ], [ %tmp5, %.preheader.i ]
  %tmp9 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp10 = load i8** %tmp9, align 8
  %tmp11 = bitcast i8* %tmp8 to void (i8*, i32, i64)*
  tail call void %tmp11(i8* %tmp10, i32 %nbytes, i64 %tmp1) #4
  %tmp12 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp13 = getelementptr inbounds %struct.tracepoint_func* %tmp12, i64 0, i32 0
  %tmp14 = load i8** %tmp13, align 8
  %tmp15 = icmp eq i8* %tmp14, null
  br i1 %tmp15, label %.loopexit.i, label %bb7

.loopexit.i:                                      ; preds = %bb7, %bb4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_get_random_bytes_arch.exit.preheader

trace_get_random_bytes_arch.exit.preheader:       ; preds = %.loopexit.i, %bb
  %tmp16 = icmp eq i32 %nbytes, 0
  br i1 %tmp16, label %.critedge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %trace_get_random_bytes_arch.exit.preheader
  %v.0.cast1 = bitcast i64* %v to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %trace_get_random_bytes_arch.exit, %.lr.ph.preheader
  %.04 = phi i32 [ %tmp25, %trace_get_random_bytes_arch.exit ], [ %nbytes, %.lr.ph.preheader ]
  %p.03 = phi i8* [ %tmp24, %trace_get_random_bytes_arch.exit ], [ %buf, %.lr.ph.preheader ]
  %tmp17 = icmp slt i32 %.04, 8
  %tmp18 = select i1 %tmp17, i32 %.04, i32 8
  %tmp19 = tail call { i32, i64 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x48,0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !28
  %tmp20 = extractvalue { i32, i64 } %tmp19, 0
  %tmp21 = extractvalue { i32, i64 } %tmp19, 1
  store i64 %tmp21, i64* %v, align 8
  %tmp22 = icmp eq i32 %tmp20, 0
  br i1 %tmp22, label %bb27, label %trace_get_random_bytes_arch.exit

trace_get_random_bytes_arch.exit:                 ; preds = %.lr.ph
  %tmp23 = sext i32 %tmp18 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %p.03, i8* %v.0.cast1, i64 %tmp23, i32 1, i1 false)
  %tmp24 = getelementptr i8* %p.03, i64 %tmp23
  %tmp25 = sub i32 %.04, %tmp18
  %tmp26 = icmp eq i32 %.04, %tmp18
  br i1 %tmp26, label %.critedge, label %.lr.ph

bb27:                                             ; preds = %.lr.ph
  %tmp28 = sext i32 %.04 to i64
  %tmp29 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %p.03, i64 %tmp28, i32 0, i32 0) #5
  br label %.critedge

.critedge:                                        ; preds = %bb27, %trace_get_random_bytes_arch.exit, %trace_get_random_bytes_arch.exit.preheader
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noredzone nounwind
define internal i32 @rand_initialize() #0 {
bb:
  tail call fastcc void @init_std_data(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*)) #5
  tail call fastcc void @init_std_data(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*)) #5
  tail call fastcc void @init_std_data(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*)) #5
  ret i32 0
}

; Function Attrs: noredzone nounwind
define void @rand_initialize_disk(%struct.gendisk* nocapture %disk) #0 {
bb:
  %tmp = tail call i8* @__kmalloc(i64 32, i32 32976) #4
  %tmp1 = icmp eq i8* %tmp, null
  br i1 %tmp1, label %bb6, label %bb2

bb2:                                              ; preds = %bb
  %tmp3 = bitcast i8* %tmp to %struct.timer_rand_state*
  %tmp4 = bitcast i8* %tmp to i64*
  store i64 4294667296, i64* %tmp4, align 8
  %tmp5 = getelementptr inbounds %struct.gendisk* %disk, i64 0, i32 15
  store %struct.timer_rand_state* %tmp3, %struct.timer_rand_state** %tmp5, align 8
  br label %bb6

bb6:                                              ; preds = %bb2, %bb
  ret void
}

; Function Attrs: noredzone
declare i64 @noop_llseek(%struct.file*, i64, i32) #1

; Function Attrs: noredzone nounwind
define internal i64 @random_read(%struct.file* nocapture readonly %file, i8* %buf, i64 %nbytes, i64* nocapture readnone %ppos) #0 {
bb:
  %tmp = getelementptr inbounds %struct.file* %file, i64 0, i32 6
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = and i32 %tmp1, 2048
  %tmp3 = tail call fastcc i64 @_random_read(i32 %tmp2, i8* %buf, i64 %nbytes) #5
  ret i64 %tmp3
}

; Function Attrs: noredzone nounwind
define internal i64 @random_write(%struct.file* nocapture readnone %file, i8* %buffer, i64 %count, i64* nocapture readnone %ppos) #0 {
bb:
  %tmp = tail call fastcc i32 @write_pool(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*), i8* %buffer, i64 %count) #5
  %tmp1 = icmp eq i32 %tmp, 0
  br i1 %tmp1, label %bb4, label %bb2

bb2:                                              ; preds = %bb
  %tmp3 = sext i32 %tmp to i64
  br label %UnifiedReturnBlock

bb4:                                              ; preds = %bb
  %tmp5 = tail call fastcc i32 @write_pool(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buffer, i64 %count) #5
  %tmp6 = icmp eq i32 %tmp5, 0
  %tmp7 = sext i32 %tmp5 to i64
  %count. = select i1 %tmp6, i64 %count, i64 %tmp7
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %bb4, %bb2
  %UnifiedRetVal = phi i64 [ %tmp3, %bb2 ], [ %count., %bb4 ]
  ret i64 %UnifiedRetVal
}

; Function Attrs: noredzone nounwind
define internal i32 @random_poll(%struct.file* %file, %struct.poll_table_struct* %wait) #0 {
bb:
  %tmp = icmp eq %struct.poll_table_struct* %wait, null
  br i1 %tmp, label %poll_wait.exit1, label %bb1

bb1:                                              ; preds = %bb
  %tmp2 = getelementptr inbounds %struct.poll_table_struct* %wait, i64 0, i32 0
  %tmp3 = load void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)** %tmp2, align 8
  %tmp4 = icmp eq void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)* %tmp3, null
  br i1 %tmp4, label %poll_wait.exit1, label %bb5

bb5:                                              ; preds = %bb1
  tail call void %tmp3(%struct.file* %file, %struct.__wait_queue_head* @random_read_wait, %struct.poll_table_struct* %wait) #4
  %.pre = load void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)** %tmp2, align 8
  %tmp6 = icmp eq void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)* %.pre, null
  br i1 %tmp6, label %poll_wait.exit1, label %bb7

bb7:                                              ; preds = %bb5
  tail call void %.pre(%struct.file* %file, %struct.__wait_queue_head* @random_write_wait, %struct.poll_table_struct* %wait) #4
  br label %poll_wait.exit1

poll_wait.exit1:                                  ; preds = %bb7, %bb5, %bb1, %bb
  %tmp8 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp9 = ashr i32 %tmp8, 3
  %tmp10 = load i32* @random_read_wakeup_bits, align 4
  %tmp11 = icmp slt i32 %tmp9, %tmp10
  %. = select i1 %tmp11, i32 0, i32 65
  %tmp12 = load i32* @random_write_wakeup_bits, align 4
  %tmp13 = icmp slt i32 %tmp9, %tmp12
  %tmp14 = or i32 %., 260
  %mask.1 = select i1 %tmp13, i32 %tmp14, i32 %.
  ret i32 %mask.1
}

; Function Attrs: noredzone nounwind
define internal i64 @random_ioctl(%struct.file* nocapture readnone %f, i32 %cmd, i64 %arg) #0 {
bb:
  %tmp = inttoptr i64 %arg to i32*
  switch i32 %cmd, label %bb57 [
    i32 -2147200512, label %bb1
    i32 1074024961, label %bb6
    i32 1074287107, label %bb21
    i32 20996, label %bb54
    i32 20998, label %bb54
  ]

bb1:                                              ; preds = %bb
  %tmp2 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp3 = ashr i32 %tmp2, 3
  %tmp4 = tail call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %tmp3, i32* %tmp) #3, !srcloc !29
  %tmp5 = icmp eq i32 %tmp4, 0
  %. = select i1 %tmp5, i64 0, i64 -14
  br label %bb57

bb6:                                              ; preds = %bb
  %tmp7 = tail call zeroext i1 @capable(i32 21) #4
  br i1 %tmp7, label %bb8, label %bb57

bb8:                                              ; preds = %bb6
  %tmp9 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %tmp, i64 4) #3, !srcloc !30
  %tmp10 = extractvalue { i32*, i64 } %tmp9, 0
  %tmp11 = ptrtoint i32* %tmp10 to i64
  %tmp12 = trunc i64 %tmp11 to i32
  %tmp13 = icmp eq i32 %tmp12, 0
  br i1 %tmp13, label %bb14, label %bb57

bb14:                                             ; preds = %bb8
  %tmp15 = extractvalue { i32*, i64 } %tmp9, 1
  %tmp16 = trunc i64 %tmp15 to i32
  %tmp17 = icmp slt i32 %tmp16, 268435455
  %tmp18 = select i1 %tmp17, i32 %tmp16, i32 268435455
  %tmp19 = icmp sgt i32 %tmp18, -268435455
  %tmp20 = select i1 %tmp19, i32 %tmp18, i32 -268435455
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i32 %tmp20) #4
  br label %bb57

bb21:                                             ; preds = %bb
  %tmp22 = tail call zeroext i1 @capable(i32 21) #4
  br i1 %tmp22, label %bb23, label %bb57

bb23:                                             ; preds = %bb21
  %tmp24 = getelementptr i32* %tmp, i64 1
  %tmp25 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %tmp, i64 4) #3, !srcloc !31
  %tmp26 = extractvalue { i32*, i64 } %tmp25, 0
  %tmp27 = extractvalue { i32*, i64 } %tmp25, 1
  %tmp28 = ptrtoint i32* %tmp26 to i64
  %tmp29 = trunc i64 %tmp28 to i32
  %tmp30 = trunc i64 %tmp27 to i32
  %tmp31 = icmp eq i32 %tmp29, 0
  br i1 %tmp31, label %bb32, label %bb57

bb32:                                             ; preds = %bb23
  %tmp33 = icmp slt i32 %tmp30, 0
  br i1 %tmp33, label %bb57, label %bb34

bb34:                                             ; preds = %bb32
  %tmp35 = tail call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %tmp24, i64 4) #3, !srcloc !32
  %tmp36 = extractvalue { i32*, i64 } %tmp35, 0
  %tmp37 = ptrtoint i32* %tmp36 to i64
  %tmp38 = trunc i64 %tmp37 to i32
  %tmp39 = icmp eq i32 %tmp38, 0
  br i1 %tmp39, label %bb40, label %bb57

bb40:                                             ; preds = %bb34
  %tmp41 = extractvalue { i32*, i64 } %tmp35, 1
  %tmp42 = getelementptr i32* %tmp, i64 2
  %tmp43 = bitcast i32* %tmp42 to i8*
  %sext = shl i64 %tmp41, 32
  %tmp44 = ashr exact i64 %sext, 32
  %tmp45 = tail call fastcc i32 @write_pool(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %tmp43, i64 %tmp44) #5
  %tmp46 = icmp slt i32 %tmp45, 0
  br i1 %tmp46, label %bb47, label %bb49

bb47:                                             ; preds = %bb40
  %tmp48 = sext i32 %tmp45 to i64
  br label %bb57

bb49:                                             ; preds = %bb40
  %tmp50 = icmp slt i32 %tmp30, 268435455
  %tmp51 = select i1 %tmp50, i32 %tmp30, i32 268435455
  %tmp52 = icmp sgt i32 %tmp51, -268435455
  %tmp53 = select i1 %tmp52, i32 %tmp51, i32 -268435455
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i32 %tmp53) #4
  br label %bb57

bb54:                                             ; preds = %bb, %bb
  %tmp55 = tail call zeroext i1 @capable(i32 21) #4
  br i1 %tmp55, label %bb56, label %bb57

bb56:                                             ; preds = %bb54
  store i32 0, i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  store i32 0, i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 9), align 8
  store i32 0, i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool, i64 0, i32 9), align 8
  br label %bb57

bb57:                                             ; preds = %bb56, %bb54, %bb49, %bb47, %bb34, %bb32, %bb23, %bb21, %bb14, %bb8, %bb6, %bb1, %bb
  %.0 = phi i64 [ 0, %bb56 ], [ %tmp48, %bb47 ], [ 0, %bb49 ], [ 0, %bb14 ], [ %., %bb1 ], [ -1, %bb6 ], [ -14, %bb8 ], [ -1, %bb21 ], [ -14, %bb23 ], [ -22, %bb32 ], [ -14, %bb34 ], [ -1, %bb54 ], [ -22, %bb ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @random_fasync(i32 %fd, %struct.file* %filp, i32 %on) #0 {
bb:
  %tmp = tail call i32 @fasync_helper(i32 %fd, %struct.file* %filp, i32 %on, %struct.fasync_struct** @fasync) #4
  ret i32 %tmp
}

; Function Attrs: noredzone nounwind
define internal i64 @urandom_read(%struct.file* nocapture readnone %file, i8* %buf, i64 %nbytes, i64* nocapture readnone %ppos) #0 {
bb:
  %tmp = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %tmp1 = and i8 %tmp, 1
  %tmp2 = icmp eq i8 %tmp1, 0
  br i1 %tmp2, label %bb3, label %bb9, !prof !26

bb3:                                              ; preds = %bb
  %.b = load i1* @urandom_read.__print_once, align 1
  br i1 %.b, label %bb9, label %bb4

bb4:                                              ; preds = %bb3
  store i1 true, i1* @urandom_read.__print_once, align 1
  %tmp5 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp6 = getelementptr inbounds %struct.task_struct* %tmp5, i64 0, i32 73, i64 0
  %tmp7 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 10), align 4
  %tmp8 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([61 x i8]* @.str14, i64 0, i64 0), i8* %tmp6, i32 %tmp7) #4
  br label %bb9

bb9:                                              ; preds = %bb4, %bb3, %bb
  %tmp10 = icmp ult i64 %nbytes, 33554431
  %tmp11 = select i1 %tmp10, i64 %nbytes, i64 33554431
  %tmp12 = tail call fastcc i64 @extract_entropy_user(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %buf, i64 %tmp11) #5
  %tmp13 = shl i64 %tmp11, 3
  %tmp14 = trunc i64 %tmp13 to i32
  %tmp15 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 9), align 8
  %tmp16 = ashr i32 %tmp15, 3
  %tmp17 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp18 = ashr i32 %tmp17, 3
  %tmp19 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_urandom_read, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp20 = icmp sgt i32 %tmp19, 0
  br i1 %tmp20, label %bb21, label %trace_urandom_read.exit

bb21:                                             ; preds = %bb9
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp22 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_urandom_read, i64 0, i32 4), align 8
  %tmp23 = icmp eq %struct.tracepoint_func* %tmp22, null
  br i1 %tmp23, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb21
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp22, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb24

bb24:                                             ; preds = %bb24, %.preheader.i
  %tmp25 = phi i8* [ %tmp31, %bb24 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp29, %bb24 ], [ %tmp22, %.preheader.i ]
  %tmp26 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp27 = load i8** %tmp26, align 8
  %tmp28 = bitcast i8* %tmp25 to void (i8*, i32, i32, i32)*
  tail call void %tmp28(i8* %tmp27, i32 %tmp14, i32 %tmp16, i32 %tmp18) #4
  %tmp29 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp30 = getelementptr inbounds %struct.tracepoint_func* %tmp29, i64 0, i32 0
  %tmp31 = load i8** %tmp30, align 8
  %tmp32 = icmp eq i8* %tmp31, null
  br i1 %tmp32, label %.loopexit.i, label %bb24

.loopexit.i:                                      ; preds = %bb24, %bb21
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_urandom_read.exit

trace_urandom_read.exit:                          ; preds = %.loopexit.i, %bb9
  %sext = shl i64 %tmp12, 32
  %tmp33 = ashr exact i64 %sext, 32
  ret i64 %tmp33
}

; Function Attrs: noredzone nounwind
define i64 @SyS_getrandom(i64 %buf, i64 %count, i64 %flags) #0 {
bb:
  %__wait.i = alloca %struct.__wait_queue, align 8
  %tmp = inttoptr i64 %buf to i8*
  %tmp1 = trunc i64 %flags to i32
  %tmp2 = icmp ugt i32 %tmp1, 3
  br i1 %tmp2, label %SYSC_getrandom.exit, label %bb3

bb3:                                              ; preds = %bb
  %tmp4 = icmp ugt i64 %count, 2147483647
  %.count.i = select i1 %tmp4, i64 2147483647, i64 %count
  %tmp5 = and i32 %tmp1, 2
  %tmp6 = icmp eq i32 %tmp5, 0
  br i1 %tmp6, label %bb10, label %bb7

bb7:                                              ; preds = %bb3
  %tmp8 = and i32 %tmp1, 1
  %tmp9 = call fastcc i64 @_random_read(i32 %tmp8, i8* %tmp, i64 %.count.i) #4
  br label %SYSC_getrandom.exit

bb10:                                             ; preds = %bb3
  %tmp11 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %tmp12 = and i8 %tmp11, 1
  %tmp13 = icmp eq i8 %tmp12, 0
  br i1 %tmp13, label %bb14, label %bb46, !prof !26

bb14:                                             ; preds = %bb10
  %tmp15 = and i32 %tmp1, 1
  %tmp16 = icmp eq i32 %tmp15, 0
  br i1 %tmp16, label %bb17, label %SYSC_getrandom.exit

bb17:                                             ; preds = %bb14
  %tmp18 = call i32 @_cond_resched() #4
  %tmp19 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %tmp20 = and i8 %tmp19, 1
  %tmp21 = icmp eq i8 %tmp20, 0
  br i1 %tmp21, label %bb22, label %bb38

bb22:                                             ; preds = %bb17
  %tmp23 = bitcast %struct.__wait_queue* %__wait.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %tmp23) #3
  %tmp24 = getelementptr inbounds %struct.__wait_queue* %__wait.i, i64 0, i32 3
  %tmp25 = getelementptr inbounds %struct.list_head* %tmp24, i64 0, i32 0
  store %struct.list_head* %tmp24, %struct.list_head** %tmp25, align 8
  %tmp26 = getelementptr inbounds %struct.__wait_queue* %__wait.i, i64 0, i32 3, i32 1
  store %struct.list_head* %tmp24, %struct.list_head** %tmp26, align 8
  %tmp27 = getelementptr inbounds %struct.__wait_queue* %__wait.i, i64 0, i32 0
  store i32 0, i32* %tmp27, align 8
  %tmp28 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @urandom_init_wait, %struct.__wait_queue* %__wait.i, i32 1) #4
  %tmp29 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %tmp30 = and i8 %tmp29, 1
  %tmp31 = icmp eq i8 %tmp30, 0
  %tmp32 = icmp eq i64 %tmp28, 0
  %or.cond3.i = and i1 %tmp31, %tmp32
  br i1 %or.cond3.i, label %.lr.ph.i, label %._crit_edge.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %bb22
  call void @schedule() #4
  %tmp33 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @urandom_init_wait, %struct.__wait_queue* %__wait.i, i32 1) #4
  %tmp34 = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  %tmp35 = and i8 %tmp34, 1
  %tmp36 = icmp eq i8 %tmp35, 0
  %tmp37 = icmp eq i64 %tmp33, 0
  %or.cond.i = and i1 %tmp36, %tmp37
  br i1 %or.cond.i, label %.lr.ph.i, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %.lr.ph.i, %bb22
  call void @finish_wait(%struct.__wait_queue_head* @urandom_init_wait, %struct.__wait_queue* %__wait.i) #4
  call void @llvm.lifetime.end(i64 40, i8* %tmp23) #3
  br label %bb38

bb38:                                             ; preds = %._crit_edge.i, %bb17
  %tmp39 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp40 = getelementptr inbounds %struct.task_struct* %tmp39, i64 0, i32 1
  %tmp41 = load i8** %tmp40, align 8
  %tmp42 = getelementptr inbounds i8* %tmp41, i64 16
  %tmp43 = bitcast i8* %tmp42 to i64*
  %tmp44 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %tmp43, i64 2) #3, !srcloc !34
  %tmp45 = icmp eq i32 %tmp44, 0
  br i1 %tmp45, label %._crit_edge, label %SYSC_getrandom.exit

._crit_edge:                                      ; preds = %bb38
  %.pre = load i8* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 11), align 8
  br label %bb46

bb46:                                             ; preds = %._crit_edge, %bb10
  %tmp47 = phi i8 [ %.pre, %._crit_edge ], [ %tmp11, %bb10 ]
  %tmp48 = and i8 %tmp47, 1
  %tmp49 = icmp eq i8 %tmp48, 0
  br i1 %tmp49, label %bb50, label %bb56, !prof !26

bb50:                                             ; preds = %bb46
  %.b.i = load i1* @urandom_read.__print_once, align 1
  br i1 %.b.i, label %bb56, label %bb51

bb51:                                             ; preds = %bb50
  store i1 true, i1* @urandom_read.__print_once, align 1
  %tmp52 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp53 = getelementptr inbounds %struct.task_struct* %tmp52, i64 0, i32 73, i64 0
  %tmp54 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 10), align 4
  %tmp55 = call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([61 x i8]* @.str14, i64 0, i64 0), i8* %tmp53, i32 %tmp54) #4
  br label %bb56

bb56:                                             ; preds = %bb51, %bb50, %bb46
  %tmp57 = icmp ult i64 %.count.i, 33554431
  %tmp58 = select i1 %tmp57, i64 %.count.i, i64 33554431
  %tmp59 = call fastcc i64 @extract_entropy_user(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %tmp, i64 %tmp58) #4
  %tmp60 = shl i64 %tmp58, 3
  %tmp61 = trunc i64 %tmp60 to i32
  %tmp62 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool, i64 0, i32 9), align 8
  %tmp63 = ashr i32 %tmp62, 3
  %tmp64 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp65 = ashr i32 %tmp64, 3
  %tmp66 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_urandom_read, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp67 = icmp sgt i32 %tmp66, 0
  br i1 %tmp67, label %bb68, label %urandom_read.exit

bb68:                                             ; preds = %bb56
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp69 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_urandom_read, i64 0, i32 4), align 8
  %tmp70 = icmp eq %struct.tracepoint_func* %tmp69, null
  br i1 %tmp70, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb68
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp69, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb71

bb71:                                             ; preds = %bb71, %.preheader.i.i
  %tmp72 = phi i8* [ %tmp78, %bb71 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp76, %bb71 ], [ %tmp69, %.preheader.i.i ]
  %tmp73 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp74 = load i8** %tmp73, align 8
  %tmp75 = bitcast i8* %tmp72 to void (i8*, i32, i32, i32)*
  call void %tmp75(i8* %tmp74, i32 %tmp61, i32 %tmp63, i32 %tmp65) #4
  %tmp76 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp77 = getelementptr inbounds %struct.tracepoint_func* %tmp76, i64 0, i32 0
  %tmp78 = load i8** %tmp77, align 8
  %tmp79 = icmp eq i8* %tmp78, null
  br i1 %tmp79, label %.loopexit.i.i, label %bb71

.loopexit.i.i:                                    ; preds = %bb71, %bb68
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %urandom_read.exit

urandom_read.exit:                                ; preds = %.loopexit.i.i, %bb56
  %sext.i = shl i64 %tmp59, 32
  %tmp80 = ashr exact i64 %sext.i, 32
  br label %SYSC_getrandom.exit

SYSC_getrandom.exit:                              ; preds = %urandom_read.exit, %bb38, %bb14, %bb7, %bb
  %.0.i = phi i64 [ %tmp9, %bb7 ], [ %tmp80, %urandom_read.exit ], [ -22, %bb ], [ -11, %bb14 ], [ -512, %bb38 ]
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define void @generate_random_uuid(i8* nocapture %uuid_out) #0 {
bb:
  %tmp = tail call i8* @llvm.returnaddress(i32 0) #3
  %tmp1 = ptrtoint i8* %tmp to i64
  %tmp2 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp3 = icmp sgt i32 %tmp2, 0
  br i1 %tmp3, label %bb4, label %get_random_bytes.exit

bb4:                                              ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp5 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %tmp6 = icmp eq %struct.tracepoint_func* %tmp5, null
  br i1 %tmp6, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb4
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp5, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb7

bb7:                                              ; preds = %bb7, %.preheader.i.i
  %tmp8 = phi i8* [ %tmp14, %bb7 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp12, %bb7 ], [ %tmp5, %.preheader.i.i ]
  %tmp9 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp10 = load i8** %tmp9, align 8
  %tmp11 = bitcast i8* %tmp8 to void (i8*, i32, i64)*
  tail call void %tmp11(i8* %tmp10, i32 16, i64 %tmp1) #4
  %tmp12 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp13 = getelementptr inbounds %struct.tracepoint_func* %tmp12, i64 0, i32 0
  %tmp14 = load i8** %tmp13, align 8
  %tmp15 = icmp eq i8* %tmp14, null
  br i1 %tmp15, label %.loopexit.i.i, label %bb7

.loopexit.i.i:                                    ; preds = %bb7, %bb4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %get_random_bytes.exit

get_random_bytes.exit:                            ; preds = %.loopexit.i.i, %bb
  %tmp16 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %uuid_out, i64 16, i32 0, i32 0) #4
  %tmp17 = getelementptr i8* %uuid_out, i64 6
  %tmp18 = load i8* %tmp17, align 1
  %tmp19 = and i8 %tmp18, 15
  %tmp20 = or i8 %tmp19, 64
  store i8 %tmp20, i8* %tmp17, align 1
  %tmp21 = getelementptr i8* %uuid_out, i64 8
  %tmp22 = load i8* %tmp21, align 1
  %tmp23 = and i8 %tmp22, 63
  %tmp24 = or i8 %tmp23, -128
  store i8 %tmp24, i8* %tmp21, align 1
  ret void
}

; Function Attrs: noredzone
declare i32 @proc_dointvec(%struct.ctl_table*, i32, i8*, i64*, i64*) #1

; Function Attrs: noredzone nounwind
define internal i32 @proc_do_entropy(%struct.ctl_table* nocapture readonly %table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #0 {
bb:
  %fake_table = alloca %struct.ctl_table, align 8
  %entropy_count = alloca i32, align 4
  %tmp = bitcast %struct.ctl_table* %fake_table to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp) #3
  %tmp1 = getelementptr inbounds %struct.ctl_table* %table, i64 0, i32 1
  %tmp2 = load i8** %tmp1, align 8
  %tmp3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %tmp3, align 4
  %tmp5 = ashr i32 %tmp4, 3
  store i32 %tmp5, i32* %entropy_count, align 4
  %tmp6 = bitcast i32* %entropy_count to i8*
  %tmp7 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 1
  store i8* %tmp6, i8** %tmp7, align 8
  %tmp8 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 2
  store i32 4, i32* %tmp8, align 8
  %tmp9 = call i32 @proc_dointvec(%struct.ctl_table* %fake_table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #4
  call void @llvm.lifetime.end(i64 64, i8* %tmp) #3
  ret i32 %tmp9
}

; Function Attrs: noredzone
declare i32 @proc_dointvec_minmax(%struct.ctl_table*, i32, i8*, i64*, i64*) #1

; Function Attrs: noredzone nounwind
define internal i32 @proc_do_uuid(%struct.ctl_table* nocapture readonly %table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #0 {
bb:
  %fake_table = alloca %struct.ctl_table, align 8
  %buf = alloca [64 x i8], align 16
  %tmp_uuid = alloca [16 x i8], align 16
  %tmp = bitcast %struct.ctl_table* %fake_table to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp) #3
  %tmp1 = getelementptr inbounds [64 x i8]* %buf, i64 0, i64 0
  call void @llvm.lifetime.start(i64 64, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds %struct.ctl_table* %table, i64 0, i32 1
  %tmp3 = load i8** %tmp2, align 8
  %tmp4 = icmp eq i8* %tmp3, null
  br i1 %tmp4, label %bb5, label %bb32

bb5:                                              ; preds = %bb
  %tmp6 = getelementptr inbounds [16 x i8]* %tmp_uuid, i64 0, i64 0
  %tmp7 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp8 = ptrtoint i8* %tmp7 to i64
  %tmp9 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp10 = icmp sgt i32 %tmp9, 0
  br i1 %tmp10, label %bb11, label %generate_random_uuid.exit

bb11:                                             ; preds = %bb5
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp12 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %tmp13 = icmp eq %struct.tracepoint_func* %tmp12, null
  br i1 %tmp13, label %.loopexit.i.i.i, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %bb11
  %.phi.trans.insert.i.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp12, i64 0, i32 0
  %.pre.i.i.i = load i8** %.phi.trans.insert.i.i.i, align 8
  br label %bb14

bb14:                                             ; preds = %bb14, %.preheader.i.i.i
  %tmp15 = phi i8* [ %tmp21, %bb14 ], [ %.pre.i.i.i, %.preheader.i.i.i ]
  %it_func_ptr.0.i.i.i = phi %struct.tracepoint_func* [ %tmp19, %bb14 ], [ %tmp12, %.preheader.i.i.i ]
  %tmp16 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i.i, i64 0, i32 1
  %tmp17 = load i8** %tmp16, align 8
  %tmp18 = bitcast i8* %tmp15 to void (i8*, i32, i64)*
  call void %tmp18(i8* %tmp17, i32 16, i64 %tmp8) #4
  %tmp19 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i.i, i64 1
  %tmp20 = getelementptr inbounds %struct.tracepoint_func* %tmp19, i64 0, i32 0
  %tmp21 = load i8** %tmp20, align 8
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %.loopexit.i.i.i, label %bb14

.loopexit.i.i.i:                                  ; preds = %bb14, %bb11
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %generate_random_uuid.exit

generate_random_uuid.exit:                        ; preds = %.loopexit.i.i.i, %bb5
  %tmp23 = call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %tmp6, i64 16, i32 0, i32 0) #4
  %tmp24 = getelementptr [16 x i8]* %tmp_uuid, i64 0, i64 6
  %tmp25 = load i8* %tmp24, align 2
  %tmp26 = and i8 %tmp25, 15
  %tmp27 = or i8 %tmp26, 64
  store i8 %tmp27, i8* %tmp24, align 2
  %tmp28 = getelementptr [16 x i8]* %tmp_uuid, i64 0, i64 8
  %tmp29 = load i8* %tmp28, align 8
  %tmp30 = and i8 %tmp29, 63
  %tmp31 = or i8 %tmp30, -128
  store i8 %tmp31, i8* %tmp28, align 8
  br label %bb62

bb32:                                             ; preds = %bb
  call void @_raw_spin_lock(%struct.raw_spinlock* getelementptr inbounds (%struct.spinlock* @proc_do_uuid.bootid_spinlock, i64 0, i32 0, i32 0)) #4
  %tmp33 = getelementptr i8* %tmp3, i64 8
  %tmp34 = load i8* %tmp33, align 1
  %tmp35 = icmp eq i8 %tmp34, 0
  br i1 %tmp35, label %bb36, label %bb61

bb36:                                             ; preds = %bb32
  %tmp37 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp38 = ptrtoint i8* %tmp37 to i64
  %tmp39 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp40 = icmp sgt i32 %tmp39, 0
  br i1 %tmp40, label %bb41, label %generate_random_uuid.exit6

bb41:                                             ; preds = %bb36
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp42 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %tmp43 = icmp eq %struct.tracepoint_func* %tmp42, null
  br i1 %tmp43, label %.loopexit.i.i.i5, label %.preheader.i.i.i3

.preheader.i.i.i3:                                ; preds = %bb41
  %.phi.trans.insert.i.i.i1 = getelementptr inbounds %struct.tracepoint_func* %tmp42, i64 0, i32 0
  %.pre.i.i.i2 = load i8** %.phi.trans.insert.i.i.i1, align 8
  br label %bb44

bb44:                                             ; preds = %bb44, %.preheader.i.i.i3
  %tmp45 = phi i8* [ %tmp51, %bb44 ], [ %.pre.i.i.i2, %.preheader.i.i.i3 ]
  %it_func_ptr.0.i.i.i4 = phi %struct.tracepoint_func* [ %tmp49, %bb44 ], [ %tmp42, %.preheader.i.i.i3 ]
  %tmp46 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i.i4, i64 0, i32 1
  %tmp47 = load i8** %tmp46, align 8
  %tmp48 = bitcast i8* %tmp45 to void (i8*, i32, i64)*
  call void %tmp48(i8* %tmp47, i32 16, i64 %tmp38) #4
  %tmp49 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i.i4, i64 1
  %tmp50 = getelementptr inbounds %struct.tracepoint_func* %tmp49, i64 0, i32 0
  %tmp51 = load i8** %tmp50, align 8
  %tmp52 = icmp eq i8* %tmp51, null
  br i1 %tmp52, label %.loopexit.i.i.i5, label %bb44

.loopexit.i.i.i5:                                 ; preds = %bb44, %bb41
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %generate_random_uuid.exit6

generate_random_uuid.exit6:                       ; preds = %.loopexit.i.i.i5, %bb36
  %tmp53 = call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* %tmp3, i64 16, i32 0, i32 0) #4
  %tmp54 = getelementptr i8* %tmp3, i64 6
  %tmp55 = load i8* %tmp54, align 1
  %tmp56 = and i8 %tmp55, 15
  %tmp57 = or i8 %tmp56, 64
  store i8 %tmp57, i8* %tmp54, align 1
  %tmp58 = load i8* %tmp33, align 1
  %tmp59 = and i8 %tmp58, 63
  %tmp60 = or i8 %tmp59, -128
  store i8 %tmp60, i8* %tmp33, align 1
  br label %bb61

bb61:                                             ; preds = %generate_random_uuid.exit6, %bb32
  call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* bitcast (%struct.spinlock* @proc_do_uuid.bootid_spinlock to i8*), i8 1, i8* bitcast (%struct.spinlock* @proc_do_uuid.bootid_spinlock to i8*)) #3, !srcloc !24
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !25
  br label %bb62

bb62:                                             ; preds = %bb61, %generate_random_uuid.exit
  %uuid.0 = phi i8* [ %tmp3, %bb61 ], [ %tmp6, %generate_random_uuid.exit ]
  %tmp63 = call i32 (i8*, i8*, ...)* @sprintf(i8* %tmp1, i8* getelementptr inbounds ([4 x i8]* @.str8, i64 0, i64 0), i8* %uuid.0) #4
  %tmp64 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 1
  store i8* %tmp1, i8** %tmp64, align 8
  %tmp65 = getelementptr inbounds %struct.ctl_table* %fake_table, i64 0, i32 2
  store i32 64, i32* %tmp65, align 8
  %tmp66 = call i32 @proc_dostring(%struct.ctl_table* %fake_table, i32 %write, i8* %buffer, i64* %lenp, i64* %ppos) #4
  call void @llvm.lifetime.end(i64 64, i8* %tmp1) #3
  call void @llvm.lifetime.end(i64 64, i8* %tmp) #3
  ret i32 %tmp66
}

; Function Attrs: noredzone nounwind
define i32 @random_int_secret_init() #0 {
bb:
  %tmp = tail call i8* @llvm.returnaddress(i32 0) #3
  %tmp1 = ptrtoint i8* %tmp to i64
  %tmp2 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp3 = icmp sgt i32 %tmp2, 0
  br i1 %tmp3, label %bb4, label %get_random_bytes.exit

bb4:                                              ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp5 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_get_random_bytes, i64 0, i32 4), align 8
  %tmp6 = icmp eq %struct.tracepoint_func* %tmp5, null
  br i1 %tmp6, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb4
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp5, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb7

bb7:                                              ; preds = %bb7, %.preheader.i.i
  %tmp8 = phi i8* [ %tmp14, %bb7 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp12, %bb7 ], [ %tmp5, %.preheader.i.i ]
  %tmp9 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp10 = load i8** %tmp9, align 8
  %tmp11 = bitcast i8* %tmp8 to void (i8*, i32, i64)*
  tail call void %tmp11(i8* %tmp10, i32 64, i64 %tmp1) #4
  %tmp12 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp13 = getelementptr inbounds %struct.tracepoint_func* %tmp12, i64 0, i32 0
  %tmp14 = load i8** %tmp13, align 8
  %tmp15 = icmp eq i8* %tmp14, null
  br i1 %tmp15, label %.loopexit.i.i, label %bb7

.loopexit.i.i:                                    ; preds = %bb7, %bb4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %get_random_bytes.exit

get_random_bytes.exit:                            ; preds = %.loopexit.i.i, %bb
  %tmp16 = tail call fastcc i64 @extract_entropy(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @nonblocking_pool to %struct.entropy_store*), i8* bitcast ([16 x i32]* @random_int_secret to i8*), i64 64, i32 0, i32 0) #4
  ret i32 0
}

; Function Attrs: noredzone nounwind
define i32 @get_random_int() #0 {
bb:
  %tmp = tail call { i32, i32 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !35
  %tmp1 = extractvalue { i32, i32 } %tmp, 0
  %tmp2 = extractvalue { i32, i32 } %tmp, 1
  %tmp3 = icmp eq i32 %tmp1, 0
  br i1 %tmp3, label %bb4, label %bb23

bb4:                                              ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !36
  %tmp5 = tail call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, [4 x i32]* @get_random_int_hash) #3, !srcloc !37
  %tmp6 = inttoptr i64 %tmp5 to [4 x i32]*
  %tmp7 = getelementptr inbounds [4 x i32]* %tmp6, i64 0, i64 0
  %tmp8 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp9 = getelementptr inbounds %struct.task_struct* %tmp8, i64 0, i32 42
  %tmp10 = load i32* %tmp9, align 4
  %tmp11 = zext i32 %tmp10 to i64
  %tmp12 = load volatile i64* @jiffies, align 8
  %tmp13 = add i64 %tmp11, %tmp12
  %tmp14 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %tmp15 = extractvalue { i32, i32 } %tmp14, 0
  %tmp16 = zext i32 %tmp15 to i64
  %tmp17 = add i64 %tmp13, %tmp16
  %tmp18 = load i32* %tmp7, align 4
  %tmp19 = zext i32 %tmp18 to i64
  %tmp20 = add i64 %tmp17, %tmp19
  %tmp21 = trunc i64 %tmp20 to i32
  store i32 %tmp21, i32* %tmp7, align 4
  tail call void @md5_transform(i32* %tmp7, i32* getelementptr inbounds ([16 x i32]* @random_int_secret, i64 0, i64 0)) #4
  %tmp22 = load i32* %tmp7, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !38
  br label %bb23

bb23:                                             ; preds = %bb4, %bb
  %tmp24 = phi i32 [ %tmp2, %bb ], [ %tmp22, %bb4 ]
  ret i32 %tmp24
}

; Function Attrs: noredzone
declare void @md5_transform(i32*, i32*) #1

; Function Attrs: noredzone nounwind
define i64 @randomize_range(i64 %start, i64 %end, i64 %len) #0 {
bb:
  %tmp = add i64 %len, %start
  %tmp1 = icmp ult i64 %tmp, %end
  br i1 %tmp1, label %bb2, label %bb34

bb2:                                              ; preds = %bb
  %tmp3 = sub i64 %end, %start
  %tmp4 = sub i64 %tmp3, %len
  %tmp5 = tail call { i32, i32 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !35
  %tmp6 = extractvalue { i32, i32 } %tmp5, 0
  %tmp7 = extractvalue { i32, i32 } %tmp5, 1
  %tmp8 = icmp eq i32 %tmp6, 0
  br i1 %tmp8, label %bb9, label %get_random_int.exit

bb9:                                              ; preds = %bb2
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !36
  %tmp10 = tail call i64 asm sideeffect "add %gs:$1, $0", "=r,*m,0,~{dirflag},~{fpsr},~{flags}"(i64* @this_cpu_off, [4 x i32]* @get_random_int_hash) #3, !srcloc !37
  %tmp11 = inttoptr i64 %tmp10 to [4 x i32]*
  %tmp12 = getelementptr inbounds [4 x i32]* %tmp11, i64 0, i64 0
  %tmp13 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp14 = getelementptr inbounds %struct.task_struct* %tmp13, i64 0, i32 42
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = zext i32 %tmp15 to i64
  %tmp17 = load volatile i64* @jiffies, align 8
  %tmp18 = add i64 %tmp16, %tmp17
  %tmp19 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %tmp20 = extractvalue { i32, i32 } %tmp19, 0
  %tmp21 = zext i32 %tmp20 to i64
  %tmp22 = add i64 %tmp18, %tmp21
  %tmp23 = load i32* %tmp12, align 4
  %tmp24 = zext i32 %tmp23 to i64
  %tmp25 = add i64 %tmp22, %tmp24
  %tmp26 = trunc i64 %tmp25 to i32
  store i32 %tmp26, i32* %tmp12, align 4
  tail call void @md5_transform(i32* %tmp12, i32* getelementptr inbounds ([16 x i32]* @random_int_secret, i64 0, i64 0)) #4
  %tmp27 = load i32* %tmp12, align 4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !38
  br label %get_random_int.exit

get_random_int.exit:                              ; preds = %bb9, %bb2
  %tmp28 = phi i32 [ %tmp7, %bb2 ], [ %tmp27, %bb9 ]
  %tmp29 = zext i32 %tmp28 to i64
  %tmp30 = urem i64 %tmp29, %tmp4
  %tmp31 = add i64 %start, 4095
  %tmp32 = add i64 %tmp31, %tmp30
  %tmp33 = and i64 %tmp32, -4096
  br label %bb34

bb34:                                             ; preds = %get_random_int.exit, %bb
  %.0 = phi i64 [ %tmp33, %get_random_int.exit ], [ 0, %bb ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define void @add_hwgenerator_randomness(i8* nocapture readonly %buffer, i64 %count, i64 %entropy) #0 {
bb:
  %__wait = alloca %struct.__wait_queue, align 8
  %tmp = call i32 @_cond_resched() #4
  %tmp1 = call zeroext i1 @kthread_should_stop() #4
  br i1 %tmp1, label %bb24, label %bb2

bb2:                                              ; preds = %bb
  %tmp3 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp4 = ashr i32 %tmp3, 3
  %tmp5 = load i32* @random_write_wakeup_bits, align 4
  %tmp6 = icmp sgt i32 %tmp4, %tmp5
  br i1 %tmp6, label %bb7, label %bb24

bb7:                                              ; preds = %bb2
  %tmp8 = bitcast %struct.__wait_queue* %__wait to i8*
  call void @llvm.lifetime.start(i64 40, i8* %tmp8) #3
  %tmp9 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3
  %tmp10 = getelementptr inbounds %struct.list_head* %tmp9, i64 0, i32 0
  store %struct.list_head* %tmp9, %struct.list_head** %tmp10, align 8
  %tmp11 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3, i32 1
  store %struct.list_head* %tmp9, %struct.list_head** %tmp11, align 8
  %tmp12 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 0
  store i32 0, i32* %tmp12, align 8
  %tmp13 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_write_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %tmp14 = call zeroext i1 @kthread_should_stop() #4
  br i1 %tmp14, label %split, label %.lr.ph

.lr.ph:                                           ; preds = %bb21, %bb7
  %tmp15 = phi i64 [ %tmp22, %bb21 ], [ %tmp13, %bb7 ]
  %tmp16 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp17 = ashr i32 %tmp16, 3
  %tmp18 = load i32* @random_write_wakeup_bits, align 4
  %tmp19 = icmp sgt i32 %tmp17, %tmp18
  %tmp20 = icmp eq i64 %tmp15, 0
  %or.cond = and i1 %tmp19, %tmp20
  br i1 %or.cond, label %bb21, label %split

bb21:                                             ; preds = %.lr.ph
  call void @schedule() #4
  %tmp22 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_write_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %tmp23 = call zeroext i1 @kthread_should_stop() #4
  br i1 %tmp23, label %split, label %.lr.ph

split:                                            ; preds = %bb21, %.lr.ph, %bb7
  call void @finish_wait(%struct.__wait_queue_head* @random_write_wait, %struct.__wait_queue* %__wait) #4
  call void @llvm.lifetime.end(i64 40, i8* %tmp8) #3
  br label %bb24

bb24:                                             ; preds = %split, %bb2, %bb
  %tmp25 = trunc i64 %count to i32
  %tmp26 = load i8** getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 2), align 8
  %tmp27 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp28 = ptrtoint i8* %tmp27 to i64
  %tmp29 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp30 = icmp sgt i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %mix_pool_bytes.exit

bb31:                                             ; preds = %bb24
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp32 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %tmp33 = icmp eq %struct.tracepoint_func* %tmp32, null
  br i1 %tmp33, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb31
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp32, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb34

bb34:                                             ; preds = %bb34, %.preheader.i.i
  %tmp35 = phi i8* [ %tmp41, %bb34 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp39, %bb34 ], [ %tmp32, %.preheader.i.i ]
  %tmp36 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp37 = load i8** %tmp36, align 8
  %tmp38 = bitcast i8* %tmp35 to void (i8*, i8*, i32, i64)*
  call void %tmp38(i8* %tmp37, i8* %tmp26, i32 %tmp25, i64 %tmp28) #4
  %tmp39 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp40 = getelementptr inbounds %struct.tracepoint_func* %tmp39, i64 0, i32 0
  %tmp41 = load i8** %tmp40, align 8
  %tmp42 = icmp eq i8* %tmp41, null
  br i1 %tmp42, label %.loopexit.i.i, label %bb34

.loopexit.i.i:                                    ; preds = %bb34, %bb31
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %bb24
  %tmp43 = call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0)) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i8* %buffer, i32 %tmp25) #4
  call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 6, i32 0, i32 0), i64 %tmp43) #4
  %tmp44 = trunc i64 %entropy to i32
  call fastcc void @credit_entropy_bits(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool to %struct.entropy_store*), i32 %tmp44) #5
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

; Function Attrs: noredzone nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #0

; Function Attrs: noredzone
declare i32 @proc_dostring(%struct.ctl_table*, i32, i8*, i64*, i64*) #1

; Function Attrs: noredzone
declare void @_raw_spin_lock(%struct.raw_spinlock*) #1 section ".spinlock.text"

; Function Attrs: noredzone nounwind
define internal fastcc i64 @_random_read(i32 %nonblock, i8* %buf, i64 %nbytes) #0 {
bb:
  %__wait = alloca %struct.__wait_queue, align 8
  %tmp = icmp eq i64 %nbytes, 0
  br i1 %tmp, label %.loopexit, label %bb1

bb1:                                              ; preds = %bb
  %tmp2 = icmp ult i64 %nbytes, 512
  %tmp3 = select i1 %tmp2, i64 %nbytes, i64 512
  %tmp4 = bitcast %struct.__wait_queue* %__wait to i8*
  %tmp5 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3
  %tmp6 = getelementptr inbounds %struct.list_head* %tmp5, i64 0, i32 0
  %tmp7 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 3, i32 1
  %tmp8 = getelementptr inbounds %struct.__wait_queue* %__wait, i64 0, i32 0
  %.not = icmp ne i32 %nonblock, 0
  br label %bb9

bb9:                                              ; preds = %bb56, %bb1
  %tmp10 = call fastcc i64 @extract_entropy_user(%struct.entropy_store* bitcast ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool to %struct.entropy_store*), i8* %buf, i64 %tmp3) #5
  %tmp11 = icmp slt i64 %tmp10, 0
  br i1 %tmp11, label %.loopexit, label %bb12

bb12:                                             ; preds = %bb9
  %tmp13 = shl i64 %tmp10, 3
  %tmp14 = trunc i64 %tmp13 to i32
  %tmp15 = sub i64 %tmp3, %tmp10
  %tmp16 = shl i64 %tmp15, 3
  %tmp17 = trunc i64 %tmp16 to i32
  %tmp18 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @blocking_pool, i64 0, i32 9), align 8
  %tmp19 = ashr i32 %tmp18, 3
  %tmp20 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp21 = ashr i32 %tmp20, 3
  %tmp22 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_random_read, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp23 = icmp sgt i32 %tmp22, 0
  br i1 %tmp23, label %bb24, label %trace_random_read.exit

bb24:                                             ; preds = %bb12
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp25 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_random_read, i64 0, i32 4), align 8
  %tmp26 = icmp eq %struct.tracepoint_func* %tmp25, null
  br i1 %tmp26, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb24
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp25, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb27

bb27:                                             ; preds = %bb27, %.preheader.i
  %tmp28 = phi i8* [ %tmp34, %bb27 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp32, %bb27 ], [ %tmp25, %.preheader.i ]
  %tmp29 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp30 = load i8** %tmp29, align 8
  %tmp31 = bitcast i8* %tmp28 to void (i8*, i32, i32, i32, i32)*
  call void %tmp31(i8* %tmp30, i32 %tmp14, i32 %tmp17, i32 %tmp19, i32 %tmp21) #4
  %tmp32 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp33 = getelementptr inbounds %struct.tracepoint_func* %tmp32, i64 0, i32 0
  %tmp34 = load i8** %tmp33, align 8
  %tmp35 = icmp eq i8* %tmp34, null
  br i1 %tmp35, label %.loopexit.i, label %bb27

.loopexit.i:                                      ; preds = %bb27, %bb24
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_random_read.exit

trace_random_read.exit:                           ; preds = %.loopexit.i, %bb12
  %tmp36 = icmp sgt i64 %tmp10, 0
  %brmerge = or i1 %tmp36, %.not
  %.mux = select i1 %tmp36, i64 %tmp10, i64 -11
  br i1 %brmerge, label %.loopexit, label %bb37

bb37:                                             ; preds = %trace_random_read.exit
  %tmp38 = call i32 @_cond_resched() #4
  %tmp39 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp40 = ashr i32 %tmp39, 3
  %tmp41 = load i32* @random_read_wakeup_bits, align 4
  %tmp42 = icmp slt i32 %tmp40, %tmp41
  br i1 %tmp42, label %bb43, label %bb56

bb43:                                             ; preds = %bb37
  call void @llvm.lifetime.start(i64 40, i8* %tmp4) #3
  store %struct.list_head* %tmp5, %struct.list_head** %tmp6, align 8
  store %struct.list_head* %tmp5, %struct.list_head** %tmp7, align 8
  store i32 0, i32* %tmp8, align 8
  %tmp44 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_read_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %tmp45 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp46 = ashr i32 %tmp45, 3
  %tmp47 = load i32* @random_read_wakeup_bits, align 4
  %tmp48 = icmp slt i32 %tmp46, %tmp47
  %tmp49 = icmp eq i64 %tmp44, 0
  %or.cond2 = and i1 %tmp48, %tmp49
  br i1 %or.cond2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %bb43
  call void @schedule() #4
  %tmp50 = call i64 @prepare_to_wait_event(%struct.__wait_queue_head* @random_read_wait, %struct.__wait_queue* %__wait, i32 1) #4
  %tmp51 = load i32* getelementptr inbounds ({ %struct.poolinfo*, i32*, i8*, %struct.entropy_store*, %struct.work_struct, i64, %struct.spinlock, i16, i16, i32, i32, i8, [10 x i8], [5 x i8] }* @input_pool, i64 0, i32 9), align 8
  %tmp52 = ashr i32 %tmp51, 3
  %tmp53 = load i32* @random_read_wakeup_bits, align 4
  %tmp54 = icmp slt i32 %tmp52, %tmp53
  %tmp55 = icmp eq i64 %tmp50, 0
  %or.cond = and i1 %tmp54, %tmp55
  br i1 %or.cond, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %bb43
  call void @finish_wait(%struct.__wait_queue_head* @random_read_wait, %struct.__wait_queue* %__wait) #4
  call void @llvm.lifetime.end(i64 40, i8* %tmp4) #3
  br label %bb56

bb56:                                             ; preds = %._crit_edge, %bb37
  %tmp57 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp58 = getelementptr inbounds %struct.task_struct* %tmp57, i64 0, i32 1
  %tmp59 = load i8** %tmp58, align 8
  %tmp60 = getelementptr inbounds i8* %tmp59, i64 16
  %tmp61 = bitcast i8* %tmp60 to i64*
  %tmp62 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %tmp61, i64 2) #3, !srcloc !34
  %tmp63 = icmp eq i32 %tmp62, 0
  br i1 %tmp63, label %bb9, label %.loopexit

.loopexit:                                        ; preds = %bb56, %trace_random_read.exit, %bb9, %bb
  %.0 = phi i64 [ 0, %bb ], [ -512, %bb56 ], [ %.mux, %trace_random_read.exit ], [ %tmp10, %bb9 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @extract_entropy_user(%struct.entropy_store* %r, i8* %buf, i64 %nbytes) #0 {
bb:
  %tmp = alloca [10 x i8], align 1
  %tmp1 = icmp ugt i64 %nbytes, 256
  %tmp2 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %tmp3 = load i8** %tmp2, align 8
  %tmp4 = trunc i64 %nbytes to i32
  %tmp5 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %tmp6 = load i32* %tmp5, align 4
  %tmp7 = ashr i32 %tmp6, 3
  %tmp8 = call i8* @llvm.returnaddress(i32 0)
  %tmp9 = ptrtoint i8* %tmp8 to i64
  %tmp10 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy_user, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp11 = icmp sgt i32 %tmp10, 0
  br i1 %tmp11, label %bb12, label %trace_extract_entropy_user.exit

bb12:                                             ; preds = %bb
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp13 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_extract_entropy_user, i64 0, i32 4), align 8
  %tmp14 = icmp eq %struct.tracepoint_func* %tmp13, null
  br i1 %tmp14, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb12
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp13, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb15

bb15:                                             ; preds = %bb15, %.preheader.i
  %tmp16 = phi i8* [ %tmp22, %bb15 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp20, %bb15 ], [ %tmp13, %.preheader.i ]
  %tmp17 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp18 = load i8** %tmp17, align 8
  %tmp19 = bitcast i8* %tmp16 to void (i8*, i8*, i32, i32, i64)*
  call void %tmp19(i8* %tmp18, i8* %tmp3, i32 %tmp4, i32 %tmp7, i64 %tmp9) #4
  %tmp20 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp21 = getelementptr inbounds %struct.tracepoint_func* %tmp20, i64 0, i32 0
  %tmp22 = load i8** %tmp21, align 8
  %tmp23 = icmp eq i8* %tmp22, null
  br i1 %tmp23, label %.loopexit.i, label %bb15

.loopexit.i:                                      ; preds = %bb15, %bb12
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_extract_entropy_user.exit

trace_extract_entropy_user.exit:                  ; preds = %.loopexit.i, %bb
  %tmp24 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 3
  %tmp25 = load %struct.entropy_store** %tmp24, align 8
  %tmp26 = icmp eq %struct.entropy_store* %tmp25, null
  br i1 %tmp26, label %xfer_secondary_pool.exit, label %bb27

bb27:                                             ; preds = %trace_extract_entropy_user.exit
  %tmp28 = load i32* %tmp5, align 4
  %tmp29 = sext i32 %tmp28 to i64
  %tmp30 = shl i64 %nbytes, 6
  %tmp31 = icmp ult i64 %tmp29, %tmp30
  br i1 %tmp31, label %bb32, label %xfer_secondary_pool.exit

bb32:                                             ; preds = %bb27
  %tmp33 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %tmp34 = load %struct.poolinfo** %tmp33, align 8
  %tmp35 = getelementptr inbounds %struct.poolinfo* %tmp34, i64 0, i32 4
  %tmp36 = load i32* %tmp35, align 4
  %tmp37 = icmp sgt i32 %tmp28, %tmp36
  br i1 %tmp37, label %xfer_secondary_pool.exit, label %bb38

bb38:                                             ; preds = %bb32
  %tmp39 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %tmp40 = load i8* %tmp39, align 8
  %tmp41 = and i8 %tmp40, 2
  %tmp42 = icmp eq i8 %tmp41, 0
  %tmp43 = load i32* @random_min_urandom_seed, align 4
  %tmp44 = icmp ne i32 %tmp43, 0
  %or.cond.i = and i1 %tmp42, %tmp44
  br i1 %or.cond.i, label %bb45, label %bb54

bb45:                                             ; preds = %bb38
  %tmp46 = load volatile i64* @jiffies, align 8
  %tmp47 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 5
  %tmp48 = load i64* %tmp47, align 8
  %tmp49 = mul i32 %tmp43, 1000
  %tmp50 = sext i32 %tmp49 to i64
  %.neg5.i = sub i64 %tmp46, %tmp50
  %tmp51 = sub i64 %.neg5.i, %tmp48
  %tmp52 = icmp slt i64 %tmp51, 0
  br i1 %tmp52, label %xfer_secondary_pool.exit, label %bb53

bb53:                                             ; preds = %bb45
  store i64 %tmp46, i64* %tmp47, align 8
  br label %bb54

bb54:                                             ; preds = %bb53, %bb38
  call fastcc void @_xfer_secondary_pool(%struct.entropy_store* %r, i64 %nbytes) #4
  br label %xfer_secondary_pool.exit

xfer_secondary_pool.exit:                         ; preds = %bb54, %bb45, %bb32, %bb27, %trace_extract_entropy_user.exit
  %tmp55 = call fastcc i64 @account(%struct.entropy_store* %r, i64 %nbytes, i32 0, i32 0) #5
  %tmp56 = icmp eq i64 %tmp55, 0
  %.pre.pre = getelementptr inbounds [10 x i8]* %tmp, i64 0, i64 0
  br i1 %tmp56, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %xfer_secondary_pool.exit
  br i1 %tmp1, label %.lr.ph.us, label %.preheader

.lr.ph.us:                                        ; preds = %bb82, %.lr.ph.preheader
  %.07.us = phi i8* [ %tmp84, %bb82 ], [ %buf, %.lr.ph.preheader ]
  %.016.us = phi i64 [ %tmp83, %bb82 ], [ %tmp55, %.lr.ph.preheader ]
  %ret.05.us = phi i64 [ %tmp85, %bb82 ], [ 0, %.lr.ph.preheader ]
  %tmp57 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #3, !srcloc !39
  %tmp58 = add i64 %tmp57, -16344
  %tmp59 = inttoptr i64 %tmp58 to %struct.thread_info*
  %tmp60 = getelementptr inbounds %struct.thread_info* %tmp59, i64 0, i32 2
  %tmp61 = bitcast i32* %tmp60 to i64*
  %tmp62 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %tmp61, i64 3) #3, !srcloc !34
  %tmp63 = icmp eq i32 %tmp62, 0
  br i1 %tmp63, label %bb73, label %bb64

bb64:                                             ; preds = %.lr.ph.us
  %tmp65 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp66 = getelementptr inbounds %struct.task_struct* %tmp65, i64 0, i32 1
  %tmp67 = load i8** %tmp66, align 8
  %tmp68 = getelementptr inbounds i8* %tmp67, i64 16
  %tmp69 = bitcast i8* %tmp68 to i64*
  %tmp70 = call i32 asm sideeffect "bt $2,$1\0A\09sbb $0,$0", "=r,*m,Ir,~{dirflag},~{fpsr},~{flags}"(i64* %tmp69, i64 2) #3, !srcloc !34
  %tmp71 = icmp eq i32 %tmp70, 0
  br i1 %tmp71, label %bb72, label %.us-lcssa.us

bb72:                                             ; preds = %bb64
  call void @schedule() #4
  br label %bb73

bb73:                                             ; preds = %bb72, %.lr.ph.us
  call fastcc void @extract_buf(%struct.entropy_store* %r, i8* %.pre.pre) #5
  %tmp74 = trunc i64 %.016.us to i32
  %tmp75 = icmp slt i32 %tmp74, 10
  %sext.us = shl i64 %.016.us, 32
  %tmp76 = ashr exact i64 %sext.us, 32
  %tmp77 = select i1 %tmp75, i64 %tmp76, i64 10
  %tmp78 = icmp ugt i64 %tmp77, 10
  br i1 %tmp78, label %copy_to_user.exit.thread, label %copy_to_user.exit.us, !prof !26

copy_to_user.exit.us:                             ; preds = %bb73
  %tmp79 = trunc i64 %tmp77 to i32
  %tmp80 = call i64 @_copy_to_user(i8* %.07.us, i8* %.pre.pre, i32 %tmp79) #4
  %tmp81 = icmp eq i64 %tmp80, 0
  br i1 %tmp81, label %bb82, label %.loopexit

bb82:                                             ; preds = %copy_to_user.exit.us
  %tmp83 = sub i64 %.016.us, %tmp77
  %tmp84 = getelementptr i8* %.07.us, i64 %tmp77
  %tmp85 = add i64 %tmp77, %ret.05.us
  %tmp86 = icmp eq i64 %.016.us, %tmp77
  br i1 %tmp86, label %.loopexit, label %.lr.ph.us

.us-lcssa.us:                                     ; preds = %bb64
  %tmp87 = icmp eq i64 %ret.05.us, 0
  %.ret.0 = select i1 %tmp87, i64 -512, i64 %ret.05.us
  br label %.loopexit

.preheader:                                       ; preds = %bb96, %.lr.ph.preheader
  %.07 = phi i8* [ %tmp98, %bb96 ], [ %buf, %.lr.ph.preheader ]
  %.016 = phi i64 [ %tmp97, %bb96 ], [ %tmp55, %.lr.ph.preheader ]
  %ret.05 = phi i64 [ %tmp99, %bb96 ], [ 0, %.lr.ph.preheader ]
  call fastcc void @extract_buf(%struct.entropy_store* %r, i8* %.pre.pre) #5
  %tmp88 = trunc i64 %.016 to i32
  %tmp89 = icmp slt i32 %tmp88, 10
  %sext = shl i64 %.016, 32
  %tmp90 = ashr exact i64 %sext, 32
  %tmp91 = select i1 %tmp89, i64 %tmp90, i64 10
  %tmp92 = icmp ugt i64 %tmp91, 10
  br i1 %tmp92, label %copy_to_user.exit.thread, label %copy_to_user.exit, !prof !26

copy_to_user.exit.thread:                         ; preds = %.preheader, %bb73
  %.lcssa = phi i64 [ %tmp76, %bb73 ], [ %tmp90, %.preheader ]
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str12, i64 0, i64 0), i32 10, i64 %.lcssa) #4
  br label %.loopexit

copy_to_user.exit:                                ; preds = %.preheader
  %tmp93 = trunc i64 %tmp91 to i32
  %tmp94 = call i64 @_copy_to_user(i8* %.07, i8* %.pre.pre, i32 %tmp93) #4
  %tmp95 = icmp eq i64 %tmp94, 0
  br i1 %tmp95, label %bb96, label %.loopexit

bb96:                                             ; preds = %copy_to_user.exit
  %tmp97 = sub i64 %.016, %tmp91
  %tmp98 = getelementptr i8* %.07, i64 %tmp91
  %tmp99 = add i64 %tmp91, %ret.05
  %tmp100 = icmp eq i64 %.016, %tmp91
  br i1 %tmp100, label %.loopexit, label %.preheader

.loopexit:                                        ; preds = %bb96, %copy_to_user.exit, %copy_to_user.exit.thread, %.us-lcssa.us, %bb82, %copy_to_user.exit.us, %xfer_secondary_pool.exit
  %ret.1 = phi i64 [ %.ret.0, %.us-lcssa.us ], [ -14, %copy_to_user.exit.thread ], [ 0, %xfer_secondary_pool.exit ], [ %tmp85, %bb82 ], [ -14, %copy_to_user.exit.us ], [ %tmp99, %bb96 ], [ -14, %copy_to_user.exit ]
  call void @memzero_explicit(i8* %.pre.pre, i64 10) #4
  ret i64 %ret.1
}

; Function Attrs: noredzone nounwind
define internal void @push_to_pool(%struct.work_struct* %work) #0 {
bb:
  %tmp = getelementptr %struct.work_struct* %work, i64 -1
  %tmp1 = icmp eq %struct.work_struct* %tmp, null
  br i1 %tmp1, label %bb2, label %bb4, !prof !26

bb2:                                              ; preds = %bb
  tail call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 1006, i64 12) #3, !srcloc !40
  br label %bb3

bb3:                                              ; preds = %bb3, %bb2
  br label %bb3

bb4:                                              ; preds = %bb
  %tmp5 = bitcast %struct.work_struct* %tmp to %struct.entropy_store*
  %tmp6 = load i32* @random_read_wakeup_bits, align 4
  %tmp7 = sdiv i32 %tmp6, 8
  %tmp8 = sext i32 %tmp7 to i64
  tail call fastcc void @_xfer_secondary_pool(%struct.entropy_store* %tmp5, i64 %tmp8) #5
  %tmp9 = getelementptr inbounds %struct.work_struct* %work, i64 -1, i32 1, i32 1
  %tmp10 = load %struct.list_head** %tmp9, align 8
  %tmp11 = bitcast %struct.list_head* %tmp10 to i8*
  %tmp12 = getelementptr inbounds %struct.work_struct* %work, i64 1, i32 1, i32 1
  %tmp13 = bitcast %struct.list_head** %tmp12 to i32*
  %tmp14 = load i32* %tmp13, align 4
  %tmp15 = ashr i32 %tmp14, 3
  %tmp16 = getelementptr inbounds %struct.work_struct* %work, i64 -1, i32 2
  %tmp17 = load void (%struct.work_struct*)** %tmp16, align 8
  %tmp18 = bitcast void (%struct.work_struct*)* %tmp17 to %struct.entropy_store*
  %tmp19 = getelementptr inbounds %struct.entropy_store* %tmp18, i64 0, i32 9
  %tmp20 = load i32* %tmp19, align 4
  %tmp21 = ashr i32 %tmp20, 3
  %tmp22 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_push_to_pool, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp23 = icmp sgt i32 %tmp22, 0
  br i1 %tmp23, label %bb24, label %trace_push_to_pool.exit

bb24:                                             ; preds = %bb4
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp25 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_push_to_pool, i64 0, i32 4), align 8
  %tmp26 = icmp eq %struct.tracepoint_func* %tmp25, null
  br i1 %tmp26, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb24
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp25, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb27

bb27:                                             ; preds = %bb27, %.preheader.i
  %tmp28 = phi i8* [ %tmp34, %bb27 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp32, %bb27 ], [ %tmp25, %.preheader.i ]
  %tmp29 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp30 = load i8** %tmp29, align 8
  %tmp31 = bitcast i8* %tmp28 to void (i8*, i8*, i32, i32)*
  tail call void %tmp31(i8* %tmp30, i8* %tmp11, i32 %tmp15, i32 %tmp21) #4
  %tmp32 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp33 = getelementptr inbounds %struct.tracepoint_func* %tmp32, i64 0, i32 0
  %tmp34 = load i8** %tmp33, align 8
  %tmp35 = icmp eq i8* %tmp34, null
  br i1 %tmp35, label %.loopexit.i, label %bb27

.loopexit.i:                                      ; preds = %bb27, %bb24
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_push_to_pool.exit

trace_push_to_pool.exit:                          ; preds = %.loopexit.i, %bb4
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc void @_xfer_secondary_pool(%struct.entropy_store* %r, i64 %nbytes) #0 {
bb:
  %tmp = alloca [32 x i32], align 16
  %tmp1 = bitcast [32 x i32]* %tmp to i8*
  call void @llvm.lifetime.start(i64 128, i8* %tmp1) #3
  %tmp2 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %tmp3 = load i8* %tmp2, align 8
  %tmp4 = and i8 %tmp3, 2
  %tmp5 = icmp eq i8 %tmp4, 0
  %tmp6 = load i32* @random_read_wakeup_bits, align 4
  br i1 %tmp5, label %bb7, label %._crit_edge

bb7:                                              ; preds = %bb
  %tmp8 = sdiv i32 %tmp6, 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %bb7, %bb
  %tmp9 = phi i32 [ %tmp8, %bb7 ], [ 0, %bb ]
  %tmp10 = trunc i64 %nbytes to i32
  %tmp11 = sdiv i32 %tmp6, 8
  %tmp12 = icmp sgt i32 %tmp10, %tmp11
  %tmp13 = select i1 %tmp12, i32 %tmp10, i32 %tmp11
  %tmp14 = icmp slt i32 %tmp13, 128
  %tmp15 = select i1 %tmp14, i32 %tmp13, i32 128
  %tmp16 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %tmp17 = load i8** %tmp16, align 8
  %tmp18 = shl i32 %tmp15, 3
  %tmp19 = shl i64 %nbytes, 3
  %tmp20 = trunc i64 %tmp19 to i32
  %tmp21 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %tmp22 = load i32* %tmp21, align 4
  %tmp23 = ashr i32 %tmp22, 3
  %tmp24 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 3
  %tmp25 = load %struct.entropy_store** %tmp24, align 8
  %tmp26 = getelementptr inbounds %struct.entropy_store* %tmp25, i64 0, i32 9
  %tmp27 = load i32* %tmp26, align 4
  %tmp28 = ashr i32 %tmp27, 3
  %tmp29 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_xfer_secondary_pool, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp30 = icmp sgt i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %trace_xfer_secondary_pool.exit

bb31:                                             ; preds = %._crit_edge
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp32 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_xfer_secondary_pool, i64 0, i32 4), align 8
  %tmp33 = icmp eq %struct.tracepoint_func* %tmp32, null
  br i1 %tmp33, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb31
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp32, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb34

bb34:                                             ; preds = %bb34, %.preheader.i
  %tmp35 = phi i8* [ %tmp41, %bb34 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp39, %bb34 ], [ %tmp32, %.preheader.i ]
  %tmp36 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp37 = load i8** %tmp36, align 8
  %tmp38 = bitcast i8* %tmp35 to void (i8*, i8*, i32, i32, i32, i32)*
  tail call void %tmp38(i8* %tmp37, i8* %tmp17, i32 %tmp18, i32 %tmp20, i32 %tmp23, i32 %tmp28) #4
  %tmp39 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp40 = getelementptr inbounds %struct.tracepoint_func* %tmp39, i64 0, i32 0
  %tmp41 = load i8** %tmp40, align 8
  %tmp42 = icmp eq i8* %tmp41, null
  br i1 %tmp42, label %.loopexit.i, label %bb34

.loopexit.i:                                      ; preds = %bb34, %bb31
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_xfer_secondary_pool.exit

trace_xfer_secondary_pool.exit:                   ; preds = %.loopexit.i, %._crit_edge
  %tmp43 = load %struct.entropy_store** %tmp24, align 8
  %tmp44 = sext i32 %tmp15 to i64
  %tmp45 = load i32* @random_read_wakeup_bits, align 4
  %tmp46 = sdiv i32 %tmp45, 8
  %tmp47 = call fastcc i64 @extract_entropy(%struct.entropy_store* %tmp43, i8* %tmp1, i64 %tmp44, i32 %tmp46, i32 %tmp9) #5
  %tmp48 = trunc i64 %tmp47 to i32
  %tmp49 = load i8** %tmp16, align 8
  %tmp50 = tail call i8* @llvm.returnaddress(i32 0) #3
  %tmp51 = ptrtoint i8* %tmp50 to i64
  %tmp52 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp53 = icmp sgt i32 %tmp52, 0
  br i1 %tmp53, label %bb54, label %mix_pool_bytes.exit

bb54:                                             ; preds = %trace_xfer_secondary_pool.exit
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp55 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %tmp56 = icmp eq %struct.tracepoint_func* %tmp55, null
  br i1 %tmp56, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb54
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp55, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb57

bb57:                                             ; preds = %bb57, %.preheader.i.i
  %tmp58 = phi i8* [ %tmp64, %bb57 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp62, %bb57 ], [ %tmp55, %.preheader.i.i ]
  %tmp59 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp60 = load i8** %tmp59, align 8
  %tmp61 = bitcast i8* %tmp58 to void (i8*, i8*, i32, i64)*
  tail call void %tmp61(i8* %tmp60, i8* %tmp49, i32 %tmp48, i64 %tmp51) #4
  %tmp62 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp63 = getelementptr inbounds %struct.tracepoint_func* %tmp62, i64 0, i32 0
  %tmp64 = load i8** %tmp63, align 8
  %tmp65 = icmp eq i8* %tmp64, null
  br i1 %tmp65, label %.loopexit.i.i, label %bb57

.loopexit.i.i:                                    ; preds = %bb57, %bb54
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %trace_xfer_secondary_pool.exit
  %tmp66 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  %tmp67 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %tmp66) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %tmp1, i32 %tmp48) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %tmp66, i64 %tmp67) #4
  %tmp68 = shl i32 %tmp48, 3
  tail call fastcc void @credit_entropy_bits(%struct.entropy_store* %r, i32 %tmp68) #5
  call void @llvm.lifetime.end(i64 128, i8* %tmp1) #3
  ret void
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @account(%struct.entropy_store* %r, i64 %nbytes, i32 %min, i32 %reserved) #0 {
bb:
  %tmp = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 9
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %tmp3 = load %struct.poolinfo** %tmp2, align 8
  %tmp4 = getelementptr inbounds %struct.poolinfo* %tmp3, i64 0, i32 4
  %tmp5 = load i32* %tmp4, align 4
  %tmp6 = icmp sgt i32 %tmp1, %tmp5
  br i1 %tmp6, label %bb10, label %.preheader, !prof !26

.preheader:                                       ; preds = %bb
  %tmp7 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 11
  %tmp8 = sext i32 %min to i64
  %tmp9 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  br label %bb12

bb10:                                             ; preds = %bb
  tail call void asm sideeffect "1:\09ud2\0A.pushsection __bug_table,\22a\22\0A2:\09.long 1b - 2b, ${0:c} - 2b\0A\09.word ${1:c}, 0\0A\09.org 2b+${2:c}\0A.popsection", "i,i,i,~{dirflag},~{fpsr},~{flags}"(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 1022, i64 12) #3, !srcloc !41
  br label %bb11

bb11:                                             ; preds = %bb11, %bb10
  br label %bb11

bb12:                                             ; preds = %bb38, %.preheader
  %tmp13 = load volatile i32* %tmp, align 4
  %tmp14 = load i8* %tmp7, align 8
  %tmp15 = and i8 %tmp14, 2
  %tmp16 = icmp eq i8 %tmp15, 0
  br i1 %tmp16, label %bb25, label %bb17

bb17:                                             ; preds = %bb12
  %tmp18 = ashr i32 %tmp13, 6
  %tmp19 = sub i32 %tmp18, %reserved
  %tmp20 = icmp slt i32 %tmp19, 0
  %tmp21 = sext i32 %tmp19 to i64
  %tmp22 = select i1 %tmp20, i64 0, i64 %tmp21
  %tmp23 = icmp ugt i64 %tmp22, %nbytes
  %tmp24 = select i1 %tmp23, i64 %nbytes, i64 %tmp22
  br label %bb25

bb25:                                             ; preds = %bb17, %bb12
  %ibytes.0 = phi i64 [ %tmp24, %bb17 ], [ %nbytes, %bb12 ]
  %tmp26 = icmp ult i64 %ibytes.0, %tmp8
  %.ibytes.0 = select i1 %tmp26, i64 0, i64 %ibytes.0
  %tmp27 = icmp slt i32 %tmp13, 0
  br i1 %tmp27, label %bb28, label %bb31, !prof !26

bb28:                                             ; preds = %bb25
  %tmp29 = load i8** %tmp9, align 8
  %tmp30 = tail call i32 (i8*, ...)* @printk(i8* getelementptr inbounds ([52 x i8]* @.str13, i64 0, i64 0), i8* %tmp29, i32 %tmp13) #4
  tail call void @warn_slowpath_null(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 1042) #4
  br label %bb31

bb31:                                             ; preds = %bb28, %bb25
  %entropy_count.0 = phi i32 [ 0, %bb28 ], [ %tmp13, %bb25 ]
  %tmp32 = shl i64 %.ibytes.0, 6
  %tmp33 = sext i32 %entropy_count.0 to i64
  %tmp34 = icmp ugt i64 %tmp33, %tmp32
  br i1 %tmp34, label %bb35, label %bb38

bb35:                                             ; preds = %bb31
  %tmp36 = sub i64 %tmp33, %tmp32
  %tmp37 = trunc i64 %tmp36 to i32
  br label %bb38

bb38:                                             ; preds = %bb35, %bb31
  %entropy_count.1 = phi i32 [ %tmp37, %bb35 ], [ 0, %bb31 ]
  %tmp39 = tail call i32 asm sideeffect ".pushsection .smp_locks,\22a\22\0A.balign 4\0A.long 671f - .\0A.popsection\0A671:\0A\09lock; cmpxchgl $2,$1", "={ax},=*m,r,0,*m,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* %tmp, i32 %entropy_count.1, i32 %tmp13, i32* %tmp) #3, !srcloc !42
  %tmp40 = icmp eq i32 %tmp39, %tmp13
  br i1 %tmp40, label %bb41, label %bb12

bb41:                                             ; preds = %bb38
  %tmp42 = load i8** %tmp9, align 8
  %tmp43 = shl i64 %.ibytes.0, 3
  %tmp44 = trunc i64 %tmp43 to i32
  %tmp45 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_debit_entropy, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp46 = icmp sgt i32 %tmp45, 0
  br i1 %tmp46, label %bb47, label %trace_debit_entropy.exit

bb47:                                             ; preds = %bb41
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp48 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_debit_entropy, i64 0, i32 4), align 8
  %tmp49 = icmp eq %struct.tracepoint_func* %tmp48, null
  br i1 %tmp49, label %.loopexit.i, label %.preheader.i

.preheader.i:                                     ; preds = %bb47
  %.phi.trans.insert.i = getelementptr inbounds %struct.tracepoint_func* %tmp48, i64 0, i32 0
  %.pre.i = load i8** %.phi.trans.insert.i, align 8
  br label %bb50

bb50:                                             ; preds = %bb50, %.preheader.i
  %tmp51 = phi i8* [ %tmp57, %bb50 ], [ %.pre.i, %.preheader.i ]
  %it_func_ptr.0.i = phi %struct.tracepoint_func* [ %tmp55, %bb50 ], [ %tmp48, %.preheader.i ]
  %tmp52 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i, i64 0, i32 1
  %tmp53 = load i8** %tmp52, align 8
  %tmp54 = bitcast i8* %tmp51 to void (i8*, i8*, i32)*
  tail call void %tmp54(i8* %tmp53, i8* %tmp42, i32 %tmp44) #4
  %tmp55 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i, i64 1
  %tmp56 = getelementptr inbounds %struct.tracepoint_func* %tmp55, i64 0, i32 0
  %tmp57 = load i8** %tmp56, align 8
  %tmp58 = icmp eq i8* %tmp57, null
  br i1 %tmp58, label %.loopexit.i, label %bb50

.loopexit.i:                                      ; preds = %bb50, %bb47
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %trace_debit_entropy.exit

trace_debit_entropy.exit:                         ; preds = %.loopexit.i, %bb41
  %tmp59 = icmp eq i64 %.ibytes.0, 0
  br i1 %tmp59, label %bb66, label %bb60

bb60:                                             ; preds = %trace_debit_entropy.exit
  %tmp61 = load i32* %tmp, align 4
  %tmp62 = ashr i32 %tmp61, 3
  %tmp63 = load i32* @random_write_wakeup_bits, align 4
  %tmp64 = icmp slt i32 %tmp62, %tmp63
  br i1 %tmp64, label %bb65, label %bb66

bb65:                                             ; preds = %bb60
  tail call void @__wake_up(%struct.__wait_queue_head* @random_write_wait, i32 1, i32 1, i8* null) #4
  tail call void @kill_fasync(%struct.fasync_struct** @fasync, i32 29, i32 131074) #4
  br label %bb66

bb66:                                             ; preds = %bb65, %bb60, %trace_debit_entropy.exit
  ret i64 %.ibytes.0
}

; Function Attrs: noredzone nounwind
define internal fastcc void @extract_buf(%struct.entropy_store* %r, i8* nocapture %out) #0 {
bb:
  %hash = alloca %union.anon.70, align 8
  %workspace = alloca [16 x i32], align 16
  %tmp = bitcast [16 x i32]* %workspace to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp) #3
  %tmp1 = bitcast %union.anon.70* %hash to [5 x i32]*
  %tmp2 = bitcast %union.anon.70* %hash to i32*
  call void @sha_init(i32* %tmp2) #4
  br label %bb3

bb3:                                              ; preds = %bb7, %bb
  %indvars.iv = phi i64 [ 0, %bb ], [ %indvars.iv.next, %bb7 ]
  %tmp4 = call { i32, i64 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x48,0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !28
  %tmp5 = extractvalue { i32, i64 } %tmp4, 0
  %tmp6 = icmp eq i32 %tmp5, 0
  br i1 %tmp6, label %bb12, label %bb7

bb7:                                              ; preds = %bb3
  %tmp8 = extractvalue { i32, i64 } %tmp4, 1
  %tmp9 = getelementptr %union.anon.70* %hash, i64 0, i32 0, i64 %indvars.iv
  store i64 %tmp8, i64* %tmp9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %tmp10 = trunc i64 %indvars.iv.next to i32
  %tmp11 = icmp ult i32 %tmp10, 3
  br i1 %tmp11, label %bb3, label %bb12

bb12:                                             ; preds = %bb7, %bb3
  %tmp13 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  %tmp14 = call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %tmp13) #4
  %tmp15 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %tmp16 = load %struct.poolinfo** %tmp15, align 8
  %tmp17 = getelementptr inbounds %struct.poolinfo* %tmp16, i64 0, i32 1
  %tmp18 = load i32* %tmp17, align 4
  %tmp19 = icmp sgt i32 %tmp18, 0
  br i1 %tmp19, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %bb12
  %tmp20 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 1
  %tmp21 = getelementptr inbounds [16 x i32]* %workspace, i64 0, i64 0
  br label %bb22

bb22:                                             ; preds = %bb22, %.lr.ph
  %i.11 = phi i32 [ 0, %.lr.ph ], [ %tmp27, %bb22 ]
  %tmp23 = load i32** %tmp20, align 8
  %tmp24 = sext i32 %i.11 to i64
  %tmp25 = getelementptr i32* %tmp23, i64 %tmp24
  %tmp26 = bitcast i32* %tmp25 to i8*
  call void @sha_transform(i32* %tmp2, i8* %tmp26, i32* %tmp21) #4
  %tmp27 = add i32 %i.11, 16
  %tmp28 = load %struct.poolinfo** %tmp15, align 8
  %tmp29 = getelementptr inbounds %struct.poolinfo* %tmp28, i64 0, i32 1
  %tmp30 = load i32* %tmp29, align 4
  %tmp31 = icmp slt i32 %tmp27, %tmp30
  br i1 %tmp31, label %bb22, label %._crit_edge

._crit_edge:                                      ; preds = %bb22, %bb12
  %tmp32 = bitcast %union.anon.70* %hash to i8*
  %tmp33 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %tmp34 = load i8** %tmp33, align 8
  %tmp35 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp36 = ptrtoint i8* %tmp35 to i64
  %tmp37 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp38 = icmp sgt i32 %tmp37, 0
  br i1 %tmp38, label %bb39, label %__mix_pool_bytes.exit

bb39:                                             ; preds = %._crit_edge
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp40 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes_nolock, i64 0, i32 4), align 8
  %tmp41 = icmp eq %struct.tracepoint_func* %tmp40, null
  br i1 %tmp41, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb39
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp40, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb42

bb42:                                             ; preds = %bb42, %.preheader.i.i
  %tmp43 = phi i8* [ %tmp49, %bb42 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp47, %bb42 ], [ %tmp40, %.preheader.i.i ]
  %tmp44 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp45 = load i8** %tmp44, align 8
  %tmp46 = bitcast i8* %tmp43 to void (i8*, i8*, i32, i64)*
  call void %tmp46(i8* %tmp45, i8* %tmp34, i32 20, i64 %tmp36) #4
  %tmp47 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp48 = getelementptr inbounds %struct.tracepoint_func* %tmp47, i64 0, i32 0
  %tmp49 = load i8** %tmp48, align 8
  %tmp50 = icmp eq i8* %tmp49, null
  br i1 %tmp50, label %.loopexit.i.i, label %bb42

.loopexit.i.i:                                    ; preds = %bb42, %bb39
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %__mix_pool_bytes.exit

__mix_pool_bytes.exit:                            ; preds = %.loopexit.i.i, %._crit_edge
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %tmp32, i32 20) #4
  call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %tmp13, i64 %tmp14) #4
  call void @memzero_explicit(i8* %tmp, i64 64) #4
  %tmp51 = getelementptr [5 x i32]* %tmp1, i64 0, i64 3
  %tmp52 = load i32* %tmp51, align 4
  %tmp53 = getelementptr inbounds %union.anon.70* %hash, i64 0, i32 0, i64 0
  %tmp54 = load i64* %tmp53, align 8
  %tmp55 = trunc i64 %tmp54 to i32
  %tmp56 = xor i32 %tmp55, %tmp52
  store i32 %tmp56, i32* %tmp2, align 8
  %tmp57 = getelementptr %union.anon.70* %hash, i64 0, i32 0, i64 2
  %tmp58 = bitcast i64* %tmp57 to i32*
  %tmp59 = load i32* %tmp58, align 8
  %tmp60 = getelementptr [5 x i32]* %tmp1, i64 0, i64 1
  %tmp61 = lshr i64 %tmp54, 32
  %tmp62 = trunc i64 %tmp61 to i32
  %tmp63 = xor i32 %tmp62, %tmp59
  store i32 %tmp63, i32* %tmp60, align 4
  %tmp64 = getelementptr %union.anon.70* %hash, i64 0, i32 0, i64 1
  %tmp65 = bitcast i64* %tmp64 to i32*
  %tmp66 = load i32* %tmp65, align 8
  %tmp67 = shl i32 %tmp66, 16
  %tmp68 = lshr i32 %tmp66, 16
  %tmp69 = or i32 %tmp68, %tmp67
  %tmp70 = xor i32 %tmp69, %tmp66
  store i32 %tmp70, i32* %tmp65, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %out, i8* %tmp32, i64 10, i32 1, i1 false)
  call void @memzero_explicit(i8* %tmp32, i64 24) #4
  call void @llvm.lifetime.end(i64 64, i8* %tmp) #3
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
bb:
  %buf = alloca [16 x i32], align 16
  %tmp = bitcast [16 x i32]* %buf to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp) #3
  %tmp1 = icmp eq i64 %count, 0
  br i1 %tmp1, label %split4, label %.critedge.i.lr.ph

.critedge.i.lr.ph:                                ; preds = %bb
  %tmp2 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %tmp3 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  br label %.critedge.i

.critedge.i:                                      ; preds = %mix_pool_bytes.exit, %.critedge.i.lr.ph
  %.013 = phi i64 [ %count, %.critedge.i.lr.ph ], [ %tmp10, %mix_pool_bytes.exit ]
  %p.02 = phi i8* [ %buffer, %.critedge.i.lr.ph ], [ %tmp11, %mix_pool_bytes.exit ]
  %tmp4 = icmp ult i64 %.013, 64
  %tmp5 = select i1 %tmp4, i64 %.013, i64 64
  %tmp6 = trunc i64 %tmp5 to i32
  %tmp7 = call i64 @_copy_from_user(i8* %tmp, i8* %p.02, i32 %tmp6) #4
  %tmp8 = icmp eq i64 %tmp7, 0
  br i1 %tmp8, label %bb9, label %split4

bb9:                                              ; preds = %.critedge.i
  %tmp10 = sub i64 %.013, %tmp5
  %tmp11 = getelementptr i8* %p.02, i64 %tmp5
  %tmp12 = load i8** %tmp2, align 8
  %tmp13 = call i8* @llvm.returnaddress(i32 0) #3
  %tmp14 = ptrtoint i8* %tmp13 to i64
  %tmp15 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp16 = icmp sgt i32 %tmp15, 0
  br i1 %tmp16, label %bb17, label %mix_pool_bytes.exit

bb17:                                             ; preds = %bb9
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp18 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %tmp19 = icmp eq %struct.tracepoint_func* %tmp18, null
  br i1 %tmp19, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb17
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp18, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb20

bb20:                                             ; preds = %bb20, %.preheader.i.i
  %tmp21 = phi i8* [ %tmp27, %bb20 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp25, %bb20 ], [ %tmp18, %.preheader.i.i ]
  %tmp22 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp23 = load i8** %tmp22, align 8
  %tmp24 = bitcast i8* %tmp21 to void (i8*, i8*, i32, i64)*
  call void %tmp24(i8* %tmp23, i8* %tmp12, i32 %tmp6, i64 %tmp14) #4
  %tmp25 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp26 = getelementptr inbounds %struct.tracepoint_func* %tmp25, i64 0, i32 0
  %tmp27 = load i8** %tmp26, align 8
  %tmp28 = icmp eq i8* %tmp27, null
  br i1 %tmp28, label %.loopexit.i.i, label %bb20

.loopexit.i.i:                                    ; preds = %bb20, %bb17
  call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %bb9
  %tmp29 = call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %tmp3) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %tmp, i32 %tmp6) #4
  call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %tmp3, i64 %tmp29) #4
  %tmp30 = call i32 @_cond_resched() #4
  %tmp31 = icmp eq i64 %.013, %tmp5
  br i1 %tmp31, label %split4, label %.critedge.i

split4:                                           ; preds = %mix_pool_bytes.exit, %.critedge.i, %bb
  %.0 = phi i32 [ 0, %bb ], [ 0, %mix_pool_bytes.exit ], [ -14, %.critedge.i ]
  call void @llvm.lifetime.end(i64 64, i8* %tmp) #3
  ret i32 %.0
}

; Function Attrs: noredzone
declare i64 @_copy_from_user(i8*, i8*, i32) #1

; Function Attrs: noredzone
declare i8* @__kmalloc(i64, i32) #1

; Function Attrs: noredzone nounwind
define internal fastcc void @init_std_data(%struct.entropy_store* %r) #0 {
bb:
  %now = alloca %union.ktime, align 8
  %rv = alloca i64, align 8
  %tmp = tail call i64 @ktime_get_with_offset(i32 0) #4
  %tmp1 = getelementptr %union.ktime* %now, i64 0, i32 0
  store i64 %tmp, i64* %tmp1, align 8
  %tmp2 = load volatile i64* @jiffies, align 8
  %tmp3 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 5
  store i64 %tmp2, i64* %tmp3, align 8
  %tmp4 = bitcast %union.ktime* %now to i8*
  %tmp5 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 2
  %tmp6 = load i8** %tmp5, align 8
  %tmp7 = tail call i8* @llvm.returnaddress(i32 0) #3
  %tmp8 = ptrtoint i8* %tmp7 to i64
  %tmp9 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp10 = icmp sgt i32 %tmp9, 0
  br i1 %tmp10, label %bb11, label %mix_pool_bytes.exit

bb11:                                             ; preds = %bb
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp12 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %tmp13 = icmp eq %struct.tracepoint_func* %tmp12, null
  br i1 %tmp13, label %.loopexit.i.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb11
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.tracepoint_func* %tmp12, i64 0, i32 0
  %.pre.i.i = load i8** %.phi.trans.insert.i.i, align 8
  br label %bb14

bb14:                                             ; preds = %bb14, %.preheader.i.i
  %tmp15 = phi i8* [ %tmp21, %bb14 ], [ %.pre.i.i, %.preheader.i.i ]
  %it_func_ptr.0.i.i = phi %struct.tracepoint_func* [ %tmp19, %bb14 ], [ %tmp12, %.preheader.i.i ]
  %tmp16 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 0, i32 1
  %tmp17 = load i8** %tmp16, align 8
  %tmp18 = bitcast i8* %tmp15 to void (i8*, i8*, i32, i64)*
  tail call void %tmp18(i8* %tmp17, i8* %tmp6, i32 8, i64 %tmp8) #4
  %tmp19 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i, i64 1
  %tmp20 = getelementptr inbounds %struct.tracepoint_func* %tmp19, i64 0, i32 0
  %tmp21 = load i8** %tmp20, align 8
  %tmp22 = icmp eq i8* %tmp21, null
  br i1 %tmp22, label %.loopexit.i.i, label %bb14

.loopexit.i.i:                                    ; preds = %bb14, %bb11
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit

mix_pool_bytes.exit:                              ; preds = %.loopexit.i.i, %bb
  %tmp23 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 6, i32 0, i32 0
  %tmp24 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %tmp23) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %tmp4, i32 8) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %tmp23, i64 %tmp24) #4
  %tmp25 = getelementptr inbounds %struct.entropy_store* %r, i64 0, i32 0
  %tmp26 = load %struct.poolinfo** %tmp25, align 8
  %tmp27 = getelementptr inbounds %struct.poolinfo* %tmp26, i64 0, i32 2
  %tmp28 = load i32* %tmp27, align 4
  %tmp29 = icmp sgt i32 %tmp28, 0
  br i1 %tmp29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %mix_pool_bytes.exit
  %tmp30 = bitcast i64* %rv to i8*
  br label %bb31

bb31:                                             ; preds = %mix_pool_bytes.exit6, %.lr.ph
  %i.013 = phi i32 [ %tmp28, %.lr.ph ], [ %tmp66, %mix_pool_bytes.exit6 ]
  %tmp32 = tail call { i8, i64 } asm sideeffect "661:\0A\09movb $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 9*32+18)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09.byte 0x48,0x0f,0xc7,0xf8\0A\09setc $0\0A6641:\0A\09.popsection", "=q,={ax},i,~{dirflag},~{fpsr},~{flags}"(i32 0) #3, !srcloc !23
  %tmp33 = extractvalue { i8, i64 } %tmp32, 0
  %tmp34 = extractvalue { i8, i64 } %tmp32, 1
  store i64 %tmp34, i64* %rv, align 8
  %tmp35 = icmp eq i8 %tmp33, 0
  br i1 %tmp35, label %bb36, label %bb49

bb36:                                             ; preds = %bb31
  %tmp37 = tail call { i32, i64 } asm sideeffect "661:\0A\09movl $$0, $0\0A\09.byte 0x66,0x66,0x90,0x66,0x90\0A\0A662:\0A.pushsection .altinstructions,\22a\22\0A .long 661b - .\0A .long 6631f - .\0A .word ( 4*32+30)\0A .byte 662b-661b\0A .byte 6641f-6631f\0A.popsection\0A.pushsection .discard,\22aw\22,@progbits\0A .byte 0xff + (6641f-6631f) - (662b-661b)\0A.popsection\0A.pushsection .altinstr_replacement, \22ax\22\0A6631:\0A\09\0A1: .byte 0x48,0x0f,0xc7,0xf0\0A\09jc 2f\0A\09decl $0\0A\09jnz 1b\0A\092:\0A6641:\0A\09.popsection", "=r,={ax},i,0,~{dirflag},~{fpsr},~{flags}"(i32 0, i32 10) #3, !srcloc !28
  %tmp38 = extractvalue { i32, i64 } %tmp37, 0
  %tmp39 = extractvalue { i32, i64 } %tmp37, 1
  store i64 %tmp39, i64* %rv, align 8
  %tmp40 = icmp eq i32 %tmp38, 0
  br i1 %tmp40, label %bb41, label %bb49

bb41:                                             ; preds = %bb36
  %tmp42 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !15
  %tmp43 = extractvalue { i32, i32 } %tmp42, 0
  %tmp44 = extractvalue { i32, i32 } %tmp42, 1
  %tmp45 = zext i32 %tmp43 to i64
  %tmp46 = zext i32 %tmp44 to i64
  %tmp47 = shl nuw i64 %tmp46, 32
  %tmp48 = or i64 %tmp47, %tmp45
  store i64 %tmp48, i64* %rv, align 8
  br label %bb49

bb49:                                             ; preds = %bb41, %bb36, %bb31
  %tmp50 = load i8** %tmp5, align 8
  %tmp51 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp52 = icmp sgt i32 %tmp51, 0
  br i1 %tmp52, label %bb53, label %mix_pool_bytes.exit6

bb53:                                             ; preds = %bb49
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp54 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %tmp55 = icmp eq %struct.tracepoint_func* %tmp54, null
  br i1 %tmp55, label %.loopexit.i.i5, label %.preheader.i.i3

.preheader.i.i3:                                  ; preds = %bb53
  %.phi.trans.insert.i.i1 = getelementptr inbounds %struct.tracepoint_func* %tmp54, i64 0, i32 0
  %.pre.i.i2 = load i8** %.phi.trans.insert.i.i1, align 8
  br label %bb56

bb56:                                             ; preds = %bb56, %.preheader.i.i3
  %tmp57 = phi i8* [ %tmp63, %bb56 ], [ %.pre.i.i2, %.preheader.i.i3 ]
  %it_func_ptr.0.i.i4 = phi %struct.tracepoint_func* [ %tmp61, %bb56 ], [ %tmp54, %.preheader.i.i3 ]
  %tmp58 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i4, i64 0, i32 1
  %tmp59 = load i8** %tmp58, align 8
  %tmp60 = bitcast i8* %tmp57 to void (i8*, i8*, i32, i64)*
  tail call void %tmp60(i8* %tmp59, i8* %tmp50, i32 8, i64 %tmp8) #4
  %tmp61 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i4, i64 1
  %tmp62 = getelementptr inbounds %struct.tracepoint_func* %tmp61, i64 0, i32 0
  %tmp63 = load i8** %tmp62, align 8
  %tmp64 = icmp eq i8* %tmp63, null
  br i1 %tmp64, label %.loopexit.i.i5, label %bb56

.loopexit.i.i5:                                   ; preds = %bb56, %bb53
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit6

mix_pool_bytes.exit6:                             ; preds = %.loopexit.i.i5, %bb49
  %tmp65 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %tmp23) #4
  call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %tmp30, i32 8) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %tmp23, i64 %tmp65) #4
  %tmp66 = add i32 %i.013, -8
  %tmp67 = icmp sgt i32 %tmp66, 0
  br i1 %tmp67, label %bb31, label %._crit_edge

._crit_edge:                                      ; preds = %mix_pool_bytes.exit6, %mix_pool_bytes.exit
  %tmp68 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #3, !srcloc !33
  %tmp69 = getelementptr inbounds %struct.task_struct* %tmp68, i64 0, i32 81
  %tmp70 = load %struct.nsproxy** %tmp69, align 8
  %tmp71 = getelementptr inbounds %struct.nsproxy* %tmp70, i64 0, i32 1
  %tmp72 = load %struct.uts_namespace** %tmp71, align 8
  %tmp73 = getelementptr inbounds %struct.uts_namespace* %tmp72, i64 0, i32 1, i32 0, i64 0
  %tmp74 = load i8** %tmp5, align 8
  %tmp75 = load volatile i32* getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 1, i32 0, i32 0), align 8
  %tmp76 = icmp sgt i32 %tmp75, 0
  br i1 %tmp76, label %bb77, label %mix_pool_bytes.exit12

bb77:                                             ; preds = %._crit_edge
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !16
  %tmp78 = load volatile %struct.tracepoint_func** getelementptr inbounds (%struct.tracepoint* @__tracepoint_mix_pool_bytes, i64 0, i32 4), align 8
  %tmp79 = icmp eq %struct.tracepoint_func* %tmp78, null
  br i1 %tmp79, label %.loopexit.i.i11, label %.preheader.i.i9

.preheader.i.i9:                                  ; preds = %bb77
  %.phi.trans.insert.i.i7 = getelementptr inbounds %struct.tracepoint_func* %tmp78, i64 0, i32 0
  %.pre.i.i8 = load i8** %.phi.trans.insert.i.i7, align 8
  br label %bb80

bb80:                                             ; preds = %bb80, %.preheader.i.i9
  %tmp81 = phi i8* [ %tmp87, %bb80 ], [ %.pre.i.i8, %.preheader.i.i9 ]
  %it_func_ptr.0.i.i10 = phi %struct.tracepoint_func* [ %tmp85, %bb80 ], [ %tmp78, %.preheader.i.i9 ]
  %tmp82 = getelementptr inbounds %struct.tracepoint_func* %it_func_ptr.0.i.i10, i64 0, i32 1
  %tmp83 = load i8** %tmp82, align 8
  %tmp84 = bitcast i8* %tmp81 to void (i8*, i8*, i32, i64)*
  tail call void %tmp84(i8* %tmp83, i8* %tmp74, i32 390, i64 %tmp8) #4
  %tmp85 = getelementptr %struct.tracepoint_func* %it_func_ptr.0.i.i10, i64 1
  %tmp86 = getelementptr inbounds %struct.tracepoint_func* %tmp85, i64 0, i32 0
  %tmp87 = load i8** %tmp86, align 8
  %tmp88 = icmp eq i8* %tmp87, null
  br i1 %tmp88, label %.loopexit.i.i11, label %bb80

.loopexit.i.i11:                                  ; preds = %bb80, %bb77
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %mix_pool_bytes.exit12

mix_pool_bytes.exit12:                            ; preds = %.loopexit.i.i11, %._crit_edge
  %tmp89 = tail call i64 @_raw_spin_lock_irqsave(%struct.raw_spinlock* %tmp23) #4
  tail call fastcc void @_mix_pool_bytes(%struct.entropy_store* %r, i8* %tmp73, i32 390) #4
  tail call void @_raw_spin_unlock_irqrestore(%struct.raw_spinlock* %tmp23, i64 %tmp89) #4
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
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb26

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i32*
  %tmp8 = load i32* %tmp7, align 4
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1, i32 3
  %tmp10 = load i32* %tmp9, align 4
  %tmp11 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp12 = bitcast %struct.trace_entry* %tmp11 to i32*
  %tmp13 = load i32* %tmp12, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([68 x i8]* @.str19, i64 0, i64 0), i32 %tmp8, i32 %tmp10, i32 %tmp13) #4
  %tmp14 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = icmp eq i32 %tmp15, 0
  br i1 %tmp16, label %bb17, label %trace_handle_return.exit

bb17:                                             ; preds = %bb4
  %tmp18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp19 = load i64* %tmp18, align 8
  %tmp20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp21 = load i64* %tmp20, align 8
  %tmp22 = icmp ugt i64 %tmp19, %tmp21
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb17, %bb4
  %tmp23 = phi i1 [ true, %bb4 ], [ %tmp22, %bb17 ]
  %tmp24 = zext i1 %tmp23 to i32
  %tmp25 = xor i32 %tmp24, 1
  br label %bb26

bb26:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp25, %trace_handle_return.exit ], [ %tmp2, %bb ]
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
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb26

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i32*
  %tmp8 = load i32* %tmp7, align 4
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i32*
  %tmp11 = load i32* %tmp10, align 4
  %tmp12 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2, i32 3
  %tmp13 = load i32* %tmp12, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([86 x i8]* @.str24, i64 0, i64 0), i32 %tmp8, i32 %tmp8, i32 %tmp11, i32 %tmp13) #4
  %tmp14 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = icmp eq i32 %tmp15, 0
  br i1 %tmp16, label %bb17, label %trace_handle_return.exit

bb17:                                             ; preds = %bb4
  %tmp18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp19 = load i64* %tmp18, align 8
  %tmp20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp21 = load i64* %tmp20, align 8
  %tmp22 = icmp ugt i64 %tmp19, %tmp21
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb17, %bb4
  %tmp23 = phi i1 [ true, %bb4 ], [ %tmp22, %bb17 ]
  %tmp24 = zext i1 %tmp23 to i32
  %tmp25 = xor i32 %tmp24, 1
  br label %bb26

bb26:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp25, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_random__extract_entropy(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb30

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i8**
  %tmp8 = load i8** %tmp7, align 8
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i32*
  %tmp11 = load i32* %tmp10, align 4
  %tmp12 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2, i32 3
  %tmp13 = load i32* %tmp12, align 4
  %tmp14 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 3
  %tmp15 = bitcast %struct.trace_entry* %tmp14 to i64*
  %tmp16 = load i64* %tmp15, align 8
  %tmp17 = inttoptr i64 %tmp16 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([48 x i8]* @.str26, i64 0, i64 0), i8* %tmp8, i32 %tmp11, i32 %tmp13, i8* %tmp17) #4
  %tmp18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = icmp eq i32 %tmp19, 0
  br i1 %tmp20, label %bb21, label %trace_handle_return.exit

bb21:                                             ; preds = %bb4
  %tmp22 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp23 = load i64* %tmp22, align 8
  %tmp24 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp25 = load i64* %tmp24, align 8
  %tmp26 = icmp ugt i64 %tmp23, %tmp25
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb21, %bb4
  %tmp27 = phi i1 [ true, %bb4 ], [ %tmp26, %bb21 ]
  %tmp28 = zext i1 %tmp27 to i32
  %tmp29 = xor i32 %tmp28, 1
  br label %bb30

bb30:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp29, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_random__get_random_bytes(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb25

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i32*
  %tmp8 = load i32* %tmp7, align 4
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i64*
  %tmp11 = load i64* %tmp10, align 8
  %tmp12 = inttoptr i64 %tmp11 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([22 x i8]* @.str33, i64 0, i64 0), i32 %tmp8, i8* %tmp12) #4
  %tmp13 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp14 = load i32* %tmp13, align 4
  %tmp15 = icmp eq i32 %tmp14, 0
  br i1 %tmp15, label %bb16, label %trace_handle_return.exit

bb16:                                             ; preds = %bb4
  %tmp17 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp18 = load i64* %tmp17, align 8
  %tmp19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp20 = load i64* %tmp19, align 8
  %tmp21 = icmp ugt i64 %tmp18, %tmp20
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb16, %bb4
  %tmp22 = phi i1 [ true, %bb4 ], [ %tmp21, %bb16 ]
  %tmp23 = zext i1 %tmp22 to i32
  %tmp24 = xor i32 %tmp23, 1
  br label %bb25

bb25:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp24, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_xfer_secondary_pool(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb31

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i8**
  %tmp8 = load i8** %tmp7, align 8
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i32*
  %tmp11 = load i32* %tmp10, align 4
  %tmp12 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2, i32 3
  %tmp13 = load i32* %tmp12, align 4
  %tmp14 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 3
  %tmp15 = bitcast %struct.trace_entry* %tmp14 to i32*
  %tmp16 = load i32* %tmp15, align 4
  %tmp17 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 3, i32 3
  %tmp18 = load i32* %tmp17, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([71 x i8]* @.str34, i64 0, i64 0), i8* %tmp8, i32 %tmp11, i32 %tmp13, i32 %tmp16, i32 %tmp18) #4
  %tmp19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp20 = load i32* %tmp19, align 4
  %tmp21 = icmp eq i32 %tmp20, 0
  br i1 %tmp21, label %bb22, label %trace_handle_return.exit

bb22:                                             ; preds = %bb4
  %tmp23 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp24 = load i64* %tmp23, align 8
  %tmp25 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp26 = load i64* %tmp25, align 8
  %tmp27 = icmp ugt i64 %tmp24, %tmp26
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb22, %bb4
  %tmp28 = phi i1 [ true, %bb4 ], [ %tmp27, %bb22 ]
  %tmp29 = zext i1 %tmp28 to i32
  %tmp30 = xor i32 %tmp29, 1
  br label %bb31

bb31:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp30, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_add_disk_randomness(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb25

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i32*
  %tmp8 = load i32* %tmp7, align 4
  %tmp9 = lshr i32 %tmp8, 20
  %tmp10 = and i32 %tmp8, 1048575
  %tmp11 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1, i32 3
  %tmp12 = load i32* %tmp11, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([30 x i8]* @.str39, i64 0, i64 0), i32 %tmp9, i32 %tmp10, i32 %tmp12) #4
  %tmp13 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp14 = load i32* %tmp13, align 4
  %tmp15 = icmp eq i32 %tmp14, 0
  br i1 %tmp15, label %bb16, label %trace_handle_return.exit

bb16:                                             ; preds = %bb4
  %tmp17 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp18 = load i64* %tmp17, align 8
  %tmp19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp20 = load i64* %tmp19, align 8
  %tmp21 = icmp ugt i64 %tmp18, %tmp20
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb16, %bb4
  %tmp22 = phi i1 [ true, %bb4 ], [ %tmp21, %bb16 ]
  %tmp23 = zext i1 %tmp22 to i32
  %tmp24 = xor i32 %tmp23, 1
  br label %bb25

bb25:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp24, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_add_input_randomness(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb21

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i32*
  %tmp8 = load i32* %tmp7, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([20 x i8]* @.str43, i64 0, i64 0), i32 %tmp8) #4
  %tmp9 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp10 = load i32* %tmp9, align 4
  %tmp11 = icmp eq i32 %tmp10, 0
  br i1 %tmp11, label %bb12, label %trace_handle_return.exit

bb12:                                             ; preds = %bb4
  %tmp13 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp14 = load i64* %tmp13, align 8
  %tmp15 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp16 = load i64* %tmp15, align 8
  %tmp17 = icmp ugt i64 %tmp14, %tmp16
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb12, %bb4
  %tmp18 = phi i1 [ true, %bb4 ], [ %tmp17, %bb12 ]
  %tmp19 = zext i1 %tmp18 to i32
  %tmp20 = xor i32 %tmp19, 1
  br label %bb21

bb21:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp20, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_debit_entropy(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb24

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i8**
  %tmp8 = load i8** %tmp7, align 8
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i32*
  %tmp11 = load i32* %tmp10, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([19 x i8]* @.str44, i64 0, i64 0), i8* %tmp8, i32 %tmp11) #4
  %tmp12 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp13 = load i32* %tmp12, align 4
  %tmp14 = icmp eq i32 %tmp13, 0
  br i1 %tmp14, label %bb15, label %trace_handle_return.exit

bb15:                                             ; preds = %bb4
  %tmp16 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp17 = load i64* %tmp16, align 8
  %tmp18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp19 = load i64* %tmp18, align 8
  %tmp20 = icmp ugt i64 %tmp17, %tmp19
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb15, %bb4
  %tmp21 = phi i1 [ true, %bb4 ], [ %tmp20, %bb15 ]
  %tmp22 = zext i1 %tmp21 to i32
  %tmp23 = xor i32 %tmp22, 1
  br label %bb24

bb24:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp23, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_push_to_pool(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb26

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i8**
  %tmp8 = load i8** %tmp7, align 8
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i32*
  %tmp11 = load i32* %tmp10, align 4
  %tmp12 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2, i32 3
  %tmp13 = load i32* %tmp12, align 4
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([37 x i8]* @.str46, i64 0, i64 0), i8* %tmp8, i32 %tmp11, i32 %tmp13) #4
  %tmp14 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = icmp eq i32 %tmp15, 0
  br i1 %tmp16, label %bb17, label %trace_handle_return.exit

bb17:                                             ; preds = %bb4
  %tmp18 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp19 = load i64* %tmp18, align 8
  %tmp20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp21 = load i64* %tmp20, align 8
  %tmp22 = icmp ugt i64 %tmp19, %tmp21
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb17, %bb4
  %tmp23 = phi i1 [ true, %bb4 ], [ %tmp22, %bb17 ]
  %tmp24 = zext i1 %tmp23 to i32
  %tmp25 = xor i32 %tmp24, 1
  br label %bb26

bb26:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp25, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_credit_entropy_bits(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb33

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i8**
  %tmp8 = load i8** %tmp7, align 8
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i32*
  %tmp11 = load i32* %tmp10, align 4
  %tmp12 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2, i32 3
  %tmp13 = load i32* %tmp12, align 4
  %tmp14 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 3
  %tmp15 = bitcast %struct.trace_entry* %tmp14 to i32*
  %tmp16 = load i32* %tmp15, align 4
  %tmp17 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 4
  %tmp18 = bitcast %struct.trace_entry* %tmp17 to i64*
  %tmp19 = load i64* %tmp18, align 8
  %tmp20 = inttoptr i64 %tmp19 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([63 x i8]* @.str48, i64 0, i64 0), i8* %tmp8, i32 %tmp11, i32 %tmp13, i32 %tmp16, i8* %tmp20) #4
  %tmp21 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp22 = load i32* %tmp21, align 4
  %tmp23 = icmp eq i32 %tmp22, 0
  br i1 %tmp23, label %bb24, label %trace_handle_return.exit

bb24:                                             ; preds = %bb4
  %tmp25 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp26 = load i64* %tmp25, align 8
  %tmp27 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp28 = load i64* %tmp27, align 8
  %tmp29 = icmp ugt i64 %tmp26, %tmp28
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb24, %bb4
  %tmp30 = phi i1 [ true, %bb4 ], [ %tmp29, %bb24 ]
  %tmp31 = zext i1 %tmp30 to i32
  %tmp32 = xor i32 %tmp31, 1
  br label %bb33

bb33:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp32, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_random__mix_pool_bytes(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb28

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i8**
  %tmp8 = load i8** %tmp7, align 8
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i32*
  %tmp11 = load i32* %tmp10, align 4
  %tmp12 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 3
  %tmp13 = bitcast %struct.trace_entry* %tmp12 to i64*
  %tmp14 = load i64* %tmp13, align 8
  %tmp15 = inttoptr i64 %tmp14 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([30 x i8]* @.str51, i64 0, i64 0), i8* %tmp8, i32 %tmp11, i8* %tmp15) #4
  %tmp16 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp17 = load i32* %tmp16, align 4
  %tmp18 = icmp eq i32 %tmp17, 0
  br i1 %tmp18, label %bb19, label %trace_handle_return.exit

bb19:                                             ; preds = %bb4
  %tmp20 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp21 = load i64* %tmp20, align 8
  %tmp22 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp23 = load i64* %tmp22, align 8
  %tmp24 = icmp ugt i64 %tmp21, %tmp23
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb19, %bb4
  %tmp25 = phi i1 [ true, %bb4 ], [ %tmp24, %bb19 ]
  %tmp26 = zext i1 %tmp25 to i32
  %tmp27 = xor i32 %tmp26, 1
  br label %bb28

bb28:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp27, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

; Function Attrs: noredzone nounwind
define internal i32 @ftrace_raw_output_add_device_randomness(%struct.trace_iterator* %iter, i32 %flags, %struct.trace_event* %trace_event) #0 {
bb:
  %tmp = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 12
  %tmp1 = load %struct.trace_entry** %tmp, align 8
  %tmp2 = tail call i32 @ftrace_raw_output_prep(%struct.trace_iterator* %iter, %struct.trace_event* %trace_event) #4
  %tmp3 = icmp eq i32 %tmp2, 1
  br i1 %tmp3, label %bb4, label %bb25

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11
  %tmp6 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 1
  %tmp7 = bitcast %struct.trace_entry* %tmp6 to i32*
  %tmp8 = load i32* %tmp7, align 4
  %tmp9 = getelementptr inbounds %struct.trace_entry* %tmp1, i64 2
  %tmp10 = bitcast %struct.trace_entry* %tmp9 to i64*
  %tmp11 = load i64* %tmp10, align 8
  %tmp12 = inttoptr i64 %tmp11 to i8*
  tail call void (%struct.trace_seq*, i8*, ...)* @trace_seq_printf(%struct.trace_seq* %tmp5, i8* getelementptr inbounds ([21 x i8]* @.str53, i64 0, i64 0), i32 %tmp8, i8* %tmp12) #4
  %tmp13 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 2
  %tmp14 = load i32* %tmp13, align 4
  %tmp15 = icmp eq i32 %tmp14, 0
  br i1 %tmp15, label %bb16, label %trace_handle_return.exit

bb16:                                             ; preds = %bb4
  %tmp17 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 2
  %tmp18 = load i64* %tmp17, align 8
  %tmp19 = getelementptr inbounds %struct.trace_iterator* %iter, i64 0, i32 11, i32 1, i32 1
  %tmp20 = load i64* %tmp19, align 8
  %tmp21 = icmp ugt i64 %tmp18, %tmp20
  br label %trace_handle_return.exit

trace_handle_return.exit:                         ; preds = %bb16, %bb4
  %tmp22 = phi i1 [ true, %bb4 ], [ %tmp21, %bb16 ]
  %tmp23 = zext i1 %tmp22 to i32
  %tmp24 = xor i32 %tmp23, 1
  br label %bb25

bb25:                                             ; preds = %trace_handle_return.exit, %bb
  %.0 = phi i32 [ %tmp24, %trace_handle_return.exit ], [ %tmp2, %bb ]
  ret i32 %.0
}

attributes #0 = { alwaysinline noredzone nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
