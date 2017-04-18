; ModuleID = './read_write.o.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.module = type opaque
%struct.file = type { %union.anon, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, %struct.atomic64_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, i8*, %struct.list_head, %struct.list_head, %struct.address_space* }
%union.anon = type { %struct.callback_head }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%struct.vfsmount = type opaque
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [32 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i64, i8*, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.66 }
%struct.seqcount = type { i32 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.0, i8* }
%union.anon.0 = type { i64 }
%struct.lockref = type { %union.anon.64 }
%union.anon.64 = type { i64 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, %struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.dentry*, i1)*, [40 x i8] }
%struct.super_block = type { %struct.list_head, i32, i8, i64, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i64, i64, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, i8*, %struct.xattr_handler**, %struct.list_head, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, [32 x i8], [16 x i8], i8*, i32, i32, i32, %struct.mutex, i8*, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic64_t, i32, %struct.workqueue_struct*, %struct.hlist_head, [24 x i8], %struct.list_lru, [48 x i8], %struct.list_lru, %struct.callback_head, i32, [28 x i8] }
%struct.file_system_type = type { i8*, i32, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.lock_class_key = type {}
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, i64 (%struct.super_block*, i32, i8*, i64, i64)*, %struct.dquot** (%struct.inode*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i64 (%struct.super_block*, i32)*, i64 (%struct.super_block*, i64, i32)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.seq_file = type { i8*, i64, i64, i64, i64, i64, i64, i64, %struct.mutex, %struct.seq_operations*, i32, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.atomic_t, %struct.__wait_queue_head, %struct.super_block*, %struct.kqid, i64, i64, %struct.mem_dqblk }
%struct.__wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.kqid = type { %union.anon.54, i32 }
%union.anon.54 = type { %struct.kuid_t }
%struct.kuid_t = type { i32 }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.page = type { i64, %union.anon.5, %struct.anon.6, %union.anon.12, %union.anon.14, [8 x i8] }
%union.anon.5 = type { %struct.address_space* }
%struct.anon.6 = type { %union.anon.7, %union.anon.8 }
%union.anon.7 = type { i64 }
%union.anon.8 = type { i64 }
%union.anon.12 = type { %struct.list_head }
%union.anon.14 = type { i64 }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)* }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.if_dqinfo*)*, i32 (%struct.super_block*, i32, %struct.if_dqinfo*)*, i32 (%struct.super_block*, i64, %struct.fs_disk_quota*)*, i32 (%struct.super_block*, i64, %struct.fs_disk_quota*)*, i32 (%struct.super_block*, %struct.fs_quota_stat*)*, i32 (%struct.super_block*, i32, i32)*, i32 (%struct.super_block*, %struct.fs_quota_statv*)*, i32 (%struct.super_block*, i32)* }
%struct.if_dqinfo = type { i64, i64, i32, i32 }
%struct.fs_disk_quota = type { i8, i8, i16, i32, i64, i64, i64, i64, i64, i64, i32, i32, i16, i16, i32, i64, i64, i64, i32, i16, i16, [8 x i8] }
%struct.fs_quota_stat = type { i8, i16, i8, %struct.fs_qfilestat, %struct.fs_qfilestat, i32, i32, i32, i32, i16, i16 }
%struct.fs_qfilestat = type { i64, i64, i32 }
%struct.fs_quota_statv = type { i8, i8, i16, i32, %struct.fs_qfilestatv, %struct.fs_qfilestatv, %struct.fs_qfilestatv, i32, i32, i32, i16, i16, [8 x i64] }
%struct.fs_qfilestatv = type { i64, i64, i32, i32 }
%struct.export_operations = type opaque
%struct.rw_semaphore = type { i64, %struct.list_head, %struct.raw_spinlock, %struct.optimistic_spin_queue, %struct.task_struct* }
%struct.raw_spinlock = type { %struct.arch_spinlock }
%struct.arch_spinlock = type { %union.anon.2 }
%union.anon.2 = type { i16 }
%struct.optimistic_spin_queue = type { %struct.atomic_t }
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
%struct.pte_t = type { i64 }
%struct.pgd_t = type { i64 }
%struct.mm_rss_stat = type { [3 x %struct.atomic64_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i8*, i32, i16, %struct.mutex, i8* }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.completion = type { i32, %struct.__wait_queue_head }
%struct.kioctx_table = type opaque
%struct.uprobes_state = type {}
%struct.task_rss_stat = type { i32, [3 x i32] }
%struct.pid_link = type { %struct.hlist_node, %struct.pid* }
%struct.pid = type { %struct.atomic_t, i32, [3 x %struct.hlist_head], %struct.callback_head, [1 x %struct.upid] }
%struct.upid = type { i32, %struct.pid_namespace*, %struct.hlist_node }
%struct.pid_namespace = type { %struct.kref, [128 x %struct.pidmap], %struct.callback_head, i32, i32, %struct.task_struct*, %struct.kmem_cache*, i32, %struct.pid_namespace*, %struct.vfsmount*, %struct.dentry*, %struct.dentry*, %struct.bsd_acct_struct*, %struct.user_namespace*, %struct.work_struct, %struct.kgid_t, i32, i32, %struct.ns_common }
%struct.kref = type { %struct.atomic_t }
%struct.pidmap = type { %struct.atomic_t, i8* }
%struct.kmem_cache = type opaque
%struct.bsd_acct_struct = type opaque
%struct.user_namespace = type opaque
%struct.work_struct = type { %struct.atomic64_t, %struct.list_head, void (%struct.work_struct*)* }
%struct.kgid_t = type { i32 }
%struct.ns_common = type { %struct.atomic64_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
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
%struct.device = type { %struct.device*, %struct.device_private*, %struct.kobject, i8*, %struct.device_type*, %struct.mutex, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.dev_pm_info, %struct.dev_pm_domain*, i32, i64*, i64, i64, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.dev_archdata, %struct.device_node*, %struct.acpi_dev_node, i32, i32, %struct.spinlock, %struct.list_head, %struct.klist_node, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, i8 }
%struct.device_private = type opaque
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_uevent_env = type { [3 x i8*], [32 x i8*], i32, [2048 x i8], i32 }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)* }
%struct.sysfs_ops = type { i64 (%struct.kobject*, %struct.attribute*, i8*)*, i64 (%struct.kobject*, %struct.attribute*, i8*, i64)* }
%struct.attribute = type { i8*, i16 }
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.sock = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.19, i8*, i16, i16, i32, %struct.kernfs_iattrs* }
%union.anon.19 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_ops = type { i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i64, i8, i64 (%struct.kernfs_open_file*, i8*, i64, i64)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)* }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, i8*, %struct.mutex, i32, %struct.list_head, i8*, i64, i8, %struct.vm_operations_struct* }
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
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
%struct.wakeup_source = type { i8*, %struct.list_head, %struct.spinlock, %struct.timer_list, i64, %union.ktime, %union.ktime, %union.ktime, %union.ktime, %union.ktime, i64, i64, i64, i64, i64, i8 }
%struct.timer_list = type { %struct.list_head, i64, %struct.tvec_base*, void (i64)*, i64, i32, i32, i8*, [16 x i8] }
%struct.tvec_base = type opaque
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
%struct.iommu_group = type opaque
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.bin_attribute = type { %struct.attribute, i64, i8*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i64 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i64)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.perf_cpu_context = type { %struct.perf_event_context, %struct.perf_event_context*, i32, i32, %struct.hrtimer, %union.ktime, %struct.list_head, %struct.pmu*, %struct.perf_cgroup* }
%struct.perf_event_context = type { %struct.pmu*, i32, %struct.raw_spinlock, %struct.mutex, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i32, i32, i32, i32, %struct.atomic_t, %struct.task_struct*, i64, i64, %struct.perf_event_context*, i64, i64, i32, i32, i32, %struct.callback_head, %struct.delayed_work, i8 }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.perf_cgroup = type opaque
%struct.local64_t = type { %struct.local_t }
%struct.local_t = type { %struct.atomic64_t }
%struct.perf_event_attr = type { i32, i32, i64, %union.anon.21, i64, i64, [8 x i8], %union.anon.22, i32, %union.anon.23, %union.anon.24, i64, i64, i32, i32, i64 }
%union.anon.21 = type { i64 }
%union.anon.22 = type { i32 }
%union.anon.23 = type { i64 }
%union.anon.24 = type { i64 }
%struct.hw_perf_event = type { %union.anon.25, i32, %struct.local64_t, i64, i64, %struct.local64_t, i64, i64, i64, i64 }
%union.anon.25 = type { %struct.anon.26 }
%struct.anon.26 = type { i64, i64, i64, i64, i32, i32, i32, i32, %struct.hw_perf_event_extra, %struct.hw_perf_event_extra, %struct.event_constraint* }
%struct.hw_perf_event_extra = type { i64, i32, i32, i32 }
%struct.event_constraint = type opaque
%struct.ring_buffer = type opaque
%struct.fasync_struct = type { %struct.spinlock, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.irq_work = type { i64, %struct.llist_node, void (%struct.irq_work*)* }
%struct.perf_sample_data = type { i64, %struct.perf_raw_record*, %struct.perf_branch_stack*, i64, i64, i64, %union.perf_mem_data_src, i64, i64, %struct.anon.31, i64, i64, i64, %struct.anon.32, %struct.perf_callchain_entry*, %struct.perf_regs, %struct.pt_regs, %struct.perf_regs, i64, [56 x i8] }
%struct.perf_raw_record = type { i32, i8* }
%struct.perf_branch_stack = type { i64, [0 x %struct.perf_branch_entry] }
%struct.perf_branch_entry = type { i64, i64, [8 x i8] }
%union.perf_mem_data_src = type { i64 }
%struct.anon.31 = type { i32, i32 }
%struct.anon.32 = type { i32, i32 }
%struct.perf_callchain_entry = type { i64, [127 x i64] }
%struct.pt_regs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.perf_regs = type { i64, %struct.pt_regs* }
%struct.ftrace_event_call = type { %struct.list_head, %struct.ftrace_event_class*, %union.anon.33, %struct.trace_event, i8*, %struct.event_filter*, i8*, i8*, i32, i32, %struct.hlist_head*, i32 (%struct.ftrace_event_call*, %struct.perf_event*)* }
%struct.ftrace_event_class = type { i8*, i8*, i8*, i32 (%struct.ftrace_event_call*, i32, i8*)*, i32 (%struct.ftrace_event_call*)*, %struct.list_head* (%struct.ftrace_event_call*)*, %struct.list_head, i32 (%struct.ftrace_event_call*)* }
%union.anon.33 = type { i8* }
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
%struct.i387_fxsave_struct = type { i16, i16, i16, i16, %union.anon.34, i32, i32, [32 x i32], [64 x i32], [12 x i32], %union.anon.37 }
%union.anon.34 = type { %struct.anon.35 }
%struct.anon.35 = type { i64, i64 }
%union.anon.37 = type { [12 x i32] }
%struct.fs_struct = type opaque
%struct.files_struct = type opaque
%struct.nsproxy = type { %struct.atomic_t, %struct.uts_namespace*, %struct.ipc_namespace*, %struct.mnt_namespace*, %struct.pid_namespace*, %struct.net* }
%struct.uts_namespace = type opaque
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
%struct.seccomp = type { i32, %struct.seccomp_filter* }
%struct.seccomp_filter = type opaque
%struct.rb_root = type { %struct.rb_node* }
%struct.rt_mutex_waiter = type opaque
%struct.bio_list = type opaque
%struct.blk_plug = type opaque
%struct.reclaim_state = type opaque
%struct.io_context = type opaque
%struct.siginfo = type { i32, i32, i32, %union.anon.39 }
%union.anon.39 = type { %struct.anon.43, [80 x i8] }
%struct.anon.43 = type { i32, i32, i32, i64, i64 }
%struct.task_io_accounting = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.nodemask_t = type { [1 x i64] }
%struct.css_set = type opaque
%struct.robust_list_head = type opaque
%struct.compat_robust_list_head = type { %struct.compat_robust_list, i32, i32 }
%struct.compat_robust_list = type { i32 }
%struct.futex_pi_state = type opaque
%struct.mempolicy = type opaque
%struct.pipe_inode_info = type { %struct.mutex, %struct.__wait_queue_head, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.page*, %struct.fasync_struct*, %struct.fasync_struct*, %struct.pipe_buffer* }
%struct.pipe_buffer = type { %struct.page*, i32, i32, %struct.pipe_buf_operations*, i32, i64 }
%struct.pipe_buf_operations = type { i32, i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)* }
%struct.page_frag = type { %struct.page*, i32, i32 }
%struct.task_delay_info = type { %struct.spinlock, i32, i64, i64, i64, i32, i32, i64, i64, i32 }
%struct.atomic_t = type { i32 }
%struct.xattr_handler = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, %struct.list_head, i8*, i8*, i32, i8, %struct.list_head, %struct.block_device*, i32, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.list_head, i64, i32, %struct.mutex }
%struct.hd_struct = type opaque
%struct.gendisk = type opaque
%struct.request_queue = type opaque
%struct.backing_dev_info = type opaque
%struct.mtd_info = type opaque
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.quota_info = type { i32, %struct.mutex, %struct.mutex, [2 x %struct.inode*], [2 x %struct.mem_dqinfo], [2 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i64, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)* }
%struct.sb_writers = type { [3 x %struct.percpu_counter], %struct.__wait_queue_head, i32, %struct.__wait_queue_head }
%struct.percpu_counter = type { %struct.raw_spinlock, i64, %struct.list_head, i32* }
%struct.shrinker = type { i64 (%struct.shrinker*, %struct.shrink_control*)*, i64 (%struct.shrinker*, %struct.shrink_control*)*, i32, i64, i64, %struct.list_head, %struct.atomic64_t* }
%struct.shrink_control = type { i32, i64, i32 }
%struct.workqueue_struct = type opaque
%struct.hlist_head = type { %struct.hlist_node* }
%struct.list_lru = type { %struct.list_lru_node*, %struct.nodemask_t }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_head, i64, [32 x i8] }
%union.anon.66 = type { %struct.hlist_node }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.posix_acl*, %struct.posix_acl*, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i8*, i64, %union.anon.55, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.spinlock, i16, i32, i64, i64, %struct.mutex, i64, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.56, i64, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.file_operations*, %struct.file_lock*, %struct.address_space, %struct.list_head, %union.anon.63, i32, i32, %struct.hlist_head, i8* }
%struct.posix_acl = type opaque
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.nameidata*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, void (%struct.dentry*, %struct.nameidata*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.vfsmount*, %struct.dentry*, %struct.kstat*)*, i32 (%struct.dentry*, i8*, i8*, i64, i32)*, i64 (%struct.dentry*, i8*, i8*, i64)*, i64 (%struct.dentry*, i8*, i64)*, i32 (%struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16, i32*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, i32 (%struct.dentry*, %struct.file*, %struct.cred*)*, [40 x i8] }
%struct.nameidata = type opaque
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.file* }
%struct.kstat = type { i64, i32, i16, i32, %struct.kuid_t, %struct.kgid_t, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64 }
%struct.fiemap_extent_info = type { i32, i32, i32, %struct.fiemap_extent* }
%struct.fiemap_extent = type { i64, i64, i64, [2 x i64], i32, [3 x i32] }
%union.anon.55 = type { i32 }
%struct.timespec = type { i64, i64 }
%union.anon.56 = type { %struct.callback_head }
%struct.file_lock = type { %struct.file_lock*, %struct.hlist_node, %struct.list_head, i8*, i32, i8, i32, i32, %struct.pid*, %struct.__wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i64, i64, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.59 }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i32 (%struct.file_lock*, %struct.file_lock*)*, i64 (%struct.file_lock*)*, void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock**, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)* }
%union.anon.59 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.address_space = type { %struct.inode*, %struct.radix_tree_root, %struct.spinlock, %struct.atomic_t, %struct.rb_root, %struct.list_head, %struct.rw_semaphore, i64, i64, i64, %struct.address_space_operations*, i64, %struct.backing_dev_info*, %struct.spinlock, %struct.list_head, i8* }
%struct.radix_tree_root = type { i32, i32, %struct.radix_tree_node* }
%struct.radix_tree_node = type { i32, i32, %union.anon.61, %struct.list_head, [64 x i8*], [3 x [1 x i64]] }
%union.anon.61 = type { %struct.anon.62 }
%struct.anon.62 = type { %struct.radix_tree_node*, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i64 (%struct.address_space*, i64)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i64 (i32, %struct.kiocb*, %struct.iov_iter*, i64)*, i32 (%struct.address_space*, i64, i32, i8**, i64*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i32 (%struct.page*)*, i32 (%struct.page*, i64, i64)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i64*)*, void (%struct.file*)* }
%struct.kiocb = type { %struct.file*, %struct.kioctx*, i32 (%struct.kiocb*)*, i8*, %union.anon.57, i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }
%struct.kioctx = type opaque
%union.anon.57 = type { i8* }
%struct.eventfd_ctx = type opaque
%struct.iov_iter = type { i32, i64, i64, %union.anon.58, i64 }
%union.anon.58 = type { %struct.iovec* }
%struct.iovec = type { i8*, i64 }
%struct.swap_info_struct = type opaque
%union.anon.63 = type { %struct.pipe_inode_info* }
%struct.file_operations = type { %struct.module*, {}*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, void (%struct.file*, %struct.vm_area_struct*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (%struct.kiocb*, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)* }
%struct.spinlock = type { %union.anon.15 }
%union.anon.15 = type { %struct.raw_spinlock }
%struct.atomic64_t = type { i64 }
%struct.mutex = type { %struct.atomic_t, %struct.spinlock, %struct.list_head, %struct.task_struct*, %struct.optimistic_spin_queue }
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.rwlock_t = type { %struct.qrwlock }
%struct.qrwlock = type { %struct.atomic_t, %struct.arch_spinlock }
%struct.cred = type { %struct.atomic_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, i8, %struct.key*, %struct.key*, %struct.key*, %struct.key*, i8*, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %struct.callback_head }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.key = type { %struct.atomic_t, i32, %union.anon.1, %struct.rw_semaphore, %struct.key_user*, i8*, %union.anon.48, i64, %struct.kuid_t, %struct.kgid_t, i32, i16, i16, i64, %union.anon.49, %union.anon.51, %union.anon.52 }
%union.anon.1 = type { %struct.rb_node }
%struct.key_user = type opaque
%union.anon.48 = type { i64 }
%union.anon.49 = type { %struct.keyring_index_key }
%struct.keyring_index_key = type { %struct.key_type*, i8*, i64 }
%struct.key_type = type opaque
%union.anon.51 = type { %struct.list_head }
%union.anon.52 = type { %union.anon.53 }
%union.anon.53 = type { [2 x i8*] }
%struct.user_struct = type { %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.atomic64_t, i64, i64, %struct.key*, %struct.key*, %struct.hlist_node, %struct.kuid_t, %struct.atomic64_t }
%struct.group_info = type { %struct.atomic_t, i32, i32, [32 x %struct.kgid_t], [0 x %struct.kgid_t*] }
%struct.file_ra_state = type { i64, i32, i32, i32, i32, i64 }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.poll_table_struct = type { void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)*, i64 }
%struct.kernel_symbol = type { i64, i8* }
%struct.compat_iovec = type { i32, i32 }
%struct.thread_info = type { %struct.task_struct*, %struct.exec_domain*, i32, i32, i32, i32, %struct.mm_segment_t, %struct.restart_block, i8*, i8 }
%struct.exec_domain = type { i8*, void (i32, %struct.pt_regs*)*, i8, i8, i64*, i64*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.module*, %struct.exec_domain* }
%struct.map_segment = type opaque
%struct.mm_segment_t = type { i64 }
%struct.restart_block = type { i64 (%struct.restart_block*)*, %union.anon.67 }
%union.anon.67 = type { %struct.anon.68 }
%struct.anon.68 = type { i32*, i32, i32, i32, i64, i32* }

@generic_ro_fops = constant { %struct.module*, i64 (%struct.file*, i64, i32)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, void (%struct.file*, %struct.vm_area_struct*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (%struct.kiocb*, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)* } { %struct.module* null, i64 (%struct.file*, i64, i32)* @generic_file_llseek, i64 (%struct.file*, i8*, i64, i64*)* @new_sync_read, i64 (%struct.file*, i8*, i64, i64*)* null, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* null, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* null, i64 (%struct.kiocb*, %struct.iov_iter*)* @generic_file_read_iter, i64 (%struct.kiocb*, %struct.iov_iter*)* null, i32 (%struct.file*, %struct.dir_context*)* null, i32 (%struct.file*, %struct.poll_table_struct*)* null, i64 (%struct.file*, i32, i64)* null, i64 (%struct.file*, i32, i64)* null, i32 (%struct.file*, %struct.vm_area_struct*)* @generic_file_readonly_mmap, void (%struct.file*, %struct.vm_area_struct*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i8*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i64, i64, i32)* null, i32 (%struct.kiocb*, i32)* null, i32 (i32, %struct.file*, i32)* null, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)* null, i64 (%struct.file*, i64, i64, i64, i64)* null, i32 (i32)* null, i32 (%struct.file*, i32, %struct.file_lock*)* null, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)* null, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)* @generic_file_splice_read, i32 (%struct.file*, i64, %struct.file_lock**, i8**)* null, i64 (%struct.file*, i32, i64, i64)* null, void (%struct.seq_file*, %struct.file*)* null }, align 8
@__kstrtab_generic_ro_fops = internal constant [16 x i8] c"generic_ro_fops\00", section "__ksymtab_strings", align 1
@__ksymtab_generic_ro_fops = constant %struct.kernel_symbol { i64 ptrtoint ({ %struct.module*, i64 (%struct.file*, i64, i32)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.file*, i8*, i64, i64*)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iovec*, i64, i64)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i64 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i64 (%struct.file*, i32, i64)*, i64 (%struct.file*, i32, i64)*, i32 (%struct.file*, %struct.vm_area_struct*)*, void (%struct.file*, %struct.vm_area_struct*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (%struct.kiocb*, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.file*, %struct.page*, i32, i64, i64*, i32)*, i64 (%struct.file*, i64, i64, i64, i64)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i64 (%struct.pipe_inode_info*, %struct.file*, i64*, i64, i32)*, i64 (%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32)*, i32 (%struct.file*, i64, %struct.file_lock**, i8**)*, i64 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)* }* @generic_ro_fops to i64), i8* getelementptr inbounds ([16 x i8]* @__kstrtab_generic_ro_fops, i32 0, i32 0) }, section "___ksymtab+generic_ro_fops", align 8
@__kstrtab_vfs_setpos = internal constant [11 x i8] c"vfs_setpos\00", section "__ksymtab_strings", align 1
@__ksymtab_vfs_setpos = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i64)* @vfs_setpos to i64), i8* getelementptr inbounds ([11 x i8]* @__kstrtab_vfs_setpos, i32 0, i32 0) }, section "___ksymtab+vfs_setpos", align 8
@__kstrtab_generic_file_llseek_size = internal constant [25 x i8] c"generic_file_llseek_size\00", section "__ksymtab_strings", align 1
@__ksymtab_generic_file_llseek_size = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i32, i64, i64)* @generic_file_llseek_size to i64), i8* getelementptr inbounds ([25 x i8]* @__kstrtab_generic_file_llseek_size, i32 0, i32 0) }, section "___ksymtab+generic_file_llseek_size", align 8
@__kstrtab_generic_file_llseek = internal constant [20 x i8] c"generic_file_llseek\00", section "__ksymtab_strings", align 1
@__ksymtab_generic_file_llseek = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i32)* @generic_file_llseek to i64), i8* getelementptr inbounds ([20 x i8]* @__kstrtab_generic_file_llseek, i32 0, i32 0) }, section "___ksymtab+generic_file_llseek", align 8
@__kstrtab_fixed_size_llseek = internal constant [18 x i8] c"fixed_size_llseek\00", section "__ksymtab_strings", align 1
@__ksymtab_fixed_size_llseek = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i32, i64)* @fixed_size_llseek to i64), i8* getelementptr inbounds ([18 x i8]* @__kstrtab_fixed_size_llseek, i32 0, i32 0) }, section "___ksymtab+fixed_size_llseek", align 8
@__kstrtab_noop_llseek = internal constant [12 x i8] c"noop_llseek\00", section "__ksymtab_strings", align 1
@__ksymtab_noop_llseek = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i32)* @noop_llseek to i64), i8* getelementptr inbounds ([12 x i8]* @__kstrtab_noop_llseek, i32 0, i32 0) }, section "___ksymtab+noop_llseek", align 8
@__kstrtab_no_llseek = internal constant [10 x i8] c"no_llseek\00", section "__ksymtab_strings", align 1
@__ksymtab_no_llseek = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i32)* @no_llseek to i64), i8* getelementptr inbounds ([10 x i8]* @__kstrtab_no_llseek, i32 0, i32 0) }, section "___ksymtab+no_llseek", align 8
@__kstrtab_default_llseek = internal constant [15 x i8] c"default_llseek\00", section "__ksymtab_strings", align 1
@__ksymtab_default_llseek = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i32)* @default_llseek to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_default_llseek, i32 0, i32 0) }, section "___ksymtab+default_llseek", align 8
@__kstrtab_vfs_llseek = internal constant [11 x i8] c"vfs_llseek\00", section "__ksymtab_strings", align 1
@__ksymtab_vfs_llseek = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i64, i32)* @vfs_llseek to i64), i8* getelementptr inbounds ([11 x i8]* @__kstrtab_vfs_llseek, i32 0, i32 0) }, section "___ksymtab+vfs_llseek", align 8
@__kstrtab_do_sync_read = internal constant [13 x i8] c"do_sync_read\00", section "__ksymtab_strings", align 1
@__ksymtab_do_sync_read = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i8*, i64, i64*)* @do_sync_read to i64), i8* getelementptr inbounds ([13 x i8]* @__kstrtab_do_sync_read, i32 0, i32 0) }, section "___ksymtab+do_sync_read", align 8
@__kstrtab_new_sync_read = internal constant [14 x i8] c"new_sync_read\00", section "__ksymtab_strings", align 1
@__ksymtab_new_sync_read = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i8*, i64, i64*)* @new_sync_read to i64), i8* getelementptr inbounds ([14 x i8]* @__kstrtab_new_sync_read, i32 0, i32 0) }, section "___ksymtab+new_sync_read", align 8
@__kstrtab_vfs_read = internal constant [9 x i8] c"vfs_read\00", section "__ksymtab_strings", align 1
@__ksymtab_vfs_read = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i8*, i64, i64*)* @vfs_read to i64), i8* getelementptr inbounds ([9 x i8]* @__kstrtab_vfs_read, i32 0, i32 0) }, section "___ksymtab+vfs_read", align 8
@__kstrtab_do_sync_write = internal constant [14 x i8] c"do_sync_write\00", section "__ksymtab_strings", align 1
@__ksymtab_do_sync_write = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i8*, i64, i64*)* @do_sync_write to i64), i8* getelementptr inbounds ([14 x i8]* @__kstrtab_do_sync_write, i32 0, i32 0) }, section "___ksymtab+do_sync_write", align 8
@__kstrtab_new_sync_write = internal constant [15 x i8] c"new_sync_write\00", section "__ksymtab_strings", align 1
@__ksymtab_new_sync_write = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i8*, i64, i64*)* @new_sync_write to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab_new_sync_write, i32 0, i32 0) }, section "___ksymtab+new_sync_write", align 8
@__kstrtab___kernel_write = internal constant [15 x i8] c"__kernel_write\00", section "__ksymtab_strings", align 1
@__ksymtab___kernel_write = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i8*, i64, i64*)* @__kernel_write to i64), i8* getelementptr inbounds ([15 x i8]* @__kstrtab___kernel_write, i32 0, i32 0) }, section "___ksymtab+__kernel_write", align 8
@__kstrtab_vfs_write = internal constant [10 x i8] c"vfs_write\00", section "__ksymtab_strings", align 1
@__ksymtab_vfs_write = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, i8*, i64, i64*)* @vfs_write to i64), i8* getelementptr inbounds ([10 x i8]* @__kstrtab_vfs_write, i32 0, i32 0) }, section "___ksymtab+vfs_write", align 8
@__kstrtab_iov_shorten = internal constant [12 x i8] c"iov_shorten\00", section "__ksymtab_strings", align 1
@__ksymtab_iov_shorten = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.iovec*, i64, i64)* @iov_shorten to i64), i8* getelementptr inbounds ([12 x i8]* @__kstrtab_iov_shorten, i32 0, i32 0) }, section "___ksymtab+iov_shorten", align 8
@__kstrtab_vfs_readv = internal constant [10 x i8] c"vfs_readv\00", section "__ksymtab_strings", align 1
@__ksymtab_vfs_readv = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, %struct.iovec*, i64, i64*)* @vfs_readv to i64), i8* getelementptr inbounds ([10 x i8]* @__kstrtab_vfs_readv, i32 0, i32 0) }, section "___ksymtab+vfs_readv", align 8
@__kstrtab_vfs_writev = internal constant [11 x i8] c"vfs_writev\00", section "__ksymtab_strings", align 1
@__ksymtab_vfs_writev = constant %struct.kernel_symbol { i64 ptrtoint (i64 (%struct.file*, %struct.iovec*, i64, i64*)* @vfs_writev to i64), i8* getelementptr inbounds ([11 x i8]* @__kstrtab_vfs_writev, i32 0, i32 0) }, section "___ksymtab+vfs_writev", align 8
@.str = private unnamed_addr constant [33 x i8] c"./arch/x86/include/asm/uaccess.h\00", align 1
@.str1 = private unnamed_addr constant [38 x i8] c"Buffer overflow detected (%d < %lu)!\0A\00", align 1
@current_task = external global %struct.task_struct*
@kernel_stack = external global i64
@llvm.used = appending global [19 x i8*] [i8* bitcast (%struct.kernel_symbol* @__ksymtab_vfs_writev to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_do_sync_read to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_no_llseek to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_generic_file_llseek to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_generic_ro_fops to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_generic_file_llseek_size to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_vfs_setpos to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_vfs_readv to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_new_sync_write to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_vfs_write to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_fixed_size_llseek to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_default_llseek to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_vfs_llseek to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_do_sync_write to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_iov_shorten to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_noop_llseek to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_new_sync_read to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab_vfs_read to i8*), i8* bitcast (%struct.kernel_symbol* @__ksymtab___kernel_write to i8*)], section "llvm.metadata"

@sys_lseek = alias bitcast (i64 (i64, i64, i64)* @SyS_lseek to i64 (i32, i64, i32)*)
@compat_sys_lseek = alias bitcast (i64 (i64, i64, i64)* @compat_SyS_lseek to i64 (i32, i32, i32)*)
@sys_llseek = alias bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_llseek to i64 (i32, i64, i64, i64*, i32)*)
@sys_read = alias bitcast (i64 (i64, i64, i64)* @SyS_read to i64 (i32, i8*, i64)*)
@sys_write = alias bitcast (i64 (i64, i64, i64)* @SyS_write to i64 (i32, i8*, i64)*)
@sys_pread64 = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_pread64 to i64 (i32, i8*, i64, i64)*)
@sys_pwrite64 = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_pwrite64 to i64 (i32, i8*, i64, i64)*)
@sys_readv = alias bitcast (i64 (i64, i64, i64)* @SyS_readv to i64 (i64, %struct.iovec*, i64)*)
@sys_writev = alias bitcast (i64 (i64, i64, i64)* @SyS_writev to i64 (i64, %struct.iovec*, i64)*)
@sys_preadv = alias bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_preadv to i64 (i64, %struct.iovec*, i64, i64, i64)*)
@sys_pwritev = alias bitcast (i64 (i64, i64, i64, i64, i64)* @SyS_pwritev to i64 (i64, %struct.iovec*, i64, i64, i64)*)
@compat_sys_readv = alias bitcast (i64 (i64, i64, i64)* @compat_SyS_readv to i64 (i32, %struct.compat_iovec*, i32)*)
@compat_sys_preadv64 = alias bitcast (i64 (i64, i64, i64, i64)* @compat_SyS_preadv64 to i64 (i64, %struct.compat_iovec*, i64, i64)*)
@compat_sys_preadv = alias bitcast (i64 (i64, i64, i64, i64, i64)* @compat_SyS_preadv to i64 (i32, %struct.compat_iovec*, i32, i32, i32)*)
@compat_sys_writev = alias bitcast (i64 (i64, i64, i64)* @compat_SyS_writev to i64 (i32, %struct.compat_iovec*, i32)*)
@compat_sys_pwritev64 = alias bitcast (i64 (i64, i64, i64, i64)* @compat_SyS_pwritev64 to i64 (i64, %struct.compat_iovec*, i64, i64)*)
@compat_sys_pwritev = alias bitcast (i64 (i64, i64, i64, i64, i64)* @compat_SyS_pwritev to i64 (i32, %struct.compat_iovec*, i32, i32, i32)*)
@sys_sendfile = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_sendfile to i64 (i32, i32, i64*, i64)*)
@sys_sendfile64 = alias bitcast (i64 (i64, i64, i64, i64)* @SyS_sendfile64 to i64 (i32, i32, i64*, i64)*)
@compat_sys_sendfile = alias bitcast (i64 (i64, i64, i64, i64)* @compat_SyS_sendfile to i64 (i32, i32, i32*, i32)*)
@compat_sys_sendfile64 = alias bitcast (i64 (i64, i64, i64, i64)* @compat_SyS_sendfile64 to i64 (i32, i32, i64*, i32)*)

; Function Attrs: noredzone nounwind
define i64 @generic_file_llseek(%struct.file* %file, i64 %offset, i32 %whence) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 18
  %2 = load %struct.address_space** %1, align 8
  %3 = getelementptr inbounds %struct.address_space* %2, i64 0, i32 0
  %4 = load %struct.inode** %3, align 8
  %5 = getelementptr inbounds %struct.inode* %4, i64 0, i32 8
  %6 = load %struct.super_block** %5, align 8
  %7 = getelementptr inbounds %struct.super_block* %6, i64 0, i32 4
  %8 = load i64* %7, align 8
  %9 = getelementptr inbounds %struct.inode* %4, i64 0, i32 14
  %10 = load i64* %9, align 8
  %11 = tail call i64 @generic_file_llseek_size(%struct.file* %file, i64 %offset, i32 %whence, i64 %8, i64 %10) #6
  ret i64 %11
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @new_sync_read(%struct.file* %filp, i8* %buf, i64 %len, i64* nocapture %ppos) #0 {
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 8
  %kiocb = alloca %struct.kiocb, align 8
  %iter = alloca %struct.iov_iter, align 8
  %1 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 0
  store i8* %buf, i8** %1, align 8
  %2 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 1
  store i64 %len, i64* %2, align 8
  %3 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 88, i8* %3) #4
  %4 = bitcast %struct.iov_iter* %iter to i8*
  call void @llvm.lifetime.start(i64 40, i8* %4) #4
  %5 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %5)
  %6 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %6)
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 48, i32 8, i1 false)
  %7 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %8 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 0
  store %struct.file* %filp, %struct.file** %8, align 8
  %9 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 1
  %10 = bitcast %struct.kioctx** %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %5, i64 24, i32 8, i1 false) #4
  %11 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %7 to i8*
  store i8* %.c.i, i8** %11, align 8
  %12 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 5
  %13 = bitcast i64* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %6, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %5)
  call void @llvm.lifetime.end(i64 48, i8* %6)
  %14 = load i64* %ppos, align 8
  %15 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 6
  store i64 %14, i64* %15, align 8
  %16 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 7
  store i64 %len, i64* %16, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter, i32 0, %struct.iovec* %iov, i64 1, i64 %len) #7
  %17 = getelementptr inbounds %struct.file* %filp, i64 0, i32 3
  %18 = load %struct.file_operations** %17, align 8
  %19 = getelementptr inbounds %struct.file_operations* %18, i64 0, i32 6
  %20 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %19, align 8
  %21 = call i64 %20(%struct.kiocb* %kiocb, %struct.iov_iter* %iter) #7
  %22 = icmp eq i64 %21, -529
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %0
  %24 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #7
  br label %25

; <label>:25                                      ; preds = %23, %0
  %ret.0 = phi i64 [ %24, %23 ], [ %21, %0 ]
  %26 = load i64* %15, align 8
  store i64 %26, i64* %ppos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %4) #4
  call void @llvm.lifetime.end(i64 88, i8* %3) #4
  ret i64 %ret.0
}

; Function Attrs: noredzone
declare i64 @generic_file_read_iter(%struct.kiocb*, %struct.iov_iter*) #1

; Function Attrs: noredzone
declare i32 @generic_file_readonly_mmap(%struct.file*, %struct.vm_area_struct*) #1

; Function Attrs: noredzone
declare i64 @generic_file_splice_read(%struct.file*, i64*, %struct.pipe_inode_info*, i64, i32) #1

; Function Attrs: noredzone nounwind
define i64 @vfs_setpos(%struct.file* nocapture %file, i64 %offset, i64 %maxsize) #0 {
  %1 = icmp slt i64 %offset, 0
  br i1 %1, label %2, label %8

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 8192
  %6 = icmp eq i32 %5, 0
  %7 = icmp sgt i64 %offset, %maxsize
  %or.cond = or i1 %6, %7
  br i1 %or.cond, label %15, label %9

; <label>:8                                       ; preds = %0
  %.old = icmp sgt i64 %offset, %maxsize
  br i1 %.old, label %15, label %9

; <label>:9                                       ; preds = %8, %2
  %10 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %11 = load i64* %10, align 8
  %12 = icmp eq i64 %11, %offset
  br i1 %12, label %15, label %13

; <label>:13                                      ; preds = %9
  store i64 %offset, i64* %10, align 8
  %14 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %14, align 8
  br label %15

; <label>:15                                      ; preds = %13, %9, %8, %2
  %.0 = phi i64 [ -22, %2 ], [ -22, %8 ], [ %offset, %9 ], [ %offset, %13 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define i64 @generic_file_llseek_size(%struct.file* %file, i64 %offset, i32 %whence, i64 %maxsize, i64 %eof) #0 {
  switch i32 %whence, label %31 [
    i32 2, label %1
    i32 1, label %3
    i32 3, label %27
    i32 4, label %29
  ]

; <label>:1                                       ; preds = %0
  %2 = add i64 %eof, %offset
  br label %31

; <label>:3                                       ; preds = %0
  %4 = icmp eq i64 %offset, 0
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %3
  %6 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %7 = load i64* %6, align 8
  br label %vfs_setpos.exit5

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds %struct.file* %file, i64 0, i32 4
  %10 = getelementptr inbounds %struct.spinlock* %9, i64 0, i32 0, i32 0
  tail call void @_raw_spin_lock(%struct.raw_spinlock* %10) #7
  %11 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %12 = load i64* %11, align 8
  %13 = add i64 %12, %offset
  %14 = icmp slt i64 %13, 0
  br i1 %14, label %15, label %21

; <label>:15                                      ; preds = %8
  %16 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %17 = load i32* %16, align 4
  %18 = and i32 %17, 8192
  %19 = icmp eq i32 %18, 0
  %20 = icmp sgt i64 %13, %maxsize
  %or.cond.i = or i1 %19, %20
  br i1 %or.cond.i, label %vfs_setpos.exit, label %22

; <label>:21                                      ; preds = %8
  %.old.i = icmp sgt i64 %13, %maxsize
  br i1 %.old.i, label %vfs_setpos.exit, label %22

; <label>:22                                      ; preds = %21, %15
  %23 = icmp eq i64 %offset, 0
  br i1 %23, label %vfs_setpos.exit, label %24

; <label>:24                                      ; preds = %22
  store i64 %13, i64* %11, align 8
  %25 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %25, align 8
  br label %vfs_setpos.exit

vfs_setpos.exit:                                  ; preds = %24, %22, %21, %15
  %.0.i = phi i64 [ -22, %15 ], [ -22, %21 ], [ %12, %22 ], [ %13, %24 ]
  %26 = bitcast %struct.spinlock* %9 to i8*
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* %26, i8 1, i8* %26) #4, !srcloc !2
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  br label %vfs_setpos.exit5

; <label>:27                                      ; preds = %0
  %28 = icmp slt i64 %offset, %eof
  br i1 %28, label %31, label %vfs_setpos.exit5

; <label>:29                                      ; preds = %0
  %30 = icmp slt i64 %offset, %eof
  br i1 %30, label %31, label %vfs_setpos.exit5

; <label>:31                                      ; preds = %29, %27, %1, %0
  %.01 = phi i64 [ %offset, %0 ], [ %offset, %27 ], [ %2, %1 ], [ %eof, %29 ]
  %32 = icmp slt i64 %.01, 0
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %31
  %34 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %35 = load i32* %34, align 4
  %36 = and i32 %35, 8192
  %37 = icmp eq i32 %36, 0
  %38 = icmp sgt i64 %.01, %maxsize
  %or.cond.i2 = or i1 %37, %38
  br i1 %or.cond.i2, label %vfs_setpos.exit5, label %40

; <label>:39                                      ; preds = %31
  %.old.i3 = icmp sgt i64 %.01, %maxsize
  br i1 %.old.i3, label %vfs_setpos.exit5, label %40

; <label>:40                                      ; preds = %39, %33
  %41 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %42 = load i64* %41, align 8
  %43 = icmp eq i64 %42, %.01
  br i1 %43, label %vfs_setpos.exit5, label %44

; <label>:44                                      ; preds = %40
  store i64 %.01, i64* %41, align 8
  %45 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %45, align 8
  br label %vfs_setpos.exit5

vfs_setpos.exit5:                                 ; preds = %44, %40, %39, %33, %29, %27, %vfs_setpos.exit, %5
  %.0 = phi i64 [ %7, %5 ], [ %.0.i, %vfs_setpos.exit ], [ -6, %27 ], [ -6, %29 ], [ -22, %33 ], [ -22, %39 ], [ %.01, %40 ], [ %.01, %44 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define i64 @fixed_size_llseek(%struct.file* %file, i64 %offset, i32 %whence, i64 %size) #0 {
  %switch = icmp ult i32 %whence, 3
  br i1 %switch, label %1, label %3

; <label>:1                                       ; preds = %0
  %2 = tail call i64 @generic_file_llseek_size(%struct.file* %file, i64 %offset, i32 %whence, i64 %size, i64 %size) #6
  br label %3

; <label>:3                                       ; preds = %1, %0
  %.0 = phi i64 [ %2, %1 ], [ -22, %0 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind readonly
define i64 @noop_llseek(%struct.file* nocapture readonly %file, i64 %offset, i32 %whence) #2 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %2 = load i64* %1, align 8
  ret i64 %2
}

; Function Attrs: noredzone nounwind readnone
define i64 @no_llseek(%struct.file* nocapture readnone %file, i64 %offset, i32 %whence) #3 {
  ret i64 -29
}

; Function Attrs: noredzone nounwind
define i64 @default_llseek(%struct.file* nocapture %file, i64 %offset, i32 %whence) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %2 = load %struct.inode** %1, align 8
  %3 = getelementptr inbounds %struct.inode* %2, i64 0, i32 23
  tail call void @mutex_lock(%struct.mutex* %3) #7
  switch i32 %whence, label %22 [
    i32 2, label %4
    i32 1, label %8
    i32 3, label %14
    i32 4, label %18
  ]

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.inode* %2, i64 0, i32 14
  %6 = load i64* %5, align 8
  %7 = add i64 %6, %offset
  br label %22

; <label>:8                                       ; preds = %0
  %9 = icmp eq i64 %offset, 0
  %10 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %11 = load i64* %10, align 8
  br i1 %9, label %35, label %12

; <label>:12                                      ; preds = %8
  %13 = add i64 %11, %offset
  br label %22

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.inode* %2, i64 0, i32 14
  %16 = load i64* %15, align 8
  %17 = icmp sgt i64 %16, %offset
  br i1 %17, label %22, label %35

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds %struct.inode* %2, i64 0, i32 14
  %20 = load i64* %19, align 8
  %21 = icmp sgt i64 %20, %offset
  br i1 %21, label %22, label %35

; <label>:22                                      ; preds = %18, %14, %12, %4, %0
  %.0 = phi i64 [ %offset, %0 ], [ %offset, %14 ], [ %13, %12 ], [ %7, %4 ], [ %20, %18 ]
  %23 = icmp sgt i64 %.0, -1
  br i1 %23, label %29, label %24

; <label>:24                                      ; preds = %22
  %25 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %26 = load i32* %25, align 4
  %27 = and i32 %26, 8192
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %35, label %29

; <label>:29                                      ; preds = %24, %22
  %30 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %31 = load i64* %30, align 8
  %32 = icmp eq i64 %.0, %31
  br i1 %32, label %35, label %33

; <label>:33                                      ; preds = %29
  store i64 %.0, i64* %30, align 8
  %34 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %34, align 8
  br label %35

; <label>:35                                      ; preds = %33, %29, %24, %18, %14, %8
  %retval.0 = phi i64 [ -22, %24 ], [ %11, %8 ], [ -6, %14 ], [ -6, %18 ], [ %.0, %29 ], [ %.0, %33 ]
  tail call void @mutex_unlock(%struct.mutex* %3) #7
  ret i64 %retval.0
}

; Function Attrs: noredzone
declare void @mutex_lock(%struct.mutex*) #1

; Function Attrs: noredzone
declare void @mutex_unlock(%struct.mutex*) #1

; Function Attrs: noredzone nounwind
define i64 @vfs_llseek(%struct.file* %file, i64 %offset, i32 %whence) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %13, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %7 = load %struct.file_operations** %6, align 8
  %8 = getelementptr inbounds %struct.file_operations* %7, i64 0, i32 1
  %9 = load {}** %8, align 8
  %10 = icmp eq {}* %9, null
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %5
  %12 = bitcast {}* %9 to i64 (%struct.file*, i64, i32)*
  br label %13

; <label>:13                                      ; preds = %11, %5, %0
  %fn.0 = phi i64 (%struct.file*, i64, i32)* [ %12, %11 ], [ @no_llseek, %5 ], [ @no_llseek, %0 ]
  %14 = tail call i64 %fn.0(%struct.file* %file, i64 %offset, i32 %whence) #7
  ret i64 %14
}

; Function Attrs: noredzone nounwind
define i64 @SyS_lseek(i64 %fd, i64 %offset, i64 %whence) #0 {
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %whence to i32
  %3 = tail call i64 @__fdget_pos(i32 %1) #7
  %4 = and i64 %3, -4
  %5 = inttoptr i64 %4 to %struct.file*
  %v.tr.i.i.i = trunc i64 %3 to i32
  %6 = icmp eq i64 %4, 0
  br i1 %6, label %SYSC_lseek.exit, label %7

; <label>:7                                       ; preds = %0
  %8 = icmp ult i32 %2, 5
  br i1 %8, label %9, label %23

; <label>:9                                       ; preds = %7
  %10 = getelementptr inbounds %struct.file* %5, i64 0, i32 7
  %11 = load i32* %10, align 4
  %12 = and i32 %11, 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %vfs_llseek.exit.i, label %14

; <label>:14                                      ; preds = %9
  %15 = getelementptr inbounds %struct.file* %5, i64 0, i32 3
  %16 = load %struct.file_operations** %15, align 8
  %17 = getelementptr inbounds %struct.file_operations* %16, i64 0, i32 1
  %18 = load {}** %17, align 8
  %19 = icmp eq {}* %18, null
  br i1 %19, label %vfs_llseek.exit.i, label %20

; <label>:20                                      ; preds = %14
  %21 = bitcast {}* %18 to i64 (%struct.file*, i64, i32)*
  br label %vfs_llseek.exit.i

vfs_llseek.exit.i:                                ; preds = %20, %14, %9
  %fn.0.i.i = phi i64 (%struct.file*, i64, i32)* [ %21, %20 ], [ @no_llseek, %14 ], [ @no_llseek, %9 ]
  %22 = tail call i64 %fn.0.i.i(%struct.file* %5, i64 %offset, i32 %2) #7
  br label %23

; <label>:23                                      ; preds = %vfs_llseek.exit.i, %7
  %retval.0.i = phi i64 [ %22, %vfs_llseek.exit.i ], [ -22, %7 ]
  %24 = and i32 %v.tr.i.i.i, 2
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %23
  %27 = getelementptr inbounds %struct.file* %5, i64 0, i32 8
  tail call void @mutex_unlock(%struct.mutex* %27) #7
  br label %28

; <label>:28                                      ; preds = %26, %23
  %29 = and i32 %v.tr.i.i.i, 1
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %SYSC_lseek.exit, label %31

; <label>:31                                      ; preds = %28
  tail call void @fput(%struct.file* %5) #7
  br label %SYSC_lseek.exit

SYSC_lseek.exit:                                  ; preds = %31, %28, %0
  %.0.i = phi i64 [ -9, %0 ], [ %retval.0.i, %28 ], [ %retval.0.i, %31 ]
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_lseek(i64 %fd, i64 %offset, i64 %whence) #0 {
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %whence to i32
  %sext = shl i64 %offset, 32
  %3 = ashr exact i64 %sext, 32
  %4 = tail call i64 bitcast (i64 (i64, i64, i64)* @SyS_lseek to i64 (i32, i64, i32)*)(i32 %1, i64 %3, i32 %2) #7
  ret i64 %4
}

; Function Attrs: noredzone nounwind
define i64 @SyS_llseek(i64 %fd, i64 %offset_high, i64 %offset_low, i64 %result, i64 %whence) #0 {
  %offset.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %whence to i32
  %3 = bitcast i64* %offset.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  %4 = call i64 @__fdget_pos(i32 %1) #7
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i = trunc i64 %4 to i32
  %7 = icmp eq i64 %5, 0
  br i1 %7, label %SYSC_llseek.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = icmp ugt i32 %2, 4
  br i1 %9, label %29, label %10

; <label>:10                                      ; preds = %8
  %11 = shl i64 %offset_high, 32
  %12 = or i64 %11, %offset_low
  %13 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %14 = load i32* %13, align 4
  %15 = and i32 %14, 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %vfs_llseek.exit.i, label %17

; <label>:17                                      ; preds = %10
  %18 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %19 = load %struct.file_operations** %18, align 8
  %20 = getelementptr inbounds %struct.file_operations* %19, i64 0, i32 1
  %21 = load {}** %20, align 8
  %22 = icmp eq {}* %21, null
  br i1 %22, label %vfs_llseek.exit.i, label %23

; <label>:23                                      ; preds = %17
  %24 = bitcast {}* %21 to i64 (%struct.file*, i64, i32)*
  br label %vfs_llseek.exit.i

vfs_llseek.exit.i:                                ; preds = %23, %17, %10
  %fn.0.i.i = phi i64 (%struct.file*, i64, i32)* [ %24, %23 ], [ @no_llseek, %17 ], [ @no_llseek, %10 ]
  %25 = call i64 %fn.0.i.i(%struct.file* %6, i64 %12, i32 %2) #7
  store i64 %25, i64* %offset.i, align 8
  %26 = icmp sgt i64 %25, -1
  br i1 %26, label %.critedge.i.i, label %29

.critedge.i.i:                                    ; preds = %vfs_llseek.exit.i
  %27 = inttoptr i64 %result to i8*
  %28 = call i64 @_copy_to_user(i8* %27, i8* %3, i32 8) #7
  %phitmp.i = icmp eq i64 %28, 0
  %phitmp1.i = select i1 %phitmp.i, i64 0, i64 -14
  br label %29

; <label>:29                                      ; preds = %.critedge.i.i, %vfs_llseek.exit.i, %8
  %retval.0.i = phi i64 [ -22, %8 ], [ %25, %vfs_llseek.exit.i ], [ %phitmp1.i, %.critedge.i.i ]
  %30 = and i32 %v.tr.i.i.i, 2
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %29
  %33 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %33) #7
  br label %34

; <label>:34                                      ; preds = %32, %29
  %35 = and i32 %v.tr.i.i.i, 1
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %fdput_pos.exit.i, label %37

; <label>:37                                      ; preds = %34
  call void @fput(%struct.file* %6) #7
  br label %fdput_pos.exit.i

fdput_pos.exit.i:                                 ; preds = %37, %34
  %sext.i = shl i64 %retval.0.i, 32
  %38 = ashr exact i64 %sext.i, 32
  br label %SYSC_llseek.exit

SYSC_llseek.exit:                                 ; preds = %fdput_pos.exit.i, %0
  %.0.i = phi i64 [ %38, %fdput_pos.exit.i ], [ -9, %0 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i32 @rw_verify_area(i32 %read_write, %struct.file* %file, i64* nocapture readonly %ppos, i64 %count) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %2 = load %struct.inode** %1, align 8
  %3 = icmp slt i64 %count, 0
  br i1 %3, label %51, label %4, !prof !4

; <label>:4                                       ; preds = %0
  %5 = load i64* %ppos, align 8
  %6 = icmp slt i64 %5, 0
  br i1 %6, label %7, label %15, !prof !4

; <label>:7                                       ; preds = %4
  %8 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %9 = load i32* %8, align 4
  %10 = and i32 %9, 8192
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %51, label %12

; <label>:12                                      ; preds = %7
  %13 = sub i64 0, %5
  %14 = icmp ult i64 %count, %13
  br i1 %14, label %23, label %51

; <label>:15                                      ; preds = %4
  %16 = add i64 %5, %count
  %17 = icmp slt i64 %16, 0
  br i1 %17, label %18, label %23, !prof !4

; <label>:18                                      ; preds = %15
  %19 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %20 = load i32* %19, align 4
  %21 = and i32 %20, 8192
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %51, label %23

; <label>:23                                      ; preds = %18, %15, %12
  %24 = getelementptr inbounds %struct.inode* %2, i64 0, i32 35
  %25 = load %struct.file_lock** %24, align 8
  %26 = icmp eq %struct.file_lock* %25, null
  br i1 %26, label %.critedge, label %27

; <label>:27                                      ; preds = %23
  %28 = getelementptr inbounds %struct.inode* %2, i64 0, i32 8
  %29 = load %struct.super_block** %28, align 8
  %30 = getelementptr inbounds %struct.super_block* %29, i64 0, i32 10
  %31 = load i64* %30, align 8
  %32 = and i64 %31, 64
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %.critedge, label %mandatory_lock.exit

mandatory_lock.exit:                              ; preds = %27
  %34 = getelementptr inbounds %struct.inode* %2, i64 0, i32 0
  %35 = load i16* %34, align 2
  %36 = and i16 %35, 1032
  %37 = icmp eq i16 %36, 1024
  br i1 %37, label %38, label %.critedge, !prof !4

; <label>:38                                      ; preds = %mandatory_lock.exit
  %39 = icmp eq i32 %read_write, 0
  %40 = select i1 %39, i32 1, i32 2
  %41 = tail call i32 @locks_mandatory_area(i32 %40, %struct.inode* %2, %struct.file* %file, i64 %5, i64 %count) #7
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %51, label %.critedge

.critedge:                                        ; preds = %38, %mandatory_lock.exit, %27, %23
  %43 = icmp eq i32 %read_write, 0
  %44 = select i1 %43, i32 4, i32 2
  %45 = tail call i32 @security_file_permission(%struct.file* %file, i32 %44) #7
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %51

; <label>:47                                      ; preds = %.critedge
  %48 = icmp ugt i64 %count, 2147479552
  %49 = trunc i64 %count to i32
  %50 = select i1 %48, i32 2147479552, i32 %49
  br label %51

; <label>:51                                      ; preds = %47, %.critedge, %38, %18, %12, %7, %0
  %.0 = phi i32 [ %50, %47 ], [ -22, %0 ], [ -22, %7 ], [ -75, %12 ], [ -22, %18 ], [ %41, %38 ], [ %45, %.critedge ]
  ret i32 %.0
}

; Function Attrs: noredzone
declare i32 @locks_mandatory_area(i32, %struct.inode*, %struct.file*, i64, i64) #1

; Function Attrs: noredzone
declare i32 @security_file_permission(%struct.file*, i32) #1

; Function Attrs: alwaysinline noredzone nounwind
define i64 @do_sync_read(%struct.file* %filp, i8* %buf, i64 %len, i64* nocapture %ppos) #0 {
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 8
  %kiocb = alloca %struct.kiocb, align 8
  %1 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 0
  store i8* %buf, i8** %1, align 8
  %2 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 1
  store i64 %len, i64* %2, align 8
  %3 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 88, i8* %3) #4
  %4 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %4)
  %5 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %5)
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 48, i32 8, i1 false)
  %6 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %7 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 0
  store %struct.file* %filp, %struct.file** %7, align 8
  %8 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 1
  %9 = bitcast %struct.kioctx** %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %4, i64 24, i32 8, i1 false) #4
  %10 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %6 to i8*
  store i8* %.c.i, i8** %10, align 8
  %11 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 5
  %12 = bitcast i64* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %5, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %4)
  call void @llvm.lifetime.end(i64 48, i8* %5)
  %13 = load i64* %ppos, align 8
  %14 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 6
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 7
  store i64 %len, i64* %15, align 8
  %16 = getelementptr inbounds %struct.file* %filp, i64 0, i32 3
  %17 = load %struct.file_operations** %16, align 8
  %18 = getelementptr inbounds %struct.file_operations* %17, i64 0, i32 4
  %19 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %18, align 8
  %20 = call i64 %19(%struct.kiocb* %kiocb, %struct.iovec* %iov, i64 1, i64 %13) #7
  %21 = icmp eq i64 %20, -529
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %0
  %23 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #7
  br label %24

; <label>:24                                      ; preds = %22, %0
  %ret.0 = phi i64 [ %23, %22 ], [ %20, %0 ]
  %25 = load i64* %14, align 8
  store i64 %25, i64* %ppos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %3) #4
  ret i64 %ret.0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

; Function Attrs: noredzone
declare i64 @wait_on_sync_kiocb(%struct.kiocb*) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

; Function Attrs: noredzone
declare void @iov_iter_init(%struct.iov_iter*, i32, %struct.iovec*, i64, i64) #1

; Function Attrs: alwaysinline noredzone nounwind
define i64 @__vfs_read(%struct.file* %file, i8* %buf, i64 %count, i64* %pos) #0 {
  %.sroa.3.i.i1 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2 = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3 = alloca %struct.iovec, align 8
  %kiocb.i4 = alloca %struct.kiocb, align 8
  %iter.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i = alloca %struct.iovec, align 8
  %kiocb.i = alloca %struct.kiocb, align 8
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %2 = load %struct.file_operations** %1, align 8
  %3 = getelementptr inbounds %struct.file_operations* %2, i64 0, i32 2
  %4 = load i64 (%struct.file*, i8*, i64, i64*)** %3, align 8
  %5 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %4, null
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = call i64 %4(%struct.file* %file, i8* %buf, i64 %count, i64* %pos) #7
  br label %67

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.file_operations* %2, i64 0, i32 4
  %10 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %9, align 8
  %11 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %10, null
  br i1 %11, label %37, label %12

; <label>:12                                      ; preds = %8
  %13 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %13) #4
  %14 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 0
  store i8* %buf, i8** %14, align 8
  %15 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 1
  store i64 %count, i64* %15, align 8
  %16 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %16) #4
  %17 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %17)
  %18 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %18)
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 48, i32 8, i1 false)
  %19 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %20 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %20, align 8
  %21 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 1
  %22 = bitcast %struct.kioctx** %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %17, i64 24, i32 8, i1 false) #4
  %23 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %19 to i8*
  store i8* %.c.i.i, i8** %23, align 8
  %24 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 5
  %25 = bitcast i64* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %18, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %17)
  call void @llvm.lifetime.end(i64 48, i8* %18)
  %26 = load i64* %pos, align 8
  %27 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 6
  store i64 %26, i64* %27, align 8
  %28 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 7
  store i64 %count, i64* %28, align 8
  %29 = load %struct.file_operations** %1, align 8
  %30 = getelementptr inbounds %struct.file_operations* %29, i64 0, i32 4
  %31 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %30, align 8
  %32 = call i64 %31(%struct.kiocb* %kiocb.i, %struct.iovec* %iov.i, i64 1, i64 %26) #7
  %33 = icmp eq i64 %32, -529
  br i1 %33, label %34, label %do_sync_read.exit

; <label>:34                                      ; preds = %12
  %35 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #7
  br label %do_sync_read.exit

do_sync_read.exit:                                ; preds = %34, %12
  %ret.0.i = phi i64 [ %35, %34 ], [ %32, %12 ]
  %36 = load i64* %27, align 8
  store i64 %36, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %16) #4
  call void @llvm.lifetime.end(i64 16, i8* %13) #4
  br label %67

; <label>:37                                      ; preds = %8
  %38 = getelementptr inbounds %struct.file_operations* %2, i64 0, i32 6
  %39 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %38, align 8
  %40 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %39, null
  br i1 %40, label %67, label %41

; <label>:41                                      ; preds = %37
  %42 = bitcast %struct.iovec* %iov.i3 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %42) #4
  %43 = getelementptr inbounds %struct.iovec* %iov.i3, i64 0, i32 0
  store i8* %buf, i8** %43, align 8
  %44 = getelementptr inbounds %struct.iovec* %iov.i3, i64 0, i32 1
  store i64 %count, i64* %44, align 8
  %45 = bitcast %struct.kiocb* %kiocb.i4 to i8*
  call void @llvm.lifetime.start(i64 88, i8* %45) #4
  %46 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %46) #4
  %47 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %47)
  %48 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %48)
  call void @llvm.memset.p0i8.i64(i8* %47, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %48, i8 0, i64 48, i32 8, i1 false)
  %49 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %50 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 0
  store %struct.file* %file, %struct.file** %50, align 8
  %51 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 1
  %52 = bitcast %struct.kioctx** %51 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %52, i8* %47, i64 24, i32 8, i1 false) #4
  %53 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 4, i32 0
  %.c.i.i5 = bitcast %struct.task_struct* %49 to i8*
  store i8* %.c.i.i5, i8** %53, align 8
  %54 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 5
  %55 = bitcast i64* %54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %48, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %47)
  call void @llvm.lifetime.end(i64 48, i8* %48)
  %56 = load i64* %pos, align 8
  %57 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 6
  store i64 %56, i64* %57, align 8
  %58 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 7
  store i64 %count, i64* %58, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 0, %struct.iovec* %iov.i3, i64 1, i64 %count) #7
  %59 = load %struct.file_operations** %1, align 8
  %60 = getelementptr inbounds %struct.file_operations* %59, i64 0, i32 6
  %61 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %60, align 8
  %62 = call i64 %61(%struct.kiocb* %kiocb.i4, %struct.iov_iter* %iter.i) #7
  %63 = icmp eq i64 %62, -529
  br i1 %63, label %64, label %new_sync_read.exit

; <label>:64                                      ; preds = %41
  %65 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4) #7
  br label %new_sync_read.exit

new_sync_read.exit:                               ; preds = %64, %41
  %ret.0.i6 = phi i64 [ %65, %64 ], [ %62, %41 ]
  %66 = load i64* %57, align 8
  store i64 %66, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %46) #4
  call void @llvm.lifetime.end(i64 88, i8* %45) #4
  call void @llvm.lifetime.end(i64 16, i8* %42) #4
  br label %67

; <label>:67                                      ; preds = %new_sync_read.exit, %37, %do_sync_read.exit, %6
  %ret.0 = phi i64 [ %7, %6 ], [ %ret.0.i, %do_sync_read.exit ], [ %ret.0.i6, %new_sync_read.exit ], [ -22, %37 ]
  ret i64 %ret.0
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @vfs_read(%struct.file* %file, i8* %buf, i64 %count, i64* %pos) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 1
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %__chk_range_not_ok.exit.thread, label %5

; <label>:5                                       ; preds = %0
  %6 = and i32 %2, 131072
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %__chk_range_not_ok.exit.thread, label %8

; <label>:8                                       ; preds = %5
  %9 = ptrtoint i8* %buf to i64
  %10 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %11 = add i64 %10, -16344
  %12 = inttoptr i64 %11 to %struct.thread_info*
  %13 = getelementptr inbounds %struct.thread_info* %12, i64 0, i32 6, i32 0
  %14 = load i64* %13, align 8
  %uadd.i = tail call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %9, i64 %count) #4
  %15 = extractvalue { i64, i1 } %uadd.i, 1
  %16 = extractvalue { i64, i1 } %uadd.i, 0
  %17 = icmp ugt i64 %16, %14
  %or.cond = or i1 %15, %17
  br i1 %or.cond, label %__chk_range_not_ok.exit.thread, label %18

; <label>:18                                      ; preds = %8
  %19 = tail call i32 @rw_verify_area(i32 0, %struct.file* %file, i64* %pos, i64 %count) #6
  %20 = sext i32 %19 to i64
  %21 = icmp sgt i32 %19, -1
  br i1 %21, label %22, label %__chk_range_not_ok.exit.thread

; <label>:22                                      ; preds = %18
  %23 = tail call i64 @__vfs_read(%struct.file* %file, i8* %buf, i64 %20, i64* %pos) #6
  %24 = icmp sgt i64 %23, 0
  br i1 %24, label %25, label %46

; <label>:25                                      ; preds = %22
  %26 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %27 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %28 = load %struct.inode** %27, align 8
  %29 = getelementptr inbounds %struct.inode* %28, i64 0, i32 0
  %30 = load i16* %29, align 2
  %31 = and i16 %30, -4096
  %32 = icmp eq i16 %31, 16384
  %..i = select i1 %32, i32 1073741825, i32 1
  %33 = load i32* %1, align 4
  %34 = and i32 %33, 67108864
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %fsnotify_access.exit

; <label>:36                                      ; preds = %25
  %37 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %38 = load %struct.dentry** %37, align 8
  %39 = tail call i32 @__fsnotify_parent(%struct.path* %26, %struct.dentry* %38, i32 %..i) #7
  %40 = bitcast %struct.path* %26 to i8*
  %41 = tail call i32 @fsnotify(%struct.inode* %28, i32 %..i, i8* %40, i32 1, i8* null, i32 0) #7
  br label %fsnotify_access.exit

fsnotify_access.exit:                             ; preds = %36, %25
  %42 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %43 = getelementptr inbounds %struct.task_struct* %42, i64 0, i32 113, i32 0
  %44 = load i64* %43, align 8
  %45 = add i64 %44, %23
  store i64 %45, i64* %43, align 8
  br label %46

; <label>:46                                      ; preds = %fsnotify_access.exit, %22
  %47 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %48 = getelementptr inbounds %struct.task_struct* %47, i64 0, i32 113, i32 2
  %49 = load i64* %48, align 8
  %50 = add i64 %49, 1
  store i64 %50, i64* %48, align 8
  br label %__chk_range_not_ok.exit.thread

__chk_range_not_ok.exit.thread:                   ; preds = %46, %18, %8, %5, %0
  %.0 = phi i64 [ -9, %0 ], [ -22, %5 ], [ %23, %46 ], [ %20, %18 ], [ -14, %8 ]
  ret i64 %.0
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @do_sync_write(%struct.file* %filp, i8* %buf, i64 %len, i64* nocapture %ppos) #0 {
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 8
  %kiocb = alloca %struct.kiocb, align 8
  %1 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 0
  store i8* %buf, i8** %1, align 8
  %2 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 1
  store i64 %len, i64* %2, align 8
  %3 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 88, i8* %3) #4
  %4 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %4)
  %5 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %5)
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 48, i32 8, i1 false)
  %6 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %7 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 0
  store %struct.file* %filp, %struct.file** %7, align 8
  %8 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 1
  %9 = bitcast %struct.kioctx** %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %4, i64 24, i32 8, i1 false) #4
  %10 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %6 to i8*
  store i8* %.c.i, i8** %10, align 8
  %11 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 5
  %12 = bitcast i64* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %5, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %4)
  call void @llvm.lifetime.end(i64 48, i8* %5)
  %13 = load i64* %ppos, align 8
  %14 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 6
  store i64 %13, i64* %14, align 8
  %15 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 7
  store i64 %len, i64* %15, align 8
  %16 = getelementptr inbounds %struct.file* %filp, i64 0, i32 3
  %17 = load %struct.file_operations** %16, align 8
  %18 = getelementptr inbounds %struct.file_operations* %17, i64 0, i32 5
  %19 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %18, align 8
  %20 = call i64 %19(%struct.kiocb* %kiocb, %struct.iovec* %iov, i64 1, i64 %13) #7
  %21 = icmp eq i64 %20, -529
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %0
  %23 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #7
  br label %24

; <label>:24                                      ; preds = %22, %0
  %ret.0 = phi i64 [ %23, %22 ], [ %20, %0 ]
  %25 = load i64* %14, align 8
  store i64 %25, i64* %ppos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %3) #4
  ret i64 %ret.0
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @new_sync_write(%struct.file* %filp, i8* %buf, i64 %len, i64* nocapture %ppos) #0 {
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 8
  %kiocb = alloca %struct.kiocb, align 8
  %iter = alloca %struct.iov_iter, align 8
  %1 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 0
  store i8* %buf, i8** %1, align 8
  %2 = getelementptr inbounds %struct.iovec* %iov, i64 0, i32 1
  store i64 %len, i64* %2, align 8
  %3 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 88, i8* %3) #4
  %4 = bitcast %struct.iov_iter* %iter to i8*
  call void @llvm.lifetime.start(i64 40, i8* %4) #4
  %5 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %5)
  %6 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %6)
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 48, i32 8, i1 false)
  %7 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %8 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 0
  store %struct.file* %filp, %struct.file** %8, align 8
  %9 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 1
  %10 = bitcast %struct.kioctx** %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %5, i64 24, i32 8, i1 false) #4
  %11 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %7 to i8*
  store i8* %.c.i, i8** %11, align 8
  %12 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 5
  %13 = bitcast i64* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %6, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %5)
  call void @llvm.lifetime.end(i64 48, i8* %6)
  %14 = load i64* %ppos, align 8
  %15 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 6
  store i64 %14, i64* %15, align 8
  %16 = getelementptr inbounds %struct.kiocb* %kiocb, i64 0, i32 7
  store i64 %len, i64* %16, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter, i32 1, %struct.iovec* %iov, i64 1, i64 %len) #7
  %17 = getelementptr inbounds %struct.file* %filp, i64 0, i32 3
  %18 = load %struct.file_operations** %17, align 8
  %19 = getelementptr inbounds %struct.file_operations* %18, i64 0, i32 7
  %20 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %19, align 8
  %21 = call i64 %20(%struct.kiocb* %kiocb, %struct.iov_iter* %iter) #7
  %22 = icmp eq i64 %21, -529
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %0
  %24 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #7
  br label %25

; <label>:25                                      ; preds = %23, %0
  %ret.0 = phi i64 [ %24, %23 ], [ %21, %0 ]
  %26 = load i64* %15, align 8
  store i64 %26, i64* %ppos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %4) #4
  call void @llvm.lifetime.end(i64 88, i8* %3) #4
  ret i64 %ret.0
}

; Function Attrs: noredzone nounwind
define i64 @__kernel_write(%struct.file* %file, i8* %buf, i64 %count, i64* %pos) #0 {
  %.sroa.3.i.i2 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i3 = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i4 = alloca %struct.iovec, align 8
  %kiocb.i5 = alloca %struct.kiocb, align 8
  %iter.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i = alloca %struct.iovec, align 8
  %kiocb.i = alloca %struct.kiocb, align 8
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 262144
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %110, label %5

; <label>:5                                       ; preds = %0
  %6 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %7 = add i64 %6, -16344
  %8 = inttoptr i64 %7 to %struct.thread_info*
  %9 = getelementptr inbounds %struct.thread_info* %8, i64 0, i32 6, i32 0
  %10 = load i64* %9, align 8
  %11 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %12 = add i64 %11, -16344
  %13 = inttoptr i64 %12 to %struct.thread_info*
  %14 = getelementptr inbounds %struct.thread_info* %13, i64 0, i32 6, i32 0
  store i64 -1, i64* %14, align 8
  %15 = icmp ugt i64 %count, 2147479552
  %.count = select i1 %15, i64 2147479552, i64 %count
  %16 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %17 = load %struct.file_operations** %16, align 8
  %18 = getelementptr inbounds %struct.file_operations* %17, i64 0, i32 3
  %19 = load i64 (%struct.file*, i8*, i64, i64*)** %18, align 8
  %20 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %19, null
  br i1 %20, label %23, label %21

; <label>:21                                      ; preds = %5
  %22 = call i64 %19(%struct.file* %file, i8* %buf, i64 %.count, i64* %pos) #7
  br label %78

; <label>:23                                      ; preds = %5
  %24 = getelementptr inbounds %struct.file_operations* %17, i64 0, i32 5
  %25 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %24, align 8
  %26 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %25, null
  br i1 %26, label %52, label %27

; <label>:27                                      ; preds = %23
  %28 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %28) #4
  %29 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 0
  store i8* %buf, i8** %29, align 8
  %30 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 1
  store i64 %.count, i64* %30, align 8
  %31 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %31) #4
  %32 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %32)
  %33 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %33)
  call void @llvm.memset.p0i8.i64(i8* %32, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %33, i8 0, i64 48, i32 8, i1 false)
  %34 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %35 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %35, align 8
  %36 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 1
  %37 = bitcast %struct.kioctx** %36 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %32, i64 24, i32 8, i1 false) #4
  %38 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %34 to i8*
  store i8* %.c.i.i, i8** %38, align 8
  %39 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 5
  %40 = bitcast i64* %39 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %33, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %32)
  call void @llvm.lifetime.end(i64 48, i8* %33)
  %41 = load i64* %pos, align 8
  %42 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 6
  store i64 %41, i64* %42, align 8
  %43 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 7
  store i64 %.count, i64* %43, align 8
  %44 = load %struct.file_operations** %16, align 8
  %45 = getelementptr inbounds %struct.file_operations* %44, i64 0, i32 5
  %46 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %45, align 8
  %47 = call i64 %46(%struct.kiocb* %kiocb.i, %struct.iovec* %iov.i, i64 1, i64 %41) #7
  %48 = icmp eq i64 %47, -529
  br i1 %48, label %49, label %do_sync_write.exit

; <label>:49                                      ; preds = %27
  %50 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #7
  br label %do_sync_write.exit

do_sync_write.exit:                               ; preds = %49, %27
  %ret.0.i = phi i64 [ %50, %49 ], [ %47, %27 ]
  %51 = load i64* %42, align 8
  store i64 %51, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %31) #4
  call void @llvm.lifetime.end(i64 16, i8* %28) #4
  br label %78

; <label>:52                                      ; preds = %23
  %53 = bitcast %struct.iovec* %iov.i4 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %53) #4
  %54 = getelementptr inbounds %struct.iovec* %iov.i4, i64 0, i32 0
  store i8* %buf, i8** %54, align 8
  %55 = getelementptr inbounds %struct.iovec* %iov.i4, i64 0, i32 1
  store i64 %.count, i64* %55, align 8
  %56 = bitcast %struct.kiocb* %kiocb.i5 to i8*
  call void @llvm.lifetime.start(i64 88, i8* %56) #4
  %57 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %57) #4
  %58 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i2 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %58)
  %59 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i3 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %59)
  call void @llvm.memset.p0i8.i64(i8* %58, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %59, i8 0, i64 48, i32 8, i1 false)
  %60 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %61 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i64 0, i32 0
  store %struct.file* %file, %struct.file** %61, align 8
  %62 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i64 0, i32 1
  %63 = bitcast %struct.kioctx** %62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %63, i8* %58, i64 24, i32 8, i1 false) #4
  %64 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i64 0, i32 4, i32 0
  %.c.i.i6 = bitcast %struct.task_struct* %60 to i8*
  store i8* %.c.i.i6, i8** %64, align 8
  %65 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i64 0, i32 5
  %66 = bitcast i64* %65 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %66, i8* %59, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %58)
  call void @llvm.lifetime.end(i64 48, i8* %59)
  %67 = load i64* %pos, align 8
  %68 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i64 0, i32 6
  store i64 %67, i64* %68, align 8
  %69 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i64 0, i32 7
  store i64 %.count, i64* %69, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 1, %struct.iovec* %iov.i4, i64 1, i64 %.count) #7
  %70 = load %struct.file_operations** %16, align 8
  %71 = getelementptr inbounds %struct.file_operations* %70, i64 0, i32 7
  %72 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %71, align 8
  %73 = call i64 %72(%struct.kiocb* %kiocb.i5, %struct.iov_iter* %iter.i) #7
  %74 = icmp eq i64 %73, -529
  br i1 %74, label %75, label %new_sync_write.exit

; <label>:75                                      ; preds = %52
  %76 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i5) #7
  br label %new_sync_write.exit

new_sync_write.exit:                              ; preds = %75, %52
  %ret.0.i7 = phi i64 [ %76, %75 ], [ %73, %52 ]
  %77 = load i64* %68, align 8
  store i64 %77, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %57) #4
  call void @llvm.lifetime.end(i64 88, i8* %56) #4
  call void @llvm.lifetime.end(i64 16, i8* %53) #4
  br label %78

; <label>:78                                      ; preds = %new_sync_write.exit, %do_sync_write.exit, %21
  %ret.0 = phi i64 [ %22, %21 ], [ %ret.0.i, %do_sync_write.exit ], [ %ret.0.i7, %new_sync_write.exit ]
  %79 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %80 = add i64 %79, -16344
  %81 = inttoptr i64 %80 to %struct.thread_info*
  %82 = getelementptr inbounds %struct.thread_info* %81, i64 0, i32 6, i32 0
  store i64 %10, i64* %82, align 8
  %83 = icmp sgt i64 %ret.0, 0
  br i1 %83, label %84, label %105

; <label>:84                                      ; preds = %78
  %85 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %86 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %87 = load %struct.inode** %86, align 8
  %88 = getelementptr inbounds %struct.inode* %87, i64 0, i32 0
  %89 = load i16* %88, align 2
  %90 = and i16 %89, -4096
  %91 = icmp eq i16 %90, 16384
  %..i = select i1 %91, i32 1073741826, i32 2
  %92 = load i32* %1, align 4
  %93 = and i32 %92, 67108864
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %fsnotify_modify.exit

; <label>:95                                      ; preds = %84
  %96 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %97 = load %struct.dentry** %96, align 8
  %98 = call i32 @__fsnotify_parent(%struct.path* %85, %struct.dentry* %97, i32 %..i) #7
  %99 = bitcast %struct.path* %85 to i8*
  %100 = call i32 @fsnotify(%struct.inode* %87, i32 %..i, i8* %99, i32 1, i8* null, i32 0) #7
  br label %fsnotify_modify.exit

fsnotify_modify.exit:                             ; preds = %95, %84
  %101 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %102 = getelementptr inbounds %struct.task_struct* %101, i64 0, i32 113, i32 1
  %103 = load i64* %102, align 8
  %104 = add i64 %103, %ret.0
  store i64 %104, i64* %102, align 8
  br label %105

; <label>:105                                     ; preds = %fsnotify_modify.exit, %78
  %106 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %107 = getelementptr inbounds %struct.task_struct* %106, i64 0, i32 113, i32 3
  %108 = load i64* %107, align 8
  %109 = add i64 %108, 1
  store i64 %109, i64* %107, align 8
  br label %110

; <label>:110                                     ; preds = %105, %0
  %.0 = phi i64 [ %ret.0, %105 ], [ -22, %0 ]
  ret i64 %.0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: alwaysinline noredzone nounwind
define i64 @vfs_write(%struct.file* %file, i8* %buf, i64 %count, i64* %pos) #0 {
  %.sroa.3.i.i1 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2 = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3 = alloca %struct.iovec, align 8
  %kiocb.i4 = alloca %struct.kiocb, align 8
  %iter.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i = alloca %struct.iovec, align 8
  %kiocb.i = alloca %struct.kiocb, align 8
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %file_end_write.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = and i32 %2, 262144
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %file_end_write.exit, label %8

; <label>:8                                       ; preds = %5
  %9 = ptrtoint i8* %buf to i64
  %10 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %11 = add i64 %10, -16344
  %12 = inttoptr i64 %11 to %struct.thread_info*
  %13 = getelementptr inbounds %struct.thread_info* %12, i64 0, i32 6, i32 0
  %14 = load i64* %13, align 8
  %uadd.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %9, i64 %count) #4
  %15 = extractvalue { i64, i1 } %uadd.i, 1
  %16 = extractvalue { i64, i1 } %uadd.i, 0
  %17 = icmp ugt i64 %16, %14
  %or.cond = or i1 %15, %17
  br i1 %or.cond, label %file_end_write.exit, label %18

; <label>:18                                      ; preds = %8
  %19 = call i32 @rw_verify_area(i32 1, %struct.file* %file, i64* %pos, i64 %count) #6
  %20 = sext i32 %19 to i64
  %21 = icmp sgt i32 %19, -1
  br i1 %21, label %22, label %file_end_write.exit

; <label>:22                                      ; preds = %18
  %23 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %24 = load %struct.inode** %23, align 8
  %25 = getelementptr inbounds %struct.inode* %24, i64 0, i32 0
  %26 = load i16* %25, align 2
  %27 = and i16 %26, -4096
  %28 = icmp eq i16 %27, -32768
  br i1 %28, label %29, label %file_start_write.exit

; <label>:29                                      ; preds = %22
  %30 = getelementptr inbounds %struct.inode* %24, i64 0, i32 8
  %31 = load %struct.super_block** %30, align 8
  %32 = call i32 @__sb_start_write(%struct.super_block* %31, i32 1, i1 zeroext true) #7
  br label %file_start_write.exit

file_start_write.exit:                            ; preds = %29, %22
  %33 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %34 = load %struct.file_operations** %33, align 8
  %35 = getelementptr inbounds %struct.file_operations* %34, i64 0, i32 3
  %36 = load i64 (%struct.file*, i8*, i64, i64*)** %35, align 8
  %37 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %36, null
  br i1 %37, label %40, label %38

; <label>:38                                      ; preds = %file_start_write.exit
  %39 = call i64 %36(%struct.file* %file, i8* %buf, i64 %20, i64* %pos) #7
  br label %95

; <label>:40                                      ; preds = %file_start_write.exit
  %41 = getelementptr inbounds %struct.file_operations* %34, i64 0, i32 5
  %42 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %41, align 8
  %43 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %42, null
  br i1 %43, label %69, label %44

; <label>:44                                      ; preds = %40
  %45 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %45) #4
  %46 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 0
  store i8* %buf, i8** %46, align 8
  %47 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 1
  store i64 %20, i64* %47, align 8
  %48 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %48) #4
  %49 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %49)
  %50 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %50)
  call void @llvm.memset.p0i8.i64(i8* %49, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %50, i8 0, i64 48, i32 8, i1 false)
  %51 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %52 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %52, align 8
  %53 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 1
  %54 = bitcast %struct.kioctx** %53 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %54, i8* %49, i64 24, i32 8, i1 false) #4
  %55 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %51 to i8*
  store i8* %.c.i.i, i8** %55, align 8
  %56 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 5
  %57 = bitcast i64* %56 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %57, i8* %50, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %49)
  call void @llvm.lifetime.end(i64 48, i8* %50)
  %58 = load i64* %pos, align 8
  %59 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 6
  store i64 %58, i64* %59, align 8
  %60 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 7
  store i64 %20, i64* %60, align 8
  %61 = load %struct.file_operations** %33, align 8
  %62 = getelementptr inbounds %struct.file_operations* %61, i64 0, i32 5
  %63 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %62, align 8
  %64 = call i64 %63(%struct.kiocb* %kiocb.i, %struct.iovec* %iov.i, i64 1, i64 %58) #7
  %65 = icmp eq i64 %64, -529
  br i1 %65, label %66, label %do_sync_write.exit

; <label>:66                                      ; preds = %44
  %67 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #7
  br label %do_sync_write.exit

do_sync_write.exit:                               ; preds = %66, %44
  %ret.0.i = phi i64 [ %67, %66 ], [ %64, %44 ]
  %68 = load i64* %59, align 8
  store i64 %68, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %48) #4
  call void @llvm.lifetime.end(i64 16, i8* %45) #4
  br label %95

; <label>:69                                      ; preds = %40
  %70 = bitcast %struct.iovec* %iov.i3 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %70) #4
  %71 = getelementptr inbounds %struct.iovec* %iov.i3, i64 0, i32 0
  store i8* %buf, i8** %71, align 8
  %72 = getelementptr inbounds %struct.iovec* %iov.i3, i64 0, i32 1
  store i64 %20, i64* %72, align 8
  %73 = bitcast %struct.kiocb* %kiocb.i4 to i8*
  call void @llvm.lifetime.start(i64 88, i8* %73) #4
  %74 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %74) #4
  %75 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %75)
  %76 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %76)
  call void @llvm.memset.p0i8.i64(i8* %75, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %76, i8 0, i64 48, i32 8, i1 false)
  %77 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %78 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 0
  store %struct.file* %file, %struct.file** %78, align 8
  %79 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 1
  %80 = bitcast %struct.kioctx** %79 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %80, i8* %75, i64 24, i32 8, i1 false) #4
  %81 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 4, i32 0
  %.c.i.i5 = bitcast %struct.task_struct* %77 to i8*
  store i8* %.c.i.i5, i8** %81, align 8
  %82 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 5
  %83 = bitcast i64* %82 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %83, i8* %76, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %75)
  call void @llvm.lifetime.end(i64 48, i8* %76)
  %84 = load i64* %pos, align 8
  %85 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 6
  store i64 %84, i64* %85, align 8
  %86 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 7
  store i64 %20, i64* %86, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 1, %struct.iovec* %iov.i3, i64 1, i64 %20) #7
  %87 = load %struct.file_operations** %33, align 8
  %88 = getelementptr inbounds %struct.file_operations* %87, i64 0, i32 7
  %89 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %88, align 8
  %90 = call i64 %89(%struct.kiocb* %kiocb.i4, %struct.iov_iter* %iter.i) #7
  %91 = icmp eq i64 %90, -529
  br i1 %91, label %92, label %new_sync_write.exit

; <label>:92                                      ; preds = %69
  %93 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4) #7
  br label %new_sync_write.exit

new_sync_write.exit:                              ; preds = %92, %69
  %ret.0.i6 = phi i64 [ %93, %92 ], [ %90, %69 ]
  %94 = load i64* %85, align 8
  store i64 %94, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %74) #4
  call void @llvm.lifetime.end(i64 88, i8* %73) #4
  call void @llvm.lifetime.end(i64 16, i8* %70) #4
  br label %95

; <label>:95                                      ; preds = %new_sync_write.exit, %do_sync_write.exit, %38
  %ret.0 = phi i64 [ %39, %38 ], [ %ret.0.i, %do_sync_write.exit ], [ %ret.0.i6, %new_sync_write.exit ]
  %96 = icmp sgt i64 %ret.0, 0
  br i1 %96, label %97, label %117

; <label>:97                                      ; preds = %95
  %98 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %99 = load %struct.inode** %23, align 8
  %100 = getelementptr inbounds %struct.inode* %99, i64 0, i32 0
  %101 = load i16* %100, align 2
  %102 = and i16 %101, -4096
  %103 = icmp eq i16 %102, 16384
  %..i = select i1 %103, i32 1073741826, i32 2
  %104 = load i32* %1, align 4
  %105 = and i32 %104, 67108864
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %fsnotify_modify.exit

; <label>:107                                     ; preds = %97
  %108 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %109 = load %struct.dentry** %108, align 8
  %110 = call i32 @__fsnotify_parent(%struct.path* %98, %struct.dentry* %109, i32 %..i) #7
  %111 = bitcast %struct.path* %98 to i8*
  %112 = call i32 @fsnotify(%struct.inode* %99, i32 %..i, i8* %111, i32 1, i8* null, i32 0) #7
  br label %fsnotify_modify.exit

fsnotify_modify.exit:                             ; preds = %107, %97
  %113 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %114 = getelementptr inbounds %struct.task_struct* %113, i64 0, i32 113, i32 1
  %115 = load i64* %114, align 8
  %116 = add i64 %115, %ret.0
  store i64 %116, i64* %114, align 8
  br label %117

; <label>:117                                     ; preds = %fsnotify_modify.exit, %95
  %118 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %119 = getelementptr inbounds %struct.task_struct* %118, i64 0, i32 113, i32 3
  %120 = load i64* %119, align 8
  %121 = add i64 %120, 1
  store i64 %121, i64* %119, align 8
  %122 = load %struct.inode** %23, align 8
  %123 = getelementptr inbounds %struct.inode* %122, i64 0, i32 0
  %124 = load i16* %123, align 2
  %125 = and i16 %124, -4096
  %126 = icmp eq i16 %125, -32768
  br i1 %126, label %127, label %file_end_write.exit

; <label>:127                                     ; preds = %117
  %128 = getelementptr inbounds %struct.inode* %122, i64 0, i32 8
  %129 = load %struct.super_block** %128, align 8
  call void @__sb_end_write(%struct.super_block* %129, i32 1) #7
  br label %file_end_write.exit

file_end_write.exit:                              ; preds = %127, %117, %18, %8, %5, %0
  %.0 = phi i64 [ -9, %0 ], [ -22, %5 ], [ %20, %18 ], [ %ret.0, %117 ], [ %ret.0, %127 ], [ -14, %8 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define i64 @SyS_read(i64 %fd, i64 %buf, i64 %count) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = call i64 @__fdget_pos(i32 %1) #7
  %4 = and i64 %3, -4
  %5 = inttoptr i64 %4 to %struct.file*
  %v.tr.i.i.i = trunc i64 %3 to i32
  %6 = icmp eq i64 %4, 0
  br i1 %6, label %SYSC_read.exit, label %7

; <label>:7                                       ; preds = %0
  %8 = inttoptr i64 %buf to i8*
  %9 = getelementptr inbounds %struct.file* %5, i64 0, i32 9
  %10 = load i64* %9, align 8
  store i64 %10, i64* %pos.i, align 8
  %11 = call i64 @vfs_read(%struct.file* %5, i8* %8, i64 %count, i64* %pos.i) #7
  %12 = icmp sgt i64 %11, -1
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %7
  %14 = load i64* %pos.i, align 8
  store i64 %14, i64* %9, align 8
  br label %15

; <label>:15                                      ; preds = %13, %7
  %16 = and i32 %v.tr.i.i.i, 2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %20, label %18

; <label>:18                                      ; preds = %15
  %19 = getelementptr inbounds %struct.file* %5, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %19) #7
  br label %20

; <label>:20                                      ; preds = %18, %15
  %21 = and i32 %v.tr.i.i.i, 1
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %SYSC_read.exit, label %23

; <label>:23                                      ; preds = %20
  call void @fput(%struct.file* %5) #7
  br label %SYSC_read.exit

SYSC_read.exit:                                   ; preds = %23, %20, %0
  %ret.0.i = phi i64 [ -9, %0 ], [ %11, %20 ], [ %11, %23 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_write(i64 %fd, i64 %buf, i64 %count) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = call i64 @__fdget_pos(i32 %1) #7
  %4 = and i64 %3, -4
  %5 = inttoptr i64 %4 to %struct.file*
  %v.tr.i.i.i = trunc i64 %3 to i32
  %6 = icmp eq i64 %4, 0
  br i1 %6, label %SYSC_write.exit, label %7

; <label>:7                                       ; preds = %0
  %8 = inttoptr i64 %buf to i8*
  %9 = getelementptr inbounds %struct.file* %5, i64 0, i32 9
  %10 = load i64* %9, align 8
  store i64 %10, i64* %pos.i, align 8
  %11 = call i64 @vfs_write(%struct.file* %5, i8* %8, i64 %count, i64* %pos.i) #7
  %12 = icmp sgt i64 %11, -1
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %7
  %14 = load i64* %pos.i, align 8
  store i64 %14, i64* %9, align 8
  br label %15

; <label>:15                                      ; preds = %13, %7
  %16 = and i32 %v.tr.i.i.i, 2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %20, label %18

; <label>:18                                      ; preds = %15
  %19 = getelementptr inbounds %struct.file* %5, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %19) #7
  br label %20

; <label>:20                                      ; preds = %18, %15
  %21 = and i32 %v.tr.i.i.i, 1
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %SYSC_write.exit, label %23

; <label>:23                                      ; preds = %20
  call void @fput(%struct.file* %5) #7
  br label %SYSC_write.exit

SYSC_write.exit:                                  ; preds = %23, %20, %0
  %ret.0.i = phi i64 [ -9, %0 ], [ %11, %20 ], [ %11, %23 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_pread64(i64 %fd, i64 %buf, i64 %count, i64 %pos) #0 {
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %buf to i8*
  %3 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  store i64 %pos, i64* %1, align 8
  %4 = icmp slt i64 %pos, 0
  br i1 %4, label %SYSC_pread64.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = trunc i64 %fd to i32
  %7 = call i64 @__fdget(i32 %6) #7
  %8 = and i64 %7, -4
  %9 = inttoptr i64 %8 to %struct.file*
  %10 = icmp eq i64 %8, 0
  br i1 %10, label %SYSC_pread64.exit, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %11
  %17 = call i64 @vfs_read(%struct.file* %9, i8* %2, i64 %count, i64* %1) #7
  br label %18

; <label>:18                                      ; preds = %16, %11
  %ret.0.i = phi i64 [ %17, %16 ], [ -29, %11 ]
  %19 = and i64 %7, 1
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %SYSC_pread64.exit, label %21

; <label>:21                                      ; preds = %18
  call void @fput(%struct.file* %9) #7
  br label %SYSC_pread64.exit

SYSC_pread64.exit:                                ; preds = %21, %18, %5, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %5 ], [ %ret.0.i, %18 ], [ %ret.0.i, %21 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_pwrite64(i64 %fd, i64 %buf, i64 %count, i64 %pos) #0 {
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %buf to i8*
  %3 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  store i64 %pos, i64* %1, align 8
  %4 = icmp slt i64 %pos, 0
  br i1 %4, label %SYSC_pwrite64.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = trunc i64 %fd to i32
  %7 = call i64 @__fdget(i32 %6) #7
  %8 = and i64 %7, -4
  %9 = inttoptr i64 %8 to %struct.file*
  %10 = icmp eq i64 %8, 0
  br i1 %10, label %SYSC_pwrite64.exit, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 16
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %11
  %17 = call i64 @vfs_write(%struct.file* %9, i8* %2, i64 %count, i64* %1) #7
  br label %18

; <label>:18                                      ; preds = %16, %11
  %ret.0.i = phi i64 [ %17, %16 ], [ -29, %11 ]
  %19 = and i64 %7, 1
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %SYSC_pwrite64.exit, label %21

; <label>:21                                      ; preds = %18
  call void @fput(%struct.file* %9) #7
  br label %SYSC_pwrite64.exit

SYSC_pwrite64.exit:                               ; preds = %21, %18, %5, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %5 ], [ %ret.0.i, %18 ], [ %ret.0.i, %21 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @iov_shorten(%struct.iovec* nocapture %iov, i64 %nr_segs, i64 %to) #0 {
  %1 = icmp eq i64 %nr_segs, 0
  br i1 %1, label %.loopexit, label %.lr.ph

; <label>:2                                       ; preds = %.lr.ph
  %3 = getelementptr %struct.iovec* %.04, i64 1
  %4 = icmp ult i64 %5, %nr_segs
  br i1 %4, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2, %0
  %len.06 = phi i64 [ %8, %2 ], [ 0, %0 ]
  %seg.05 = phi i64 [ %5, %2 ], [ 0, %0 ]
  %.04 = phi %struct.iovec* [ %3, %2 ], [ %iov, %0 ]
  %5 = add i64 %seg.05, 1
  %6 = getelementptr inbounds %struct.iovec* %.04, i64 0, i32 1
  %7 = load i64* %6, align 8
  %8 = add i64 %7, %len.06
  %9 = icmp ult i64 %8, %to
  br i1 %9, label %2, label %10

; <label>:10                                      ; preds = %.lr.ph
  %11 = sub i64 %to, %len.06
  store i64 %11, i64* %6, align 8
  br label %.loopexit

.loopexit:                                        ; preds = %10, %2, %0
  %seg.1 = phi i64 [ %5, %10 ], [ 0, %0 ], [ %5, %2 ]
  ret i64 %seg.1
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @rw_copy_check_uvector(i32 %type, %struct.iovec* %uvector, i64 %nr_segs, i64 %fast_segs, %struct.iovec* %fast_pointer, %struct.iovec** nocapture %ret_pointer) #0 {
  %1 = icmp eq i64 %nr_segs, 0
  br i1 %1, label %__chk_range_not_ok.exit.thread, label %2

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i64 %nr_segs, 1024
  br i1 %3, label %__chk_range_not_ok.exit.thread, label %4

; <label>:4                                       ; preds = %2
  %5 = icmp ugt i64 %nr_segs, %fast_segs
  %6 = shl i64 %nr_segs, 4
  br i1 %5, label %7, label %._crit_edge

; <label>:7                                       ; preds = %4
  %8 = tail call i8* @__kmalloc(i64 %6, i32 208) #7
  %9 = bitcast i8* %8 to %struct.iovec*
  %10 = icmp eq i8* %8, null
  br i1 %10, label %__chk_range_not_ok.exit.thread, label %._crit_edge

._crit_edge:                                      ; preds = %7, %4
  %iov.0 = phi %struct.iovec* [ %9, %7 ], [ %fast_pointer, %4 ]
  %11 = bitcast %struct.iovec* %iov.0 to i8*
  %12 = bitcast %struct.iovec* %uvector to i8*
  %13 = tail call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false) #4
  %14 = trunc i64 %13 to i32
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %.critedge.i, label %16

; <label>:16                                      ; preds = %._crit_edge
  %sext.i = shl i64 %13, 32
  %17 = ashr exact i64 %sext.i, 32
  %18 = icmp ult i64 %17, %6
  br i1 %18, label %21, label %.critedge.i, !prof !4

.critedge.i:                                      ; preds = %16, %._crit_edge
  %19 = trunc i64 %6 to i32
  %20 = tail call i64 @_copy_from_user(i8* %11, i8* %12, i32 %19) #7
  br label %copy_from_user.exit

; <label>:21                                      ; preds = %16
  tail call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %14, i64 %6) #7
  br label %copy_from_user.exit

copy_from_user.exit:                              ; preds = %21, %.critedge.i
  %.0.i = phi i64 [ %20, %.critedge.i ], [ %6, %21 ]
  %22 = icmp eq i64 %.0.i, 0
  br i1 %22, label %.lr.ph, label %__chk_range_not_ok.exit.thread

.lr.ph:                                           ; preds = %copy_from_user.exit
  %23 = icmp sgt i32 %type, -1
  br label %24

; <label>:24                                      ; preds = %45, %.lr.ph
  %seg.04 = phi i64 [ 0, %.lr.ph ], [ %47, %45 ]
  %ret.03 = phi i64 [ 0, %.lr.ph ], [ %46, %45 ]
  %25 = getelementptr inbounds %struct.iovec* %iov.0, i64 %seg.04, i32 0
  %26 = load i8** %25, align 8
  %27 = getelementptr inbounds %struct.iovec* %iov.0, i64 %seg.04, i32 1
  %28 = load i64* %27, align 8
  %29 = icmp slt i64 %28, 0
  br i1 %29, label %__chk_range_not_ok.exit.thread, label %30

; <label>:30                                      ; preds = %24
  br i1 %23, label %31, label %41

; <label>:31                                      ; preds = %30
  %32 = ptrtoint i8* %26 to i64
  %33 = tail call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %34 = add i64 %33, -16344
  %35 = inttoptr i64 %34 to %struct.thread_info*
  %36 = getelementptr inbounds %struct.thread_info* %35, i64 0, i32 6, i32 0
  %37 = load i64* %36, align 8
  %uadd.i = tail call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %32, i64 %28) #4
  %38 = extractvalue { i64, i1 } %uadd.i, 1
  %39 = extractvalue { i64, i1 } %uadd.i, 0
  %40 = icmp ugt i64 %39, %37
  %or.cond = or i1 %38, %40
  br i1 %or.cond, label %__chk_range_not_ok.exit.thread, label %41

; <label>:41                                      ; preds = %31, %30
  %42 = sub i64 2147479552, %ret.03
  %43 = icmp ugt i64 %28, %42
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  store i64 %42, i64* %27, align 8
  br label %45

; <label>:45                                      ; preds = %44, %41
  %len.0 = phi i64 [ %42, %44 ], [ %28, %41 ]
  %46 = add i64 %len.0, %ret.03
  %47 = add i64 %seg.04, 1
  %48 = icmp ult i64 %47, %nr_segs
  br i1 %48, label %24, label %__chk_range_not_ok.exit.thread

__chk_range_not_ok.exit.thread:                   ; preds = %45, %31, %24, %copy_from_user.exit, %7, %2, %0
  %iov.1 = phi %struct.iovec* [ %fast_pointer, %0 ], [ %fast_pointer, %2 ], [ %9, %7 ], [ %iov.0, %copy_from_user.exit ], [ %iov.0, %45 ], [ %iov.0, %24 ], [ %iov.0, %31 ]
  %ret.1 = phi i64 [ 0, %0 ], [ -22, %2 ], [ -12, %7 ], [ -14, %copy_from_user.exit ], [ -14, %31 ], [ -22, %24 ], [ %46, %45 ]
  store %struct.iovec* %iov.1, %struct.iovec** %ret_pointer, align 8
  ret i64 %ret.1
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @vfs_readv(%struct.file* %file, %struct.iovec* %vec, i64 %vlen, i64* %pos) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 1
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %10, label %5

; <label>:5                                       ; preds = %0
  %6 = and i32 %2, 131072
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %10, label %8

; <label>:8                                       ; preds = %5
  %9 = tail call fastcc i64 @do_readv_writev(i32 0, %struct.file* %file, %struct.iovec* %vec, i64 %vlen, i64* %pos) #6
  br label %10

; <label>:10                                      ; preds = %8, %5, %0
  %.0 = phi i64 [ %9, %8 ], [ -9, %0 ], [ -22, %5 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @do_readv_writev(i32 %type, %struct.file* %file, %struct.iovec* %uvector, i64 %nr_segs, i64* %pos) #0 {
  %.sroa.3.i.i1 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2 = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3 = alloca %struct.kiocb, align 8
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i = alloca %struct.kiocb, align 8
  %iter.i = alloca %struct.iov_iter, align 8
  %iovstack = alloca [8 x %struct.iovec], align 16
  %iov = alloca %struct.iovec*, align 8
  %1 = bitcast [8 x %struct.iovec]* %iovstack to i8*
  call void @llvm.lifetime.start(i64 128, i8* %1) #4
  %2 = getelementptr inbounds [8 x %struct.iovec]* %iovstack, i64 0, i64 0
  store %struct.iovec* %2, %struct.iovec** %iov, align 8
  %3 = call i64 @rw_copy_check_uvector(i32 %type, %struct.iovec* %uvector, i64 %nr_segs, i64 8, %struct.iovec* %2, %struct.iovec** %iov) #6
  %4 = icmp slt i64 %3, 1
  br i1 %4, label %file_end_write.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = call i32 @rw_verify_area(i32 %type, %struct.file* %file, i64* %pos, i64 %3) #6
  %7 = sext i32 %6 to i64
  %8 = icmp slt i32 %6, 0
  br i1 %8, label %file_end_write.exit, label %9

; <label>:9                                       ; preds = %5
  %10 = icmp eq i32 %type, 0
  %11 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %12 = load %struct.file_operations** %11, align 8
  br i1 %10, label %13, label %20

; <label>:13                                      ; preds = %9
  %14 = getelementptr inbounds %struct.file_operations* %12, i64 0, i32 2
  %15 = load i64 (%struct.file*, i8*, i64, i64*)** %14, align 8
  %16 = getelementptr inbounds %struct.file_operations* %12, i64 0, i32 4
  %17 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %16, align 8
  %18 = getelementptr inbounds %struct.file_operations* %12, i64 0, i32 6
  %19 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %18, align 8
  br label %file_start_write.exit

; <label>:20                                      ; preds = %9
  %21 = getelementptr inbounds %struct.file_operations* %12, i64 0, i32 3
  %22 = load i64 (%struct.file*, i8*, i64, i64*)** %21, align 8
  %23 = getelementptr inbounds %struct.file_operations* %12, i64 0, i32 5
  %24 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %23, align 8
  %25 = getelementptr inbounds %struct.file_operations* %12, i64 0, i32 7
  %26 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %25, align 8
  %27 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %28 = load %struct.inode** %27, align 8
  %29 = getelementptr inbounds %struct.inode* %28, i64 0, i32 0
  %30 = load i16* %29, align 2
  %31 = and i16 %30, -4096
  %32 = icmp eq i16 %31, -32768
  br i1 %32, label %33, label %file_start_write.exit

; <label>:33                                      ; preds = %20
  %34 = getelementptr inbounds %struct.inode* %28, i64 0, i32 8
  %35 = load %struct.super_block** %34, align 8
  %36 = call i32 @__sb_start_write(%struct.super_block* %35, i32 1, i1 zeroext true) #7
  br label %file_start_write.exit

file_start_write.exit:                            ; preds = %33, %20, %13
  %fn.0 = phi i64 (%struct.file*, i8*, i64, i64*)* [ %15, %13 ], [ %22, %20 ], [ %22, %33 ]
  %fnv.0 = phi i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* [ %17, %13 ], [ %24, %20 ], [ %24, %33 ]
  %iter_fn.0 = phi i64 (%struct.kiocb*, %struct.iov_iter*)* [ %19, %13 ], [ %26, %20 ], [ %26, %33 ]
  %37 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %iter_fn.0, null
  br i1 %37, label %59, label %38

; <label>:38                                      ; preds = %file_start_write.exit
  %39 = load %struct.iovec** %iov, align 8
  %40 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %40) #4
  %41 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %41) #4
  %42 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %42)
  %43 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %43)
  call void @llvm.memset.p0i8.i64(i8* %42, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 48, i32 8, i1 false)
  %44 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %45 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %45, align 8
  %46 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 1
  %47 = bitcast %struct.kioctx** %46 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %47, i8* %42, i64 24, i32 8, i1 false) #4
  %48 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %44 to i8*
  store i8* %.c.i.i, i8** %48, align 8
  %49 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 5
  %50 = bitcast i64* %49 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %50, i8* %43, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %42)
  call void @llvm.lifetime.end(i64 48, i8* %43)
  %51 = load i64* %pos, align 8
  %52 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 6
  store i64 %51, i64* %52, align 8
  %53 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 7
  store i64 %3, i64* %53, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 %type, %struct.iovec* %39, i64 %nr_segs, i64 %3) #7
  %54 = call i64 %iter_fn.0(%struct.kiocb* %kiocb.i, %struct.iov_iter* %iter.i) #7
  %55 = icmp eq i64 %54, -529
  br i1 %55, label %56, label %do_iter_readv_writev.exit

; <label>:56                                      ; preds = %38
  %57 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #7
  br label %do_iter_readv_writev.exit

do_iter_readv_writev.exit:                        ; preds = %56, %38
  %ret.0.i = phi i64 [ %57, %56 ], [ %54, %38 ]
  %58 = load i64* %52, align 8
  store i64 %58, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %41) #4
  call void @llvm.lifetime.end(i64 88, i8* %40) #4
  br label %do_loop_readv_writev.exit

; <label>:59                                      ; preds = %file_start_write.exit
  %60 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %fnv.0, null
  %61 = load %struct.iovec** %iov, align 8
  br i1 %60, label %81, label %62

; <label>:62                                      ; preds = %59
  %63 = bitcast %struct.kiocb* %kiocb.i3 to i8*
  call void @llvm.lifetime.start(i64 88, i8* %63) #4
  %64 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %64)
  %65 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %65)
  call void @llvm.memset.p0i8.i64(i8* %64, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %65, i8 0, i64 48, i32 8, i1 false)
  %66 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %67 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 0
  store %struct.file* %file, %struct.file** %67, align 8
  %68 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 1
  %69 = bitcast %struct.kioctx** %68 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %69, i8* %64, i64 24, i32 8, i1 false) #4
  %70 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 4, i32 0
  %.c.i.i4 = bitcast %struct.task_struct* %66 to i8*
  store i8* %.c.i.i4, i8** %70, align 8
  %71 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 5
  %72 = bitcast i64* %71 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %72, i8* %65, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %64)
  call void @llvm.lifetime.end(i64 48, i8* %65)
  %73 = load i64* %pos, align 8
  %74 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 6
  store i64 %73, i64* %74, align 8
  %75 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 7
  store i64 %3, i64* %75, align 8
  %76 = call i64 %fnv.0(%struct.kiocb* %kiocb.i3, %struct.iovec* %61, i64 %nr_segs, i64 %73) #7
  %77 = icmp eq i64 %76, -529
  br i1 %77, label %78, label %do_sync_readv_writev.exit

; <label>:78                                      ; preds = %62
  %79 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3) #7
  br label %do_sync_readv_writev.exit

do_sync_readv_writev.exit:                        ; preds = %78, %62
  %ret.0.i5 = phi i64 [ %79, %78 ], [ %76, %62 ]
  %80 = load i64* %74, align 8
  store i64 %80, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %63) #4
  br label %do_loop_readv_writev.exit

; <label>:81                                      ; preds = %59
  %.old1.i = icmp eq i64 %nr_segs, 0
  br i1 %.old1.i, label %do_loop_readv_writev.exit, label %.preheader.i

.preheader.i:                                     ; preds = %91, %81
  %ret.0.i6 = phi i64 [ %93, %91 ], [ 0, %81 ]
  %vector.0.i = phi %struct.iovec* [ %92, %91 ], [ %61, %81 ]
  %.0.i = phi i64 [ %86, %91 ], [ %nr_segs, %81 ]
  %82 = getelementptr inbounds %struct.iovec* %vector.0.i, i64 0, i32 0
  %83 = load i8** %82, align 8
  %84 = getelementptr inbounds %struct.iovec* %vector.0.i, i64 0, i32 1
  %85 = load i64* %84, align 8
  %86 = add i64 %.0.i, -1
  %87 = call i64 %fn.0(%struct.file* %file, i8* %83, i64 %85, i64* %pos) #7
  %88 = icmp slt i64 %87, 0
  br i1 %88, label %89, label %91

; <label>:89                                      ; preds = %.preheader.i
  %90 = icmp eq i64 %ret.0.i6, 0
  %.ret.0.i = select i1 %90, i64 %87, i64 %ret.0.i6
  br label %do_loop_readv_writev.exit

; <label>:91                                      ; preds = %.preheader.i
  %92 = getelementptr %struct.iovec* %vector.0.i, i64 1
  %93 = add i64 %87, %ret.0.i6
  %94 = icmp eq i64 %87, %85
  %95 = icmp ne i64 %86, 0
  %or.cond.i = and i1 %94, %95
  br i1 %or.cond.i, label %.preheader.i, label %do_loop_readv_writev.exit

do_loop_readv_writev.exit:                        ; preds = %91, %89, %81, %do_sync_readv_writev.exit, %do_iter_readv_writev.exit
  %ret.0 = phi i64 [ %ret.0.i, %do_iter_readv_writev.exit ], [ %ret.0.i5, %do_sync_readv_writev.exit ], [ %.ret.0.i, %89 ], [ 0, %81 ], [ %93, %91 ]
  br i1 %10, label %file_end_write.exit, label %96

; <label>:96                                      ; preds = %do_loop_readv_writev.exit
  %97 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %98 = load %struct.inode** %97, align 8
  %99 = getelementptr inbounds %struct.inode* %98, i64 0, i32 0
  %100 = load i16* %99, align 2
  %101 = and i16 %100, -4096
  %102 = icmp eq i16 %101, -32768
  br i1 %102, label %103, label %file_end_write.exit

; <label>:103                                     ; preds = %96
  %104 = getelementptr inbounds %struct.inode* %98, i64 0, i32 8
  %105 = load %struct.super_block** %104, align 8
  call void @__sb_end_write(%struct.super_block* %105, i32 1) #7
  br label %file_end_write.exit

file_end_write.exit:                              ; preds = %103, %96, %do_loop_readv_writev.exit, %5, %0
  %ret.1 = phi i64 [ %3, %0 ], [ %7, %5 ], [ %ret.0, %do_loop_readv_writev.exit ], [ %ret.0, %96 ], [ %ret.0, %103 ]
  %106 = load %struct.iovec** %iov, align 8
  %107 = icmp eq %struct.iovec* %106, %2
  br i1 %107, label %110, label %108

; <label>:108                                     ; preds = %file_end_write.exit
  %109 = bitcast %struct.iovec* %106 to i8*
  call void @kfree(i8* %109) #7
  br label %110

; <label>:110                                     ; preds = %108, %file_end_write.exit
  %111 = icmp eq i32 %type, 0
  %112 = zext i1 %111 to i64
  %113 = add i64 %ret.1, %112
  %114 = icmp sgt i64 %113, 0
  br i1 %114, label %115, label %fsnotify_access.exit

; <label>:115                                     ; preds = %110
  %116 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %117 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %118 = load %struct.inode** %117, align 8
  %119 = getelementptr inbounds %struct.inode* %118, i64 0, i32 0
  %120 = load i16* %119, align 2
  %121 = and i16 %120, -4096
  %122 = icmp eq i16 %121, 16384
  br i1 %111, label %123, label %134

; <label>:123                                     ; preds = %115
  %..i = select i1 %122, i32 1073741825, i32 1
  %124 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %125 = load i32* %124, align 4
  %126 = and i32 %125, 67108864
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %fsnotify_access.exit

; <label>:128                                     ; preds = %123
  %129 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %130 = load %struct.dentry** %129, align 8
  %131 = call i32 @__fsnotify_parent(%struct.path* %116, %struct.dentry* %130, i32 %..i) #7
  %132 = bitcast %struct.path* %116 to i8*
  %133 = call i32 @fsnotify(%struct.inode* %118, i32 %..i, i8* %132, i32 1, i8* null, i32 0) #7
  br label %fsnotify_access.exit

; <label>:134                                     ; preds = %115
  %..i7 = select i1 %122, i32 1073741826, i32 2
  %135 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %136 = load i32* %135, align 4
  %137 = and i32 %136, 67108864
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %fsnotify_access.exit

; <label>:139                                     ; preds = %134
  %140 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %141 = load %struct.dentry** %140, align 8
  %142 = call i32 @__fsnotify_parent(%struct.path* %116, %struct.dentry* %141, i32 %..i7) #7
  %143 = bitcast %struct.path* %116 to i8*
  %144 = call i32 @fsnotify(%struct.inode* %118, i32 %..i7, i8* %143, i32 1, i8* null, i32 0) #7
  br label %fsnotify_access.exit

fsnotify_access.exit:                             ; preds = %139, %134, %128, %123, %110
  call void @llvm.lifetime.end(i64 128, i8* %1) #4
  ret i64 %ret.1
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @vfs_writev(%struct.file* %file, %struct.iovec* %vec, i64 %vlen, i64* %pos) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %10, label %5

; <label>:5                                       ; preds = %0
  %6 = and i32 %2, 262144
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %10, label %8

; <label>:8                                       ; preds = %5
  %9 = tail call fastcc i64 @do_readv_writev(i32 1, %struct.file* %file, %struct.iovec* %vec, i64 %vlen, i64* %pos) #6
  br label %10

; <label>:10                                      ; preds = %8, %5, %0
  %.0 = phi i64 [ %9, %8 ], [ -9, %0 ], [ -22, %5 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define i64 @SyS_readv(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = trunc i64 %fd to i32
  %4 = call i64 @__fdget_pos(i32 %3) #7
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i = trunc i64 %4 to i32
  %7 = icmp eq i64 %5, 0
  br i1 %7, label %SYSC_readv.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.file* %6, i64 0, i32 9
  %10 = load i64* %9, align 8
  store i64 %10, i64* %pos.i, align 8
  %11 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %vfs_readv.exit.thread.i, label %15

; <label>:15                                      ; preds = %8
  %16 = and i32 %12, 131072
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %vfs_readv.exit.thread.i, label %vfs_readv.exit.i

vfs_readv.exit.i:                                 ; preds = %15
  %18 = call fastcc i64 @do_readv_writev(i32 0, %struct.file* %6, %struct.iovec* %1, i64 %vlen, i64* %pos.i) #7
  %19 = icmp sgt i64 %18, -1
  br i1 %19, label %20, label %vfs_readv.exit.thread.i

; <label>:20                                      ; preds = %vfs_readv.exit.i
  %21 = load i64* %pos.i, align 8
  store i64 %21, i64* %9, align 8
  br label %vfs_readv.exit.thread.i

vfs_readv.exit.thread.i:                          ; preds = %20, %vfs_readv.exit.i, %15, %8
  %.0.i1.i = phi i64 [ %18, %20 ], [ %18, %vfs_readv.exit.i ], [ -9, %8 ], [ -22, %15 ]
  %22 = and i32 %v.tr.i.i.i, 2
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %26, label %24

; <label>:24                                      ; preds = %vfs_readv.exit.thread.i
  %25 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %25) #7
  br label %26

; <label>:26                                      ; preds = %24, %vfs_readv.exit.thread.i
  %27 = and i32 %v.tr.i.i.i, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %fdput_pos.exit.i, label %29

; <label>:29                                      ; preds = %26
  call void @fput(%struct.file* %6) #7
  br label %fdput_pos.exit.i

fdput_pos.exit.i:                                 ; preds = %29, %26
  %30 = icmp sgt i64 %.0.i1.i, 0
  br i1 %30, label %31, label %SYSC_readv.exit

; <label>:31                                      ; preds = %fdput_pos.exit.i
  %32 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %33 = getelementptr inbounds %struct.task_struct* %32, i64 0, i32 113, i32 0
  %34 = load i64* %33, align 8
  %35 = add i64 %34, %.0.i1.i
  store i64 %35, i64* %33, align 8
  br label %SYSC_readv.exit

SYSC_readv.exit:                                  ; preds = %31, %fdput_pos.exit.i, %0
  %ret.02.i = phi i64 [ %.0.i1.i, %31 ], [ %.0.i1.i, %fdput_pos.exit.i ], [ -9, %0 ]
  %36 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %37 = getelementptr inbounds %struct.task_struct* %36, i64 0, i32 113, i32 2
  %38 = load i64* %37, align 8
  %39 = add i64 %38, 1
  store i64 %39, i64* %37, align 8
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.02.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_writev(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = trunc i64 %fd to i32
  %4 = call i64 @__fdget_pos(i32 %3) #7
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i = trunc i64 %4 to i32
  %7 = icmp eq i64 %5, 0
  br i1 %7, label %SYSC_writev.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.file* %6, i64 0, i32 9
  %10 = load i64* %9, align 8
  store i64 %10, i64* %pos.i, align 8
  %11 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %vfs_writev.exit.thread.i, label %15

; <label>:15                                      ; preds = %8
  %16 = and i32 %12, 262144
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %vfs_writev.exit.thread.i, label %vfs_writev.exit.i

vfs_writev.exit.i:                                ; preds = %15
  %18 = call fastcc i64 @do_readv_writev(i32 1, %struct.file* %6, %struct.iovec* %1, i64 %vlen, i64* %pos.i) #7
  %19 = icmp sgt i64 %18, -1
  br i1 %19, label %20, label %vfs_writev.exit.thread.i

; <label>:20                                      ; preds = %vfs_writev.exit.i
  %21 = load i64* %pos.i, align 8
  store i64 %21, i64* %9, align 8
  br label %vfs_writev.exit.thread.i

vfs_writev.exit.thread.i:                         ; preds = %20, %vfs_writev.exit.i, %15, %8
  %.0.i1.i = phi i64 [ %18, %20 ], [ %18, %vfs_writev.exit.i ], [ -9, %8 ], [ -22, %15 ]
  %22 = and i32 %v.tr.i.i.i, 2
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %26, label %24

; <label>:24                                      ; preds = %vfs_writev.exit.thread.i
  %25 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %25) #7
  br label %26

; <label>:26                                      ; preds = %24, %vfs_writev.exit.thread.i
  %27 = and i32 %v.tr.i.i.i, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %fdput_pos.exit.i, label %29

; <label>:29                                      ; preds = %26
  call void @fput(%struct.file* %6) #7
  br label %fdput_pos.exit.i

fdput_pos.exit.i:                                 ; preds = %29, %26
  %30 = icmp sgt i64 %.0.i1.i, 0
  br i1 %30, label %31, label %SYSC_writev.exit

; <label>:31                                      ; preds = %fdput_pos.exit.i
  %32 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %33 = getelementptr inbounds %struct.task_struct* %32, i64 0, i32 113, i32 1
  %34 = load i64* %33, align 8
  %35 = add i64 %34, %.0.i1.i
  store i64 %35, i64* %33, align 8
  br label %SYSC_writev.exit

SYSC_writev.exit:                                 ; preds = %31, %fdput_pos.exit.i, %0
  %ret.02.i = phi i64 [ %.0.i1.i, %31 ], [ %.0.i1.i, %fdput_pos.exit.i ], [ -9, %0 ]
  %36 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %37 = getelementptr inbounds %struct.task_struct* %36, i64 0, i32 113, i32 3
  %38 = load i64* %37, align 8
  %39 = add i64 %38, 1
  store i64 %39, i64* %37, align 8
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.02.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_preadv(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_l, i64 %pos_h) #0 {
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  store i64 %pos_l, i64* %pos.i, align 8
  %3 = icmp slt i64 %pos_l, 0
  br i1 %3, label %SYSC_preadv.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = trunc i64 %fd to i32
  %6 = call i64 @__fdget(i32 %5) #7
  %7 = and i64 %6, -4
  %8 = inttoptr i64 %7 to %struct.file*
  %9 = icmp eq i64 %7, 0
  br i1 %9, label %fdput.exit.thread.i, label %10

; <label>:10                                      ; preds = %4
  %11 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %vfs_readv.exit.i, label %15

; <label>:15                                      ; preds = %10
  %16 = and i32 %12, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %vfs_readv.exit.i, label %18

; <label>:18                                      ; preds = %15
  %19 = and i32 %12, 131072
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %vfs_readv.exit.i, label %21

; <label>:21                                      ; preds = %18
  %22 = call fastcc i64 @do_readv_writev(i32 0, %struct.file* %8, %struct.iovec* %1, i64 %vlen, i64* %pos.i) #7
  br label %vfs_readv.exit.i

vfs_readv.exit.i:                                 ; preds = %21, %18, %15, %10
  %ret.0.i = phi i64 [ -29, %10 ], [ %22, %21 ], [ -9, %15 ], [ -22, %18 ]
  %23 = and i64 %6, 1
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %fdput.exit.i, label %25

; <label>:25                                      ; preds = %vfs_readv.exit.i
  call void @fput(%struct.file* %8) #7
  br label %fdput.exit.i

fdput.exit.i:                                     ; preds = %25, %vfs_readv.exit.i
  %26 = icmp sgt i64 %ret.0.i, 0
  br i1 %26, label %27, label %fdput.exit.thread.i

; <label>:27                                      ; preds = %fdput.exit.i
  %28 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %29 = getelementptr inbounds %struct.task_struct* %28, i64 0, i32 113, i32 0
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %ret.0.i
  store i64 %31, i64* %29, align 8
  br label %fdput.exit.thread.i

fdput.exit.thread.i:                              ; preds = %27, %fdput.exit.i, %4
  %ret.11.i = phi i64 [ %ret.0.i, %27 ], [ %ret.0.i, %fdput.exit.i ], [ -9, %4 ]
  %32 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %33 = getelementptr inbounds %struct.task_struct* %32, i64 0, i32 113, i32 2
  %34 = load i64* %33, align 8
  %35 = add i64 %34, 1
  store i64 %35, i64* %33, align 8
  br label %SYSC_preadv.exit

SYSC_preadv.exit:                                 ; preds = %fdput.exit.thread.i, %0
  %.0.i = phi i64 [ %ret.11.i, %fdput.exit.thread.i ], [ -22, %0 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_pwritev(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_l, i64 %pos_h) #0 {
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  store i64 %pos_l, i64* %pos.i, align 8
  %3 = icmp slt i64 %pos_l, 0
  br i1 %3, label %SYSC_pwritev.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = trunc i64 %fd to i32
  %6 = call i64 @__fdget(i32 %5) #7
  %7 = and i64 %6, -4
  %8 = inttoptr i64 %7 to %struct.file*
  %9 = icmp eq i64 %7, 0
  br i1 %9, label %fdput.exit.thread.i, label %10

; <label>:10                                      ; preds = %4
  %11 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 16
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %vfs_writev.exit.i, label %15

; <label>:15                                      ; preds = %10
  %16 = and i32 %12, 2
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %vfs_writev.exit.i, label %18

; <label>:18                                      ; preds = %15
  %19 = and i32 %12, 262144
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %vfs_writev.exit.i, label %21

; <label>:21                                      ; preds = %18
  %22 = call fastcc i64 @do_readv_writev(i32 1, %struct.file* %8, %struct.iovec* %1, i64 %vlen, i64* %pos.i) #7
  br label %vfs_writev.exit.i

vfs_writev.exit.i:                                ; preds = %21, %18, %15, %10
  %ret.0.i = phi i64 [ -29, %10 ], [ %22, %21 ], [ -9, %15 ], [ -22, %18 ]
  %23 = and i64 %6, 1
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %fdput.exit.i, label %25

; <label>:25                                      ; preds = %vfs_writev.exit.i
  call void @fput(%struct.file* %8) #7
  br label %fdput.exit.i

fdput.exit.i:                                     ; preds = %25, %vfs_writev.exit.i
  %26 = icmp sgt i64 %ret.0.i, 0
  br i1 %26, label %27, label %fdput.exit.thread.i

; <label>:27                                      ; preds = %fdput.exit.i
  %28 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %29 = getelementptr inbounds %struct.task_struct* %28, i64 0, i32 113, i32 1
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %ret.0.i
  store i64 %31, i64* %29, align 8
  br label %fdput.exit.thread.i

fdput.exit.thread.i:                              ; preds = %27, %fdput.exit.i, %4
  %ret.11.i = phi i64 [ %ret.0.i, %27 ], [ %ret.0.i, %fdput.exit.i ], [ -9, %4 ]
  %32 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %33 = getelementptr inbounds %struct.task_struct* %32, i64 0, i32 113, i32 3
  %34 = load i64* %33, align 8
  %35 = add i64 %34, 1
  store i64 %35, i64* %33, align 8
  br label %SYSC_pwritev.exit

SYSC_pwritev.exit:                                ; preds = %fdput.exit.thread.i, %0
  %.0.i = phi i64 [ %ret.11.i, %fdput.exit.thread.i ], [ -22, %0 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_readv(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  %4 = call i64 @__fdget_pos(i32 %1) #7
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i = trunc i64 %4 to i32
  %7 = icmp eq i64 %5, 0
  br i1 %7, label %C_SYSC_readv.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.file* %6, i64 0, i32 9
  %10 = load i64* %9, align 8
  store i64 %10, i64* %pos.i, align 8
  %11 = and i64 %vlen, 4294967295
  %12 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %compat_readv.exit.i, label %16

; <label>:16                                      ; preds = %8
  %17 = and i32 %13, 131072
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %compat_readv.exit.i, label %19

; <label>:19                                      ; preds = %16
  %20 = call fastcc i64 @compat_do_readv_writev(i32 0, %struct.file* %6, %struct.compat_iovec* %2, i64 %11, i64* %pos.i) #7
  %21 = icmp sgt i64 %20, 0
  br i1 %21, label %22, label %compat_readv.exit.i

; <label>:22                                      ; preds = %19
  %23 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %24 = getelementptr inbounds %struct.task_struct* %23, i64 0, i32 113, i32 0
  %25 = load i64* %24, align 8
  %26 = add i64 %25, %20
  store i64 %26, i64* %24, align 8
  br label %compat_readv.exit.i

compat_readv.exit.i:                              ; preds = %22, %19, %16, %8
  %ret.01.i.i = phi i64 [ %20, %22 ], [ %20, %19 ], [ -22, %16 ], [ -9, %8 ]
  %27 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %28 = getelementptr inbounds %struct.task_struct* %27, i64 0, i32 113, i32 2
  %29 = load i64* %28, align 8
  %30 = add i64 %29, 1
  store i64 %30, i64* %28, align 8
  %31 = icmp sgt i64 %ret.01.i.i, -1
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %compat_readv.exit.i
  %33 = load i64* %pos.i, align 8
  store i64 %33, i64* %9, align 8
  br label %34

; <label>:34                                      ; preds = %32, %compat_readv.exit.i
  %35 = and i32 %v.tr.i.i.i, 2
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %39, label %37

; <label>:37                                      ; preds = %34
  %38 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %38) #7
  br label %39

; <label>:39                                      ; preds = %37, %34
  %40 = and i32 %v.tr.i.i.i, 1
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %C_SYSC_readv.exit, label %42

; <label>:42                                      ; preds = %39
  call void @fput(%struct.file* %6) #7
  br label %C_SYSC_readv.exit

C_SYSC_readv.exit:                                ; preds = %42, %39, %0
  %.0.i = phi i64 [ -9, %0 ], [ %ret.01.i.i, %39 ], [ %ret.01.i.i, %42 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_preadv64(i64 %fd, i64 %vec, i64 %vlen, i64 %pos) #0 {
  %1 = inttoptr i64 %vec to %struct.compat_iovec*
  %2 = tail call fastcc i64 @__compat_sys_preadv64(i64 %fd, %struct.compat_iovec* %1, i64 %vlen, i64 %pos) #7
  ret i64 %2
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_preadv(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_low, i64 %pos_high) #0 {
  %1 = inttoptr i64 %vec to %struct.compat_iovec*
  %2 = shl i64 %pos_high, 32
  %3 = and i64 %pos_low, 4294967295
  %4 = or i64 %2, %3
  %5 = and i64 %fd, 4294967295
  %6 = and i64 %vlen, 4294967295
  %7 = tail call fastcc i64 @__compat_sys_preadv64(i64 %5, %struct.compat_iovec* %1, i64 %6, i64 %4) #7
  ret i64 %7
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_writev(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  %4 = call i64 @__fdget_pos(i32 %1) #7
  %5 = and i64 %4, -4
  %6 = inttoptr i64 %5 to %struct.file*
  %v.tr.i.i.i = trunc i64 %4 to i32
  %7 = icmp eq i64 %5, 0
  br i1 %7, label %C_SYSC_writev.exit, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.file* %6, i64 0, i32 9
  %10 = load i64* %9, align 8
  store i64 %10, i64* %pos.i, align 8
  %11 = and i64 %vlen, 4294967295
  %12 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %compat_writev.exit.i, label %16

; <label>:16                                      ; preds = %8
  %17 = and i32 %13, 262144
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %compat_writev.exit.i, label %19

; <label>:19                                      ; preds = %16
  %20 = call fastcc i64 @compat_do_readv_writev(i32 1, %struct.file* %6, %struct.compat_iovec* %2, i64 %11, i64* %pos.i) #7
  %21 = icmp sgt i64 %20, 0
  br i1 %21, label %22, label %compat_writev.exit.i

; <label>:22                                      ; preds = %19
  %23 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %24 = getelementptr inbounds %struct.task_struct* %23, i64 0, i32 113, i32 1
  %25 = load i64* %24, align 8
  %26 = add i64 %25, %20
  store i64 %26, i64* %24, align 8
  br label %compat_writev.exit.i

compat_writev.exit.i:                             ; preds = %22, %19, %16, %8
  %ret.01.i.i = phi i64 [ %20, %22 ], [ %20, %19 ], [ -22, %16 ], [ -9, %8 ]
  %27 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %28 = getelementptr inbounds %struct.task_struct* %27, i64 0, i32 113, i32 3
  %29 = load i64* %28, align 8
  %30 = add i64 %29, 1
  store i64 %30, i64* %28, align 8
  %31 = icmp sgt i64 %ret.01.i.i, -1
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %compat_writev.exit.i
  %33 = load i64* %pos.i, align 8
  store i64 %33, i64* %9, align 8
  br label %34

; <label>:34                                      ; preds = %32, %compat_writev.exit.i
  %35 = and i32 %v.tr.i.i.i, 2
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %39, label %37

; <label>:37                                      ; preds = %34
  %38 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %38) #7
  br label %39

; <label>:39                                      ; preds = %37, %34
  %40 = and i32 %v.tr.i.i.i, 1
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %C_SYSC_writev.exit, label %42

; <label>:42                                      ; preds = %39
  call void @fput(%struct.file* %6) #7
  br label %C_SYSC_writev.exit

C_SYSC_writev.exit:                               ; preds = %42, %39, %0
  %.0.i = phi i64 [ -9, %0 ], [ %ret.01.i.i, %39 ], [ %ret.01.i.i, %42 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_pwritev64(i64 %fd, i64 %vec, i64 %vlen, i64 %pos) #0 {
  %1 = inttoptr i64 %vec to %struct.compat_iovec*
  %2 = tail call fastcc i64 @__compat_sys_pwritev64(i64 %fd, %struct.compat_iovec* %1, i64 %vlen, i64 %pos) #7
  ret i64 %2
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_pwritev(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_low, i64 %pos_high) #0 {
  %1 = inttoptr i64 %vec to %struct.compat_iovec*
  %2 = shl i64 %pos_high, 32
  %3 = and i64 %pos_low, 4294967295
  %4 = or i64 %2, %3
  %5 = and i64 %fd, 4294967295
  %6 = and i64 %vlen, 4294967295
  %7 = tail call fastcc i64 @__compat_sys_pwritev64(i64 %5, %struct.compat_iovec* %1, i64 %6, i64 %4) #7
  ret i64 %7
}

; Function Attrs: noredzone nounwind
define i64 @SyS_sendfile(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i64*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %19, label %6

; <label>:6                                       ; preds = %0
  %7 = call { i64*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i64* %3, i64 8) #4, !srcloc !6
  %8 = extractvalue { i64*, i64 } %7, 0
  %9 = ptrtoint i64* %8 to i64
  %10 = trunc i64 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %SYSC_sendfile.exit, !prof !7

; <label>:12                                      ; preds = %6
  %13 = extractvalue { i64*, i64 } %7, 1
  store i64 %13, i64* %pos.i, align 8
  %14 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* %pos.i, i64 %count, i64 2147483647) #7
  %15 = load i64* %pos.i, align 8
  %16 = call i64 asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i64 %15, i64* %3) #4, !srcloc !8
  %17 = trunc i64 %16 to i32
  %18 = icmp eq i32 %17, 0
  %..i = select i1 %18, i64 %14, i64 -14
  br label %SYSC_sendfile.exit

; <label>:19                                      ; preds = %0
  %20 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* null, i64 %count, i64 0) #7
  br label %SYSC_sendfile.exit

SYSC_sendfile.exit:                               ; preds = %19, %12, %6
  %.0.i = phi i64 [ %20, %19 ], [ -14, %6 ], [ %..i, %12 ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @SyS_sendfile64(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i64*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %15, label %copy_from_user.exit.i

copy_from_user.exit.i:                            ; preds = %0
  %6 = inttoptr i64 %offset to i8*
  %7 = call i64 @_copy_from_user(i8* %4, i8* %6, i32 8) #7
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %SYSC_sendfile64.exit, !prof !7

; <label>:9                                       ; preds = %copy_from_user.exit.i
  %10 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* %pos.i, i64 %count, i64 0) #7
  %11 = load i64* %pos.i, align 8
  %12 = call i64 asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i64 %11, i64* %3) #4, !srcloc !9
  %13 = trunc i64 %12 to i32
  %14 = icmp eq i32 %13, 0
  %..i = select i1 %14, i64 %10, i64 -14
  br label %SYSC_sendfile64.exit

; <label>:15                                      ; preds = %0
  %16 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* null, i64 %count, i64 0) #7
  br label %SYSC_sendfile64.exit

SYSC_sendfile64.exit:                             ; preds = %15, %9, %copy_from_user.exit.i
  %.0.i = phi i64 [ %16, %15 ], [ -14, %copy_from_user.exit.i ], [ %..i, %9 ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_sendfile(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i32*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %21, label %6

; <label>:6                                       ; preds = %0
  %7 = call { i32*, i64 } asm sideeffect "call __get_user_${3:P}", "={ax},={rdx},0,i,~{dirflag},~{fpsr},~{flags}"(i32* %3, i64 4) #4, !srcloc !10
  %8 = extractvalue { i32*, i64 } %7, 0
  %9 = ptrtoint i32* %8 to i64
  %10 = trunc i64 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %C_SYSC_sendfile.exit, !prof !7

; <label>:12                                      ; preds = %6
  %13 = extractvalue { i32*, i64 } %7, 1
  %sext.i = shl i64 %13, 32
  %14 = ashr exact i64 %sext.i, 32
  store i64 %14, i64* %pos.i, align 8
  %15 = and i64 %count, 4294967295
  %16 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* %pos.i, i64 %15, i64 2147483647) #7
  %17 = load i64* %pos.i, align 8
  %18 = trunc i64 %17 to i32
  %19 = call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %18, i32* %3) #4, !srcloc !11
  %20 = icmp eq i32 %19, 0
  %..i = select i1 %20, i64 %16, i64 -14
  br label %C_SYSC_sendfile.exit

; <label>:21                                      ; preds = %0
  %22 = and i64 %count, 4294967295
  %23 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* null, i64 %22, i64 0) #7
  br label %C_SYSC_sendfile.exit

C_SYSC_sendfile.exit:                             ; preds = %21, %12, %6
  %.0.i = phi i64 [ %23, %21 ], [ -14, %6 ], [ %..i, %12 ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define i64 @compat_SyS_sendfile64(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i64*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %16, label %copy_from_user.exit.i

copy_from_user.exit.i:                            ; preds = %0
  %6 = inttoptr i64 %offset to i8*
  %7 = call i64 @_copy_from_user(i8* %4, i8* %6, i32 8) #7
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %C_SYSC_sendfile64.exit, !prof !7

; <label>:9                                       ; preds = %copy_from_user.exit.i
  %10 = and i64 %count, 4294967295
  %11 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* %pos.i, i64 %10, i64 0) #7
  %12 = load i64* %pos.i, align 8
  %13 = call i64 asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i64 %12, i64* %3) #4, !srcloc !12
  %14 = trunc i64 %13 to i32
  %15 = icmp eq i32 %14, 0
  %..i = select i1 %15, i64 %11, i64 -14
  br label %C_SYSC_sendfile64.exit

; <label>:16                                      ; preds = %0
  %17 = and i64 %count, 4294967295
  %18 = call fastcc i64 @do_sendfile(i32 %1, i32 %2, i64* null, i64 %17, i64 0) #7
  br label %C_SYSC_sendfile64.exit

C_SYSC_sendfile64.exit:                           ; preds = %16, %9, %copy_from_user.exit.i
  %.0.i = phi i64 [ %18, %16 ], [ -14, %copy_from_user.exit.i ], [ %..i, %9 ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @do_sendfile(i32 %out_fd, i32 %in_fd, i64* %ppos, i64 %count, i64 %max) #0 {
  %pos = alloca i64, align 8
  %out_pos = alloca i64, align 8
  %1 = call i64 @__fdget(i32 %in_fd) #7
  %2 = and i64 %1, -4
  %3 = inttoptr i64 %2 to %struct.file*
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %fdput.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.file* %3, i64 0, i32 7
  %7 = load i32* %6, align 4
  %8 = and i32 %7, 1
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %fdput.exit6, label %10

; <label>:10                                      ; preds = %5
  %11 = icmp ne i64* %ppos, null
  br i1 %11, label %15, label %12

; <label>:12                                      ; preds = %10
  %13 = getelementptr inbounds %struct.file* %3, i64 0, i32 9
  %14 = load i64* %13, align 8
  store i64 %14, i64* %pos, align 8
  br label %20

; <label>:15                                      ; preds = %10
  %16 = load i64* %ppos, align 8
  store i64 %16, i64* %pos, align 8
  %17 = load i32* %6, align 4
  %18 = and i32 %17, 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %fdput.exit6, label %20

; <label>:20                                      ; preds = %15, %12
  %21 = phi i64 [ %16, %15 ], [ %14, %12 ]
  %22 = call i32 @rw_verify_area(i32 0, %struct.file* %3, i64* %pos, i64 %count) #6
  %23 = sext i32 %22 to i64
  %24 = icmp slt i32 %22, 0
  br i1 %24, label %fdput.exit6, label %25

; <label>:25                                      ; preds = %20
  %26 = call i64 @__fdget(i32 %out_fd) #7
  %27 = and i64 %26, -4
  %28 = inttoptr i64 %27 to %struct.file*
  %29 = icmp eq i64 %27, 0
  br i1 %29, label %fdput.exit6, label %30

; <label>:30                                      ; preds = %25
  %31 = getelementptr inbounds %struct.file* %28, i64 0, i32 7
  %32 = load i32* %31, align 4
  %33 = and i32 %32, 2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %140, label %35

; <label>:35                                      ; preds = %30
  %36 = getelementptr inbounds %struct.file* %3, i64 0, i32 2
  %37 = load %struct.inode** %36, align 8
  %38 = getelementptr inbounds %struct.file* %28, i64 0, i32 2
  %39 = load %struct.inode** %38, align 8
  %40 = getelementptr inbounds %struct.file* %28, i64 0, i32 9
  %41 = load i64* %40, align 8
  store i64 %41, i64* %out_pos, align 8
  %42 = call i32 @rw_verify_area(i32 1, %struct.file* %28, i64* %out_pos, i64 %23) #6
  %43 = sext i32 %42 to i64
  %44 = icmp slt i32 %42, 0
  br i1 %44, label %140, label %45

; <label>:45                                      ; preds = %35
  %46 = icmp eq i64 %max, 0
  br i1 %46, label %47, label %58

; <label>:47                                      ; preds = %45
  %48 = getelementptr inbounds %struct.inode* %37, i64 0, i32 8
  %49 = load %struct.super_block** %48, align 8
  %50 = getelementptr inbounds %struct.super_block* %49, i64 0, i32 4
  %51 = load i64* %50, align 8
  %52 = getelementptr inbounds %struct.inode* %39, i64 0, i32 8
  %53 = load %struct.super_block** %52, align 8
  %54 = getelementptr inbounds %struct.super_block* %53, i64 0, i32 4
  %55 = load i64* %54, align 8
  %56 = icmp slt i64 %51, %55
  %57 = select i1 %56, i64 %51, i64 %55
  br label %58

; <label>:58                                      ; preds = %47, %45
  %.04 = phi i64 [ %max, %45 ], [ %57, %47 ]
  %59 = add i64 %21, %43
  %60 = icmp ugt i64 %59, %.04
  br i1 %60, label %61, label %65, !prof !4

; <label>:61                                      ; preds = %58
  %62 = icmp sgt i64 %.04, %21
  br i1 %62, label %63, label %140

; <label>:63                                      ; preds = %61
  %64 = sub i64 %.04, %21
  br label %65

; <label>:65                                      ; preds = %63, %58
  %.0 = phi i64 [ %64, %63 ], [ %43, %58 ]
  %66 = load %struct.inode** %38, align 8
  %67 = getelementptr inbounds %struct.inode* %66, i64 0, i32 0
  %68 = load i16* %67, align 2
  %69 = and i16 %68, -4096
  %70 = icmp eq i16 %69, -32768
  br i1 %70, label %71, label %file_start_write.exit

; <label>:71                                      ; preds = %65
  %72 = getelementptr inbounds %struct.inode* %66, i64 0, i32 8
  %73 = load %struct.super_block** %72, align 8
  %74 = call i32 @__sb_start_write(%struct.super_block* %73, i32 1, i1 zeroext true) #7
  br label %file_start_write.exit

file_start_write.exit:                            ; preds = %71, %65
  %75 = call i64 @do_splice_direct(%struct.file* %3, i64* %pos, %struct.file* %28, i64* %out_pos, i64 %.0, i32 0) #7
  %76 = load %struct.inode** %38, align 8
  %77 = getelementptr inbounds %struct.inode* %76, i64 0, i32 0
  %78 = load i16* %77, align 2
  %79 = and i16 %78, -4096
  %80 = icmp eq i16 %79, -32768
  br i1 %80, label %81, label %file_end_write.exit

; <label>:81                                      ; preds = %file_start_write.exit
  %82 = getelementptr inbounds %struct.inode* %76, i64 0, i32 8
  %83 = load %struct.super_block** %82, align 8
  call void @__sb_end_write(%struct.super_block* %83, i32 1) #7
  br label %file_end_write.exit

file_end_write.exit:                              ; preds = %81, %file_start_write.exit
  %84 = icmp sgt i64 %75, 0
  br i1 %84, label %85, label %129

; <label>:85                                      ; preds = %file_end_write.exit
  %86 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %87 = getelementptr inbounds %struct.task_struct* %86, i64 0, i32 113, i32 0
  %88 = load i64* %87, align 8
  %89 = add i64 %88, %75
  store i64 %89, i64* %87, align 8
  %90 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %91 = getelementptr inbounds %struct.task_struct* %90, i64 0, i32 113, i32 1
  %92 = load i64* %91, align 8
  %93 = add i64 %92, %75
  store i64 %93, i64* %91, align 8
  %94 = getelementptr inbounds %struct.file* %3, i64 0, i32 1
  %95 = load %struct.inode** %36, align 8
  %96 = getelementptr inbounds %struct.inode* %95, i64 0, i32 0
  %97 = load i16* %96, align 2
  %98 = and i16 %97, -4096
  %99 = icmp eq i16 %98, 16384
  %..i = select i1 %99, i32 1073741825, i32 1
  %100 = load i32* %6, align 4
  %101 = and i32 %100, 67108864
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %fsnotify_access.exit

; <label>:103                                     ; preds = %85
  %104 = getelementptr inbounds %struct.file* %3, i64 0, i32 1, i32 1
  %105 = load %struct.dentry** %104, align 8
  %106 = call i32 @__fsnotify_parent(%struct.path* %94, %struct.dentry* %105, i32 %..i) #7
  %107 = bitcast %struct.path* %94 to i8*
  %108 = call i32 @fsnotify(%struct.inode* %95, i32 %..i, i8* %107, i32 1, i8* null, i32 0) #7
  br label %fsnotify_access.exit

fsnotify_access.exit:                             ; preds = %103, %85
  %109 = getelementptr inbounds %struct.file* %28, i64 0, i32 1
  %110 = load %struct.inode** %38, align 8
  %111 = getelementptr inbounds %struct.inode* %110, i64 0, i32 0
  %112 = load i16* %111, align 2
  %113 = and i16 %112, -4096
  %114 = icmp eq i16 %113, 16384
  %..i7 = select i1 %114, i32 1073741826, i32 2
  %115 = load i32* %31, align 4
  %116 = and i32 %115, 67108864
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %fsnotify_modify.exit

; <label>:118                                     ; preds = %fsnotify_access.exit
  %119 = getelementptr inbounds %struct.file* %28, i64 0, i32 1, i32 1
  %120 = load %struct.dentry** %119, align 8
  %121 = call i32 @__fsnotify_parent(%struct.path* %109, %struct.dentry* %120, i32 %..i7) #7
  %122 = bitcast %struct.path* %109 to i8*
  %123 = call i32 @fsnotify(%struct.inode* %110, i32 %..i7, i8* %122, i32 1, i8* null, i32 0) #7
  br label %fsnotify_modify.exit

fsnotify_modify.exit:                             ; preds = %118, %fsnotify_access.exit
  %124 = load i64* %out_pos, align 8
  store i64 %124, i64* %40, align 8
  %125 = load i64* %pos, align 8
  br i1 %11, label %126, label %127

; <label>:126                                     ; preds = %fsnotify_modify.exit
  store i64 %125, i64* %ppos, align 8
  br label %129

; <label>:127                                     ; preds = %fsnotify_modify.exit
  %128 = getelementptr inbounds %struct.file* %3, i64 0, i32 9
  store i64 %125, i64* %128, align 8
  br label %129

; <label>:129                                     ; preds = %127, %126, %file_end_write.exit
  %130 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %131 = getelementptr inbounds %struct.task_struct* %130, i64 0, i32 113, i32 2
  %132 = load i64* %131, align 8
  %133 = add i64 %132, 1
  store i64 %133, i64* %131, align 8
  %134 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %135 = getelementptr inbounds %struct.task_struct* %134, i64 0, i32 113, i32 3
  %136 = load i64* %135, align 8
  %137 = add i64 %136, 1
  store i64 %137, i64* %135, align 8
  %138 = load i64* %pos, align 8
  %139 = icmp sgt i64 %138, %.04
  %. = select i1 %139, i64 -75, i64 %75
  br label %140

; <label>:140                                     ; preds = %129, %61, %35, %30
  %retval.0 = phi i64 [ %43, %35 ], [ -75, %61 ], [ -9, %30 ], [ %., %129 ]
  %141 = and i64 %26, 1
  %142 = icmp eq i64 %141, 0
  br i1 %142, label %fdput.exit6, label %143

; <label>:143                                     ; preds = %140
  call void @fput(%struct.file* %28) #7
  br label %fdput.exit6

fdput.exit6:                                      ; preds = %143, %140, %25, %20, %15, %5
  %retval.1 = phi i64 [ %23, %20 ], [ -9, %25 ], [ -29, %15 ], [ -9, %5 ], [ %retval.0, %140 ], [ %retval.0, %143 ]
  %144 = and i64 %1, 1
  %145 = icmp eq i64 %144, 0
  br i1 %145, label %fdput.exit, label %146

; <label>:146                                     ; preds = %fdput.exit6
  call void @fput(%struct.file* %3) #7
  br label %fdput.exit

fdput.exit:                                       ; preds = %146, %fdput.exit6, %0
  %retval.2 = phi i64 [ -9, %0 ], [ %retval.1, %fdput.exit6 ], [ %retval.1, %146 ]
  ret i64 %retval.2
}

; Function Attrs: noredzone
declare i64 @do_splice_direct(%struct.file*, i64*, %struct.file*, i64*, i64, i32) #1

; Function Attrs: noredzone
declare void @fput(%struct.file*) #1

; Function Attrs: noredzone
declare i64 @__fdget(i32) #1

; Function Attrs: noredzone nounwind
define internal fastcc i64 @__compat_sys_pwritev64(i64 %fd, %struct.compat_iovec* %vec, i64 %vlen, i64 %pos) #0 {
  %1 = alloca i64, align 8
  store i64 %pos, i64* %1, align 8
  %2 = icmp slt i64 %pos, 0
  br i1 %2, label %fdput.exit, label %3

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %fd to i32
  %5 = call i64 @__fdget(i32 %4) #7
  %6 = and i64 %5, -4
  %7 = inttoptr i64 %6 to %struct.file*
  %8 = icmp eq i64 %6, 0
  br i1 %8, label %fdput.exit, label %9

; <label>:9                                       ; preds = %3
  %10 = getelementptr inbounds %struct.file* %7, i64 0, i32 7
  %11 = load i32* %10, align 4
  %12 = and i32 %11, 16
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %32, label %14

; <label>:14                                      ; preds = %9
  %15 = and i32 %11, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %compat_writev.exit, label %17

; <label>:17                                      ; preds = %14
  %18 = and i32 %11, 262144
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %compat_writev.exit, label %20

; <label>:20                                      ; preds = %17
  %21 = call fastcc i64 @compat_do_readv_writev(i32 1, %struct.file* %7, %struct.compat_iovec* %vec, i64 %vlen, i64* %1) #7
  %22 = icmp sgt i64 %21, 0
  br i1 %22, label %23, label %compat_writev.exit

; <label>:23                                      ; preds = %20
  %24 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %25 = getelementptr inbounds %struct.task_struct* %24, i64 0, i32 113, i32 1
  %26 = load i64* %25, align 8
  %27 = add i64 %26, %21
  store i64 %27, i64* %25, align 8
  br label %compat_writev.exit

compat_writev.exit:                               ; preds = %23, %20, %17, %14
  %ret.01.i = phi i64 [ %21, %23 ], [ %21, %20 ], [ -22, %17 ], [ -9, %14 ]
  %28 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %29 = getelementptr inbounds %struct.task_struct* %28, i64 0, i32 113, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, 1
  store i64 %31, i64* %29, align 8
  br label %32

; <label>:32                                      ; preds = %compat_writev.exit, %9
  %ret.0 = phi i64 [ %ret.01.i, %compat_writev.exit ], [ -29, %9 ]
  %33 = and i64 %5, 1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %fdput.exit, label %35

; <label>:35                                      ; preds = %32
  call void @fput(%struct.file* %7) #7
  br label %fdput.exit

fdput.exit:                                       ; preds = %35, %32, %3, %0
  %.0 = phi i64 [ -22, %0 ], [ -9, %3 ], [ %ret.0, %32 ], [ %ret.0, %35 ]
  ret i64 %.0
}

; Function Attrs: noredzone nounwind
define internal fastcc i64 @compat_do_readv_writev(i32 %type, %struct.file* %file, %struct.compat_iovec* %uvector, i64 %nr_segs, i64* %pos) #0 {
  %.sroa.3.i.i1 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2 = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3 = alloca %struct.kiocb, align 8
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i = alloca %struct.kiocb, align 8
  %iter.i = alloca %struct.iov_iter, align 8
  %iovstack = alloca [8 x %struct.iovec], align 16
  %iov = alloca %struct.iovec*, align 8
  %1 = bitcast [8 x %struct.iovec]* %iovstack to i8*
  call void @llvm.lifetime.start(i64 128, i8* %1) #4
  %2 = getelementptr inbounds [8 x %struct.iovec]* %iovstack, i64 0, i64 0
  store %struct.iovec* %2, %struct.iovec** %iov, align 8
  %3 = call i64 @compat_rw_copy_check_uvector(i32 %type, %struct.compat_iovec* %uvector, i64 %nr_segs, i64 8, %struct.iovec* %2, %struct.iovec** %iov) #7
  %4 = icmp slt i64 %3, 1
  br i1 %4, label %file_end_write.exit, label %5

; <label>:5                                       ; preds = %0
  %sext = shl i64 %3, 32
  %6 = ashr exact i64 %sext, 32
  %7 = call i32 @rw_verify_area(i32 %type, %struct.file* %file, i64* %pos, i64 %6) #6
  %8 = sext i32 %7 to i64
  %9 = icmp slt i32 %7, 0
  br i1 %9, label %file_end_write.exit, label %10

; <label>:10                                      ; preds = %5
  %11 = icmp eq i32 %type, 0
  %12 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %13 = load %struct.file_operations** %12, align 8
  br i1 %11, label %14, label %21

; <label>:14                                      ; preds = %10
  %15 = getelementptr inbounds %struct.file_operations* %13, i64 0, i32 2
  %16 = load i64 (%struct.file*, i8*, i64, i64*)** %15, align 8
  %17 = getelementptr inbounds %struct.file_operations* %13, i64 0, i32 4
  %18 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %17, align 8
  %19 = getelementptr inbounds %struct.file_operations* %13, i64 0, i32 6
  %20 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %19, align 8
  br label %file_start_write.exit

; <label>:21                                      ; preds = %10
  %22 = getelementptr inbounds %struct.file_operations* %13, i64 0, i32 3
  %23 = load i64 (%struct.file*, i8*, i64, i64*)** %22, align 8
  %24 = getelementptr inbounds %struct.file_operations* %13, i64 0, i32 5
  %25 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %24, align 8
  %26 = getelementptr inbounds %struct.file_operations* %13, i64 0, i32 7
  %27 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %26, align 8
  %28 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %29 = load %struct.inode** %28, align 8
  %30 = getelementptr inbounds %struct.inode* %29, i64 0, i32 0
  %31 = load i16* %30, align 2
  %32 = and i16 %31, -4096
  %33 = icmp eq i16 %32, -32768
  br i1 %33, label %34, label %file_start_write.exit

; <label>:34                                      ; preds = %21
  %35 = getelementptr inbounds %struct.inode* %29, i64 0, i32 8
  %36 = load %struct.super_block** %35, align 8
  %37 = call i32 @__sb_start_write(%struct.super_block* %36, i32 1, i1 zeroext true) #7
  br label %file_start_write.exit

file_start_write.exit:                            ; preds = %34, %21, %14
  %fn.0 = phi i64 (%struct.file*, i8*, i64, i64*)* [ %16, %14 ], [ %23, %21 ], [ %23, %34 ]
  %fnv.0 = phi i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* [ %18, %14 ], [ %25, %21 ], [ %25, %34 ]
  %iter_fn.0 = phi i64 (%struct.kiocb*, %struct.iov_iter*)* [ %20, %14 ], [ %27, %21 ], [ %27, %34 ]
  %38 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %iter_fn.0, null
  br i1 %38, label %60, label %39

; <label>:39                                      ; preds = %file_start_write.exit
  %40 = load %struct.iovec** %iov, align 8
  %41 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %41) #4
  %42 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %42) #4
  %43 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %43)
  %44 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %44)
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %44, i8 0, i64 48, i32 8, i1 false)
  %45 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %46 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %46, align 8
  %47 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 1
  %48 = bitcast %struct.kioctx** %47 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %48, i8* %43, i64 24, i32 8, i1 false) #4
  %49 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %45 to i8*
  store i8* %.c.i.i, i8** %49, align 8
  %50 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 5
  %51 = bitcast i64* %50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %44, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %43)
  call void @llvm.lifetime.end(i64 48, i8* %44)
  %52 = load i64* %pos, align 8
  %53 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 6
  store i64 %52, i64* %53, align 8
  %54 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 7
  store i64 %6, i64* %54, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 %type, %struct.iovec* %40, i64 %nr_segs, i64 %6) #7
  %55 = call i64 %iter_fn.0(%struct.kiocb* %kiocb.i, %struct.iov_iter* %iter.i) #7
  %56 = icmp eq i64 %55, -529
  br i1 %56, label %57, label %do_iter_readv_writev.exit

; <label>:57                                      ; preds = %39
  %58 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #7
  br label %do_iter_readv_writev.exit

do_iter_readv_writev.exit:                        ; preds = %57, %39
  %ret.0.i = phi i64 [ %58, %57 ], [ %55, %39 ]
  %59 = load i64* %53, align 8
  store i64 %59, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %42) #4
  call void @llvm.lifetime.end(i64 88, i8* %41) #4
  br label %do_loop_readv_writev.exit

; <label>:60                                      ; preds = %file_start_write.exit
  %61 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %fnv.0, null
  %62 = load %struct.iovec** %iov, align 8
  br i1 %61, label %82, label %63

; <label>:63                                      ; preds = %60
  %64 = bitcast %struct.kiocb* %kiocb.i3 to i8*
  call void @llvm.lifetime.start(i64 88, i8* %64) #4
  %65 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %65)
  %66 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %66)
  call void @llvm.memset.p0i8.i64(i8* %65, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %66, i8 0, i64 48, i32 8, i1 false)
  %67 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %68 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 0
  store %struct.file* %file, %struct.file** %68, align 8
  %69 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 1
  %70 = bitcast %struct.kioctx** %69 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %70, i8* %65, i64 24, i32 8, i1 false) #4
  %71 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 4, i32 0
  %.c.i.i4 = bitcast %struct.task_struct* %67 to i8*
  store i8* %.c.i.i4, i8** %71, align 8
  %72 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 5
  %73 = bitcast i64* %72 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %73, i8* %66, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %65)
  call void @llvm.lifetime.end(i64 48, i8* %66)
  %74 = load i64* %pos, align 8
  %75 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 6
  store i64 %74, i64* %75, align 8
  %76 = getelementptr inbounds %struct.kiocb* %kiocb.i3, i64 0, i32 7
  store i64 %6, i64* %76, align 8
  %77 = call i64 %fnv.0(%struct.kiocb* %kiocb.i3, %struct.iovec* %62, i64 %nr_segs, i64 %74) #7
  %78 = icmp eq i64 %77, -529
  br i1 %78, label %79, label %do_sync_readv_writev.exit

; <label>:79                                      ; preds = %63
  %80 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3) #7
  br label %do_sync_readv_writev.exit

do_sync_readv_writev.exit:                        ; preds = %79, %63
  %ret.0.i5 = phi i64 [ %80, %79 ], [ %77, %63 ]
  %81 = load i64* %75, align 8
  store i64 %81, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %64) #4
  br label %do_loop_readv_writev.exit

; <label>:82                                      ; preds = %60
  %.old1.i = icmp eq i64 %nr_segs, 0
  br i1 %.old1.i, label %do_loop_readv_writev.exit, label %.preheader.i

.preheader.i:                                     ; preds = %92, %82
  %ret.0.i6 = phi i64 [ %94, %92 ], [ 0, %82 ]
  %vector.0.i = phi %struct.iovec* [ %93, %92 ], [ %62, %82 ]
  %.0.i = phi i64 [ %87, %92 ], [ %nr_segs, %82 ]
  %83 = getelementptr inbounds %struct.iovec* %vector.0.i, i64 0, i32 0
  %84 = load i8** %83, align 8
  %85 = getelementptr inbounds %struct.iovec* %vector.0.i, i64 0, i32 1
  %86 = load i64* %85, align 8
  %87 = add i64 %.0.i, -1
  %88 = call i64 %fn.0(%struct.file* %file, i8* %84, i64 %86, i64* %pos) #7
  %89 = icmp slt i64 %88, 0
  br i1 %89, label %90, label %92

; <label>:90                                      ; preds = %.preheader.i
  %91 = icmp eq i64 %ret.0.i6, 0
  %.ret.0.i = select i1 %91, i64 %88, i64 %ret.0.i6
  br label %do_loop_readv_writev.exit

; <label>:92                                      ; preds = %.preheader.i
  %93 = getelementptr %struct.iovec* %vector.0.i, i64 1
  %94 = add i64 %88, %ret.0.i6
  %95 = icmp eq i64 %88, %86
  %96 = icmp ne i64 %87, 0
  %or.cond.i = and i1 %95, %96
  br i1 %or.cond.i, label %.preheader.i, label %do_loop_readv_writev.exit

do_loop_readv_writev.exit:                        ; preds = %92, %90, %82, %do_sync_readv_writev.exit, %do_iter_readv_writev.exit
  %ret.0 = phi i64 [ %ret.0.i, %do_iter_readv_writev.exit ], [ %ret.0.i5, %do_sync_readv_writev.exit ], [ %.ret.0.i, %90 ], [ 0, %82 ], [ %94, %92 ]
  br i1 %11, label %file_end_write.exit, label %97

; <label>:97                                      ; preds = %do_loop_readv_writev.exit
  %98 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %99 = load %struct.inode** %98, align 8
  %100 = getelementptr inbounds %struct.inode* %99, i64 0, i32 0
  %101 = load i16* %100, align 2
  %102 = and i16 %101, -4096
  %103 = icmp eq i16 %102, -32768
  br i1 %103, label %104, label %file_end_write.exit

; <label>:104                                     ; preds = %97
  %105 = getelementptr inbounds %struct.inode* %99, i64 0, i32 8
  %106 = load %struct.super_block** %105, align 8
  call void @__sb_end_write(%struct.super_block* %106, i32 1) #7
  br label %file_end_write.exit

file_end_write.exit:                              ; preds = %104, %97, %do_loop_readv_writev.exit, %5, %0
  %ret.1 = phi i64 [ %3, %0 ], [ %8, %5 ], [ %ret.0, %do_loop_readv_writev.exit ], [ %ret.0, %97 ], [ %ret.0, %104 ]
  %107 = load %struct.iovec** %iov, align 8
  %108 = icmp eq %struct.iovec* %107, %2
  br i1 %108, label %111, label %109

; <label>:109                                     ; preds = %file_end_write.exit
  %110 = bitcast %struct.iovec* %107 to i8*
  call void @kfree(i8* %110) #7
  br label %111

; <label>:111                                     ; preds = %109, %file_end_write.exit
  %112 = icmp eq i32 %type, 0
  %113 = zext i1 %112 to i64
  %114 = add i64 %ret.1, %113
  %115 = icmp sgt i64 %114, 0
  br i1 %115, label %116, label %fsnotify_access.exit

; <label>:116                                     ; preds = %111
  %117 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %118 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %119 = load %struct.inode** %118, align 8
  %120 = getelementptr inbounds %struct.inode* %119, i64 0, i32 0
  %121 = load i16* %120, align 2
  %122 = and i16 %121, -4096
  %123 = icmp eq i16 %122, 16384
  br i1 %112, label %124, label %135

; <label>:124                                     ; preds = %116
  %..i = select i1 %123, i32 1073741825, i32 1
  %125 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %126 = load i32* %125, align 4
  %127 = and i32 %126, 67108864
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %fsnotify_access.exit

; <label>:129                                     ; preds = %124
  %130 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %131 = load %struct.dentry** %130, align 8
  %132 = call i32 @__fsnotify_parent(%struct.path* %117, %struct.dentry* %131, i32 %..i) #7
  %133 = bitcast %struct.path* %117 to i8*
  %134 = call i32 @fsnotify(%struct.inode* %119, i32 %..i, i8* %133, i32 1, i8* null, i32 0) #7
  br label %fsnotify_access.exit

; <label>:135                                     ; preds = %116
  %..i7 = select i1 %123, i32 1073741826, i32 2
  %136 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %137 = load i32* %136, align 4
  %138 = and i32 %137, 67108864
  %139 = icmp eq i32 %138, 0
  br i1 %139, label %140, label %fsnotify_access.exit

; <label>:140                                     ; preds = %135
  %141 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %142 = load %struct.dentry** %141, align 8
  %143 = call i32 @__fsnotify_parent(%struct.path* %117, %struct.dentry* %142, i32 %..i7) #7
  %144 = bitcast %struct.path* %117 to i8*
  %145 = call i32 @fsnotify(%struct.inode* %119, i32 %..i7, i8* %144, i32 1, i8* null, i32 0) #7
  br label %fsnotify_access.exit

fsnotify_access.exit:                             ; preds = %140, %135, %129, %124, %111
  call void @llvm.lifetime.end(i64 128, i8* %1) #4
  ret i64 %ret.1
}

; Function Attrs: noredzone
declare i64 @compat_rw_copy_check_uvector(i32, %struct.compat_iovec*, i64, i64, %struct.iovec*, %struct.iovec**) #1

; Function Attrs: noredzone
declare void @kfree(i8*) #1

; Function Attrs: noredzone
declare i64 @__fdget_pos(i32) #1

; Function Attrs: noredzone nounwind
define internal fastcc i64 @__compat_sys_preadv64(i64 %fd, %struct.compat_iovec* %vec, i64 %vlen, i64 %pos) #0 {
  %1 = alloca i64, align 8
  store i64 %pos, i64* %1, align 8
  %2 = icmp slt i64 %pos, 0
  br i1 %2, label %fdput.exit, label %3

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %fd to i32
  %5 = call i64 @__fdget(i32 %4) #7
  %6 = and i64 %5, -4
  %7 = inttoptr i64 %6 to %struct.file*
  %8 = icmp eq i64 %6, 0
  br i1 %8, label %fdput.exit, label %9

; <label>:9                                       ; preds = %3
  %10 = getelementptr inbounds %struct.file* %7, i64 0, i32 7
  %11 = load i32* %10, align 4
  %12 = and i32 %11, 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %32, label %14

; <label>:14                                      ; preds = %9
  %15 = and i32 %11, 1
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %compat_readv.exit, label %17

; <label>:17                                      ; preds = %14
  %18 = and i32 %11, 131072
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %compat_readv.exit, label %20

; <label>:20                                      ; preds = %17
  %21 = call fastcc i64 @compat_do_readv_writev(i32 0, %struct.file* %7, %struct.compat_iovec* %vec, i64 %vlen, i64* %1) #7
  %22 = icmp sgt i64 %21, 0
  br i1 %22, label %23, label %compat_readv.exit

; <label>:23                                      ; preds = %20
  %24 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %25 = getelementptr inbounds %struct.task_struct* %24, i64 0, i32 113, i32 0
  %26 = load i64* %25, align 8
  %27 = add i64 %26, %21
  store i64 %27, i64* %25, align 8
  br label %compat_readv.exit

compat_readv.exit:                                ; preds = %23, %20, %17, %14
  %ret.01.i = phi i64 [ %21, %23 ], [ %21, %20 ], [ -22, %17 ], [ -9, %14 ]
  %28 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !1
  %29 = getelementptr inbounds %struct.task_struct* %28, i64 0, i32 113, i32 2
  %30 = load i64* %29, align 8
  %31 = add i64 %30, 1
  store i64 %31, i64* %29, align 8
  br label %32

; <label>:32                                      ; preds = %compat_readv.exit, %9
  %ret.0 = phi i64 [ %ret.01.i, %compat_readv.exit ], [ -29, %9 ]
  %33 = and i64 %5, 1
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %fdput.exit, label %35

; <label>:35                                      ; preds = %32
  call void @fput(%struct.file* %7) #7
  br label %fdput.exit

fdput.exit:                                       ; preds = %35, %32, %3, %0
  %.0 = phi i64 [ -22, %0 ], [ -9, %3 ], [ %ret.0, %32 ], [ %ret.0, %35 ]
  ret i64 %.0
}

; Function Attrs: nounwind readnone
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1) #5

; Function Attrs: noredzone
declare i64 @_copy_from_user(i8*, i8*, i32) #1

; Function Attrs: noredzone
declare void @warn_slowpath_fmt(i8*, i32, i8*, ...) #1

; Function Attrs: noredzone
declare i8* @__kmalloc(i64, i32) #1

; Function Attrs: noredzone
declare void @__sb_end_write(%struct.super_block*, i32) #1

; Function Attrs: noredzone
declare i32 @__sb_start_write(%struct.super_block*, i32, i1 zeroext) #1

; Function Attrs: noredzone
declare i32 @fsnotify(%struct.inode*, i32, i8*, i32, i8*, i32) #1

; Function Attrs: noredzone
declare i32 @__fsnotify_parent(%struct.path*, %struct.dentry*, i32) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

; Function Attrs: noredzone
declare i64 @_copy_to_user(i8*, i8*, i32) #1

; Function Attrs: noredzone
declare void @_raw_spin_lock(%struct.raw_spinlock*) #1 section ".spinlock.text"

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #5

attributes #0 = { alwaysinline noredzone nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noredzone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noredzone nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noredzone nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }
attributes #6 = { nobuiltin noredzone }
attributes #7 = { nobuiltin noredzone nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!1 = metadata !{i32 -2146822019}
!2 = metadata !{i32 -2146513298}
!3 = metadata !{i32 -2146491284}
!4 = metadata !{metadata !"branch_weights", i32 4, i32 64}
!5 = metadata !{i32 -2146612126}
!6 = metadata !{i32 -2143334077}
!7 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!8 = metadata !{i32 -2143331293}
!9 = metadata !{i32 -2143316779}
!10 = metadata !{i32 -2143307477}
!11 = metadata !{i32 -2143304982}
!12 = metadata !{i32 -2143293506}
