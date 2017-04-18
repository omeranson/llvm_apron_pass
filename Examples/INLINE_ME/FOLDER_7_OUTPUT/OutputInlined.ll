; ModuleID = './FOLDER_7_OUTPUT/OutputInlined.bc'
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

; Function Attrs: alwaysinline noredzone nounwind
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
  switch i32 %whence, label %41 [
    i32 2, label %11
    i32 1, label %13
    i32 3, label %37
    i32 4, label %39
  ]

; <label>:11                                      ; preds = %0
  %12 = add i64 %10, %offset
  br label %41

; <label>:13                                      ; preds = %0
  %14 = icmp eq i64 %offset, 0
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %13
  %16 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %17 = load i64* %16, align 8
  br label %generic_file_llseek_size.exit

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct.file* %file, i64 0, i32 4
  %20 = getelementptr inbounds %struct.spinlock* %19, i64 0, i32 0, i32 0
  tail call void @_raw_spin_lock(%struct.raw_spinlock* %20) #6
  %21 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %22 = load i64* %21, align 8
  %23 = add i64 %22, %offset
  %24 = icmp slt i64 %23, 0
  br i1 %24, label %25, label %31

; <label>:25                                      ; preds = %18
  %26 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %27 = load i32* %26, align 4
  %28 = and i32 %27, 8192
  %29 = icmp eq i32 %28, 0
  %30 = icmp sgt i64 %23, %8
  %or.cond.i.i = or i1 %29, %30
  br i1 %or.cond.i.i, label %vfs_setpos.exit.i, label %32

; <label>:31                                      ; preds = %18
  %.old.i.i = icmp sgt i64 %23, %8
  br i1 %.old.i.i, label %vfs_setpos.exit.i, label %32

; <label>:32                                      ; preds = %31, %25
  %33 = icmp eq i64 %offset, 0
  br i1 %33, label %vfs_setpos.exit.i, label %34

; <label>:34                                      ; preds = %32
  store i64 %23, i64* %21, align 8
  %35 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %35, align 8
  br label %vfs_setpos.exit.i

vfs_setpos.exit.i:                                ; preds = %34, %32, %31, %25
  %.0.i.i = phi i64 [ -22, %25 ], [ -22, %31 ], [ %22, %32 ], [ %23, %34 ]
  %36 = bitcast %struct.spinlock* %19 to i8*
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* %36, i8 1, i8* %36) #4, !srcloc !1
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !2
  br label %generic_file_llseek_size.exit

; <label>:37                                      ; preds = %0
  %38 = icmp slt i64 %offset, %10
  br i1 %38, label %41, label %generic_file_llseek_size.exit

; <label>:39                                      ; preds = %0
  %40 = icmp slt i64 %offset, %10
  br i1 %40, label %41, label %generic_file_llseek_size.exit

; <label>:41                                      ; preds = %39, %37, %11, %0
  %.01.i = phi i64 [ %offset, %0 ], [ %offset, %37 ], [ %12, %11 ], [ %10, %39 ]
  %42 = icmp slt i64 %.01.i, 0
  br i1 %42, label %43, label %49

; <label>:43                                      ; preds = %41
  %44 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %45 = load i32* %44, align 4
  %46 = and i32 %45, 8192
  %47 = icmp eq i32 %46, 0
  %48 = icmp sgt i64 %.01.i, %8
  %or.cond.i2.i = or i1 %47, %48
  br i1 %or.cond.i2.i, label %generic_file_llseek_size.exit, label %50

; <label>:49                                      ; preds = %41
  %.old.i3.i = icmp sgt i64 %.01.i, %8
  br i1 %.old.i3.i, label %generic_file_llseek_size.exit, label %50

; <label>:50                                      ; preds = %49, %43
  %51 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %52 = load i64* %51, align 8
  %53 = icmp eq i64 %52, %.01.i
  br i1 %53, label %generic_file_llseek_size.exit, label %54

; <label>:54                                      ; preds = %50
  store i64 %.01.i, i64* %51, align 8
  %55 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %55, align 8
  br label %generic_file_llseek_size.exit

generic_file_llseek_size.exit:                    ; preds = %54, %50, %49, %43, %39, %37, %vfs_setpos.exit.i, %15
  %.0.i = phi i64 [ %17, %15 ], [ %.0.i.i, %vfs_setpos.exit.i ], [ -6, %37 ], [ -6, %39 ], [ -22, %43 ], [ -22, %49 ], [ %.01.i, %50 ], [ %.01.i, %54 ]
  ret i64 %.0.i
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
  %7 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  call void @iov_iter_init(%struct.iov_iter* %iter, i32 0, %struct.iovec* %iov, i64 1, i64 %len) #6
  %17 = getelementptr inbounds %struct.file* %filp, i64 0, i32 3
  %18 = load %struct.file_operations** %17, align 8
  %19 = getelementptr inbounds %struct.file_operations* %18, i64 0, i32 6
  %20 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %19, align 8
  %21 = call i64 %20(%struct.kiocb* %kiocb, %struct.iov_iter* %iter) #6
  %22 = icmp eq i64 %21, -529
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %0
  %24 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #6
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

; Function Attrs: alwaysinline noredzone nounwind
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

; Function Attrs: alwaysinline noredzone nounwind
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
  tail call void @_raw_spin_lock(%struct.raw_spinlock* %10) #6
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
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* %26, i8 1, i8* %26) #4, !srcloc !1
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !2
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

; Function Attrs: alwaysinline noredzone nounwind
define i64 @fixed_size_llseek(%struct.file* %file, i64 %offset, i32 %whence, i64 %size) #0 {
  %switch = icmp ult i32 %whence, 3
  br i1 %switch, label %1, label %47

; <label>:1                                       ; preds = %0
  switch i32 %whence, label %32 [
    i32 2, label %2
    i32 1, label %4
    i32 3, label %28
    i32 4, label %30
  ]

; <label>:2                                       ; preds = %1
  %3 = add i64 %size, %offset
  br label %32

; <label>:4                                       ; preds = %1
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %4
  %7 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %8 = load i64* %7, align 8
  br label %generic_file_llseek_size.exit

; <label>:9                                       ; preds = %4
  %10 = getelementptr inbounds %struct.file* %file, i64 0, i32 4
  %11 = getelementptr inbounds %struct.spinlock* %10, i64 0, i32 0, i32 0
  tail call void @_raw_spin_lock(%struct.raw_spinlock* %11) #6
  %12 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %13 = load i64* %12, align 8
  %14 = add i64 %13, %offset
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %9
  %17 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 8192
  %20 = icmp eq i32 %19, 0
  %21 = icmp sgt i64 %14, %size
  %or.cond.i.i = or i1 %20, %21
  br i1 %or.cond.i.i, label %vfs_setpos.exit.i, label %23

; <label>:22                                      ; preds = %9
  %.old.i.i = icmp sgt i64 %14, %size
  br i1 %.old.i.i, label %vfs_setpos.exit.i, label %23

; <label>:23                                      ; preds = %22, %16
  %24 = icmp eq i64 %offset, 0
  br i1 %24, label %vfs_setpos.exit.i, label %25

; <label>:25                                      ; preds = %23
  store i64 %14, i64* %12, align 8
  %26 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %26, align 8
  br label %vfs_setpos.exit.i

vfs_setpos.exit.i:                                ; preds = %25, %23, %22, %16
  %.0.i.i = phi i64 [ -22, %16 ], [ -22, %22 ], [ %13, %23 ], [ %14, %25 ]
  %27 = bitcast %struct.spinlock* %10 to i8*
  tail call void asm sideeffect "addb ${1:b}, $0\0A", "=*m,qi,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i8* %27, i8 1, i8* %27) #4, !srcloc !1
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !2
  br label %generic_file_llseek_size.exit

; <label>:28                                      ; preds = %1
  %29 = icmp slt i64 %offset, %size
  br i1 %29, label %32, label %generic_file_llseek_size.exit

; <label>:30                                      ; preds = %1
  %31 = icmp slt i64 %offset, %size
  br i1 %31, label %32, label %generic_file_llseek_size.exit

; <label>:32                                      ; preds = %30, %28, %2, %1
  %.01.i = phi i64 [ %offset, %1 ], [ %offset, %28 ], [ %3, %2 ], [ %size, %30 ]
  %33 = icmp slt i64 %.01.i, 0
  br i1 %33, label %34, label %40

; <label>:34                                      ; preds = %32
  %35 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %36 = load i32* %35, align 4
  %37 = and i32 %36, 8192
  %38 = icmp eq i32 %37, 0
  %39 = icmp sgt i64 %.01.i, %size
  %or.cond.i2.i = or i1 %38, %39
  br i1 %or.cond.i2.i, label %generic_file_llseek_size.exit, label %41

; <label>:40                                      ; preds = %32
  %.old.i3.i = icmp sgt i64 %.01.i, %size
  br i1 %.old.i3.i, label %generic_file_llseek_size.exit, label %41

; <label>:41                                      ; preds = %40, %34
  %42 = getelementptr inbounds %struct.file* %file, i64 0, i32 9
  %43 = load i64* %42, align 8
  %44 = icmp eq i64 %43, %.01.i
  br i1 %44, label %generic_file_llseek_size.exit, label %45

; <label>:45                                      ; preds = %41
  store i64 %.01.i, i64* %42, align 8
  %46 = getelementptr inbounds %struct.file* %file, i64 0, i32 13
  store i64 0, i64* %46, align 8
  br label %generic_file_llseek_size.exit

generic_file_llseek_size.exit:                    ; preds = %45, %41, %40, %34, %30, %28, %vfs_setpos.exit.i, %6
  %.0.i = phi i64 [ %8, %6 ], [ %.0.i.i, %vfs_setpos.exit.i ], [ -6, %28 ], [ -6, %30 ], [ -22, %34 ], [ -22, %40 ], [ %.01.i, %41 ], [ %.01.i, %45 ]
  br label %47

; <label>:47                                      ; preds = %generic_file_llseek_size.exit, %0
  %.0 = phi i64 [ %.0.i, %generic_file_llseek_size.exit ], [ -22, %0 ]
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

; Function Attrs: alwaysinline noredzone nounwind
define i64 @default_llseek(%struct.file* nocapture %file, i64 %offset, i32 %whence) #0 {
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %2 = load %struct.inode** %1, align 8
  %3 = getelementptr inbounds %struct.inode* %2, i64 0, i32 23
  tail call void @mutex_lock(%struct.mutex* %3) #6
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
  tail call void @mutex_unlock(%struct.mutex* %3) #6
  ret i64 %retval.0
}

; Function Attrs: noredzone
declare void @mutex_lock(%struct.mutex*) #1

; Function Attrs: noredzone
declare void @mutex_unlock(%struct.mutex*) #1

; Function Attrs: alwaysinline noredzone nounwind
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
  %14 = tail call i64 %fn.0(%struct.file* %file, i64 %offset, i32 %whence) #6
  ret i64 %14
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_lseek(i64 %fd, i64 %offset, i64 %whence) #0 {
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %whence to i32
  %3 = tail call i64 @__fdget_pos(i32 %1) #6
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
  %22 = tail call i64 %fn.0.i.i(%struct.file* %5, i64 %offset, i32 %2) #6
  br label %23

; <label>:23                                      ; preds = %vfs_llseek.exit.i, %7
  %retval.0.i = phi i64 [ %22, %vfs_llseek.exit.i ], [ -22, %7 ]
  %24 = and i32 %v.tr.i.i.i, 2
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %23
  %27 = getelementptr inbounds %struct.file* %5, i64 0, i32 8
  tail call void @mutex_unlock(%struct.mutex* %27) #6
  br label %28

; <label>:28                                      ; preds = %26, %23
  %29 = and i32 %v.tr.i.i.i, 1
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %SYSC_lseek.exit, label %31

; <label>:31                                      ; preds = %28
  tail call void @fput(%struct.file* %5) #6
  br label %SYSC_lseek.exit

SYSC_lseek.exit:                                  ; preds = %31, %28, %0
  %.0.i = phi i64 [ -9, %0 ], [ %retval.0.i, %28 ], [ %retval.0.i, %31 ]
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_lseek(i64 %fd, i64 %offset, i64 %whence) #0 {
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %whence to i32
  %sext = shl i64 %offset, 32
  %3 = ashr exact i64 %sext, 32
  %4 = tail call i64 bitcast (i64 (i64, i64, i64)* @SyS_lseek to i64 (i32, i64, i32)*)(i32 %1, i64 %3, i32 %2) #6
  ret i64 %4
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_llseek(i64 %fd, i64 %offset_high, i64 %offset_low, i64 %result, i64 %whence) #0 {
  %offset.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = trunc i64 %whence to i32
  %3 = bitcast i64* %offset.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  %4 = call i64 @__fdget_pos(i32 %1) #6
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
  %25 = call i64 %fn.0.i.i(%struct.file* %6, i64 %12, i32 %2) #6
  store i64 %25, i64* %offset.i, align 8
  %26 = icmp sgt i64 %25, -1
  br i1 %26, label %.critedge.i.i, label %29

.critedge.i.i:                                    ; preds = %vfs_llseek.exit.i
  %27 = inttoptr i64 %result to i8*
  %28 = call i64 @_copy_to_user(i8* %27, i8* %3, i32 8) #6
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
  call void @mutex_unlock(%struct.mutex* %33) #6
  br label %34

; <label>:34                                      ; preds = %32, %29
  %35 = and i32 %v.tr.i.i.i, 1
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %fdput_pos.exit.i, label %37

; <label>:37                                      ; preds = %34
  call void @fput(%struct.file* %6) #6
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

; Function Attrs: alwaysinline noredzone nounwind
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
  %41 = tail call i32 @locks_mandatory_area(i32 %40, %struct.inode* %2, %struct.file* %file, i64 %5, i64 %count) #6
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %51, label %.critedge

.critedge:                                        ; preds = %38, %mandatory_lock.exit, %27, %23
  %43 = icmp eq i32 %read_write, 0
  %44 = select i1 %43, i32 4, i32 2
  %45 = tail call i32 @security_file_permission(%struct.file* %file, i32 %44) #6
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
  %6 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  %20 = call i64 %19(%struct.kiocb* %kiocb, %struct.iovec* %iov, i64 1, i64 %13) #6
  %21 = icmp eq i64 %20, -529
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %0
  %23 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #6
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
  %7 = call i64 %4(%struct.file* %file, i8* %buf, i64 %count, i64* %pos) #6
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
  %19 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  %32 = call i64 %31(%struct.kiocb* %kiocb.i, %struct.iovec* %iov.i, i64 1, i64 %26) #6
  %33 = icmp eq i64 %32, -529
  br i1 %33, label %34, label %do_sync_read.exit

; <label>:34                                      ; preds = %12
  %35 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #6
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
  %49 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 0, %struct.iovec* %iov.i3, i64 1, i64 %count) #6
  %59 = load %struct.file_operations** %1, align 8
  %60 = getelementptr inbounds %struct.file_operations* %59, i64 0, i32 6
  %61 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %60, align 8
  %62 = call i64 %61(%struct.kiocb* %kiocb.i4, %struct.iov_iter* %iter.i) #6
  %63 = icmp eq i64 %62, -529
  br i1 %63, label %64, label %new_sync_read.exit

; <label>:64                                      ; preds = %41
  %65 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4) #6
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
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i = alloca %struct.iovec, align 8
  %kiocb.i4.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
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
  %19 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %20 = load %struct.inode** %19, align 8
  %21 = icmp slt i64 %count, 0
  br i1 %21, label %rw_verify_area.exit, label %22, !prof !4

; <label>:22                                      ; preds = %18
  %23 = load i64* %pos, align 8
  %24 = icmp slt i64 %23, 0
  br i1 %24, label %25, label %33, !prof !4

; <label>:25                                      ; preds = %22
  %26 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %27 = load i32* %26, align 4
  %28 = and i32 %27, 8192
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %rw_verify_area.exit, label %30

; <label>:30                                      ; preds = %25
  %31 = sub i64 0, %23
  %32 = icmp ult i64 %count, %31
  br i1 %32, label %41, label %rw_verify_area.exit

; <label>:33                                      ; preds = %22
  %34 = add i64 %23, %count
  %35 = icmp slt i64 %34, 0
  br i1 %35, label %36, label %41, !prof !4

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %38 = load i32* %37, align 4
  %39 = and i32 %38, 8192
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %rw_verify_area.exit, label %41

; <label>:41                                      ; preds = %36, %33, %30
  %42 = getelementptr inbounds %struct.inode* %20, i64 0, i32 35
  %43 = load %struct.file_lock** %42, align 8
  %44 = icmp eq %struct.file_lock* %43, null
  br i1 %44, label %.critedge.i, label %45

; <label>:45                                      ; preds = %41
  %46 = getelementptr inbounds %struct.inode* %20, i64 0, i32 8
  %47 = load %struct.super_block** %46, align 8
  %48 = getelementptr inbounds %struct.super_block* %47, i64 0, i32 10
  %49 = load i64* %48, align 8
  %50 = and i64 %49, 64
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %.critedge.i, label %mandatory_lock.exit.i

mandatory_lock.exit.i:                            ; preds = %45
  %52 = getelementptr inbounds %struct.inode* %20, i64 0, i32 0
  %53 = load i16* %52, align 2
  %54 = and i16 %53, 1032
  %55 = icmp eq i16 %54, 1024
  br i1 %55, label %56, label %.critedge.i, !prof !4

; <label>:56                                      ; preds = %mandatory_lock.exit.i
  %57 = tail call i32 @locks_mandatory_area(i32 1, %struct.inode* %20, %struct.file* %file, i64 %23, i64 %count) #6
  %58 = icmp slt i32 %57, 0
  br i1 %58, label %rw_verify_area.exit, label %.critedge.i

.critedge.i:                                      ; preds = %56, %mandatory_lock.exit.i, %45, %41
  %59 = tail call i32 @security_file_permission(%struct.file* %file, i32 4) #6
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %rw_verify_area.exit

; <label>:61                                      ; preds = %.critedge.i
  %62 = icmp ugt i64 %count, 2147479552
  %63 = trunc i64 %count to i32
  %64 = select i1 %62, i32 2147479552, i32 %63
  br label %rw_verify_area.exit

rw_verify_area.exit:                              ; preds = %61, %.critedge.i, %56, %36, %30, %25, %18
  %.0.i = phi i32 [ %64, %61 ], [ -22, %18 ], [ -22, %25 ], [ -75, %30 ], [ -22, %36 ], [ %57, %56 ], [ %59, %.critedge.i ]
  %65 = sext i32 %.0.i to i64
  %66 = icmp sgt i32 %.0.i, -1
  br i1 %66, label %67, label %__chk_range_not_ok.exit.thread

; <label>:67                                      ; preds = %rw_verify_area.exit
  %68 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %69 = load %struct.file_operations** %68, align 8
  %70 = getelementptr inbounds %struct.file_operations* %69, i64 0, i32 2
  %71 = load i64 (%struct.file*, i8*, i64, i64*)** %70, align 8
  %72 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %71, null
  br i1 %72, label %75, label %73

; <label>:73                                      ; preds = %67
  %74 = call i64 %71(%struct.file* %file, i8* %buf, i64 %65, i64* %pos) #6
  br label %__vfs_read.exit

; <label>:75                                      ; preds = %67
  %76 = getelementptr inbounds %struct.file_operations* %69, i64 0, i32 4
  %77 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %76, align 8
  %78 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %77, null
  br i1 %78, label %104, label %79

; <label>:79                                      ; preds = %75
  %80 = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %80) #4
  %81 = getelementptr inbounds %struct.iovec* %iov.i.i, i64 0, i32 0
  store i8* %buf, i8** %81, align 8
  %82 = getelementptr inbounds %struct.iovec* %iov.i.i, i64 0, i32 1
  store i64 %65, i64* %82, align 8
  %83 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %83) #4
  %84 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %84) #4
  %85 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %85) #4
  call void @llvm.memset.p0i8.i64(i8* %84, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %85, i8 0, i64 48, i32 8, i1 false) #4
  %86 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %87 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %87, align 8
  %88 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %89 = bitcast %struct.kioctx** %88 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %89, i8* %84, i64 24, i32 8, i1 false) #4
  %90 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %86 to i8*
  store i8* %.c.i.i.i, i8** %90, align 8
  %91 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %92 = bitcast i64* %91 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %92, i8* %85, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %84) #4
  call void @llvm.lifetime.end(i64 48, i8* %85) #4
  %93 = load i64* %pos, align 8
  %94 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %93, i64* %94, align 8
  %95 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %65, i64* %95, align 8
  %96 = load %struct.file_operations** %68, align 8
  %97 = getelementptr inbounds %struct.file_operations* %96, i64 0, i32 4
  %98 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %97, align 8
  %99 = call i64 %98(%struct.kiocb* %kiocb.i.i, %struct.iovec* %iov.i.i, i64 1, i64 %93) #6
  %100 = icmp eq i64 %99, -529
  br i1 %100, label %101, label %do_sync_read.exit.i

; <label>:101                                     ; preds = %79
  %102 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_sync_read.exit.i

do_sync_read.exit.i:                              ; preds = %101, %79
  %ret.0.i.i = phi i64 [ %102, %101 ], [ %99, %79 ]
  %103 = load i64* %94, align 8
  store i64 %103, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %83) #4
  call void @llvm.lifetime.end(i64 16, i8* %80) #4
  br label %__vfs_read.exit

; <label>:104                                     ; preds = %75
  %105 = getelementptr inbounds %struct.file_operations* %69, i64 0, i32 6
  %106 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %105, align 8
  %107 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %106, null
  br i1 %107, label %__vfs_read.exit, label %108

; <label>:108                                     ; preds = %104
  %109 = bitcast %struct.iovec* %iov.i3.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %109) #4
  %110 = getelementptr inbounds %struct.iovec* %iov.i3.i, i64 0, i32 0
  store i8* %buf, i8** %110, align 8
  %111 = getelementptr inbounds %struct.iovec* %iov.i3.i, i64 0, i32 1
  store i64 %65, i64* %111, align 8
  %112 = bitcast %struct.kiocb* %kiocb.i4.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %112) #4
  %113 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %113) #4
  %114 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %114) #4
  %115 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %115) #4
  call void @llvm.memset.p0i8.i64(i8* %114, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %115, i8 0, i64 48, i32 8, i1 false) #4
  %116 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %117 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %117, align 8
  %118 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 1
  %119 = bitcast %struct.kioctx** %118 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %119, i8* %114, i64 24, i32 8, i1 false) #4
  %120 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 4, i32 0
  %.c.i.i5.i = bitcast %struct.task_struct* %116 to i8*
  store i8* %.c.i.i5.i, i8** %120, align 8
  %121 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 5
  %122 = bitcast i64* %121 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %115, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %114) #4
  call void @llvm.lifetime.end(i64 48, i8* %115) #4
  %123 = load i64* %pos, align 8
  %124 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 6
  store i64 %123, i64* %124, align 8
  %125 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 7
  store i64 %65, i64* %125, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 0, %struct.iovec* %iov.i3.i, i64 1, i64 %65) #6
  %126 = load %struct.file_operations** %68, align 8
  %127 = getelementptr inbounds %struct.file_operations* %126, i64 0, i32 6
  %128 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %127, align 8
  %129 = call i64 %128(%struct.kiocb* %kiocb.i4.i, %struct.iov_iter* %iter.i.i) #6
  %130 = icmp eq i64 %129, -529
  br i1 %130, label %131, label %new_sync_read.exit.i

; <label>:131                                     ; preds = %108
  %132 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4.i) #6
  br label %new_sync_read.exit.i

new_sync_read.exit.i:                             ; preds = %131, %108
  %ret.0.i6.i = phi i64 [ %132, %131 ], [ %129, %108 ]
  %133 = load i64* %124, align 8
  store i64 %133, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %113) #4
  call void @llvm.lifetime.end(i64 88, i8* %112) #4
  call void @llvm.lifetime.end(i64 16, i8* %109) #4
  br label %__vfs_read.exit

__vfs_read.exit:                                  ; preds = %new_sync_read.exit.i, %104, %do_sync_read.exit.i, %73
  %ret.0.i = phi i64 [ %74, %73 ], [ %ret.0.i.i, %do_sync_read.exit.i ], [ %ret.0.i6.i, %new_sync_read.exit.i ], [ -22, %104 ]
  %134 = icmp sgt i64 %ret.0.i, 0
  br i1 %134, label %135, label %156

; <label>:135                                     ; preds = %__vfs_read.exit
  %136 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %137 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %138 = load %struct.inode** %137, align 8
  %139 = getelementptr inbounds %struct.inode* %138, i64 0, i32 0
  %140 = load i16* %139, align 2
  %141 = and i16 %140, -4096
  %142 = icmp eq i16 %141, 16384
  %..i = select i1 %142, i32 1073741825, i32 1
  %143 = load i32* %1, align 4
  %144 = and i32 %143, 67108864
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %146, label %fsnotify_access.exit

; <label>:146                                     ; preds = %135
  %147 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %148 = load %struct.dentry** %147, align 8
  %149 = tail call i32 @__fsnotify_parent(%struct.path* %136, %struct.dentry* %148, i32 %..i) #6
  %150 = bitcast %struct.path* %136 to i8*
  %151 = tail call i32 @fsnotify(%struct.inode* %138, i32 %..i, i8* %150, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit

fsnotify_access.exit:                             ; preds = %146, %135
  %152 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %153 = getelementptr inbounds %struct.task_struct* %152, i64 0, i32 113, i32 0
  %154 = load i64* %153, align 8
  %155 = add i64 %154, %ret.0.i
  store i64 %155, i64* %153, align 8
  br label %156

; <label>:156                                     ; preds = %fsnotify_access.exit, %__vfs_read.exit
  %157 = tail call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %158 = getelementptr inbounds %struct.task_struct* %157, i64 0, i32 113, i32 2
  %159 = load i64* %158, align 8
  %160 = add i64 %159, 1
  store i64 %160, i64* %158, align 8
  br label %__chk_range_not_ok.exit.thread

__chk_range_not_ok.exit.thread:                   ; preds = %156, %rw_verify_area.exit, %8, %5, %0
  %.0 = phi i64 [ -9, %0 ], [ -22, %5 ], [ %ret.0.i, %156 ], [ %65, %rw_verify_area.exit ], [ -14, %8 ]
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
  %6 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  %20 = call i64 %19(%struct.kiocb* %kiocb, %struct.iovec* %iov, i64 1, i64 %13) #6
  %21 = icmp eq i64 %20, -529
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %0
  %23 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #6
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
  %7 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  call void @iov_iter_init(%struct.iov_iter* %iter, i32 1, %struct.iovec* %iov, i64 1, i64 %len) #6
  %17 = getelementptr inbounds %struct.file* %filp, i64 0, i32 3
  %18 = load %struct.file_operations** %17, align 8
  %19 = getelementptr inbounds %struct.file_operations* %18, i64 0, i32 7
  %20 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %19, align 8
  %21 = call i64 %20(%struct.kiocb* %kiocb, %struct.iov_iter* %iter) #6
  %22 = icmp eq i64 %21, -529
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %0
  %24 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb) #6
  br label %25

; <label>:25                                      ; preds = %23, %0
  %ret.0 = phi i64 [ %24, %23 ], [ %21, %0 ]
  %26 = load i64* %15, align 8
  store i64 %26, i64* %ppos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %4) #4
  call void @llvm.lifetime.end(i64 88, i8* %3) #4
  ret i64 %ret.0
}

; Function Attrs: alwaysinline noredzone nounwind
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
  %22 = call i64 %19(%struct.file* %file, i8* %buf, i64 %.count, i64* %pos) #6
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
  %34 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  %47 = call i64 %46(%struct.kiocb* %kiocb.i, %struct.iovec* %iov.i, i64 1, i64 %41) #6
  %48 = icmp eq i64 %47, -529
  br i1 %48, label %49, label %do_sync_write.exit

; <label>:49                                      ; preds = %27
  %50 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #6
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
  %60 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 1, %struct.iovec* %iov.i4, i64 1, i64 %.count) #6
  %70 = load %struct.file_operations** %16, align 8
  %71 = getelementptr inbounds %struct.file_operations* %70, i64 0, i32 7
  %72 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %71, align 8
  %73 = call i64 %72(%struct.kiocb* %kiocb.i5, %struct.iov_iter* %iter.i) #6
  %74 = icmp eq i64 %73, -529
  br i1 %74, label %75, label %new_sync_write.exit

; <label>:75                                      ; preds = %52
  %76 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i5) #6
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
  %98 = call i32 @__fsnotify_parent(%struct.path* %85, %struct.dentry* %97, i32 %..i) #6
  %99 = bitcast %struct.path* %85 to i8*
  %100 = call i32 @fsnotify(%struct.inode* %87, i32 %..i, i8* %99, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit

fsnotify_modify.exit:                             ; preds = %95, %84
  %101 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %102 = getelementptr inbounds %struct.task_struct* %101, i64 0, i32 113, i32 1
  %103 = load i64* %102, align 8
  %104 = add i64 %103, %ret.0
  store i64 %104, i64* %102, align 8
  br label %105

; <label>:105                                     ; preds = %fsnotify_modify.exit, %78
  %106 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
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
  %19 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %20 = load %struct.inode** %19, align 8
  %21 = icmp slt i64 %count, 0
  br i1 %21, label %rw_verify_area.exit, label %22, !prof !4

; <label>:22                                      ; preds = %18
  %23 = load i64* %pos, align 8
  %24 = icmp slt i64 %23, 0
  br i1 %24, label %25, label %33, !prof !4

; <label>:25                                      ; preds = %22
  %26 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %27 = load i32* %26, align 4
  %28 = and i32 %27, 8192
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %rw_verify_area.exit, label %30

; <label>:30                                      ; preds = %25
  %31 = sub i64 0, %23
  %32 = icmp ult i64 %count, %31
  br i1 %32, label %41, label %rw_verify_area.exit

; <label>:33                                      ; preds = %22
  %34 = add i64 %23, %count
  %35 = icmp slt i64 %34, 0
  br i1 %35, label %36, label %41, !prof !4

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %38 = load i32* %37, align 4
  %39 = and i32 %38, 8192
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %rw_verify_area.exit, label %41

; <label>:41                                      ; preds = %36, %33, %30
  %42 = getelementptr inbounds %struct.inode* %20, i64 0, i32 35
  %43 = load %struct.file_lock** %42, align 8
  %44 = icmp eq %struct.file_lock* %43, null
  br i1 %44, label %.critedge.i, label %45

; <label>:45                                      ; preds = %41
  %46 = getelementptr inbounds %struct.inode* %20, i64 0, i32 8
  %47 = load %struct.super_block** %46, align 8
  %48 = getelementptr inbounds %struct.super_block* %47, i64 0, i32 10
  %49 = load i64* %48, align 8
  %50 = and i64 %49, 64
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %.critedge.i, label %mandatory_lock.exit.i

mandatory_lock.exit.i:                            ; preds = %45
  %52 = getelementptr inbounds %struct.inode* %20, i64 0, i32 0
  %53 = load i16* %52, align 2
  %54 = and i16 %53, 1032
  %55 = icmp eq i16 %54, 1024
  br i1 %55, label %56, label %.critedge.i, !prof !4

; <label>:56                                      ; preds = %mandatory_lock.exit.i
  %57 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %20, %struct.file* %file, i64 %23, i64 %count) #6
  %58 = icmp slt i32 %57, 0
  br i1 %58, label %rw_verify_area.exit, label %.critedge.i

.critedge.i:                                      ; preds = %56, %mandatory_lock.exit.i, %45, %41
  %59 = call i32 @security_file_permission(%struct.file* %file, i32 2) #6
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %rw_verify_area.exit

; <label>:61                                      ; preds = %.critedge.i
  %62 = icmp ugt i64 %count, 2147479552
  %63 = trunc i64 %count to i32
  %64 = select i1 %62, i32 2147479552, i32 %63
  br label %rw_verify_area.exit

rw_verify_area.exit:                              ; preds = %61, %.critedge.i, %56, %36, %30, %25, %18
  %.0.i = phi i32 [ %64, %61 ], [ -22, %18 ], [ -22, %25 ], [ -75, %30 ], [ -22, %36 ], [ %57, %56 ], [ %59, %.critedge.i ]
  %65 = sext i32 %.0.i to i64
  %66 = icmp sgt i32 %.0.i, -1
  br i1 %66, label %67, label %file_end_write.exit

; <label>:67                                      ; preds = %rw_verify_area.exit
  %68 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %69 = load %struct.inode** %68, align 8
  %70 = getelementptr inbounds %struct.inode* %69, i64 0, i32 0
  %71 = load i16* %70, align 2
  %72 = and i16 %71, -4096
  %73 = icmp eq i16 %72, -32768
  br i1 %73, label %74, label %file_start_write.exit

; <label>:74                                      ; preds = %67
  %75 = getelementptr inbounds %struct.inode* %69, i64 0, i32 8
  %76 = load %struct.super_block** %75, align 8
  %77 = call i32 @__sb_start_write(%struct.super_block* %76, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit

file_start_write.exit:                            ; preds = %74, %67
  %78 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %79 = load %struct.file_operations** %78, align 8
  %80 = getelementptr inbounds %struct.file_operations* %79, i64 0, i32 3
  %81 = load i64 (%struct.file*, i8*, i64, i64*)** %80, align 8
  %82 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %81, null
  br i1 %82, label %85, label %83

; <label>:83                                      ; preds = %file_start_write.exit
  %84 = call i64 %81(%struct.file* %file, i8* %buf, i64 %65, i64* %pos) #6
  br label %140

; <label>:85                                      ; preds = %file_start_write.exit
  %86 = getelementptr inbounds %struct.file_operations* %79, i64 0, i32 5
  %87 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %86, align 8
  %88 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %87, null
  br i1 %88, label %114, label %89

; <label>:89                                      ; preds = %85
  %90 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %90) #4
  %91 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 0
  store i8* %buf, i8** %91, align 8
  %92 = getelementptr inbounds %struct.iovec* %iov.i, i64 0, i32 1
  store i64 %65, i64* %92, align 8
  %93 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %93) #4
  %94 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %94)
  %95 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %95)
  call void @llvm.memset.p0i8.i64(i8* %94, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %95, i8 0, i64 48, i32 8, i1 false)
  %96 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %97 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %97, align 8
  %98 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 1
  %99 = bitcast %struct.kioctx** %98 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %94, i64 24, i32 8, i1 false) #4
  %100 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %96 to i8*
  store i8* %.c.i.i, i8** %100, align 8
  %101 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 5
  %102 = bitcast i64* %101 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %102, i8* %95, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %94)
  call void @llvm.lifetime.end(i64 48, i8* %95)
  %103 = load i64* %pos, align 8
  %104 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 6
  store i64 %103, i64* %104, align 8
  %105 = getelementptr inbounds %struct.kiocb* %kiocb.i, i64 0, i32 7
  store i64 %65, i64* %105, align 8
  %106 = load %struct.file_operations** %78, align 8
  %107 = getelementptr inbounds %struct.file_operations* %106, i64 0, i32 5
  %108 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %107, align 8
  %109 = call i64 %108(%struct.kiocb* %kiocb.i, %struct.iovec* %iov.i, i64 1, i64 %103) #6
  %110 = icmp eq i64 %109, -529
  br i1 %110, label %111, label %do_sync_write.exit

; <label>:111                                     ; preds = %89
  %112 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i) #6
  br label %do_sync_write.exit

do_sync_write.exit:                               ; preds = %111, %89
  %ret.0.i = phi i64 [ %112, %111 ], [ %109, %89 ]
  %113 = load i64* %104, align 8
  store i64 %113, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %93) #4
  call void @llvm.lifetime.end(i64 16, i8* %90) #4
  br label %140

; <label>:114                                     ; preds = %85
  %115 = bitcast %struct.iovec* %iov.i3 to i8*
  call void @llvm.lifetime.start(i64 16, i8* %115) #4
  %116 = getelementptr inbounds %struct.iovec* %iov.i3, i64 0, i32 0
  store i8* %buf, i8** %116, align 8
  %117 = getelementptr inbounds %struct.iovec* %iov.i3, i64 0, i32 1
  store i64 %65, i64* %117, align 8
  %118 = bitcast %struct.kiocb* %kiocb.i4 to i8*
  call void @llvm.lifetime.start(i64 88, i8* %118) #4
  %119 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %119) #4
  %120 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %120)
  %121 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %121)
  call void @llvm.memset.p0i8.i64(i8* %120, i8 0, i64 24, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %121, i8 0, i64 48, i32 8, i1 false)
  %122 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %123 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 0
  store %struct.file* %file, %struct.file** %123, align 8
  %124 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 1
  %125 = bitcast %struct.kioctx** %124 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %125, i8* %120, i64 24, i32 8, i1 false) #4
  %126 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 4, i32 0
  %.c.i.i5 = bitcast %struct.task_struct* %122 to i8*
  store i8* %.c.i.i5, i8** %126, align 8
  %127 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 5
  %128 = bitcast i64* %127 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %128, i8* %121, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %120)
  call void @llvm.lifetime.end(i64 48, i8* %121)
  %129 = load i64* %pos, align 8
  %130 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 6
  store i64 %129, i64* %130, align 8
  %131 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i64 0, i32 7
  store i64 %65, i64* %131, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i, i32 1, %struct.iovec* %iov.i3, i64 1, i64 %65) #6
  %132 = load %struct.file_operations** %78, align 8
  %133 = getelementptr inbounds %struct.file_operations* %132, i64 0, i32 7
  %134 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %133, align 8
  %135 = call i64 %134(%struct.kiocb* %kiocb.i4, %struct.iov_iter* %iter.i) #6
  %136 = icmp eq i64 %135, -529
  br i1 %136, label %137, label %new_sync_write.exit

; <label>:137                                     ; preds = %114
  %138 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4) #6
  br label %new_sync_write.exit

new_sync_write.exit:                              ; preds = %137, %114
  %ret.0.i6 = phi i64 [ %138, %137 ], [ %135, %114 ]
  %139 = load i64* %130, align 8
  store i64 %139, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %119) #4
  call void @llvm.lifetime.end(i64 88, i8* %118) #4
  call void @llvm.lifetime.end(i64 16, i8* %115) #4
  br label %140

; <label>:140                                     ; preds = %new_sync_write.exit, %do_sync_write.exit, %83
  %ret.0 = phi i64 [ %84, %83 ], [ %ret.0.i, %do_sync_write.exit ], [ %ret.0.i6, %new_sync_write.exit ]
  %141 = icmp sgt i64 %ret.0, 0
  br i1 %141, label %142, label %162

; <label>:142                                     ; preds = %140
  %143 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %144 = load %struct.inode** %68, align 8
  %145 = getelementptr inbounds %struct.inode* %144, i64 0, i32 0
  %146 = load i16* %145, align 2
  %147 = and i16 %146, -4096
  %148 = icmp eq i16 %147, 16384
  %..i = select i1 %148, i32 1073741826, i32 2
  %149 = load i32* %1, align 4
  %150 = and i32 %149, 67108864
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %152, label %fsnotify_modify.exit

; <label>:152                                     ; preds = %142
  %153 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %154 = load %struct.dentry** %153, align 8
  %155 = call i32 @__fsnotify_parent(%struct.path* %143, %struct.dentry* %154, i32 %..i) #6
  %156 = bitcast %struct.path* %143 to i8*
  %157 = call i32 @fsnotify(%struct.inode* %144, i32 %..i, i8* %156, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit

fsnotify_modify.exit:                             ; preds = %152, %142
  %158 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %159 = getelementptr inbounds %struct.task_struct* %158, i64 0, i32 113, i32 1
  %160 = load i64* %159, align 8
  %161 = add i64 %160, %ret.0
  store i64 %161, i64* %159, align 8
  br label %162

; <label>:162                                     ; preds = %fsnotify_modify.exit, %140
  %163 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %164 = getelementptr inbounds %struct.task_struct* %163, i64 0, i32 113, i32 3
  %165 = load i64* %164, align 8
  %166 = add i64 %165, 1
  store i64 %166, i64* %164, align 8
  %167 = load %struct.inode** %68, align 8
  %168 = getelementptr inbounds %struct.inode* %167, i64 0, i32 0
  %169 = load i16* %168, align 2
  %170 = and i16 %169, -4096
  %171 = icmp eq i16 %170, -32768
  br i1 %171, label %172, label %file_end_write.exit

; <label>:172                                     ; preds = %162
  %173 = getelementptr inbounds %struct.inode* %167, i64 0, i32 8
  %174 = load %struct.super_block** %173, align 8
  call void @__sb_end_write(%struct.super_block* %174, i32 1) #6
  br label %file_end_write.exit

file_end_write.exit:                              ; preds = %172, %162, %rw_verify_area.exit, %8, %5, %0
  %.0 = phi i64 [ -9, %0 ], [ -22, %5 ], [ %65, %rw_verify_area.exit ], [ %ret.0, %162 ], [ %ret.0, %172 ], [ -14, %8 ]
  ret i64 %.0
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_read(i64 %fd, i64 %buf, i64 %count) #0 {
  %.sroa.3.i.i1.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i.i = alloca %struct.iovec, align 8
  %kiocb.i4.i.i = alloca %struct.kiocb, align 8
  %iter.i.i.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i.i = alloca %struct.iovec, align 8
  %kiocb.i.i.i = alloca %struct.kiocb, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = call i64 @__fdget_pos(i32 %1) #6
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
  %11 = getelementptr inbounds %struct.file* %5, i64 0, i32 7
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %vfs_read.exit, label %15

; <label>:15                                      ; preds = %7
  %16 = and i32 %12, 131072
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %vfs_read.exit, label %18

; <label>:18                                      ; preds = %15
  %19 = ptrtoint i8* %8 to i64
  %20 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %21 = add i64 %20, -16344
  %22 = inttoptr i64 %21 to %struct.thread_info*
  %23 = getelementptr inbounds %struct.thread_info* %22, i64 0, i32 6, i32 0
  %24 = load i64* %23, align 8
  %uadd.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %19, i64 %count) #4
  %25 = extractvalue { i64, i1 } %uadd.i.i, 1
  %26 = extractvalue { i64, i1 } %uadd.i.i, 0
  %27 = icmp ugt i64 %26, %24
  %or.cond.i = or i1 %25, %27
  br i1 %or.cond.i, label %vfs_read.exit, label %28

; <label>:28                                      ; preds = %18
  %29 = getelementptr inbounds %struct.file* %5, i64 0, i32 2
  %30 = load %struct.inode** %29, align 8
  %31 = icmp slt i64 %count, 0
  br i1 %31, label %rw_verify_area.exit.i, label %32, !prof !4

; <label>:32                                      ; preds = %28
  %33 = load i64* %pos.i, align 8
  %34 = icmp slt i64 %33, 0
  br i1 %34, label %35, label %43, !prof !4

; <label>:35                                      ; preds = %32
  %36 = getelementptr inbounds %struct.file* %5, i64 0, i32 7
  %37 = load i32* %36, align 4
  %38 = and i32 %37, 8192
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %rw_verify_area.exit.i, label %40

; <label>:40                                      ; preds = %35
  %41 = sub i64 0, %33
  %42 = icmp ult i64 %count, %41
  br i1 %42, label %51, label %rw_verify_area.exit.i

; <label>:43                                      ; preds = %32
  %44 = add i64 %33, %count
  %45 = icmp slt i64 %44, 0
  br i1 %45, label %46, label %51, !prof !4

; <label>:46                                      ; preds = %43
  %47 = getelementptr inbounds %struct.file* %5, i64 0, i32 7
  %48 = load i32* %47, align 4
  %49 = and i32 %48, 8192
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %rw_verify_area.exit.i, label %51

; <label>:51                                      ; preds = %46, %43, %40
  %52 = getelementptr inbounds %struct.inode* %30, i64 0, i32 35
  %53 = load %struct.file_lock** %52, align 8
  %54 = icmp eq %struct.file_lock* %53, null
  br i1 %54, label %.critedge.i.i, label %55

; <label>:55                                      ; preds = %51
  %56 = getelementptr inbounds %struct.inode* %30, i64 0, i32 8
  %57 = load %struct.super_block** %56, align 8
  %58 = getelementptr inbounds %struct.super_block* %57, i64 0, i32 10
  %59 = load i64* %58, align 8
  %60 = and i64 %59, 64
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %55
  %62 = getelementptr inbounds %struct.inode* %30, i64 0, i32 0
  %63 = load i16* %62, align 2
  %64 = and i16 %63, 1032
  %65 = icmp eq i16 %64, 1024
  br i1 %65, label %66, label %.critedge.i.i, !prof !4

; <label>:66                                      ; preds = %mandatory_lock.exit.i.i
  %67 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %30, %struct.file* %5, i64 %33, i64 %count) #6
  %68 = icmp slt i32 %67, 0
  br i1 %68, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %66, %mandatory_lock.exit.i.i, %55, %51
  %69 = call i32 @security_file_permission(%struct.file* %5, i32 4) #6
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %rw_verify_area.exit.i

; <label>:71                                      ; preds = %.critedge.i.i
  %72 = icmp ugt i64 %count, 2147479552
  %73 = trunc i64 %count to i32
  %74 = select i1 %72, i32 2147479552, i32 %73
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %71, %.critedge.i.i, %66, %46, %40, %35, %28
  %.0.i.i = phi i32 [ %74, %71 ], [ -22, %28 ], [ -22, %35 ], [ -75, %40 ], [ -22, %46 ], [ %67, %66 ], [ %69, %.critedge.i.i ]
  %75 = sext i32 %.0.i.i to i64
  %76 = icmp sgt i32 %.0.i.i, -1
  br i1 %76, label %77, label %vfs_read.exit

; <label>:77                                      ; preds = %rw_verify_area.exit.i
  %78 = getelementptr inbounds %struct.file* %5, i64 0, i32 3
  %79 = load %struct.file_operations** %78, align 8
  %80 = getelementptr inbounds %struct.file_operations* %79, i64 0, i32 2
  %81 = load i64 (%struct.file*, i8*, i64, i64*)** %80, align 8
  %82 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %81, null
  br i1 %82, label %85, label %83

; <label>:83                                      ; preds = %77
  %84 = call i64 %81(%struct.file* %5, i8* %8, i64 %75, i64* %pos.i) #6
  br label %__vfs_read.exit.i

; <label>:85                                      ; preds = %77
  %86 = getelementptr inbounds %struct.file_operations* %79, i64 0, i32 4
  %87 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %86, align 8
  %88 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %87, null
  br i1 %88, label %114, label %89

; <label>:89                                      ; preds = %85
  %90 = bitcast %struct.iovec* %iov.i.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %90) #4
  %91 = getelementptr inbounds %struct.iovec* %iov.i.i.i, i64 0, i32 0
  store i8* %8, i8** %91, align 8
  %92 = getelementptr inbounds %struct.iovec* %iov.i.i.i, i64 0, i32 1
  store i64 %75, i64* %92, align 8
  %93 = bitcast %struct.kiocb* %kiocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %93) #4
  %94 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %94) #4
  %95 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %95) #4
  call void @llvm.memset.p0i8.i64(i8* %94, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %95, i8 0, i64 48, i32 8, i1 false) #4
  %96 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %97 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 0
  store %struct.file* %5, %struct.file** %97, align 8
  %98 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 1
  %99 = bitcast %struct.kioctx** %98 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %94, i64 24, i32 8, i1 false) #4
  %100 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i.i = bitcast %struct.task_struct* %96 to i8*
  store i8* %.c.i.i.i.i, i8** %100, align 8
  %101 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 5
  %102 = bitcast i64* %101 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %102, i8* %95, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %94) #4
  call void @llvm.lifetime.end(i64 48, i8* %95) #4
  %103 = load i64* %pos.i, align 8
  %104 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 6
  store i64 %103, i64* %104, align 8
  %105 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 7
  store i64 %75, i64* %105, align 8
  %106 = load %struct.file_operations** %78, align 8
  %107 = getelementptr inbounds %struct.file_operations* %106, i64 0, i32 4
  %108 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %107, align 8
  %109 = call i64 %108(%struct.kiocb* %kiocb.i.i.i, %struct.iovec* %iov.i.i.i, i64 1, i64 %103) #6
  %110 = icmp eq i64 %109, -529
  br i1 %110, label %111, label %do_sync_read.exit.i.i

; <label>:111                                     ; preds = %89
  %112 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i.i) #6
  br label %do_sync_read.exit.i.i

do_sync_read.exit.i.i:                            ; preds = %111, %89
  %ret.0.i.i.i = phi i64 [ %112, %111 ], [ %109, %89 ]
  %113 = load i64* %104, align 8
  store i64 %113, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %93) #4
  call void @llvm.lifetime.end(i64 16, i8* %90) #4
  br label %__vfs_read.exit.i

; <label>:114                                     ; preds = %85
  %115 = getelementptr inbounds %struct.file_operations* %79, i64 0, i32 6
  %116 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %115, align 8
  %117 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %116, null
  br i1 %117, label %__vfs_read.exit.i, label %118

; <label>:118                                     ; preds = %114
  %119 = bitcast %struct.iovec* %iov.i3.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %119) #4
  %120 = getelementptr inbounds %struct.iovec* %iov.i3.i.i, i64 0, i32 0
  store i8* %8, i8** %120, align 8
  %121 = getelementptr inbounds %struct.iovec* %iov.i3.i.i, i64 0, i32 1
  store i64 %75, i64* %121, align 8
  %122 = bitcast %struct.kiocb* %kiocb.i4.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %122) #4
  %123 = bitcast %struct.iov_iter* %iter.i.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %123) #4
  %124 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %124) #4
  %125 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %125) #4
  call void @llvm.memset.p0i8.i64(i8* %124, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %125, i8 0, i64 48, i32 8, i1 false) #4
  %126 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %127 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 0
  store %struct.file* %5, %struct.file** %127, align 8
  %128 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 1
  %129 = bitcast %struct.kioctx** %128 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %129, i8* %124, i64 24, i32 8, i1 false) #4
  %130 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 4, i32 0
  %.c.i.i5.i.i = bitcast %struct.task_struct* %126 to i8*
  store i8* %.c.i.i5.i.i, i8** %130, align 8
  %131 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 5
  %132 = bitcast i64* %131 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %132, i8* %125, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %124) #4
  call void @llvm.lifetime.end(i64 48, i8* %125) #4
  %133 = load i64* %pos.i, align 8
  %134 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 6
  store i64 %133, i64* %134, align 8
  %135 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 7
  store i64 %75, i64* %135, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i.i, i32 0, %struct.iovec* %iov.i3.i.i, i64 1, i64 %75) #6
  %136 = load %struct.file_operations** %78, align 8
  %137 = getelementptr inbounds %struct.file_operations* %136, i64 0, i32 6
  %138 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %137, align 8
  %139 = call i64 %138(%struct.kiocb* %kiocb.i4.i.i, %struct.iov_iter* %iter.i.i.i) #6
  %140 = icmp eq i64 %139, -529
  br i1 %140, label %141, label %new_sync_read.exit.i.i

; <label>:141                                     ; preds = %118
  %142 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4.i.i) #6
  br label %new_sync_read.exit.i.i

new_sync_read.exit.i.i:                           ; preds = %141, %118
  %ret.0.i6.i.i = phi i64 [ %142, %141 ], [ %139, %118 ]
  %143 = load i64* %134, align 8
  store i64 %143, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %123) #4
  call void @llvm.lifetime.end(i64 88, i8* %122) #4
  call void @llvm.lifetime.end(i64 16, i8* %119) #4
  br label %__vfs_read.exit.i

__vfs_read.exit.i:                                ; preds = %new_sync_read.exit.i.i, %114, %do_sync_read.exit.i.i, %83
  %ret.0.i.i = phi i64 [ %84, %83 ], [ %ret.0.i.i.i, %do_sync_read.exit.i.i ], [ %ret.0.i6.i.i, %new_sync_read.exit.i.i ], [ -22, %114 ]
  %144 = icmp sgt i64 %ret.0.i.i, 0
  br i1 %144, label %145, label %166

; <label>:145                                     ; preds = %__vfs_read.exit.i
  %146 = getelementptr inbounds %struct.file* %5, i64 0, i32 1
  %147 = getelementptr inbounds %struct.file* %5, i64 0, i32 2
  %148 = load %struct.inode** %147, align 8
  %149 = getelementptr inbounds %struct.inode* %148, i64 0, i32 0
  %150 = load i16* %149, align 2
  %151 = and i16 %150, -4096
  %152 = icmp eq i16 %151, 16384
  %..i.i = select i1 %152, i32 1073741825, i32 1
  %153 = load i32* %11, align 4
  %154 = and i32 %153, 67108864
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %fsnotify_access.exit.i

; <label>:156                                     ; preds = %145
  %157 = getelementptr inbounds %struct.file* %5, i64 0, i32 1, i32 1
  %158 = load %struct.dentry** %157, align 8
  %159 = call i32 @__fsnotify_parent(%struct.path* %146, %struct.dentry* %158, i32 %..i.i) #6
  %160 = bitcast %struct.path* %146 to i8*
  %161 = call i32 @fsnotify(%struct.inode* %148, i32 %..i.i, i8* %160, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i

fsnotify_access.exit.i:                           ; preds = %156, %145
  %162 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %163 = getelementptr inbounds %struct.task_struct* %162, i64 0, i32 113, i32 0
  %164 = load i64* %163, align 8
  %165 = add i64 %164, %ret.0.i.i
  store i64 %165, i64* %163, align 8
  br label %166

; <label>:166                                     ; preds = %fsnotify_access.exit.i, %__vfs_read.exit.i
  %167 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %168 = getelementptr inbounds %struct.task_struct* %167, i64 0, i32 113, i32 2
  %169 = load i64* %168, align 8
  %170 = add i64 %169, 1
  store i64 %170, i64* %168, align 8
  br label %vfs_read.exit

vfs_read.exit:                                    ; preds = %166, %rw_verify_area.exit.i, %18, %15, %7
  %.0.i = phi i64 [ -9, %7 ], [ -22, %15 ], [ %ret.0.i.i, %166 ], [ %75, %rw_verify_area.exit.i ], [ -14, %18 ]
  %171 = icmp sgt i64 %.0.i, -1
  br i1 %171, label %172, label %174

; <label>:172                                     ; preds = %vfs_read.exit
  %173 = load i64* %pos.i, align 8
  store i64 %173, i64* %9, align 8
  br label %174

; <label>:174                                     ; preds = %172, %vfs_read.exit
  %175 = and i32 %v.tr.i.i.i, 2
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %179, label %177

; <label>:177                                     ; preds = %174
  %178 = getelementptr inbounds %struct.file* %5, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %178) #6
  br label %179

; <label>:179                                     ; preds = %177, %174
  %180 = and i32 %v.tr.i.i.i, 1
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %SYSC_read.exit, label %182

; <label>:182                                     ; preds = %179
  call void @fput(%struct.file* %5) #6
  br label %SYSC_read.exit

SYSC_read.exit:                                   ; preds = %182, %179, %0
  %ret.0.i = phi i64 [ -9, %0 ], [ %.0.i, %179 ], [ %.0.i, %182 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_write(i64 %fd, i64 %buf, i64 %count) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i = alloca %struct.iovec, align 8
  %kiocb.i4.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = call i64 @__fdget_pos(i32 %1) #6
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
  %11 = getelementptr inbounds %struct.file* %5, i64 0, i32 7
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 2
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %vfs_write.exit, label %15

; <label>:15                                      ; preds = %7
  %16 = and i32 %12, 262144
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %vfs_write.exit, label %18

; <label>:18                                      ; preds = %15
  %19 = ptrtoint i8* %8 to i64
  %20 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %21 = add i64 %20, -16344
  %22 = inttoptr i64 %21 to %struct.thread_info*
  %23 = getelementptr inbounds %struct.thread_info* %22, i64 0, i32 6, i32 0
  %24 = load i64* %23, align 8
  %uadd.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %19, i64 %count) #4
  %25 = extractvalue { i64, i1 } %uadd.i.i, 1
  %26 = extractvalue { i64, i1 } %uadd.i.i, 0
  %27 = icmp ugt i64 %26, %24
  %or.cond.i = or i1 %25, %27
  br i1 %or.cond.i, label %vfs_write.exit, label %28

; <label>:28                                      ; preds = %18
  %29 = getelementptr inbounds %struct.file* %5, i64 0, i32 2
  %30 = load %struct.inode** %29, align 8
  %31 = icmp slt i64 %count, 0
  br i1 %31, label %rw_verify_area.exit.i, label %32, !prof !4

; <label>:32                                      ; preds = %28
  %33 = load i64* %pos.i, align 8
  %34 = icmp slt i64 %33, 0
  br i1 %34, label %35, label %43, !prof !4

; <label>:35                                      ; preds = %32
  %36 = getelementptr inbounds %struct.file* %5, i64 0, i32 7
  %37 = load i32* %36, align 4
  %38 = and i32 %37, 8192
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %rw_verify_area.exit.i, label %40

; <label>:40                                      ; preds = %35
  %41 = sub i64 0, %33
  %42 = icmp ult i64 %count, %41
  br i1 %42, label %51, label %rw_verify_area.exit.i

; <label>:43                                      ; preds = %32
  %44 = add i64 %33, %count
  %45 = icmp slt i64 %44, 0
  br i1 %45, label %46, label %51, !prof !4

; <label>:46                                      ; preds = %43
  %47 = getelementptr inbounds %struct.file* %5, i64 0, i32 7
  %48 = load i32* %47, align 4
  %49 = and i32 %48, 8192
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %rw_verify_area.exit.i, label %51

; <label>:51                                      ; preds = %46, %43, %40
  %52 = getelementptr inbounds %struct.inode* %30, i64 0, i32 35
  %53 = load %struct.file_lock** %52, align 8
  %54 = icmp eq %struct.file_lock* %53, null
  br i1 %54, label %.critedge.i.i, label %55

; <label>:55                                      ; preds = %51
  %56 = getelementptr inbounds %struct.inode* %30, i64 0, i32 8
  %57 = load %struct.super_block** %56, align 8
  %58 = getelementptr inbounds %struct.super_block* %57, i64 0, i32 10
  %59 = load i64* %58, align 8
  %60 = and i64 %59, 64
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %55
  %62 = getelementptr inbounds %struct.inode* %30, i64 0, i32 0
  %63 = load i16* %62, align 2
  %64 = and i16 %63, 1032
  %65 = icmp eq i16 %64, 1024
  br i1 %65, label %66, label %.critedge.i.i, !prof !4

; <label>:66                                      ; preds = %mandatory_lock.exit.i.i
  %67 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %30, %struct.file* %5, i64 %33, i64 %count) #6
  %68 = icmp slt i32 %67, 0
  br i1 %68, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %66, %mandatory_lock.exit.i.i, %55, %51
  %69 = call i32 @security_file_permission(%struct.file* %5, i32 2) #6
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %rw_verify_area.exit.i

; <label>:71                                      ; preds = %.critedge.i.i
  %72 = icmp ugt i64 %count, 2147479552
  %73 = trunc i64 %count to i32
  %74 = select i1 %72, i32 2147479552, i32 %73
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %71, %.critedge.i.i, %66, %46, %40, %35, %28
  %.0.i.i = phi i32 [ %74, %71 ], [ -22, %28 ], [ -22, %35 ], [ -75, %40 ], [ -22, %46 ], [ %67, %66 ], [ %69, %.critedge.i.i ]
  %75 = sext i32 %.0.i.i to i64
  %76 = icmp sgt i32 %.0.i.i, -1
  br i1 %76, label %77, label %vfs_write.exit

; <label>:77                                      ; preds = %rw_verify_area.exit.i
  %78 = getelementptr inbounds %struct.file* %5, i64 0, i32 2
  %79 = load %struct.inode** %78, align 8
  %80 = getelementptr inbounds %struct.inode* %79, i64 0, i32 0
  %81 = load i16* %80, align 2
  %82 = and i16 %81, -4096
  %83 = icmp eq i16 %82, -32768
  br i1 %83, label %84, label %file_start_write.exit.i

; <label>:84                                      ; preds = %77
  %85 = getelementptr inbounds %struct.inode* %79, i64 0, i32 8
  %86 = load %struct.super_block** %85, align 8
  %87 = call i32 @__sb_start_write(%struct.super_block* %86, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %84, %77
  %88 = getelementptr inbounds %struct.file* %5, i64 0, i32 3
  %89 = load %struct.file_operations** %88, align 8
  %90 = getelementptr inbounds %struct.file_operations* %89, i64 0, i32 3
  %91 = load i64 (%struct.file*, i8*, i64, i64*)** %90, align 8
  %92 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %91, null
  br i1 %92, label %95, label %93

; <label>:93                                      ; preds = %file_start_write.exit.i
  %94 = call i64 %91(%struct.file* %5, i8* %8, i64 %75, i64* %pos.i) #6
  br label %150

; <label>:95                                      ; preds = %file_start_write.exit.i
  %96 = getelementptr inbounds %struct.file_operations* %89, i64 0, i32 5
  %97 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %96, align 8
  %98 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %97, null
  br i1 %98, label %124, label %99

; <label>:99                                      ; preds = %95
  %100 = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %100) #4
  %101 = getelementptr inbounds %struct.iovec* %iov.i.i, i64 0, i32 0
  store i8* %8, i8** %101, align 8
  %102 = getelementptr inbounds %struct.iovec* %iov.i.i, i64 0, i32 1
  store i64 %75, i64* %102, align 8
  %103 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %103) #4
  %104 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %104) #4
  %105 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %105) #4
  call void @llvm.memset.p0i8.i64(i8* %104, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %105, i8 0, i64 48, i32 8, i1 false) #4
  %106 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %107 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %5, %struct.file** %107, align 8
  %108 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %109 = bitcast %struct.kioctx** %108 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %109, i8* %104, i64 24, i32 8, i1 false) #4
  %110 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %106 to i8*
  store i8* %.c.i.i.i, i8** %110, align 8
  %111 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %112 = bitcast i64* %111 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %112, i8* %105, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %104) #4
  call void @llvm.lifetime.end(i64 48, i8* %105) #4
  %113 = load i64* %pos.i, align 8
  %114 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %113, i64* %114, align 8
  %115 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %75, i64* %115, align 8
  %116 = load %struct.file_operations** %88, align 8
  %117 = getelementptr inbounds %struct.file_operations* %116, i64 0, i32 5
  %118 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %117, align 8
  %119 = call i64 %118(%struct.kiocb* %kiocb.i.i, %struct.iovec* %iov.i.i, i64 1, i64 %113) #6
  %120 = icmp eq i64 %119, -529
  br i1 %120, label %121, label %do_sync_write.exit.i

; <label>:121                                     ; preds = %99
  %122 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_sync_write.exit.i

do_sync_write.exit.i:                             ; preds = %121, %99
  %ret.0.i.i = phi i64 [ %122, %121 ], [ %119, %99 ]
  %123 = load i64* %114, align 8
  store i64 %123, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %103) #4
  call void @llvm.lifetime.end(i64 16, i8* %100) #4
  br label %150

; <label>:124                                     ; preds = %95
  %125 = bitcast %struct.iovec* %iov.i3.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %125) #4
  %126 = getelementptr inbounds %struct.iovec* %iov.i3.i, i64 0, i32 0
  store i8* %8, i8** %126, align 8
  %127 = getelementptr inbounds %struct.iovec* %iov.i3.i, i64 0, i32 1
  store i64 %75, i64* %127, align 8
  %128 = bitcast %struct.kiocb* %kiocb.i4.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %128) #4
  %129 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %129) #4
  %130 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %130) #4
  %131 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %131) #4
  call void @llvm.memset.p0i8.i64(i8* %130, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %131, i8 0, i64 48, i32 8, i1 false) #4
  %132 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %133 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 0
  store %struct.file* %5, %struct.file** %133, align 8
  %134 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 1
  %135 = bitcast %struct.kioctx** %134 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* %130, i64 24, i32 8, i1 false) #4
  %136 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 4, i32 0
  %.c.i.i5.i = bitcast %struct.task_struct* %132 to i8*
  store i8* %.c.i.i5.i, i8** %136, align 8
  %137 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 5
  %138 = bitcast i64* %137 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %138, i8* %131, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %130) #4
  call void @llvm.lifetime.end(i64 48, i8* %131) #4
  %139 = load i64* %pos.i, align 8
  %140 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 6
  store i64 %139, i64* %140, align 8
  %141 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 7
  store i64 %75, i64* %141, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 1, %struct.iovec* %iov.i3.i, i64 1, i64 %75) #6
  %142 = load %struct.file_operations** %88, align 8
  %143 = getelementptr inbounds %struct.file_operations* %142, i64 0, i32 7
  %144 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %143, align 8
  %145 = call i64 %144(%struct.kiocb* %kiocb.i4.i, %struct.iov_iter* %iter.i.i) #6
  %146 = icmp eq i64 %145, -529
  br i1 %146, label %147, label %new_sync_write.exit.i

; <label>:147                                     ; preds = %124
  %148 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4.i) #6
  br label %new_sync_write.exit.i

new_sync_write.exit.i:                            ; preds = %147, %124
  %ret.0.i6.i = phi i64 [ %148, %147 ], [ %145, %124 ]
  %149 = load i64* %140, align 8
  store i64 %149, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %129) #4
  call void @llvm.lifetime.end(i64 88, i8* %128) #4
  call void @llvm.lifetime.end(i64 16, i8* %125) #4
  br label %150

; <label>:150                                     ; preds = %new_sync_write.exit.i, %do_sync_write.exit.i, %93
  %ret.0.i1 = phi i64 [ %94, %93 ], [ %ret.0.i.i, %do_sync_write.exit.i ], [ %ret.0.i6.i, %new_sync_write.exit.i ]
  %151 = icmp sgt i64 %ret.0.i1, 0
  br i1 %151, label %152, label %172

; <label>:152                                     ; preds = %150
  %153 = getelementptr inbounds %struct.file* %5, i64 0, i32 1
  %154 = load %struct.inode** %78, align 8
  %155 = getelementptr inbounds %struct.inode* %154, i64 0, i32 0
  %156 = load i16* %155, align 2
  %157 = and i16 %156, -4096
  %158 = icmp eq i16 %157, 16384
  %..i.i = select i1 %158, i32 1073741826, i32 2
  %159 = load i32* %11, align 4
  %160 = and i32 %159, 67108864
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %fsnotify_modify.exit.i

; <label>:162                                     ; preds = %152
  %163 = getelementptr inbounds %struct.file* %5, i64 0, i32 1, i32 1
  %164 = load %struct.dentry** %163, align 8
  %165 = call i32 @__fsnotify_parent(%struct.path* %153, %struct.dentry* %164, i32 %..i.i) #6
  %166 = bitcast %struct.path* %153 to i8*
  %167 = call i32 @fsnotify(%struct.inode* %154, i32 %..i.i, i8* %166, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i

fsnotify_modify.exit.i:                           ; preds = %162, %152
  %168 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %169 = getelementptr inbounds %struct.task_struct* %168, i64 0, i32 113, i32 1
  %170 = load i64* %169, align 8
  %171 = add i64 %170, %ret.0.i1
  store i64 %171, i64* %169, align 8
  br label %172

; <label>:172                                     ; preds = %fsnotify_modify.exit.i, %150
  %173 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %174 = getelementptr inbounds %struct.task_struct* %173, i64 0, i32 113, i32 3
  %175 = load i64* %174, align 8
  %176 = add i64 %175, 1
  store i64 %176, i64* %174, align 8
  %177 = load %struct.inode** %78, align 8
  %178 = getelementptr inbounds %struct.inode* %177, i64 0, i32 0
  %179 = load i16* %178, align 2
  %180 = and i16 %179, -4096
  %181 = icmp eq i16 %180, -32768
  br i1 %181, label %182, label %vfs_write.exit

; <label>:182                                     ; preds = %172
  %183 = getelementptr inbounds %struct.inode* %177, i64 0, i32 8
  %184 = load %struct.super_block** %183, align 8
  call void @__sb_end_write(%struct.super_block* %184, i32 1) #6
  br label %vfs_write.exit

vfs_write.exit:                                   ; preds = %182, %172, %rw_verify_area.exit.i, %18, %15, %7
  %.0.i = phi i64 [ -9, %7 ], [ -22, %15 ], [ %75, %rw_verify_area.exit.i ], [ %ret.0.i1, %172 ], [ %ret.0.i1, %182 ], [ -14, %18 ]
  %185 = icmp sgt i64 %.0.i, -1
  br i1 %185, label %186, label %188

; <label>:186                                     ; preds = %vfs_write.exit
  %187 = load i64* %pos.i, align 8
  store i64 %187, i64* %9, align 8
  br label %188

; <label>:188                                     ; preds = %186, %vfs_write.exit
  %189 = and i32 %v.tr.i.i.i, 2
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %193, label %191

; <label>:191                                     ; preds = %188
  %192 = getelementptr inbounds %struct.file* %5, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %192) #6
  br label %193

; <label>:193                                     ; preds = %191, %188
  %194 = and i32 %v.tr.i.i.i, 1
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %SYSC_write.exit, label %196

; <label>:196                                     ; preds = %193
  call void @fput(%struct.file* %5) #6
  br label %SYSC_write.exit

SYSC_write.exit:                                  ; preds = %196, %193, %0
  %ret.0.i = phi i64 [ -9, %0 ], [ %.0.i, %193 ], [ %.0.i, %196 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_pread64(i64 %fd, i64 %buf, i64 %count, i64 %pos) #0 {
  %.sroa.3.i.i1.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i.i = alloca %struct.iovec, align 8
  %kiocb.i4.i.i = alloca %struct.kiocb, align 8
  %iter.i.i.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i.i = alloca %struct.iovec, align 8
  %kiocb.i.i.i = alloca %struct.kiocb, align 8
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %buf to i8*
  %3 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  store i64 %pos, i64* %1, align 8
  %4 = icmp slt i64 %pos, 0
  br i1 %4, label %SYSC_pread64.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = trunc i64 %fd to i32
  %7 = call i64 @__fdget(i32 %6) #6
  %8 = and i64 %7, -4
  %9 = inttoptr i64 %8 to %struct.file*
  %10 = icmp eq i64 %8, 0
  br i1 %10, label %SYSC_pread64.exit, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %177, label %16

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %vfs_read.exit, label %21

; <label>:21                                      ; preds = %16
  %22 = and i32 %18, 131072
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %vfs_read.exit, label %24

; <label>:24                                      ; preds = %21
  %25 = ptrtoint i8* %2 to i64
  %26 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %27 = add i64 %26, -16344
  %28 = inttoptr i64 %27 to %struct.thread_info*
  %29 = getelementptr inbounds %struct.thread_info* %28, i64 0, i32 6, i32 0
  %30 = load i64* %29, align 8
  %uadd.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %25, i64 %count) #4
  %31 = extractvalue { i64, i1 } %uadd.i.i, 1
  %32 = extractvalue { i64, i1 } %uadd.i.i, 0
  %33 = icmp ugt i64 %32, %30
  %or.cond.i = or i1 %31, %33
  br i1 %or.cond.i, label %vfs_read.exit, label %34

; <label>:34                                      ; preds = %24
  %35 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %36 = load %struct.inode** %35, align 8
  %37 = icmp slt i64 %count, 0
  br i1 %37, label %rw_verify_area.exit.i, label %38, !prof !4

; <label>:38                                      ; preds = %34
  %39 = load i64* %1, align 8
  %40 = icmp slt i64 %39, 0
  br i1 %40, label %41, label %49, !prof !4

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %43 = load i32* %42, align 4
  %44 = and i32 %43, 8192
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %rw_verify_area.exit.i, label %46

; <label>:46                                      ; preds = %41
  %47 = sub i64 0, %39
  %48 = icmp ult i64 %count, %47
  br i1 %48, label %57, label %rw_verify_area.exit.i

; <label>:49                                      ; preds = %38
  %50 = add i64 %39, %count
  %51 = icmp slt i64 %50, 0
  br i1 %51, label %52, label %57, !prof !4

; <label>:52                                      ; preds = %49
  %53 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %54 = load i32* %53, align 4
  %55 = and i32 %54, 8192
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %rw_verify_area.exit.i, label %57

; <label>:57                                      ; preds = %52, %49, %46
  %58 = getelementptr inbounds %struct.inode* %36, i64 0, i32 35
  %59 = load %struct.file_lock** %58, align 8
  %60 = icmp eq %struct.file_lock* %59, null
  br i1 %60, label %.critedge.i.i, label %61

; <label>:61                                      ; preds = %57
  %62 = getelementptr inbounds %struct.inode* %36, i64 0, i32 8
  %63 = load %struct.super_block** %62, align 8
  %64 = getelementptr inbounds %struct.super_block* %63, i64 0, i32 10
  %65 = load i64* %64, align 8
  %66 = and i64 %65, 64
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %61
  %68 = getelementptr inbounds %struct.inode* %36, i64 0, i32 0
  %69 = load i16* %68, align 2
  %70 = and i16 %69, 1032
  %71 = icmp eq i16 %70, 1024
  br i1 %71, label %72, label %.critedge.i.i, !prof !4

; <label>:72                                      ; preds = %mandatory_lock.exit.i.i
  %73 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %36, %struct.file* %9, i64 %39, i64 %count) #6
  %74 = icmp slt i32 %73, 0
  br i1 %74, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %72, %mandatory_lock.exit.i.i, %61, %57
  %75 = call i32 @security_file_permission(%struct.file* %9, i32 4) #6
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %rw_verify_area.exit.i

; <label>:77                                      ; preds = %.critedge.i.i
  %78 = icmp ugt i64 %count, 2147479552
  %79 = trunc i64 %count to i32
  %80 = select i1 %78, i32 2147479552, i32 %79
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %77, %.critedge.i.i, %72, %52, %46, %41, %34
  %.0.i.i = phi i32 [ %80, %77 ], [ -22, %34 ], [ -22, %41 ], [ -75, %46 ], [ -22, %52 ], [ %73, %72 ], [ %75, %.critedge.i.i ]
  %81 = sext i32 %.0.i.i to i64
  %82 = icmp sgt i32 %.0.i.i, -1
  br i1 %82, label %83, label %vfs_read.exit

; <label>:83                                      ; preds = %rw_verify_area.exit.i
  %84 = getelementptr inbounds %struct.file* %9, i64 0, i32 3
  %85 = load %struct.file_operations** %84, align 8
  %86 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 2
  %87 = load i64 (%struct.file*, i8*, i64, i64*)** %86, align 8
  %88 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %87, null
  br i1 %88, label %91, label %89

; <label>:89                                      ; preds = %83
  %90 = call i64 %87(%struct.file* %9, i8* %2, i64 %81, i64* %1) #6
  br label %__vfs_read.exit.i

; <label>:91                                      ; preds = %83
  %92 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 4
  %93 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %92, align 8
  %94 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %93, null
  br i1 %94, label %120, label %95

; <label>:95                                      ; preds = %91
  %96 = bitcast %struct.iovec* %iov.i.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %96) #4
  %97 = getelementptr inbounds %struct.iovec* %iov.i.i.i, i64 0, i32 0
  store i8* %2, i8** %97, align 8
  %98 = getelementptr inbounds %struct.iovec* %iov.i.i.i, i64 0, i32 1
  store i64 %81, i64* %98, align 8
  %99 = bitcast %struct.kiocb* %kiocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %99) #4
  %100 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %100) #4
  %101 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %101) #4
  call void @llvm.memset.p0i8.i64(i8* %100, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %101, i8 0, i64 48, i32 8, i1 false) #4
  %102 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %103 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %103, align 8
  %104 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 1
  %105 = bitcast %struct.kioctx** %104 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %105, i8* %100, i64 24, i32 8, i1 false) #4
  %106 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i.i = bitcast %struct.task_struct* %102 to i8*
  store i8* %.c.i.i.i.i, i8** %106, align 8
  %107 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 5
  %108 = bitcast i64* %107 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %108, i8* %101, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %100) #4
  call void @llvm.lifetime.end(i64 48, i8* %101) #4
  %109 = load i64* %1, align 8
  %110 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 6
  store i64 %109, i64* %110, align 8
  %111 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 7
  store i64 %81, i64* %111, align 8
  %112 = load %struct.file_operations** %84, align 8
  %113 = getelementptr inbounds %struct.file_operations* %112, i64 0, i32 4
  %114 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %113, align 8
  %115 = call i64 %114(%struct.kiocb* %kiocb.i.i.i, %struct.iovec* %iov.i.i.i, i64 1, i64 %109) #6
  %116 = icmp eq i64 %115, -529
  br i1 %116, label %117, label %do_sync_read.exit.i.i

; <label>:117                                     ; preds = %95
  %118 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i.i) #6
  br label %do_sync_read.exit.i.i

do_sync_read.exit.i.i:                            ; preds = %117, %95
  %ret.0.i.i.i = phi i64 [ %118, %117 ], [ %115, %95 ]
  %119 = load i64* %110, align 8
  store i64 %119, i64* %1, align 8
  call void @llvm.lifetime.end(i64 88, i8* %99) #4
  call void @llvm.lifetime.end(i64 16, i8* %96) #4
  br label %__vfs_read.exit.i

; <label>:120                                     ; preds = %91
  %121 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 6
  %122 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %121, align 8
  %123 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %122, null
  br i1 %123, label %__vfs_read.exit.i, label %124

; <label>:124                                     ; preds = %120
  %125 = bitcast %struct.iovec* %iov.i3.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %125) #4
  %126 = getelementptr inbounds %struct.iovec* %iov.i3.i.i, i64 0, i32 0
  store i8* %2, i8** %126, align 8
  %127 = getelementptr inbounds %struct.iovec* %iov.i3.i.i, i64 0, i32 1
  store i64 %81, i64* %127, align 8
  %128 = bitcast %struct.kiocb* %kiocb.i4.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %128) #4
  %129 = bitcast %struct.iov_iter* %iter.i.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %129) #4
  %130 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %130) #4
  %131 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %131) #4
  call void @llvm.memset.p0i8.i64(i8* %130, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %131, i8 0, i64 48, i32 8, i1 false) #4
  %132 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %133 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %133, align 8
  %134 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 1
  %135 = bitcast %struct.kioctx** %134 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* %130, i64 24, i32 8, i1 false) #4
  %136 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 4, i32 0
  %.c.i.i5.i.i = bitcast %struct.task_struct* %132 to i8*
  store i8* %.c.i.i5.i.i, i8** %136, align 8
  %137 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 5
  %138 = bitcast i64* %137 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %138, i8* %131, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %130) #4
  call void @llvm.lifetime.end(i64 48, i8* %131) #4
  %139 = load i64* %1, align 8
  %140 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 6
  store i64 %139, i64* %140, align 8
  %141 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i.i, i64 0, i32 7
  store i64 %81, i64* %141, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i.i, i32 0, %struct.iovec* %iov.i3.i.i, i64 1, i64 %81) #6
  %142 = load %struct.file_operations** %84, align 8
  %143 = getelementptr inbounds %struct.file_operations* %142, i64 0, i32 6
  %144 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %143, align 8
  %145 = call i64 %144(%struct.kiocb* %kiocb.i4.i.i, %struct.iov_iter* %iter.i.i.i) #6
  %146 = icmp eq i64 %145, -529
  br i1 %146, label %147, label %new_sync_read.exit.i.i

; <label>:147                                     ; preds = %124
  %148 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4.i.i) #6
  br label %new_sync_read.exit.i.i

new_sync_read.exit.i.i:                           ; preds = %147, %124
  %ret.0.i6.i.i = phi i64 [ %148, %147 ], [ %145, %124 ]
  %149 = load i64* %140, align 8
  store i64 %149, i64* %1, align 8
  call void @llvm.lifetime.end(i64 40, i8* %129) #4
  call void @llvm.lifetime.end(i64 88, i8* %128) #4
  call void @llvm.lifetime.end(i64 16, i8* %125) #4
  br label %__vfs_read.exit.i

__vfs_read.exit.i:                                ; preds = %new_sync_read.exit.i.i, %120, %do_sync_read.exit.i.i, %89
  %ret.0.i.i = phi i64 [ %90, %89 ], [ %ret.0.i.i.i, %do_sync_read.exit.i.i ], [ %ret.0.i6.i.i, %new_sync_read.exit.i.i ], [ -22, %120 ]
  %150 = icmp sgt i64 %ret.0.i.i, 0
  br i1 %150, label %151, label %172

; <label>:151                                     ; preds = %__vfs_read.exit.i
  %152 = getelementptr inbounds %struct.file* %9, i64 0, i32 1
  %153 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %154 = load %struct.inode** %153, align 8
  %155 = getelementptr inbounds %struct.inode* %154, i64 0, i32 0
  %156 = load i16* %155, align 2
  %157 = and i16 %156, -4096
  %158 = icmp eq i16 %157, 16384
  %..i.i = select i1 %158, i32 1073741825, i32 1
  %159 = load i32* %17, align 4
  %160 = and i32 %159, 67108864
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %fsnotify_access.exit.i

; <label>:162                                     ; preds = %151
  %163 = getelementptr inbounds %struct.file* %9, i64 0, i32 1, i32 1
  %164 = load %struct.dentry** %163, align 8
  %165 = call i32 @__fsnotify_parent(%struct.path* %152, %struct.dentry* %164, i32 %..i.i) #6
  %166 = bitcast %struct.path* %152 to i8*
  %167 = call i32 @fsnotify(%struct.inode* %154, i32 %..i.i, i8* %166, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i

fsnotify_access.exit.i:                           ; preds = %162, %151
  %168 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %169 = getelementptr inbounds %struct.task_struct* %168, i64 0, i32 113, i32 0
  %170 = load i64* %169, align 8
  %171 = add i64 %170, %ret.0.i.i
  store i64 %171, i64* %169, align 8
  br label %172

; <label>:172                                     ; preds = %fsnotify_access.exit.i, %__vfs_read.exit.i
  %173 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %174 = getelementptr inbounds %struct.task_struct* %173, i64 0, i32 113, i32 2
  %175 = load i64* %174, align 8
  %176 = add i64 %175, 1
  store i64 %176, i64* %174, align 8
  br label %vfs_read.exit

vfs_read.exit:                                    ; preds = %172, %rw_verify_area.exit.i, %24, %21, %16
  %.0.i1 = phi i64 [ -9, %16 ], [ -22, %21 ], [ %ret.0.i.i, %172 ], [ %81, %rw_verify_area.exit.i ], [ -14, %24 ]
  br label %177

; <label>:177                                     ; preds = %vfs_read.exit, %11
  %ret.0.i = phi i64 [ %.0.i1, %vfs_read.exit ], [ -29, %11 ]
  %178 = and i64 %7, 1
  %179 = icmp eq i64 %178, 0
  br i1 %179, label %SYSC_pread64.exit, label %180

; <label>:180                                     ; preds = %177
  call void @fput(%struct.file* %9) #6
  br label %SYSC_pread64.exit

SYSC_pread64.exit:                                ; preds = %180, %177, %5, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %5 ], [ %ret.0.i, %177 ], [ %ret.0.i, %180 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_pwrite64(i64 %fd, i64 %buf, i64 %count, i64 %pos) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i = alloca %struct.iovec, align 8
  %kiocb.i4.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %buf to i8*
  %3 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  store i64 %pos, i64* %1, align 8
  %4 = icmp slt i64 %pos, 0
  br i1 %4, label %SYSC_pwrite64.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = trunc i64 %fd to i32
  %7 = call i64 @__fdget(i32 %6) #6
  %8 = and i64 %7, -4
  %9 = inttoptr i64 %8 to %struct.file*
  %10 = icmp eq i64 %8, 0
  br i1 %10, label %SYSC_pwrite64.exit, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 16
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %191, label %16

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 2
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %vfs_write.exit, label %21

; <label>:21                                      ; preds = %16
  %22 = and i32 %18, 262144
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %vfs_write.exit, label %24

; <label>:24                                      ; preds = %21
  %25 = ptrtoint i8* %2 to i64
  %26 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %27 = add i64 %26, -16344
  %28 = inttoptr i64 %27 to %struct.thread_info*
  %29 = getelementptr inbounds %struct.thread_info* %28, i64 0, i32 6, i32 0
  %30 = load i64* %29, align 8
  %uadd.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %25, i64 %count) #4
  %31 = extractvalue { i64, i1 } %uadd.i.i, 1
  %32 = extractvalue { i64, i1 } %uadd.i.i, 0
  %33 = icmp ugt i64 %32, %30
  %or.cond.i = or i1 %31, %33
  br i1 %or.cond.i, label %vfs_write.exit, label %34

; <label>:34                                      ; preds = %24
  %35 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %36 = load %struct.inode** %35, align 8
  %37 = icmp slt i64 %count, 0
  br i1 %37, label %rw_verify_area.exit.i, label %38, !prof !4

; <label>:38                                      ; preds = %34
  %39 = load i64* %1, align 8
  %40 = icmp slt i64 %39, 0
  br i1 %40, label %41, label %49, !prof !4

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %43 = load i32* %42, align 4
  %44 = and i32 %43, 8192
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %rw_verify_area.exit.i, label %46

; <label>:46                                      ; preds = %41
  %47 = sub i64 0, %39
  %48 = icmp ult i64 %count, %47
  br i1 %48, label %57, label %rw_verify_area.exit.i

; <label>:49                                      ; preds = %38
  %50 = add i64 %39, %count
  %51 = icmp slt i64 %50, 0
  br i1 %51, label %52, label %57, !prof !4

; <label>:52                                      ; preds = %49
  %53 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %54 = load i32* %53, align 4
  %55 = and i32 %54, 8192
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %rw_verify_area.exit.i, label %57

; <label>:57                                      ; preds = %52, %49, %46
  %58 = getelementptr inbounds %struct.inode* %36, i64 0, i32 35
  %59 = load %struct.file_lock** %58, align 8
  %60 = icmp eq %struct.file_lock* %59, null
  br i1 %60, label %.critedge.i.i, label %61

; <label>:61                                      ; preds = %57
  %62 = getelementptr inbounds %struct.inode* %36, i64 0, i32 8
  %63 = load %struct.super_block** %62, align 8
  %64 = getelementptr inbounds %struct.super_block* %63, i64 0, i32 10
  %65 = load i64* %64, align 8
  %66 = and i64 %65, 64
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %61
  %68 = getelementptr inbounds %struct.inode* %36, i64 0, i32 0
  %69 = load i16* %68, align 2
  %70 = and i16 %69, 1032
  %71 = icmp eq i16 %70, 1024
  br i1 %71, label %72, label %.critedge.i.i, !prof !4

; <label>:72                                      ; preds = %mandatory_lock.exit.i.i
  %73 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %36, %struct.file* %9, i64 %39, i64 %count) #6
  %74 = icmp slt i32 %73, 0
  br i1 %74, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %72, %mandatory_lock.exit.i.i, %61, %57
  %75 = call i32 @security_file_permission(%struct.file* %9, i32 2) #6
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %rw_verify_area.exit.i

; <label>:77                                      ; preds = %.critedge.i.i
  %78 = icmp ugt i64 %count, 2147479552
  %79 = trunc i64 %count to i32
  %80 = select i1 %78, i32 2147479552, i32 %79
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %77, %.critedge.i.i, %72, %52, %46, %41, %34
  %.0.i.i = phi i32 [ %80, %77 ], [ -22, %34 ], [ -22, %41 ], [ -75, %46 ], [ -22, %52 ], [ %73, %72 ], [ %75, %.critedge.i.i ]
  %81 = sext i32 %.0.i.i to i64
  %82 = icmp sgt i32 %.0.i.i, -1
  br i1 %82, label %83, label %vfs_write.exit

; <label>:83                                      ; preds = %rw_verify_area.exit.i
  %84 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %85 = load %struct.inode** %84, align 8
  %86 = getelementptr inbounds %struct.inode* %85, i64 0, i32 0
  %87 = load i16* %86, align 2
  %88 = and i16 %87, -4096
  %89 = icmp eq i16 %88, -32768
  br i1 %89, label %90, label %file_start_write.exit.i

; <label>:90                                      ; preds = %83
  %91 = getelementptr inbounds %struct.inode* %85, i64 0, i32 8
  %92 = load %struct.super_block** %91, align 8
  %93 = call i32 @__sb_start_write(%struct.super_block* %92, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %90, %83
  %94 = getelementptr inbounds %struct.file* %9, i64 0, i32 3
  %95 = load %struct.file_operations** %94, align 8
  %96 = getelementptr inbounds %struct.file_operations* %95, i64 0, i32 3
  %97 = load i64 (%struct.file*, i8*, i64, i64*)** %96, align 8
  %98 = icmp eq i64 (%struct.file*, i8*, i64, i64*)* %97, null
  br i1 %98, label %101, label %99

; <label>:99                                      ; preds = %file_start_write.exit.i
  %100 = call i64 %97(%struct.file* %9, i8* %2, i64 %81, i64* %1) #6
  br label %156

; <label>:101                                     ; preds = %file_start_write.exit.i
  %102 = getelementptr inbounds %struct.file_operations* %95, i64 0, i32 5
  %103 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %102, align 8
  %104 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %103, null
  br i1 %104, label %130, label %105

; <label>:105                                     ; preds = %101
  %106 = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %106) #4
  %107 = getelementptr inbounds %struct.iovec* %iov.i.i, i64 0, i32 0
  store i8* %2, i8** %107, align 8
  %108 = getelementptr inbounds %struct.iovec* %iov.i.i, i64 0, i32 1
  store i64 %81, i64* %108, align 8
  %109 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %109) #4
  %110 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %110) #4
  %111 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %111) #4
  call void @llvm.memset.p0i8.i64(i8* %110, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %111, i8 0, i64 48, i32 8, i1 false) #4
  %112 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %113 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %113, align 8
  %114 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %115 = bitcast %struct.kioctx** %114 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %115, i8* %110, i64 24, i32 8, i1 false) #4
  %116 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %112 to i8*
  store i8* %.c.i.i.i, i8** %116, align 8
  %117 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %118 = bitcast i64* %117 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %118, i8* %111, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %110) #4
  call void @llvm.lifetime.end(i64 48, i8* %111) #4
  %119 = load i64* %1, align 8
  %120 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %119, i64* %120, align 8
  %121 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %81, i64* %121, align 8
  %122 = load %struct.file_operations** %94, align 8
  %123 = getelementptr inbounds %struct.file_operations* %122, i64 0, i32 5
  %124 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %123, align 8
  %125 = call i64 %124(%struct.kiocb* %kiocb.i.i, %struct.iovec* %iov.i.i, i64 1, i64 %119) #6
  %126 = icmp eq i64 %125, -529
  br i1 %126, label %127, label %do_sync_write.exit.i

; <label>:127                                     ; preds = %105
  %128 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_sync_write.exit.i

do_sync_write.exit.i:                             ; preds = %127, %105
  %ret.0.i.i = phi i64 [ %128, %127 ], [ %125, %105 ]
  %129 = load i64* %120, align 8
  store i64 %129, i64* %1, align 8
  call void @llvm.lifetime.end(i64 88, i8* %109) #4
  call void @llvm.lifetime.end(i64 16, i8* %106) #4
  br label %156

; <label>:130                                     ; preds = %101
  %131 = bitcast %struct.iovec* %iov.i3.i to i8*
  call void @llvm.lifetime.start(i64 16, i8* %131) #4
  %132 = getelementptr inbounds %struct.iovec* %iov.i3.i, i64 0, i32 0
  store i8* %2, i8** %132, align 8
  %133 = getelementptr inbounds %struct.iovec* %iov.i3.i, i64 0, i32 1
  store i64 %81, i64* %133, align 8
  %134 = bitcast %struct.kiocb* %kiocb.i4.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %134) #4
  %135 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %135) #4
  %136 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %136) #4
  %137 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %137) #4
  call void @llvm.memset.p0i8.i64(i8* %136, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %137, i8 0, i64 48, i32 8, i1 false) #4
  %138 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %139 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %139, align 8
  %140 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 1
  %141 = bitcast %struct.kioctx** %140 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %141, i8* %136, i64 24, i32 8, i1 false) #4
  %142 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 4, i32 0
  %.c.i.i5.i = bitcast %struct.task_struct* %138 to i8*
  store i8* %.c.i.i5.i, i8** %142, align 8
  %143 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 5
  %144 = bitcast i64* %143 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %144, i8* %137, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %136) #4
  call void @llvm.lifetime.end(i64 48, i8* %137) #4
  %145 = load i64* %1, align 8
  %146 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 6
  store i64 %145, i64* %146, align 8
  %147 = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i64 0, i32 7
  store i64 %81, i64* %147, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 1, %struct.iovec* %iov.i3.i, i64 1, i64 %81) #6
  %148 = load %struct.file_operations** %94, align 8
  %149 = getelementptr inbounds %struct.file_operations* %148, i64 0, i32 7
  %150 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %149, align 8
  %151 = call i64 %150(%struct.kiocb* %kiocb.i4.i, %struct.iov_iter* %iter.i.i) #6
  %152 = icmp eq i64 %151, -529
  br i1 %152, label %153, label %new_sync_write.exit.i

; <label>:153                                     ; preds = %130
  %154 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i4.i) #6
  br label %new_sync_write.exit.i

new_sync_write.exit.i:                            ; preds = %153, %130
  %ret.0.i6.i = phi i64 [ %154, %153 ], [ %151, %130 ]
  %155 = load i64* %146, align 8
  store i64 %155, i64* %1, align 8
  call void @llvm.lifetime.end(i64 40, i8* %135) #4
  call void @llvm.lifetime.end(i64 88, i8* %134) #4
  call void @llvm.lifetime.end(i64 16, i8* %131) #4
  br label %156

; <label>:156                                     ; preds = %new_sync_write.exit.i, %do_sync_write.exit.i, %99
  %ret.0.i1 = phi i64 [ %100, %99 ], [ %ret.0.i.i, %do_sync_write.exit.i ], [ %ret.0.i6.i, %new_sync_write.exit.i ]
  %157 = icmp sgt i64 %ret.0.i1, 0
  br i1 %157, label %158, label %178

; <label>:158                                     ; preds = %156
  %159 = getelementptr inbounds %struct.file* %9, i64 0, i32 1
  %160 = load %struct.inode** %84, align 8
  %161 = getelementptr inbounds %struct.inode* %160, i64 0, i32 0
  %162 = load i16* %161, align 2
  %163 = and i16 %162, -4096
  %164 = icmp eq i16 %163, 16384
  %..i.i = select i1 %164, i32 1073741826, i32 2
  %165 = load i32* %17, align 4
  %166 = and i32 %165, 67108864
  %167 = icmp eq i32 %166, 0
  br i1 %167, label %168, label %fsnotify_modify.exit.i

; <label>:168                                     ; preds = %158
  %169 = getelementptr inbounds %struct.file* %9, i64 0, i32 1, i32 1
  %170 = load %struct.dentry** %169, align 8
  %171 = call i32 @__fsnotify_parent(%struct.path* %159, %struct.dentry* %170, i32 %..i.i) #6
  %172 = bitcast %struct.path* %159 to i8*
  %173 = call i32 @fsnotify(%struct.inode* %160, i32 %..i.i, i8* %172, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i

fsnotify_modify.exit.i:                           ; preds = %168, %158
  %174 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %175 = getelementptr inbounds %struct.task_struct* %174, i64 0, i32 113, i32 1
  %176 = load i64* %175, align 8
  %177 = add i64 %176, %ret.0.i1
  store i64 %177, i64* %175, align 8
  br label %178

; <label>:178                                     ; preds = %fsnotify_modify.exit.i, %156
  %179 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %180 = getelementptr inbounds %struct.task_struct* %179, i64 0, i32 113, i32 3
  %181 = load i64* %180, align 8
  %182 = add i64 %181, 1
  store i64 %182, i64* %180, align 8
  %183 = load %struct.inode** %84, align 8
  %184 = getelementptr inbounds %struct.inode* %183, i64 0, i32 0
  %185 = load i16* %184, align 2
  %186 = and i16 %185, -4096
  %187 = icmp eq i16 %186, -32768
  br i1 %187, label %188, label %vfs_write.exit

; <label>:188                                     ; preds = %178
  %189 = getelementptr inbounds %struct.inode* %183, i64 0, i32 8
  %190 = load %struct.super_block** %189, align 8
  call void @__sb_end_write(%struct.super_block* %190, i32 1) #6
  br label %vfs_write.exit

vfs_write.exit:                                   ; preds = %188, %178, %rw_verify_area.exit.i, %24, %21, %16
  %.0.i2 = phi i64 [ -9, %16 ], [ -22, %21 ], [ %81, %rw_verify_area.exit.i ], [ %ret.0.i1, %178 ], [ %ret.0.i1, %188 ], [ -14, %24 ]
  br label %191

; <label>:191                                     ; preds = %vfs_write.exit, %11
  %ret.0.i = phi i64 [ %.0.i2, %vfs_write.exit ], [ -29, %11 ]
  %192 = and i64 %7, 1
  %193 = icmp eq i64 %192, 0
  br i1 %193, label %SYSC_pwrite64.exit, label %194

; <label>:194                                     ; preds = %191
  call void @fput(%struct.file* %9) #6
  br label %SYSC_pwrite64.exit

SYSC_pwrite64.exit:                               ; preds = %194, %191, %5, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %5 ], [ %ret.0.i, %191 ], [ %ret.0.i, %194 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
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
  %8 = tail call i8* @__kmalloc(i64 %6, i32 208) #6
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
  %20 = tail call i64 @_copy_from_user(i8* %11, i8* %12, i32 %19) #6
  br label %copy_from_user.exit

; <label>:21                                      ; preds = %16
  tail call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %14, i64 %6) #6
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
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 1
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %202, label %5

; <label>:5                                       ; preds = %0
  %6 = and i32 %2, 131072
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %202, label %8

; <label>:8                                       ; preds = %5
  %9 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %9) #4
  %10 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %10) #4
  %11 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %11, %struct.iovec** %iov.i, align 8
  %12 = icmp eq i64 %vlen, 0
  br i1 %12, label %rw_copy_check_uvector.exit.i, label %13

; <label>:13                                      ; preds = %8
  %14 = icmp ugt i64 %vlen, 1024
  br i1 %14, label %rw_copy_check_uvector.exit.i, label %15

; <label>:15                                      ; preds = %13
  %16 = icmp ugt i64 %vlen, 8
  %17 = shl i64 %vlen, 4
  br i1 %16, label %18, label %._crit_edge.i.i

; <label>:18                                      ; preds = %15
  %19 = call i8* @__kmalloc(i64 %17, i32 208) #6
  %20 = bitcast i8* %19 to %struct.iovec*
  %21 = icmp eq i8* %19, null
  br i1 %21, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %18, %15
  %iov.0.i.i = phi %struct.iovec* [ %20, %18 ], [ %11, %15 ]
  %22 = bitcast %struct.iovec* %iov.0.i.i to i8*
  %23 = bitcast %struct.iovec* %vec to i8*
  %24 = call i64 @llvm.objectsize.i64.p0i8(i8* %22, i1 false) #4
  %25 = trunc i64 %24 to i32
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %.critedge.i.i.i, label %27

; <label>:27                                      ; preds = %._crit_edge.i.i
  %sext.i.i.i = shl i64 %24, 32
  %28 = ashr exact i64 %sext.i.i.i, 32
  %29 = icmp ult i64 %28, %17
  br i1 %29, label %32, label %.critedge.i.i.i, !prof !4

.critedge.i.i.i:                                  ; preds = %27, %._crit_edge.i.i
  %30 = trunc i64 %17 to i32
  %31 = call i64 @_copy_from_user(i8* %22, i8* %23, i32 %30) #6
  br label %copy_from_user.exit.i.i

; <label>:32                                      ; preds = %27
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %25, i64 %17) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %32, %.critedge.i.i.i
  %.0.i.i.i = phi i64 [ %31, %.critedge.i.i.i ], [ %17, %32 ]
  %33 = icmp eq i64 %.0.i.i.i, 0
  br i1 %33, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %34

; <label>:34                                      ; preds = %54, %.lr.ph.i.i
  %seg.04.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %56, %54 ]
  %ret.03.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %55, %54 ]
  %35 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 0
  %36 = load i8** %35, align 8
  %37 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 1
  %38 = load i64* %37, align 8
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %rw_copy_check_uvector.exit.i, label %40

; <label>:40                                      ; preds = %34
  %41 = ptrtoint i8* %36 to i64
  %42 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %43 = add i64 %42, -16344
  %44 = inttoptr i64 %43 to %struct.thread_info*
  %45 = getelementptr inbounds %struct.thread_info* %44, i64 0, i32 6, i32 0
  %46 = load i64* %45, align 8
  %uadd.i.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %41, i64 %38) #4
  %47 = extractvalue { i64, i1 } %uadd.i.i.i, 1
  %48 = extractvalue { i64, i1 } %uadd.i.i.i, 0
  %49 = icmp ugt i64 %48, %46
  %or.cond.i1.i = or i1 %47, %49
  br i1 %or.cond.i1.i, label %rw_copy_check_uvector.exit.i, label %50

; <label>:50                                      ; preds = %40
  %51 = sub i64 2147479552, %ret.03.i.i
  %52 = icmp ugt i64 %38, %51
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %50
  store i64 %51, i64* %37, align 8
  br label %54

; <label>:54                                      ; preds = %53, %50
  %len.0.i.i = phi i64 [ %51, %53 ], [ %38, %50 ]
  %55 = add i64 %len.0.i.i, %ret.03.i.i
  %56 = add i64 %seg.04.i.i, 1
  %57 = icmp ult i64 %56, %vlen
  br i1 %57, label %34, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %54, %40, %34, %copy_from_user.exit.i.i, %18, %13, %8
  %iov.1.i.i = phi %struct.iovec* [ %11, %8 ], [ %11, %13 ], [ %20, %18 ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %54 ], [ %iov.0.i.i, %34 ], [ %iov.0.i.i, %40 ]
  %ret.1.i.i = phi i64 [ 0, %8 ], [ -22, %13 ], [ -12, %18 ], [ -14, %copy_from_user.exit.i.i ], [ -14, %40 ], [ -22, %34 ], [ %55, %54 ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 8
  %58 = icmp slt i64 %ret.1.i.i, 1
  br i1 %58, label %file_end_write.exit.i, label %59

; <label>:59                                      ; preds = %rw_copy_check_uvector.exit.i
  %60 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %61 = load %struct.inode** %60, align 8
  %62 = icmp slt i64 %ret.1.i.i, 0
  br i1 %62, label %rw_verify_area.exit.i, label %63, !prof !4

; <label>:63                                      ; preds = %59
  %64 = load i64* %pos, align 8
  %65 = icmp slt i64 %64, 0
  br i1 %65, label %66, label %74, !prof !4

; <label>:66                                      ; preds = %63
  %67 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %68 = load i32* %67, align 4
  %69 = and i32 %68, 8192
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %rw_verify_area.exit.i, label %71

; <label>:71                                      ; preds = %66
  %72 = sub i64 0, %64
  %73 = icmp ult i64 %ret.1.i.i, %72
  br i1 %73, label %82, label %rw_verify_area.exit.i

; <label>:74                                      ; preds = %63
  %75 = add i64 %64, %ret.1.i.i
  %76 = icmp slt i64 %75, 0
  br i1 %76, label %77, label %82, !prof !4

; <label>:77                                      ; preds = %74
  %78 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %79 = load i32* %78, align 4
  %80 = and i32 %79, 8192
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %rw_verify_area.exit.i, label %82

; <label>:82                                      ; preds = %77, %74, %71
  %83 = getelementptr inbounds %struct.inode* %61, i64 0, i32 35
  %84 = load %struct.file_lock** %83, align 8
  %85 = icmp eq %struct.file_lock* %84, null
  br i1 %85, label %.critedge.i.i, label %86

; <label>:86                                      ; preds = %82
  %87 = getelementptr inbounds %struct.inode* %61, i64 0, i32 8
  %88 = load %struct.super_block** %87, align 8
  %89 = getelementptr inbounds %struct.super_block* %88, i64 0, i32 10
  %90 = load i64* %89, align 8
  %91 = and i64 %90, 64
  %92 = icmp eq i64 %91, 0
  br i1 %92, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %86
  %93 = getelementptr inbounds %struct.inode* %61, i64 0, i32 0
  %94 = load i16* %93, align 2
  %95 = and i16 %94, 1032
  %96 = icmp eq i16 %95, 1024
  br i1 %96, label %97, label %.critedge.i.i, !prof !4

; <label>:97                                      ; preds = %mandatory_lock.exit.i.i
  %98 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %61, %struct.file* %file, i64 %64, i64 %ret.1.i.i) #6
  %99 = icmp slt i32 %98, 0
  br i1 %99, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %97, %mandatory_lock.exit.i.i, %86, %82
  %100 = call i32 @security_file_permission(%struct.file* %file, i32 4) #6
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %rw_verify_area.exit.i

; <label>:102                                     ; preds = %.critedge.i.i
  %103 = icmp ugt i64 %ret.1.i.i, 2147479552
  %104 = trunc i64 %ret.1.i.i to i32
  %105 = select i1 %103, i32 2147479552, i32 %104
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %102, %.critedge.i.i, %97, %77, %71, %66, %59
  %.0.i2.i = phi i32 [ %105, %102 ], [ -22, %59 ], [ -22, %66 ], [ -75, %71 ], [ -22, %77 ], [ %98, %97 ], [ %100, %.critedge.i.i ]
  %106 = sext i32 %.0.i2.i to i64
  %107 = icmp slt i32 %.0.i2.i, 0
  br i1 %107, label %file_end_write.exit.i, label %108

; <label>:108                                     ; preds = %rw_verify_area.exit.i
  %109 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %110 = load %struct.file_operations** %109, align 8
  %111 = getelementptr inbounds %struct.file_operations* %110, i64 0, i32 2
  %112 = load i64 (%struct.file*, i8*, i64, i64*)** %111, align 8
  %113 = getelementptr inbounds %struct.file_operations* %110, i64 0, i32 4
  %114 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %113, align 8
  %115 = getelementptr inbounds %struct.file_operations* %110, i64 0, i32 6
  %116 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %115, align 8
  %117 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %116, null
  br i1 %117, label %139, label %118

; <label>:118                                     ; preds = %108
  %119 = load %struct.iovec** %iov.i, align 8
  %120 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %120) #4
  %121 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %121) #4
  %122 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %122) #4
  %123 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %123) #4
  call void @llvm.memset.p0i8.i64(i8* %122, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %123, i8 0, i64 48, i32 8, i1 false) #4
  %124 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %125 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %125, align 8
  %126 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %127 = bitcast %struct.kioctx** %126 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %127, i8* %122, i64 24, i32 8, i1 false) #4
  %128 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %124 to i8*
  store i8* %.c.i.i.i, i8** %128, align 8
  %129 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %130 = bitcast i64* %129 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %130, i8* %123, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %122) #4
  call void @llvm.lifetime.end(i64 48, i8* %123) #4
  %131 = load i64* %pos, align 8
  %132 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %131, i64* %132, align 8
  %133 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %133, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 0, %struct.iovec* %119, i64 %vlen, i64 %ret.1.i.i) #6
  %134 = call i64 %116(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %135 = icmp eq i64 %134, -529
  br i1 %135, label %136, label %do_iter_readv_writev.exit.i

; <label>:136                                     ; preds = %118
  %137 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %136, %118
  %ret.0.i.i = phi i64 [ %137, %136 ], [ %134, %118 ]
  %138 = load i64* %132, align 8
  store i64 %138, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %121) #4
  call void @llvm.lifetime.end(i64 88, i8* %120) #4
  br label %do_loop_readv_writev.exit.i

; <label>:139                                     ; preds = %108
  %140 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %114, null
  %141 = load %struct.iovec** %iov.i, align 8
  br i1 %140, label %161, label %142

; <label>:142                                     ; preds = %139
  %143 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %143) #4
  %144 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %144) #4
  %145 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %145) #4
  call void @llvm.memset.p0i8.i64(i8* %144, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %145, i8 0, i64 48, i32 8, i1 false) #4
  %146 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %147 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %147, align 8
  %148 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %149 = bitcast %struct.kioctx** %148 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %149, i8* %144, i64 24, i32 8, i1 false) #4
  %150 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %146 to i8*
  store i8* %.c.i.i4.i, i8** %150, align 8
  %151 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %152 = bitcast i64* %151 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %152, i8* %145, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %144) #4
  call void @llvm.lifetime.end(i64 48, i8* %145) #4
  %153 = load i64* %pos, align 8
  %154 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %153, i64* %154, align 8
  %155 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %155, align 8
  %156 = call i64 %114(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %141, i64 %vlen, i64 %153) #6
  %157 = icmp eq i64 %156, -529
  br i1 %157, label %158, label %do_sync_readv_writev.exit.i

; <label>:158                                     ; preds = %142
  %159 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %158, %142
  %ret.0.i5.i = phi i64 [ %159, %158 ], [ %156, %142 ]
  %160 = load i64* %154, align 8
  store i64 %160, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %143) #4
  br label %do_loop_readv_writev.exit.i

; <label>:161                                     ; preds = %139
  %.old1.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %171, %161
  %ret.0.i6.i = phi i64 [ %173, %171 ], [ 0, %161 ]
  %vector.0.i.i = phi %struct.iovec* [ %172, %171 ], [ %141, %161 ]
  %.0.i.i = phi i64 [ %166, %171 ], [ %vlen, %161 ]
  %162 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %163 = load i8** %162, align 8
  %164 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %165 = load i64* %164, align 8
  %166 = add i64 %.0.i.i, -1
  %167 = call i64 %112(%struct.file* %file, i8* %163, i64 %165, i64* %pos) #6
  %168 = icmp slt i64 %167, 0
  br i1 %168, label %169, label %171

; <label>:169                                     ; preds = %.preheader.i.i
  %170 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %170, i64 %167, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:171                                     ; preds = %.preheader.i.i
  %172 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %173 = add i64 %167, %ret.0.i6.i
  %174 = icmp eq i64 %167, %165
  %175 = icmp ne i64 %166, 0
  %or.cond.i.i = and i1 %174, %175
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %171, %169, %161, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %169 ], [ 0, %161 ], [ %173, %171 ]
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i64 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %106, %rw_verify_area.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ]
  %176 = load %struct.iovec** %iov.i, align 8
  %177 = icmp eq %struct.iovec* %176, %11
  br i1 %177, label %180, label %178

; <label>:178                                     ; preds = %file_end_write.exit.i
  %179 = bitcast %struct.iovec* %176 to i8*
  call void @kfree(i8* %179) #6
  br label %180

; <label>:180                                     ; preds = %178, %file_end_write.exit.i
  %181 = add i64 %ret.1.i, 1
  %182 = icmp sgt i64 %181, 0
  br i1 %182, label %183, label %do_readv_writev.exit

; <label>:183                                     ; preds = %180
  %184 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %185 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %186 = load %struct.inode** %185, align 8
  %187 = getelementptr inbounds %struct.inode* %186, i64 0, i32 0
  %188 = load i16* %187, align 2
  %189 = and i16 %188, -4096
  %190 = icmp eq i16 %189, 16384
  %..i.i = select i1 %190, i32 1073741825, i32 1
  %191 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %192 = load i32* %191, align 4
  %193 = and i32 %192, 67108864
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %do_readv_writev.exit

; <label>:195                                     ; preds = %183
  %196 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %197 = load %struct.dentry** %196, align 8
  %198 = call i32 @__fsnotify_parent(%struct.path* %184, %struct.dentry* %197, i32 %..i.i) #6
  %199 = bitcast %struct.path* %184 to i8*
  %200 = call i32 @fsnotify(%struct.inode* %186, i32 %..i.i, i8* %199, i32 1, i8* null, i32 0) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %195, %183, %180
  call void @llvm.lifetime.end(i64 128, i8* %10) #4
  %201 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %201) #4
  br label %202

; <label>:202                                     ; preds = %do_readv_writev.exit, %5, %0
  %.0 = phi i64 [ %ret.1.i, %do_readv_writev.exit ], [ -9, %0 ], [ -22, %5 ]
  ret i64 %.0
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @vfs_writev(%struct.file* %file, %struct.iovec* %vec, i64 %vlen, i64* %pos) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %1 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %220, label %5

; <label>:5                                       ; preds = %0
  %6 = and i32 %2, 262144
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %220, label %8

; <label>:8                                       ; preds = %5
  %9 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %9) #4
  %10 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %10) #4
  %11 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %11, %struct.iovec** %iov.i, align 8
  %12 = icmp eq i64 %vlen, 0
  br i1 %12, label %rw_copy_check_uvector.exit.i, label %13

; <label>:13                                      ; preds = %8
  %14 = icmp ugt i64 %vlen, 1024
  br i1 %14, label %rw_copy_check_uvector.exit.i, label %15

; <label>:15                                      ; preds = %13
  %16 = icmp ugt i64 %vlen, 8
  %17 = shl i64 %vlen, 4
  br i1 %16, label %18, label %._crit_edge.i.i

; <label>:18                                      ; preds = %15
  %19 = call i8* @__kmalloc(i64 %17, i32 208) #6
  %20 = bitcast i8* %19 to %struct.iovec*
  %21 = icmp eq i8* %19, null
  br i1 %21, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %18, %15
  %iov.0.i.i = phi %struct.iovec* [ %20, %18 ], [ %11, %15 ]
  %22 = bitcast %struct.iovec* %iov.0.i.i to i8*
  %23 = bitcast %struct.iovec* %vec to i8*
  %24 = call i64 @llvm.objectsize.i64.p0i8(i8* %22, i1 false) #4
  %25 = trunc i64 %24 to i32
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %.critedge.i.i.i, label %27

; <label>:27                                      ; preds = %._crit_edge.i.i
  %sext.i.i.i = shl i64 %24, 32
  %28 = ashr exact i64 %sext.i.i.i, 32
  %29 = icmp ult i64 %28, %17
  br i1 %29, label %32, label %.critedge.i.i.i, !prof !4

.critedge.i.i.i:                                  ; preds = %27, %._crit_edge.i.i
  %30 = trunc i64 %17 to i32
  %31 = call i64 @_copy_from_user(i8* %22, i8* %23, i32 %30) #6
  br label %copy_from_user.exit.i.i

; <label>:32                                      ; preds = %27
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %25, i64 %17) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %32, %.critedge.i.i.i
  %.0.i.i.i = phi i64 [ %31, %.critedge.i.i.i ], [ %17, %32 ]
  %33 = icmp eq i64 %.0.i.i.i, 0
  br i1 %33, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %34

; <label>:34                                      ; preds = %54, %.lr.ph.i.i
  %seg.04.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %56, %54 ]
  %ret.03.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %55, %54 ]
  %35 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 0
  %36 = load i8** %35, align 8
  %37 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 1
  %38 = load i64* %37, align 8
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %rw_copy_check_uvector.exit.i, label %40

; <label>:40                                      ; preds = %34
  %41 = ptrtoint i8* %36 to i64
  %42 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %43 = add i64 %42, -16344
  %44 = inttoptr i64 %43 to %struct.thread_info*
  %45 = getelementptr inbounds %struct.thread_info* %44, i64 0, i32 6, i32 0
  %46 = load i64* %45, align 8
  %uadd.i.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %41, i64 %38) #4
  %47 = extractvalue { i64, i1 } %uadd.i.i.i, 1
  %48 = extractvalue { i64, i1 } %uadd.i.i.i, 0
  %49 = icmp ugt i64 %48, %46
  %or.cond.i1.i = or i1 %47, %49
  br i1 %or.cond.i1.i, label %rw_copy_check_uvector.exit.i, label %50

; <label>:50                                      ; preds = %40
  %51 = sub i64 2147479552, %ret.03.i.i
  %52 = icmp ugt i64 %38, %51
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %50
  store i64 %51, i64* %37, align 8
  br label %54

; <label>:54                                      ; preds = %53, %50
  %len.0.i.i = phi i64 [ %51, %53 ], [ %38, %50 ]
  %55 = add i64 %len.0.i.i, %ret.03.i.i
  %56 = add i64 %seg.04.i.i, 1
  %57 = icmp ult i64 %56, %vlen
  br i1 %57, label %34, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %54, %40, %34, %copy_from_user.exit.i.i, %18, %13, %8
  %iov.1.i.i = phi %struct.iovec* [ %11, %8 ], [ %11, %13 ], [ %20, %18 ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %54 ], [ %iov.0.i.i, %34 ], [ %iov.0.i.i, %40 ]
  %ret.1.i.i = phi i64 [ 0, %8 ], [ -22, %13 ], [ -12, %18 ], [ -14, %copy_from_user.exit.i.i ], [ -14, %40 ], [ -22, %34 ], [ %55, %54 ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 8
  %58 = icmp slt i64 %ret.1.i.i, 1
  br i1 %58, label %file_end_write.exit.i, label %59

; <label>:59                                      ; preds = %rw_copy_check_uvector.exit.i
  %60 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %61 = load %struct.inode** %60, align 8
  %62 = icmp slt i64 %ret.1.i.i, 0
  br i1 %62, label %rw_verify_area.exit.i, label %63, !prof !4

; <label>:63                                      ; preds = %59
  %64 = load i64* %pos, align 8
  %65 = icmp slt i64 %64, 0
  br i1 %65, label %66, label %74, !prof !4

; <label>:66                                      ; preds = %63
  %67 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %68 = load i32* %67, align 4
  %69 = and i32 %68, 8192
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %rw_verify_area.exit.i, label %71

; <label>:71                                      ; preds = %66
  %72 = sub i64 0, %64
  %73 = icmp ult i64 %ret.1.i.i, %72
  br i1 %73, label %82, label %rw_verify_area.exit.i

; <label>:74                                      ; preds = %63
  %75 = add i64 %64, %ret.1.i.i
  %76 = icmp slt i64 %75, 0
  br i1 %76, label %77, label %82, !prof !4

; <label>:77                                      ; preds = %74
  %78 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %79 = load i32* %78, align 4
  %80 = and i32 %79, 8192
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %rw_verify_area.exit.i, label %82

; <label>:82                                      ; preds = %77, %74, %71
  %83 = getelementptr inbounds %struct.inode* %61, i64 0, i32 35
  %84 = load %struct.file_lock** %83, align 8
  %85 = icmp eq %struct.file_lock* %84, null
  br i1 %85, label %.critedge.i.i, label %86

; <label>:86                                      ; preds = %82
  %87 = getelementptr inbounds %struct.inode* %61, i64 0, i32 8
  %88 = load %struct.super_block** %87, align 8
  %89 = getelementptr inbounds %struct.super_block* %88, i64 0, i32 10
  %90 = load i64* %89, align 8
  %91 = and i64 %90, 64
  %92 = icmp eq i64 %91, 0
  br i1 %92, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %86
  %93 = getelementptr inbounds %struct.inode* %61, i64 0, i32 0
  %94 = load i16* %93, align 2
  %95 = and i16 %94, 1032
  %96 = icmp eq i16 %95, 1024
  br i1 %96, label %97, label %.critedge.i.i, !prof !4

; <label>:97                                      ; preds = %mandatory_lock.exit.i.i
  %98 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %61, %struct.file* %file, i64 %64, i64 %ret.1.i.i) #6
  %99 = icmp slt i32 %98, 0
  br i1 %99, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %97, %mandatory_lock.exit.i.i, %86, %82
  %100 = call i32 @security_file_permission(%struct.file* %file, i32 2) #6
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %rw_verify_area.exit.i

; <label>:102                                     ; preds = %.critedge.i.i
  %103 = icmp ugt i64 %ret.1.i.i, 2147479552
  %104 = trunc i64 %ret.1.i.i to i32
  %105 = select i1 %103, i32 2147479552, i32 %104
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %102, %.critedge.i.i, %97, %77, %71, %66, %59
  %.0.i2.i = phi i32 [ %105, %102 ], [ -22, %59 ], [ -22, %66 ], [ -75, %71 ], [ -22, %77 ], [ %98, %97 ], [ %100, %.critedge.i.i ]
  %106 = sext i32 %.0.i2.i to i64
  %107 = icmp slt i32 %.0.i2.i, 0
  br i1 %107, label %file_end_write.exit.i, label %108

; <label>:108                                     ; preds = %rw_verify_area.exit.i
  %109 = getelementptr inbounds %struct.file* %file, i64 0, i32 3
  %110 = load %struct.file_operations** %109, align 8
  %111 = getelementptr inbounds %struct.file_operations* %110, i64 0, i32 3
  %112 = load i64 (%struct.file*, i8*, i64, i64*)** %111, align 8
  %113 = getelementptr inbounds %struct.file_operations* %110, i64 0, i32 5
  %114 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %113, align 8
  %115 = getelementptr inbounds %struct.file_operations* %110, i64 0, i32 7
  %116 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %115, align 8
  %117 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %118 = load %struct.inode** %117, align 8
  %119 = getelementptr inbounds %struct.inode* %118, i64 0, i32 0
  %120 = load i16* %119, align 2
  %121 = and i16 %120, -4096
  %122 = icmp eq i16 %121, -32768
  br i1 %122, label %123, label %file_start_write.exit.i

; <label>:123                                     ; preds = %108
  %124 = getelementptr inbounds %struct.inode* %118, i64 0, i32 8
  %125 = load %struct.super_block** %124, align 8
  %126 = call i32 @__sb_start_write(%struct.super_block* %125, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %123, %108
  %127 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %116, null
  br i1 %127, label %149, label %128

; <label>:128                                     ; preds = %file_start_write.exit.i
  %129 = load %struct.iovec** %iov.i, align 8
  %130 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %130) #4
  %131 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %131) #4
  %132 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %132) #4
  %133 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %133) #4
  call void @llvm.memset.p0i8.i64(i8* %132, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %133, i8 0, i64 48, i32 8, i1 false) #4
  %134 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %135 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %135, align 8
  %136 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %137 = bitcast %struct.kioctx** %136 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %137, i8* %132, i64 24, i32 8, i1 false) #4
  %138 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %134 to i8*
  store i8* %.c.i.i.i, i8** %138, align 8
  %139 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %140 = bitcast i64* %139 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %140, i8* %133, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %132) #4
  call void @llvm.lifetime.end(i64 48, i8* %133) #4
  %141 = load i64* %pos, align 8
  %142 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %141, i64* %142, align 8
  %143 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %143, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 1, %struct.iovec* %129, i64 %vlen, i64 %ret.1.i.i) #6
  %144 = call i64 %116(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %145 = icmp eq i64 %144, -529
  br i1 %145, label %146, label %do_iter_readv_writev.exit.i

; <label>:146                                     ; preds = %128
  %147 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %146, %128
  %ret.0.i.i = phi i64 [ %147, %146 ], [ %144, %128 ]
  %148 = load i64* %142, align 8
  store i64 %148, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 40, i8* %131) #4
  call void @llvm.lifetime.end(i64 88, i8* %130) #4
  br label %do_loop_readv_writev.exit.i

; <label>:149                                     ; preds = %file_start_write.exit.i
  %150 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %114, null
  %151 = load %struct.iovec** %iov.i, align 8
  br i1 %150, label %171, label %152

; <label>:152                                     ; preds = %149
  %153 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %153) #4
  %154 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %154) #4
  %155 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %155) #4
  call void @llvm.memset.p0i8.i64(i8* %154, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %155, i8 0, i64 48, i32 8, i1 false) #4
  %156 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %157 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %file, %struct.file** %157, align 8
  %158 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %159 = bitcast %struct.kioctx** %158 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %159, i8* %154, i64 24, i32 8, i1 false) #4
  %160 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %156 to i8*
  store i8* %.c.i.i4.i, i8** %160, align 8
  %161 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %162 = bitcast i64* %161 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %162, i8* %155, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %154) #4
  call void @llvm.lifetime.end(i64 48, i8* %155) #4
  %163 = load i64* %pos, align 8
  %164 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %163, i64* %164, align 8
  %165 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %165, align 8
  %166 = call i64 %114(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %151, i64 %vlen, i64 %163) #6
  %167 = icmp eq i64 %166, -529
  br i1 %167, label %168, label %do_sync_readv_writev.exit.i

; <label>:168                                     ; preds = %152
  %169 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %168, %152
  %ret.0.i5.i = phi i64 [ %169, %168 ], [ %166, %152 ]
  %170 = load i64* %164, align 8
  store i64 %170, i64* %pos, align 8
  call void @llvm.lifetime.end(i64 88, i8* %153) #4
  br label %do_loop_readv_writev.exit.i

; <label>:171                                     ; preds = %149
  %.old1.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %181, %171
  %ret.0.i6.i = phi i64 [ %183, %181 ], [ 0, %171 ]
  %vector.0.i.i = phi %struct.iovec* [ %182, %181 ], [ %151, %171 ]
  %.0.i.i = phi i64 [ %176, %181 ], [ %vlen, %171 ]
  %172 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %173 = load i8** %172, align 8
  %174 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %175 = load i64* %174, align 8
  %176 = add i64 %.0.i.i, -1
  %177 = call i64 %112(%struct.file* %file, i8* %173, i64 %175, i64* %pos) #6
  %178 = icmp slt i64 %177, 0
  br i1 %178, label %179, label %181

; <label>:179                                     ; preds = %.preheader.i.i
  %180 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %180, i64 %177, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:181                                     ; preds = %.preheader.i.i
  %182 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %183 = add i64 %177, %ret.0.i6.i
  %184 = icmp eq i64 %177, %175
  %185 = icmp ne i64 %176, 0
  %or.cond.i.i = and i1 %184, %185
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %181, %179, %171, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %179 ], [ 0, %171 ], [ %183, %181 ]
  %186 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %187 = load %struct.inode** %186, align 8
  %188 = getelementptr inbounds %struct.inode* %187, i64 0, i32 0
  %189 = load i16* %188, align 2
  %190 = and i16 %189, -4096
  %191 = icmp eq i16 %190, -32768
  br i1 %191, label %192, label %file_end_write.exit.i

; <label>:192                                     ; preds = %do_loop_readv_writev.exit.i
  %193 = getelementptr inbounds %struct.inode* %187, i64 0, i32 8
  %194 = load %struct.super_block** %193, align 8
  call void @__sb_end_write(%struct.super_block* %194, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %192, %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i64 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %106, %rw_verify_area.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ], [ %ret.0.i, %192 ]
  %195 = load %struct.iovec** %iov.i, align 8
  %196 = icmp eq %struct.iovec* %195, %11
  br i1 %196, label %199, label %197

; <label>:197                                     ; preds = %file_end_write.exit.i
  %198 = bitcast %struct.iovec* %195 to i8*
  call void @kfree(i8* %198) #6
  br label %199

; <label>:199                                     ; preds = %197, %file_end_write.exit.i
  %200 = icmp sgt i64 %ret.1.i, 0
  br i1 %200, label %201, label %do_readv_writev.exit

; <label>:201                                     ; preds = %199
  %202 = getelementptr inbounds %struct.file* %file, i64 0, i32 1
  %203 = getelementptr inbounds %struct.file* %file, i64 0, i32 2
  %204 = load %struct.inode** %203, align 8
  %205 = getelementptr inbounds %struct.inode* %204, i64 0, i32 0
  %206 = load i16* %205, align 2
  %207 = and i16 %206, -4096
  %208 = icmp eq i16 %207, 16384
  %..i7.i = select i1 %208, i32 1073741826, i32 2
  %209 = getelementptr inbounds %struct.file* %file, i64 0, i32 7
  %210 = load i32* %209, align 4
  %211 = and i32 %210, 67108864
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %213, label %do_readv_writev.exit

; <label>:213                                     ; preds = %201
  %214 = getelementptr inbounds %struct.file* %file, i64 0, i32 1, i32 1
  %215 = load %struct.dentry** %214, align 8
  %216 = call i32 @__fsnotify_parent(%struct.path* %202, %struct.dentry* %215, i32 %..i7.i) #6
  %217 = bitcast %struct.path* %202 to i8*
  %218 = call i32 @fsnotify(%struct.inode* %204, i32 %..i7.i, i8* %217, i32 1, i8* null, i32 0) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %213, %201, %199
  call void @llvm.lifetime.end(i64 128, i8* %10) #4
  %219 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %219) #4
  br label %220

; <label>:220                                     ; preds = %do_readv_writev.exit, %5, %0
  %.0 = phi i64 [ %ret.1.i, %do_readv_writev.exit ], [ -9, %0 ], [ -22, %5 ]
  ret i64 %.0
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_readv(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = trunc i64 %fd to i32
  %4 = call i64 @__fdget_pos(i32 %3) #6
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
  %18 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %18) #4
  %19 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %19) #4
  %20 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %20, %struct.iovec** %iov.i, align 8
  %21 = icmp eq i64 %vlen, 0
  br i1 %21, label %rw_copy_check_uvector.exit.i, label %22

; <label>:22                                      ; preds = %vfs_readv.exit.i
  %23 = icmp ugt i64 %vlen, 1024
  br i1 %23, label %rw_copy_check_uvector.exit.i, label %24

; <label>:24                                      ; preds = %22
  %25 = icmp ugt i64 %vlen, 8
  %26 = shl i64 %vlen, 4
  br i1 %25, label %27, label %._crit_edge.i.i

; <label>:27                                      ; preds = %24
  %28 = call i8* @__kmalloc(i64 %26, i32 208) #6
  %29 = bitcast i8* %28 to %struct.iovec*
  %30 = icmp eq i8* %28, null
  br i1 %30, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %27, %24
  %iov.0.i.i = phi %struct.iovec* [ %29, %27 ], [ %20, %24 ]
  %31 = bitcast %struct.iovec* %iov.0.i.i to i8*
  %32 = bitcast %struct.iovec* %1 to i8*
  %33 = call i64 @llvm.objectsize.i64.p0i8(i8* %31, i1 false) #4
  %34 = trunc i64 %33 to i32
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %.critedge.i.i.i, label %36

; <label>:36                                      ; preds = %._crit_edge.i.i
  %sext.i.i.i = shl i64 %33, 32
  %37 = ashr exact i64 %sext.i.i.i, 32
  %38 = icmp ult i64 %37, %26
  br i1 %38, label %41, label %.critedge.i.i.i, !prof !4

.critedge.i.i.i:                                  ; preds = %36, %._crit_edge.i.i
  %39 = trunc i64 %26 to i32
  %40 = call i64 @_copy_from_user(i8* %31, i8* %32, i32 %39) #6
  br label %copy_from_user.exit.i.i

; <label>:41                                      ; preds = %36
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %34, i64 %26) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %41, %.critedge.i.i.i
  %.0.i.i.i = phi i64 [ %40, %.critedge.i.i.i ], [ %26, %41 ]
  %42 = icmp eq i64 %.0.i.i.i, 0
  br i1 %42, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %43

; <label>:43                                      ; preds = %63, %.lr.ph.i.i
  %seg.04.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %65, %63 ]
  %ret.03.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %64, %63 ]
  %44 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 0
  %45 = load i8** %44, align 8
  %46 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 1
  %47 = load i64* %46, align 8
  %48 = icmp slt i64 %47, 0
  br i1 %48, label %rw_copy_check_uvector.exit.i, label %49

; <label>:49                                      ; preds = %43
  %50 = ptrtoint i8* %45 to i64
  %51 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %52 = add i64 %51, -16344
  %53 = inttoptr i64 %52 to %struct.thread_info*
  %54 = getelementptr inbounds %struct.thread_info* %53, i64 0, i32 6, i32 0
  %55 = load i64* %54, align 8
  %uadd.i.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %50, i64 %47) #4
  %56 = extractvalue { i64, i1 } %uadd.i.i.i, 1
  %57 = extractvalue { i64, i1 } %uadd.i.i.i, 0
  %58 = icmp ugt i64 %57, %55
  %or.cond.i1.i = or i1 %56, %58
  br i1 %or.cond.i1.i, label %rw_copy_check_uvector.exit.i, label %59

; <label>:59                                      ; preds = %49
  %60 = sub i64 2147479552, %ret.03.i.i
  %61 = icmp ugt i64 %47, %60
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %59
  store i64 %60, i64* %46, align 8
  br label %63

; <label>:63                                      ; preds = %62, %59
  %len.0.i.i = phi i64 [ %60, %62 ], [ %47, %59 ]
  %64 = add i64 %len.0.i.i, %ret.03.i.i
  %65 = add i64 %seg.04.i.i, 1
  %66 = icmp ult i64 %65, %vlen
  br i1 %66, label %43, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %63, %49, %43, %copy_from_user.exit.i.i, %27, %22, %vfs_readv.exit.i
  %iov.1.i.i = phi %struct.iovec* [ %20, %vfs_readv.exit.i ], [ %20, %22 ], [ %29, %27 ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %63 ], [ %iov.0.i.i, %43 ], [ %iov.0.i.i, %49 ]
  %ret.1.i.i = phi i64 [ 0, %vfs_readv.exit.i ], [ -22, %22 ], [ -12, %27 ], [ -14, %copy_from_user.exit.i.i ], [ -14, %49 ], [ -22, %43 ], [ %64, %63 ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 8
  %67 = icmp slt i64 %ret.1.i.i, 1
  br i1 %67, label %file_end_write.exit.i, label %68

; <label>:68                                      ; preds = %rw_copy_check_uvector.exit.i
  %69 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %70 = load %struct.inode** %69, align 8
  %71 = icmp slt i64 %ret.1.i.i, 0
  br i1 %71, label %rw_verify_area.exit.i, label %72, !prof !4

; <label>:72                                      ; preds = %68
  %73 = load i64* %pos.i, align 8
  %74 = icmp slt i64 %73, 0
  br i1 %74, label %75, label %83, !prof !4

; <label>:75                                      ; preds = %72
  %76 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %77 = load i32* %76, align 4
  %78 = and i32 %77, 8192
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %rw_verify_area.exit.i, label %80

; <label>:80                                      ; preds = %75
  %81 = sub i64 0, %73
  %82 = icmp ult i64 %ret.1.i.i, %81
  br i1 %82, label %91, label %rw_verify_area.exit.i

; <label>:83                                      ; preds = %72
  %84 = add i64 %73, %ret.1.i.i
  %85 = icmp slt i64 %84, 0
  br i1 %85, label %86, label %91, !prof !4

; <label>:86                                      ; preds = %83
  %87 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %88 = load i32* %87, align 4
  %89 = and i32 %88, 8192
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %rw_verify_area.exit.i, label %91

; <label>:91                                      ; preds = %86, %83, %80
  %92 = getelementptr inbounds %struct.inode* %70, i64 0, i32 35
  %93 = load %struct.file_lock** %92, align 8
  %94 = icmp eq %struct.file_lock* %93, null
  br i1 %94, label %.critedge.i.i, label %95

; <label>:95                                      ; preds = %91
  %96 = getelementptr inbounds %struct.inode* %70, i64 0, i32 8
  %97 = load %struct.super_block** %96, align 8
  %98 = getelementptr inbounds %struct.super_block* %97, i64 0, i32 10
  %99 = load i64* %98, align 8
  %100 = and i64 %99, 64
  %101 = icmp eq i64 %100, 0
  br i1 %101, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %95
  %102 = getelementptr inbounds %struct.inode* %70, i64 0, i32 0
  %103 = load i16* %102, align 2
  %104 = and i16 %103, 1032
  %105 = icmp eq i16 %104, 1024
  br i1 %105, label %106, label %.critedge.i.i, !prof !4

; <label>:106                                     ; preds = %mandatory_lock.exit.i.i
  %107 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %70, %struct.file* %6, i64 %73, i64 %ret.1.i.i) #6
  %108 = icmp slt i32 %107, 0
  br i1 %108, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %106, %mandatory_lock.exit.i.i, %95, %91
  %109 = call i32 @security_file_permission(%struct.file* %6, i32 4) #6
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %rw_verify_area.exit.i

; <label>:111                                     ; preds = %.critedge.i.i
  %112 = icmp ugt i64 %ret.1.i.i, 2147479552
  %113 = trunc i64 %ret.1.i.i to i32
  %114 = select i1 %112, i32 2147479552, i32 %113
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %111, %.critedge.i.i, %106, %86, %80, %75, %68
  %.0.i2.i = phi i32 [ %114, %111 ], [ -22, %68 ], [ -22, %75 ], [ -75, %80 ], [ -22, %86 ], [ %107, %106 ], [ %109, %.critedge.i.i ]
  %115 = sext i32 %.0.i2.i to i64
  %116 = icmp slt i32 %.0.i2.i, 0
  br i1 %116, label %file_end_write.exit.i, label %117

; <label>:117                                     ; preds = %rw_verify_area.exit.i
  %118 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %119 = load %struct.file_operations** %118, align 8
  %120 = getelementptr inbounds %struct.file_operations* %119, i64 0, i32 2
  %121 = load i64 (%struct.file*, i8*, i64, i64*)** %120, align 8
  %122 = getelementptr inbounds %struct.file_operations* %119, i64 0, i32 4
  %123 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %122, align 8
  %124 = getelementptr inbounds %struct.file_operations* %119, i64 0, i32 6
  %125 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %124, align 8
  %126 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %125, null
  br i1 %126, label %148, label %127

; <label>:127                                     ; preds = %117
  %128 = load %struct.iovec** %iov.i, align 8
  %129 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %129) #4
  %130 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %130) #4
  %131 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %131) #4
  %132 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %132) #4
  call void @llvm.memset.p0i8.i64(i8* %131, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %132, i8 0, i64 48, i32 8, i1 false) #4
  %133 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %134 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %134, align 8
  %135 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %136 = bitcast %struct.kioctx** %135 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %136, i8* %131, i64 24, i32 8, i1 false) #4
  %137 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %133 to i8*
  store i8* %.c.i.i.i, i8** %137, align 8
  %138 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %139 = bitcast i64* %138 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %139, i8* %132, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %131) #4
  call void @llvm.lifetime.end(i64 48, i8* %132) #4
  %140 = load i64* %pos.i, align 8
  %141 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %140, i64* %141, align 8
  %142 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %142, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 0, %struct.iovec* %128, i64 %vlen, i64 %ret.1.i.i) #6
  %143 = call i64 %125(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %144 = icmp eq i64 %143, -529
  br i1 %144, label %145, label %do_iter_readv_writev.exit.i

; <label>:145                                     ; preds = %127
  %146 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %145, %127
  %ret.0.i.i = phi i64 [ %146, %145 ], [ %143, %127 ]
  %147 = load i64* %141, align 8
  store i64 %147, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %130) #4
  call void @llvm.lifetime.end(i64 88, i8* %129) #4
  br label %do_loop_readv_writev.exit.i

; <label>:148                                     ; preds = %117
  %149 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %123, null
  %150 = load %struct.iovec** %iov.i, align 8
  br i1 %149, label %170, label %151

; <label>:151                                     ; preds = %148
  %152 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %152) #4
  %153 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %153) #4
  %154 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %154) #4
  call void @llvm.memset.p0i8.i64(i8* %153, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %154, i8 0, i64 48, i32 8, i1 false) #4
  %155 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %156 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %156, align 8
  %157 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %158 = bitcast %struct.kioctx** %157 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %158, i8* %153, i64 24, i32 8, i1 false) #4
  %159 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %155 to i8*
  store i8* %.c.i.i4.i, i8** %159, align 8
  %160 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %161 = bitcast i64* %160 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %161, i8* %154, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %153) #4
  call void @llvm.lifetime.end(i64 48, i8* %154) #4
  %162 = load i64* %pos.i, align 8
  %163 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %162, i64* %163, align 8
  %164 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %164, align 8
  %165 = call i64 %123(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %150, i64 %vlen, i64 %162) #6
  %166 = icmp eq i64 %165, -529
  br i1 %166, label %167, label %do_sync_readv_writev.exit.i

; <label>:167                                     ; preds = %151
  %168 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %167, %151
  %ret.0.i5.i = phi i64 [ %168, %167 ], [ %165, %151 ]
  %169 = load i64* %163, align 8
  store i64 %169, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %152) #4
  br label %do_loop_readv_writev.exit.i

; <label>:170                                     ; preds = %148
  %.old1.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %180, %170
  %ret.0.i6.i = phi i64 [ %182, %180 ], [ 0, %170 ]
  %vector.0.i.i = phi %struct.iovec* [ %181, %180 ], [ %150, %170 ]
  %.0.i.i = phi i64 [ %175, %180 ], [ %vlen, %170 ]
  %171 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %172 = load i8** %171, align 8
  %173 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %174 = load i64* %173, align 8
  %175 = add i64 %.0.i.i, -1
  %176 = call i64 %121(%struct.file* %6, i8* %172, i64 %174, i64* %pos.i) #6
  %177 = icmp slt i64 %176, 0
  br i1 %177, label %178, label %180

; <label>:178                                     ; preds = %.preheader.i.i
  %179 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %179, i64 %176, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:180                                     ; preds = %.preheader.i.i
  %181 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %182 = add i64 %176, %ret.0.i6.i
  %183 = icmp eq i64 %176, %174
  %184 = icmp ne i64 %175, 0
  %or.cond.i.i = and i1 %183, %184
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %180, %178, %170, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %178 ], [ 0, %170 ], [ %182, %180 ]
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i64 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %115, %rw_verify_area.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ]
  %185 = load %struct.iovec** %iov.i, align 8
  %186 = icmp eq %struct.iovec* %185, %20
  br i1 %186, label %189, label %187

; <label>:187                                     ; preds = %file_end_write.exit.i
  %188 = bitcast %struct.iovec* %185 to i8*
  call void @kfree(i8* %188) #6
  br label %189

; <label>:189                                     ; preds = %187, %file_end_write.exit.i
  %190 = add i64 %ret.1.i, 1
  %191 = icmp sgt i64 %190, 0
  br i1 %191, label %192, label %do_readv_writev.exit

; <label>:192                                     ; preds = %189
  %193 = getelementptr inbounds %struct.file* %6, i64 0, i32 1
  %194 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %195 = load %struct.inode** %194, align 8
  %196 = getelementptr inbounds %struct.inode* %195, i64 0, i32 0
  %197 = load i16* %196, align 2
  %198 = and i16 %197, -4096
  %199 = icmp eq i16 %198, 16384
  %..i.i = select i1 %199, i32 1073741825, i32 1
  %200 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %201 = load i32* %200, align 4
  %202 = and i32 %201, 67108864
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %do_readv_writev.exit

; <label>:204                                     ; preds = %192
  %205 = getelementptr inbounds %struct.file* %6, i64 0, i32 1, i32 1
  %206 = load %struct.dentry** %205, align 8
  %207 = call i32 @__fsnotify_parent(%struct.path* %193, %struct.dentry* %206, i32 %..i.i) #6
  %208 = bitcast %struct.path* %193 to i8*
  %209 = call i32 @fsnotify(%struct.inode* %195, i32 %..i.i, i8* %208, i32 1, i8* null, i32 0) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %204, %192, %189
  call void @llvm.lifetime.end(i64 128, i8* %19) #4
  %210 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %210) #4
  %211 = icmp sgt i64 %ret.1.i, -1
  br i1 %211, label %212, label %vfs_readv.exit.thread.i

; <label>:212                                     ; preds = %do_readv_writev.exit
  %213 = load i64* %pos.i, align 8
  store i64 %213, i64* %9, align 8
  br label %vfs_readv.exit.thread.i

vfs_readv.exit.thread.i:                          ; preds = %212, %do_readv_writev.exit, %15, %8
  %.0.i1.i = phi i64 [ %ret.1.i, %212 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %8 ], [ -22, %15 ]
  %214 = and i32 %v.tr.i.i.i, 2
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %218, label %216

; <label>:216                                     ; preds = %vfs_readv.exit.thread.i
  %217 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %217) #6
  br label %218

; <label>:218                                     ; preds = %216, %vfs_readv.exit.thread.i
  %219 = and i32 %v.tr.i.i.i, 1
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %fdput_pos.exit.i, label %221

; <label>:221                                     ; preds = %218
  call void @fput(%struct.file* %6) #6
  br label %fdput_pos.exit.i

fdput_pos.exit.i:                                 ; preds = %221, %218
  %222 = icmp sgt i64 %.0.i1.i, 0
  br i1 %222, label %223, label %SYSC_readv.exit

; <label>:223                                     ; preds = %fdput_pos.exit.i
  %224 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %225 = getelementptr inbounds %struct.task_struct* %224, i64 0, i32 113, i32 0
  %226 = load i64* %225, align 8
  %227 = add i64 %226, %.0.i1.i
  store i64 %227, i64* %225, align 8
  br label %SYSC_readv.exit

SYSC_readv.exit:                                  ; preds = %223, %fdput_pos.exit.i, %0
  %ret.02.i = phi i64 [ %.0.i1.i, %223 ], [ %.0.i1.i, %fdput_pos.exit.i ], [ -9, %0 ]
  %228 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %229 = getelementptr inbounds %struct.task_struct* %228, i64 0, i32 113, i32 2
  %230 = load i64* %229, align 8
  %231 = add i64 %230, 1
  store i64 %231, i64* %229, align 8
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.02.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_writev(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  %3 = trunc i64 %fd to i32
  %4 = call i64 @__fdget_pos(i32 %3) #6
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
  %18 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %18) #4
  %19 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %19) #4
  %20 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %20, %struct.iovec** %iov.i, align 8
  %21 = icmp eq i64 %vlen, 0
  br i1 %21, label %rw_copy_check_uvector.exit.i, label %22

; <label>:22                                      ; preds = %vfs_writev.exit.i
  %23 = icmp ugt i64 %vlen, 1024
  br i1 %23, label %rw_copy_check_uvector.exit.i, label %24

; <label>:24                                      ; preds = %22
  %25 = icmp ugt i64 %vlen, 8
  %26 = shl i64 %vlen, 4
  br i1 %25, label %27, label %._crit_edge.i.i

; <label>:27                                      ; preds = %24
  %28 = call i8* @__kmalloc(i64 %26, i32 208) #6
  %29 = bitcast i8* %28 to %struct.iovec*
  %30 = icmp eq i8* %28, null
  br i1 %30, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %27, %24
  %iov.0.i.i = phi %struct.iovec* [ %29, %27 ], [ %20, %24 ]
  %31 = bitcast %struct.iovec* %iov.0.i.i to i8*
  %32 = bitcast %struct.iovec* %1 to i8*
  %33 = call i64 @llvm.objectsize.i64.p0i8(i8* %31, i1 false) #4
  %34 = trunc i64 %33 to i32
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %.critedge.i.i.i, label %36

; <label>:36                                      ; preds = %._crit_edge.i.i
  %sext.i.i.i = shl i64 %33, 32
  %37 = ashr exact i64 %sext.i.i.i, 32
  %38 = icmp ult i64 %37, %26
  br i1 %38, label %41, label %.critedge.i.i.i, !prof !4

.critedge.i.i.i:                                  ; preds = %36, %._crit_edge.i.i
  %39 = trunc i64 %26 to i32
  %40 = call i64 @_copy_from_user(i8* %31, i8* %32, i32 %39) #6
  br label %copy_from_user.exit.i.i

; <label>:41                                      ; preds = %36
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %34, i64 %26) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %41, %.critedge.i.i.i
  %.0.i.i.i = phi i64 [ %40, %.critedge.i.i.i ], [ %26, %41 ]
  %42 = icmp eq i64 %.0.i.i.i, 0
  br i1 %42, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %43

; <label>:43                                      ; preds = %63, %.lr.ph.i.i
  %seg.04.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %65, %63 ]
  %ret.03.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %64, %63 ]
  %44 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 0
  %45 = load i8** %44, align 8
  %46 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 1
  %47 = load i64* %46, align 8
  %48 = icmp slt i64 %47, 0
  br i1 %48, label %rw_copy_check_uvector.exit.i, label %49

; <label>:49                                      ; preds = %43
  %50 = ptrtoint i8* %45 to i64
  %51 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %52 = add i64 %51, -16344
  %53 = inttoptr i64 %52 to %struct.thread_info*
  %54 = getelementptr inbounds %struct.thread_info* %53, i64 0, i32 6, i32 0
  %55 = load i64* %54, align 8
  %uadd.i.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %50, i64 %47) #4
  %56 = extractvalue { i64, i1 } %uadd.i.i.i, 1
  %57 = extractvalue { i64, i1 } %uadd.i.i.i, 0
  %58 = icmp ugt i64 %57, %55
  %or.cond.i1.i = or i1 %56, %58
  br i1 %or.cond.i1.i, label %rw_copy_check_uvector.exit.i, label %59

; <label>:59                                      ; preds = %49
  %60 = sub i64 2147479552, %ret.03.i.i
  %61 = icmp ugt i64 %47, %60
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %59
  store i64 %60, i64* %46, align 8
  br label %63

; <label>:63                                      ; preds = %62, %59
  %len.0.i.i = phi i64 [ %60, %62 ], [ %47, %59 ]
  %64 = add i64 %len.0.i.i, %ret.03.i.i
  %65 = add i64 %seg.04.i.i, 1
  %66 = icmp ult i64 %65, %vlen
  br i1 %66, label %43, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %63, %49, %43, %copy_from_user.exit.i.i, %27, %22, %vfs_writev.exit.i
  %iov.1.i.i = phi %struct.iovec* [ %20, %vfs_writev.exit.i ], [ %20, %22 ], [ %29, %27 ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %63 ], [ %iov.0.i.i, %43 ], [ %iov.0.i.i, %49 ]
  %ret.1.i.i = phi i64 [ 0, %vfs_writev.exit.i ], [ -22, %22 ], [ -12, %27 ], [ -14, %copy_from_user.exit.i.i ], [ -14, %49 ], [ -22, %43 ], [ %64, %63 ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 8
  %67 = icmp slt i64 %ret.1.i.i, 1
  br i1 %67, label %file_end_write.exit.i, label %68

; <label>:68                                      ; preds = %rw_copy_check_uvector.exit.i
  %69 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %70 = load %struct.inode** %69, align 8
  %71 = icmp slt i64 %ret.1.i.i, 0
  br i1 %71, label %rw_verify_area.exit.i, label %72, !prof !4

; <label>:72                                      ; preds = %68
  %73 = load i64* %pos.i, align 8
  %74 = icmp slt i64 %73, 0
  br i1 %74, label %75, label %83, !prof !4

; <label>:75                                      ; preds = %72
  %76 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %77 = load i32* %76, align 4
  %78 = and i32 %77, 8192
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %rw_verify_area.exit.i, label %80

; <label>:80                                      ; preds = %75
  %81 = sub i64 0, %73
  %82 = icmp ult i64 %ret.1.i.i, %81
  br i1 %82, label %91, label %rw_verify_area.exit.i

; <label>:83                                      ; preds = %72
  %84 = add i64 %73, %ret.1.i.i
  %85 = icmp slt i64 %84, 0
  br i1 %85, label %86, label %91, !prof !4

; <label>:86                                      ; preds = %83
  %87 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %88 = load i32* %87, align 4
  %89 = and i32 %88, 8192
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %rw_verify_area.exit.i, label %91

; <label>:91                                      ; preds = %86, %83, %80
  %92 = getelementptr inbounds %struct.inode* %70, i64 0, i32 35
  %93 = load %struct.file_lock** %92, align 8
  %94 = icmp eq %struct.file_lock* %93, null
  br i1 %94, label %.critedge.i.i, label %95

; <label>:95                                      ; preds = %91
  %96 = getelementptr inbounds %struct.inode* %70, i64 0, i32 8
  %97 = load %struct.super_block** %96, align 8
  %98 = getelementptr inbounds %struct.super_block* %97, i64 0, i32 10
  %99 = load i64* %98, align 8
  %100 = and i64 %99, 64
  %101 = icmp eq i64 %100, 0
  br i1 %101, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %95
  %102 = getelementptr inbounds %struct.inode* %70, i64 0, i32 0
  %103 = load i16* %102, align 2
  %104 = and i16 %103, 1032
  %105 = icmp eq i16 %104, 1024
  br i1 %105, label %106, label %.critedge.i.i, !prof !4

; <label>:106                                     ; preds = %mandatory_lock.exit.i.i
  %107 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %70, %struct.file* %6, i64 %73, i64 %ret.1.i.i) #6
  %108 = icmp slt i32 %107, 0
  br i1 %108, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %106, %mandatory_lock.exit.i.i, %95, %91
  %109 = call i32 @security_file_permission(%struct.file* %6, i32 2) #6
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %rw_verify_area.exit.i

; <label>:111                                     ; preds = %.critedge.i.i
  %112 = icmp ugt i64 %ret.1.i.i, 2147479552
  %113 = trunc i64 %ret.1.i.i to i32
  %114 = select i1 %112, i32 2147479552, i32 %113
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %111, %.critedge.i.i, %106, %86, %80, %75, %68
  %.0.i2.i = phi i32 [ %114, %111 ], [ -22, %68 ], [ -22, %75 ], [ -75, %80 ], [ -22, %86 ], [ %107, %106 ], [ %109, %.critedge.i.i ]
  %115 = sext i32 %.0.i2.i to i64
  %116 = icmp slt i32 %.0.i2.i, 0
  br i1 %116, label %file_end_write.exit.i, label %117

; <label>:117                                     ; preds = %rw_verify_area.exit.i
  %118 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %119 = load %struct.file_operations** %118, align 8
  %120 = getelementptr inbounds %struct.file_operations* %119, i64 0, i32 3
  %121 = load i64 (%struct.file*, i8*, i64, i64*)** %120, align 8
  %122 = getelementptr inbounds %struct.file_operations* %119, i64 0, i32 5
  %123 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %122, align 8
  %124 = getelementptr inbounds %struct.file_operations* %119, i64 0, i32 7
  %125 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %124, align 8
  %126 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %127 = load %struct.inode** %126, align 8
  %128 = getelementptr inbounds %struct.inode* %127, i64 0, i32 0
  %129 = load i16* %128, align 2
  %130 = and i16 %129, -4096
  %131 = icmp eq i16 %130, -32768
  br i1 %131, label %132, label %file_start_write.exit.i

; <label>:132                                     ; preds = %117
  %133 = getelementptr inbounds %struct.inode* %127, i64 0, i32 8
  %134 = load %struct.super_block** %133, align 8
  %135 = call i32 @__sb_start_write(%struct.super_block* %134, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %132, %117
  %136 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %125, null
  br i1 %136, label %158, label %137

; <label>:137                                     ; preds = %file_start_write.exit.i
  %138 = load %struct.iovec** %iov.i, align 8
  %139 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %139) #4
  %140 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %140) #4
  %141 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %141) #4
  %142 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %142) #4
  call void @llvm.memset.p0i8.i64(i8* %141, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %142, i8 0, i64 48, i32 8, i1 false) #4
  %143 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %144 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %144, align 8
  %145 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %146 = bitcast %struct.kioctx** %145 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %146, i8* %141, i64 24, i32 8, i1 false) #4
  %147 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %143 to i8*
  store i8* %.c.i.i.i, i8** %147, align 8
  %148 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %149 = bitcast i64* %148 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %149, i8* %142, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %141) #4
  call void @llvm.lifetime.end(i64 48, i8* %142) #4
  %150 = load i64* %pos.i, align 8
  %151 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %150, i64* %151, align 8
  %152 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %152, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 1, %struct.iovec* %138, i64 %vlen, i64 %ret.1.i.i) #6
  %153 = call i64 %125(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %154 = icmp eq i64 %153, -529
  br i1 %154, label %155, label %do_iter_readv_writev.exit.i

; <label>:155                                     ; preds = %137
  %156 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %155, %137
  %ret.0.i.i = phi i64 [ %156, %155 ], [ %153, %137 ]
  %157 = load i64* %151, align 8
  store i64 %157, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %140) #4
  call void @llvm.lifetime.end(i64 88, i8* %139) #4
  br label %do_loop_readv_writev.exit.i

; <label>:158                                     ; preds = %file_start_write.exit.i
  %159 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %123, null
  %160 = load %struct.iovec** %iov.i, align 8
  br i1 %159, label %180, label %161

; <label>:161                                     ; preds = %158
  %162 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %162) #4
  %163 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %163) #4
  %164 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %164) #4
  call void @llvm.memset.p0i8.i64(i8* %163, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %164, i8 0, i64 48, i32 8, i1 false) #4
  %165 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %166 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %166, align 8
  %167 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %168 = bitcast %struct.kioctx** %167 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %168, i8* %163, i64 24, i32 8, i1 false) #4
  %169 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %165 to i8*
  store i8* %.c.i.i4.i, i8** %169, align 8
  %170 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %171 = bitcast i64* %170 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %171, i8* %164, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %163) #4
  call void @llvm.lifetime.end(i64 48, i8* %164) #4
  %172 = load i64* %pos.i, align 8
  %173 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %172, i64* %173, align 8
  %174 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %174, align 8
  %175 = call i64 %123(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %160, i64 %vlen, i64 %172) #6
  %176 = icmp eq i64 %175, -529
  br i1 %176, label %177, label %do_sync_readv_writev.exit.i

; <label>:177                                     ; preds = %161
  %178 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %177, %161
  %ret.0.i5.i = phi i64 [ %178, %177 ], [ %175, %161 ]
  %179 = load i64* %173, align 8
  store i64 %179, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %162) #4
  br label %do_loop_readv_writev.exit.i

; <label>:180                                     ; preds = %158
  %.old1.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %190, %180
  %ret.0.i6.i = phi i64 [ %192, %190 ], [ 0, %180 ]
  %vector.0.i.i = phi %struct.iovec* [ %191, %190 ], [ %160, %180 ]
  %.0.i.i = phi i64 [ %185, %190 ], [ %vlen, %180 ]
  %181 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %182 = load i8** %181, align 8
  %183 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %184 = load i64* %183, align 8
  %185 = add i64 %.0.i.i, -1
  %186 = call i64 %121(%struct.file* %6, i8* %182, i64 %184, i64* %pos.i) #6
  %187 = icmp slt i64 %186, 0
  br i1 %187, label %188, label %190

; <label>:188                                     ; preds = %.preheader.i.i
  %189 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %189, i64 %186, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:190                                     ; preds = %.preheader.i.i
  %191 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %192 = add i64 %186, %ret.0.i6.i
  %193 = icmp eq i64 %186, %184
  %194 = icmp ne i64 %185, 0
  %or.cond.i.i = and i1 %193, %194
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %190, %188, %180, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %188 ], [ 0, %180 ], [ %192, %190 ]
  %195 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %196 = load %struct.inode** %195, align 8
  %197 = getelementptr inbounds %struct.inode* %196, i64 0, i32 0
  %198 = load i16* %197, align 2
  %199 = and i16 %198, -4096
  %200 = icmp eq i16 %199, -32768
  br i1 %200, label %201, label %file_end_write.exit.i

; <label>:201                                     ; preds = %do_loop_readv_writev.exit.i
  %202 = getelementptr inbounds %struct.inode* %196, i64 0, i32 8
  %203 = load %struct.super_block** %202, align 8
  call void @__sb_end_write(%struct.super_block* %203, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %201, %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i64 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %115, %rw_verify_area.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ], [ %ret.0.i, %201 ]
  %204 = load %struct.iovec** %iov.i, align 8
  %205 = icmp eq %struct.iovec* %204, %20
  br i1 %205, label %208, label %206

; <label>:206                                     ; preds = %file_end_write.exit.i
  %207 = bitcast %struct.iovec* %204 to i8*
  call void @kfree(i8* %207) #6
  br label %208

; <label>:208                                     ; preds = %206, %file_end_write.exit.i
  %209 = icmp sgt i64 %ret.1.i, 0
  br i1 %209, label %210, label %do_readv_writev.exit

; <label>:210                                     ; preds = %208
  %211 = getelementptr inbounds %struct.file* %6, i64 0, i32 1
  %212 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %213 = load %struct.inode** %212, align 8
  %214 = getelementptr inbounds %struct.inode* %213, i64 0, i32 0
  %215 = load i16* %214, align 2
  %216 = and i16 %215, -4096
  %217 = icmp eq i16 %216, 16384
  %..i7.i = select i1 %217, i32 1073741826, i32 2
  %218 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %219 = load i32* %218, align 4
  %220 = and i32 %219, 67108864
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %do_readv_writev.exit

; <label>:222                                     ; preds = %210
  %223 = getelementptr inbounds %struct.file* %6, i64 0, i32 1, i32 1
  %224 = load %struct.dentry** %223, align 8
  %225 = call i32 @__fsnotify_parent(%struct.path* %211, %struct.dentry* %224, i32 %..i7.i) #6
  %226 = bitcast %struct.path* %211 to i8*
  %227 = call i32 @fsnotify(%struct.inode* %213, i32 %..i7.i, i8* %226, i32 1, i8* null, i32 0) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %222, %210, %208
  call void @llvm.lifetime.end(i64 128, i8* %19) #4
  %228 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %228) #4
  %229 = icmp sgt i64 %ret.1.i, -1
  br i1 %229, label %230, label %vfs_writev.exit.thread.i

; <label>:230                                     ; preds = %do_readv_writev.exit
  %231 = load i64* %pos.i, align 8
  store i64 %231, i64* %9, align 8
  br label %vfs_writev.exit.thread.i

vfs_writev.exit.thread.i:                         ; preds = %230, %do_readv_writev.exit, %15, %8
  %.0.i1.i = phi i64 [ %ret.1.i, %230 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %8 ], [ -22, %15 ]
  %232 = and i32 %v.tr.i.i.i, 2
  %233 = icmp eq i32 %232, 0
  br i1 %233, label %236, label %234

; <label>:234                                     ; preds = %vfs_writev.exit.thread.i
  %235 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %235) #6
  br label %236

; <label>:236                                     ; preds = %234, %vfs_writev.exit.thread.i
  %237 = and i32 %v.tr.i.i.i, 1
  %238 = icmp eq i32 %237, 0
  br i1 %238, label %fdput_pos.exit.i, label %239

; <label>:239                                     ; preds = %236
  call void @fput(%struct.file* %6) #6
  br label %fdput_pos.exit.i

fdput_pos.exit.i:                                 ; preds = %239, %236
  %240 = icmp sgt i64 %.0.i1.i, 0
  br i1 %240, label %241, label %SYSC_writev.exit

; <label>:241                                     ; preds = %fdput_pos.exit.i
  %242 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %243 = getelementptr inbounds %struct.task_struct* %242, i64 0, i32 113, i32 1
  %244 = load i64* %243, align 8
  %245 = add i64 %244, %.0.i1.i
  store i64 %245, i64* %243, align 8
  br label %SYSC_writev.exit

SYSC_writev.exit:                                 ; preds = %241, %fdput_pos.exit.i, %0
  %ret.02.i = phi i64 [ %.0.i1.i, %241 ], [ %.0.i1.i, %fdput_pos.exit.i ], [ -9, %0 ]
  %246 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %247 = getelementptr inbounds %struct.task_struct* %246, i64 0, i32 113, i32 3
  %248 = load i64* %247, align 8
  %249 = add i64 %248, 1
  store i64 %249, i64* %247, align 8
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %ret.02.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_preadv(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_l, i64 %pos_h) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  store i64 %pos_l, i64* %pos.i, align 8
  %3 = icmp slt i64 %pos_l, 0
  br i1 %3, label %SYSC_preadv.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = trunc i64 %fd to i32
  %6 = call i64 @__fdget(i32 %5) #6
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
  %22 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %22) #4
  %23 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %23) #4
  %24 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %24, %struct.iovec** %iov.i, align 8
  %25 = icmp eq i64 %vlen, 0
  br i1 %25, label %rw_copy_check_uvector.exit.i, label %26

; <label>:26                                      ; preds = %21
  %27 = icmp ugt i64 %vlen, 1024
  br i1 %27, label %rw_copy_check_uvector.exit.i, label %28

; <label>:28                                      ; preds = %26
  %29 = icmp ugt i64 %vlen, 8
  %30 = shl i64 %vlen, 4
  br i1 %29, label %31, label %._crit_edge.i.i

; <label>:31                                      ; preds = %28
  %32 = call i8* @__kmalloc(i64 %30, i32 208) #6
  %33 = bitcast i8* %32 to %struct.iovec*
  %34 = icmp eq i8* %32, null
  br i1 %34, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %31, %28
  %iov.0.i.i = phi %struct.iovec* [ %33, %31 ], [ %24, %28 ]
  %35 = bitcast %struct.iovec* %iov.0.i.i to i8*
  %36 = bitcast %struct.iovec* %1 to i8*
  %37 = call i64 @llvm.objectsize.i64.p0i8(i8* %35, i1 false) #4
  %38 = trunc i64 %37 to i32
  %39 = icmp slt i32 %38, 0
  br i1 %39, label %.critedge.i.i.i, label %40

; <label>:40                                      ; preds = %._crit_edge.i.i
  %sext.i.i.i = shl i64 %37, 32
  %41 = ashr exact i64 %sext.i.i.i, 32
  %42 = icmp ult i64 %41, %30
  br i1 %42, label %45, label %.critedge.i.i.i, !prof !4

.critedge.i.i.i:                                  ; preds = %40, %._crit_edge.i.i
  %43 = trunc i64 %30 to i32
  %44 = call i64 @_copy_from_user(i8* %35, i8* %36, i32 %43) #6
  br label %copy_from_user.exit.i.i

; <label>:45                                      ; preds = %40
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %38, i64 %30) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %45, %.critedge.i.i.i
  %.0.i.i.i = phi i64 [ %44, %.critedge.i.i.i ], [ %30, %45 ]
  %46 = icmp eq i64 %.0.i.i.i, 0
  br i1 %46, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %47

; <label>:47                                      ; preds = %67, %.lr.ph.i.i
  %seg.04.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %69, %67 ]
  %ret.03.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %68, %67 ]
  %48 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 0
  %49 = load i8** %48, align 8
  %50 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 1
  %51 = load i64* %50, align 8
  %52 = icmp slt i64 %51, 0
  br i1 %52, label %rw_copy_check_uvector.exit.i, label %53

; <label>:53                                      ; preds = %47
  %54 = ptrtoint i8* %49 to i64
  %55 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %56 = add i64 %55, -16344
  %57 = inttoptr i64 %56 to %struct.thread_info*
  %58 = getelementptr inbounds %struct.thread_info* %57, i64 0, i32 6, i32 0
  %59 = load i64* %58, align 8
  %uadd.i.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %54, i64 %51) #4
  %60 = extractvalue { i64, i1 } %uadd.i.i.i, 1
  %61 = extractvalue { i64, i1 } %uadd.i.i.i, 0
  %62 = icmp ugt i64 %61, %59
  %or.cond.i1.i = or i1 %60, %62
  br i1 %or.cond.i1.i, label %rw_copy_check_uvector.exit.i, label %63

; <label>:63                                      ; preds = %53
  %64 = sub i64 2147479552, %ret.03.i.i
  %65 = icmp ugt i64 %51, %64
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %63
  store i64 %64, i64* %50, align 8
  br label %67

; <label>:67                                      ; preds = %66, %63
  %len.0.i.i = phi i64 [ %64, %66 ], [ %51, %63 ]
  %68 = add i64 %len.0.i.i, %ret.03.i.i
  %69 = add i64 %seg.04.i.i, 1
  %70 = icmp ult i64 %69, %vlen
  br i1 %70, label %47, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %67, %53, %47, %copy_from_user.exit.i.i, %31, %26, %21
  %iov.1.i.i = phi %struct.iovec* [ %24, %21 ], [ %24, %26 ], [ %33, %31 ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %67 ], [ %iov.0.i.i, %47 ], [ %iov.0.i.i, %53 ]
  %ret.1.i.i = phi i64 [ 0, %21 ], [ -22, %26 ], [ -12, %31 ], [ -14, %copy_from_user.exit.i.i ], [ -14, %53 ], [ -22, %47 ], [ %68, %67 ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 8
  %71 = icmp slt i64 %ret.1.i.i, 1
  br i1 %71, label %file_end_write.exit.i, label %72

; <label>:72                                      ; preds = %rw_copy_check_uvector.exit.i
  %73 = getelementptr inbounds %struct.file* %8, i64 0, i32 2
  %74 = load %struct.inode** %73, align 8
  %75 = icmp slt i64 %ret.1.i.i, 0
  br i1 %75, label %rw_verify_area.exit.i, label %76, !prof !4

; <label>:76                                      ; preds = %72
  %77 = load i64* %pos.i, align 8
  %78 = icmp slt i64 %77, 0
  br i1 %78, label %79, label %87, !prof !4

; <label>:79                                      ; preds = %76
  %80 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %81 = load i32* %80, align 4
  %82 = and i32 %81, 8192
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %rw_verify_area.exit.i, label %84

; <label>:84                                      ; preds = %79
  %85 = sub i64 0, %77
  %86 = icmp ult i64 %ret.1.i.i, %85
  br i1 %86, label %95, label %rw_verify_area.exit.i

; <label>:87                                      ; preds = %76
  %88 = add i64 %77, %ret.1.i.i
  %89 = icmp slt i64 %88, 0
  br i1 %89, label %90, label %95, !prof !4

; <label>:90                                      ; preds = %87
  %91 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %92 = load i32* %91, align 4
  %93 = and i32 %92, 8192
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %rw_verify_area.exit.i, label %95

; <label>:95                                      ; preds = %90, %87, %84
  %96 = getelementptr inbounds %struct.inode* %74, i64 0, i32 35
  %97 = load %struct.file_lock** %96, align 8
  %98 = icmp eq %struct.file_lock* %97, null
  br i1 %98, label %.critedge.i.i, label %99

; <label>:99                                      ; preds = %95
  %100 = getelementptr inbounds %struct.inode* %74, i64 0, i32 8
  %101 = load %struct.super_block** %100, align 8
  %102 = getelementptr inbounds %struct.super_block* %101, i64 0, i32 10
  %103 = load i64* %102, align 8
  %104 = and i64 %103, 64
  %105 = icmp eq i64 %104, 0
  br i1 %105, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %99
  %106 = getelementptr inbounds %struct.inode* %74, i64 0, i32 0
  %107 = load i16* %106, align 2
  %108 = and i16 %107, 1032
  %109 = icmp eq i16 %108, 1024
  br i1 %109, label %110, label %.critedge.i.i, !prof !4

; <label>:110                                     ; preds = %mandatory_lock.exit.i.i
  %111 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %74, %struct.file* %8, i64 %77, i64 %ret.1.i.i) #6
  %112 = icmp slt i32 %111, 0
  br i1 %112, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %110, %mandatory_lock.exit.i.i, %99, %95
  %113 = call i32 @security_file_permission(%struct.file* %8, i32 4) #6
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %rw_verify_area.exit.i

; <label>:115                                     ; preds = %.critedge.i.i
  %116 = icmp ugt i64 %ret.1.i.i, 2147479552
  %117 = trunc i64 %ret.1.i.i to i32
  %118 = select i1 %116, i32 2147479552, i32 %117
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %115, %.critedge.i.i, %110, %90, %84, %79, %72
  %.0.i2.i = phi i32 [ %118, %115 ], [ -22, %72 ], [ -22, %79 ], [ -75, %84 ], [ -22, %90 ], [ %111, %110 ], [ %113, %.critedge.i.i ]
  %119 = sext i32 %.0.i2.i to i64
  %120 = icmp slt i32 %.0.i2.i, 0
  br i1 %120, label %file_end_write.exit.i, label %121

; <label>:121                                     ; preds = %rw_verify_area.exit.i
  %122 = getelementptr inbounds %struct.file* %8, i64 0, i32 3
  %123 = load %struct.file_operations** %122, align 8
  %124 = getelementptr inbounds %struct.file_operations* %123, i64 0, i32 2
  %125 = load i64 (%struct.file*, i8*, i64, i64*)** %124, align 8
  %126 = getelementptr inbounds %struct.file_operations* %123, i64 0, i32 4
  %127 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %126, align 8
  %128 = getelementptr inbounds %struct.file_operations* %123, i64 0, i32 6
  %129 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %128, align 8
  %130 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %129, null
  br i1 %130, label %152, label %131

; <label>:131                                     ; preds = %121
  %132 = load %struct.iovec** %iov.i, align 8
  %133 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %133) #4
  %134 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %134) #4
  %135 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %135) #4
  %136 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %136) #4
  call void @llvm.memset.p0i8.i64(i8* %135, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %136, i8 0, i64 48, i32 8, i1 false) #4
  %137 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %138 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %8, %struct.file** %138, align 8
  %139 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %140 = bitcast %struct.kioctx** %139 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %140, i8* %135, i64 24, i32 8, i1 false) #4
  %141 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %137 to i8*
  store i8* %.c.i.i.i, i8** %141, align 8
  %142 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %143 = bitcast i64* %142 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %143, i8* %136, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %135) #4
  call void @llvm.lifetime.end(i64 48, i8* %136) #4
  %144 = load i64* %pos.i, align 8
  %145 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %144, i64* %145, align 8
  %146 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %146, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 0, %struct.iovec* %132, i64 %vlen, i64 %ret.1.i.i) #6
  %147 = call i64 %129(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %148 = icmp eq i64 %147, -529
  br i1 %148, label %149, label %do_iter_readv_writev.exit.i

; <label>:149                                     ; preds = %131
  %150 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %149, %131
  %ret.0.i.i = phi i64 [ %150, %149 ], [ %147, %131 ]
  %151 = load i64* %145, align 8
  store i64 %151, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %134) #4
  call void @llvm.lifetime.end(i64 88, i8* %133) #4
  br label %do_loop_readv_writev.exit.i

; <label>:152                                     ; preds = %121
  %153 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %127, null
  %154 = load %struct.iovec** %iov.i, align 8
  br i1 %153, label %174, label %155

; <label>:155                                     ; preds = %152
  %156 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %156) #4
  %157 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %157) #4
  %158 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %158) #4
  call void @llvm.memset.p0i8.i64(i8* %157, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %158, i8 0, i64 48, i32 8, i1 false) #4
  %159 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %160 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %8, %struct.file** %160, align 8
  %161 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %162 = bitcast %struct.kioctx** %161 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %162, i8* %157, i64 24, i32 8, i1 false) #4
  %163 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %159 to i8*
  store i8* %.c.i.i4.i, i8** %163, align 8
  %164 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %165 = bitcast i64* %164 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %165, i8* %158, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %157) #4
  call void @llvm.lifetime.end(i64 48, i8* %158) #4
  %166 = load i64* %pos.i, align 8
  %167 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %166, i64* %167, align 8
  %168 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %168, align 8
  %169 = call i64 %127(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %154, i64 %vlen, i64 %166) #6
  %170 = icmp eq i64 %169, -529
  br i1 %170, label %171, label %do_sync_readv_writev.exit.i

; <label>:171                                     ; preds = %155
  %172 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %171, %155
  %ret.0.i5.i = phi i64 [ %172, %171 ], [ %169, %155 ]
  %173 = load i64* %167, align 8
  store i64 %173, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %156) #4
  br label %do_loop_readv_writev.exit.i

; <label>:174                                     ; preds = %152
  %.old1.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %184, %174
  %ret.0.i6.i = phi i64 [ %186, %184 ], [ 0, %174 ]
  %vector.0.i.i = phi %struct.iovec* [ %185, %184 ], [ %154, %174 ]
  %.0.i.i = phi i64 [ %179, %184 ], [ %vlen, %174 ]
  %175 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %176 = load i8** %175, align 8
  %177 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %178 = load i64* %177, align 8
  %179 = add i64 %.0.i.i, -1
  %180 = call i64 %125(%struct.file* %8, i8* %176, i64 %178, i64* %pos.i) #6
  %181 = icmp slt i64 %180, 0
  br i1 %181, label %182, label %184

; <label>:182                                     ; preds = %.preheader.i.i
  %183 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %183, i64 %180, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:184                                     ; preds = %.preheader.i.i
  %185 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %186 = add i64 %180, %ret.0.i6.i
  %187 = icmp eq i64 %180, %178
  %188 = icmp ne i64 %179, 0
  %or.cond.i.i = and i1 %187, %188
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %184, %182, %174, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i1 = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %182 ], [ 0, %174 ], [ %186, %184 ]
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i64 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %119, %rw_verify_area.exit.i ], [ %ret.0.i1, %do_loop_readv_writev.exit.i ]
  %189 = load %struct.iovec** %iov.i, align 8
  %190 = icmp eq %struct.iovec* %189, %24
  br i1 %190, label %193, label %191

; <label>:191                                     ; preds = %file_end_write.exit.i
  %192 = bitcast %struct.iovec* %189 to i8*
  call void @kfree(i8* %192) #6
  br label %193

; <label>:193                                     ; preds = %191, %file_end_write.exit.i
  %194 = add i64 %ret.1.i, 1
  %195 = icmp sgt i64 %194, 0
  br i1 %195, label %196, label %do_readv_writev.exit

; <label>:196                                     ; preds = %193
  %197 = getelementptr inbounds %struct.file* %8, i64 0, i32 1
  %198 = getelementptr inbounds %struct.file* %8, i64 0, i32 2
  %199 = load %struct.inode** %198, align 8
  %200 = getelementptr inbounds %struct.inode* %199, i64 0, i32 0
  %201 = load i16* %200, align 2
  %202 = and i16 %201, -4096
  %203 = icmp eq i16 %202, 16384
  %..i.i = select i1 %203, i32 1073741825, i32 1
  %204 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %205 = load i32* %204, align 4
  %206 = and i32 %205, 67108864
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %do_readv_writev.exit

; <label>:208                                     ; preds = %196
  %209 = getelementptr inbounds %struct.file* %8, i64 0, i32 1, i32 1
  %210 = load %struct.dentry** %209, align 8
  %211 = call i32 @__fsnotify_parent(%struct.path* %197, %struct.dentry* %210, i32 %..i.i) #6
  %212 = bitcast %struct.path* %197 to i8*
  %213 = call i32 @fsnotify(%struct.inode* %199, i32 %..i.i, i8* %212, i32 1, i8* null, i32 0) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %208, %196, %193
  call void @llvm.lifetime.end(i64 128, i8* %23) #4
  %214 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %214) #4
  br label %vfs_readv.exit.i

vfs_readv.exit.i:                                 ; preds = %do_readv_writev.exit, %18, %15, %10
  %ret.0.i = phi i64 [ -29, %10 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %15 ], [ -22, %18 ]
  %215 = and i64 %6, 1
  %216 = icmp eq i64 %215, 0
  br i1 %216, label %fdput.exit.i, label %217

; <label>:217                                     ; preds = %vfs_readv.exit.i
  call void @fput(%struct.file* %8) #6
  br label %fdput.exit.i

fdput.exit.i:                                     ; preds = %217, %vfs_readv.exit.i
  %218 = icmp sgt i64 %ret.0.i, 0
  br i1 %218, label %219, label %fdput.exit.thread.i

; <label>:219                                     ; preds = %fdput.exit.i
  %220 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %221 = getelementptr inbounds %struct.task_struct* %220, i64 0, i32 113, i32 0
  %222 = load i64* %221, align 8
  %223 = add i64 %222, %ret.0.i
  store i64 %223, i64* %221, align 8
  br label %fdput.exit.thread.i

fdput.exit.thread.i:                              ; preds = %219, %fdput.exit.i, %4
  %ret.11.i = phi i64 [ %ret.0.i, %219 ], [ %ret.0.i, %fdput.exit.i ], [ -9, %4 ]
  %224 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %225 = getelementptr inbounds %struct.task_struct* %224, i64 0, i32 113, i32 2
  %226 = load i64* %225, align 8
  %227 = add i64 %226, 1
  store i64 %227, i64* %225, align 8
  br label %SYSC_preadv.exit

SYSC_preadv.exit:                                 ; preds = %fdput.exit.thread.i, %0
  %.0.i = phi i64 [ %ret.11.i, %fdput.exit.thread.i ], [ -22, %0 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_pwritev(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_l, i64 %pos_h) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %pos.i = alloca i64, align 8
  %1 = inttoptr i64 %vec to %struct.iovec*
  %2 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2) #4
  store i64 %pos_l, i64* %pos.i, align 8
  %3 = icmp slt i64 %pos_l, 0
  br i1 %3, label %SYSC_pwritev.exit, label %4

; <label>:4                                       ; preds = %0
  %5 = trunc i64 %fd to i32
  %6 = call i64 @__fdget(i32 %5) #6
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
  %22 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %22) #4
  %23 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %23) #4
  %24 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %24, %struct.iovec** %iov.i, align 8
  %25 = icmp eq i64 %vlen, 0
  br i1 %25, label %rw_copy_check_uvector.exit.i, label %26

; <label>:26                                      ; preds = %21
  %27 = icmp ugt i64 %vlen, 1024
  br i1 %27, label %rw_copy_check_uvector.exit.i, label %28

; <label>:28                                      ; preds = %26
  %29 = icmp ugt i64 %vlen, 8
  %30 = shl i64 %vlen, 4
  br i1 %29, label %31, label %._crit_edge.i.i

; <label>:31                                      ; preds = %28
  %32 = call i8* @__kmalloc(i64 %30, i32 208) #6
  %33 = bitcast i8* %32 to %struct.iovec*
  %34 = icmp eq i8* %32, null
  br i1 %34, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %31, %28
  %iov.0.i.i = phi %struct.iovec* [ %33, %31 ], [ %24, %28 ]
  %35 = bitcast %struct.iovec* %iov.0.i.i to i8*
  %36 = bitcast %struct.iovec* %1 to i8*
  %37 = call i64 @llvm.objectsize.i64.p0i8(i8* %35, i1 false) #4
  %38 = trunc i64 %37 to i32
  %39 = icmp slt i32 %38, 0
  br i1 %39, label %.critedge.i.i.i, label %40

; <label>:40                                      ; preds = %._crit_edge.i.i
  %sext.i.i.i = shl i64 %37, 32
  %41 = ashr exact i64 %sext.i.i.i, 32
  %42 = icmp ult i64 %41, %30
  br i1 %42, label %45, label %.critedge.i.i.i, !prof !4

.critedge.i.i.i:                                  ; preds = %40, %._crit_edge.i.i
  %43 = trunc i64 %30 to i32
  %44 = call i64 @_copy_from_user(i8* %35, i8* %36, i32 %43) #6
  br label %copy_from_user.exit.i.i

; <label>:45                                      ; preds = %40
  call void (i8*, i32, i8*, ...)* @warn_slowpath_fmt(i8* getelementptr inbounds ([33 x i8]* @.str, i64 0, i64 0), i32 680, i8* getelementptr inbounds ([38 x i8]* @.str1, i64 0, i64 0), i32 %38, i64 %30) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %45, %.critedge.i.i.i
  %.0.i.i.i = phi i64 [ %44, %.critedge.i.i.i ], [ %30, %45 ]
  %46 = icmp eq i64 %.0.i.i.i, 0
  br i1 %46, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %47

; <label>:47                                      ; preds = %67, %.lr.ph.i.i
  %seg.04.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %69, %67 ]
  %ret.03.i.i = phi i64 [ 0, %.lr.ph.i.i ], [ %68, %67 ]
  %48 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 0
  %49 = load i8** %48, align 8
  %50 = getelementptr inbounds %struct.iovec* %iov.0.i.i, i64 %seg.04.i.i, i32 1
  %51 = load i64* %50, align 8
  %52 = icmp slt i64 %51, 0
  br i1 %52, label %rw_copy_check_uvector.exit.i, label %53

; <label>:53                                      ; preds = %47
  %54 = ptrtoint i8* %49 to i64
  %55 = call i64 asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i64* @kernel_stack) #4, !srcloc !5
  %56 = add i64 %55, -16344
  %57 = inttoptr i64 %56 to %struct.thread_info*
  %58 = getelementptr inbounds %struct.thread_info* %57, i64 0, i32 6, i32 0
  %59 = load i64* %58, align 8
  %uadd.i.i.i = call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %54, i64 %51) #4
  %60 = extractvalue { i64, i1 } %uadd.i.i.i, 1
  %61 = extractvalue { i64, i1 } %uadd.i.i.i, 0
  %62 = icmp ugt i64 %61, %59
  %or.cond.i1.i = or i1 %60, %62
  br i1 %or.cond.i1.i, label %rw_copy_check_uvector.exit.i, label %63

; <label>:63                                      ; preds = %53
  %64 = sub i64 2147479552, %ret.03.i.i
  %65 = icmp ugt i64 %51, %64
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %63
  store i64 %64, i64* %50, align 8
  br label %67

; <label>:67                                      ; preds = %66, %63
  %len.0.i.i = phi i64 [ %64, %66 ], [ %51, %63 ]
  %68 = add i64 %len.0.i.i, %ret.03.i.i
  %69 = add i64 %seg.04.i.i, 1
  %70 = icmp ult i64 %69, %vlen
  br i1 %70, label %47, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %67, %53, %47, %copy_from_user.exit.i.i, %31, %26, %21
  %iov.1.i.i = phi %struct.iovec* [ %24, %21 ], [ %24, %26 ], [ %33, %31 ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %67 ], [ %iov.0.i.i, %47 ], [ %iov.0.i.i, %53 ]
  %ret.1.i.i = phi i64 [ 0, %21 ], [ -22, %26 ], [ -12, %31 ], [ -14, %copy_from_user.exit.i.i ], [ -14, %53 ], [ -22, %47 ], [ %68, %67 ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 8
  %71 = icmp slt i64 %ret.1.i.i, 1
  br i1 %71, label %file_end_write.exit.i, label %72

; <label>:72                                      ; preds = %rw_copy_check_uvector.exit.i
  %73 = getelementptr inbounds %struct.file* %8, i64 0, i32 2
  %74 = load %struct.inode** %73, align 8
  %75 = icmp slt i64 %ret.1.i.i, 0
  br i1 %75, label %rw_verify_area.exit.i, label %76, !prof !4

; <label>:76                                      ; preds = %72
  %77 = load i64* %pos.i, align 8
  %78 = icmp slt i64 %77, 0
  br i1 %78, label %79, label %87, !prof !4

; <label>:79                                      ; preds = %76
  %80 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %81 = load i32* %80, align 4
  %82 = and i32 %81, 8192
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %rw_verify_area.exit.i, label %84

; <label>:84                                      ; preds = %79
  %85 = sub i64 0, %77
  %86 = icmp ult i64 %ret.1.i.i, %85
  br i1 %86, label %95, label %rw_verify_area.exit.i

; <label>:87                                      ; preds = %76
  %88 = add i64 %77, %ret.1.i.i
  %89 = icmp slt i64 %88, 0
  br i1 %89, label %90, label %95, !prof !4

; <label>:90                                      ; preds = %87
  %91 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %92 = load i32* %91, align 4
  %93 = and i32 %92, 8192
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %rw_verify_area.exit.i, label %95

; <label>:95                                      ; preds = %90, %87, %84
  %96 = getelementptr inbounds %struct.inode* %74, i64 0, i32 35
  %97 = load %struct.file_lock** %96, align 8
  %98 = icmp eq %struct.file_lock* %97, null
  br i1 %98, label %.critedge.i.i, label %99

; <label>:99                                      ; preds = %95
  %100 = getelementptr inbounds %struct.inode* %74, i64 0, i32 8
  %101 = load %struct.super_block** %100, align 8
  %102 = getelementptr inbounds %struct.super_block* %101, i64 0, i32 10
  %103 = load i64* %102, align 8
  %104 = and i64 %103, 64
  %105 = icmp eq i64 %104, 0
  br i1 %105, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %99
  %106 = getelementptr inbounds %struct.inode* %74, i64 0, i32 0
  %107 = load i16* %106, align 2
  %108 = and i16 %107, 1032
  %109 = icmp eq i16 %108, 1024
  br i1 %109, label %110, label %.critedge.i.i, !prof !4

; <label>:110                                     ; preds = %mandatory_lock.exit.i.i
  %111 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %74, %struct.file* %8, i64 %77, i64 %ret.1.i.i) #6
  %112 = icmp slt i32 %111, 0
  br i1 %112, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %110, %mandatory_lock.exit.i.i, %99, %95
  %113 = call i32 @security_file_permission(%struct.file* %8, i32 2) #6
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %rw_verify_area.exit.i

; <label>:115                                     ; preds = %.critedge.i.i
  %116 = icmp ugt i64 %ret.1.i.i, 2147479552
  %117 = trunc i64 %ret.1.i.i to i32
  %118 = select i1 %116, i32 2147479552, i32 %117
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %115, %.critedge.i.i, %110, %90, %84, %79, %72
  %.0.i2.i = phi i32 [ %118, %115 ], [ -22, %72 ], [ -22, %79 ], [ -75, %84 ], [ -22, %90 ], [ %111, %110 ], [ %113, %.critedge.i.i ]
  %119 = sext i32 %.0.i2.i to i64
  %120 = icmp slt i32 %.0.i2.i, 0
  br i1 %120, label %file_end_write.exit.i, label %121

; <label>:121                                     ; preds = %rw_verify_area.exit.i
  %122 = getelementptr inbounds %struct.file* %8, i64 0, i32 3
  %123 = load %struct.file_operations** %122, align 8
  %124 = getelementptr inbounds %struct.file_operations* %123, i64 0, i32 3
  %125 = load i64 (%struct.file*, i8*, i64, i64*)** %124, align 8
  %126 = getelementptr inbounds %struct.file_operations* %123, i64 0, i32 5
  %127 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %126, align 8
  %128 = getelementptr inbounds %struct.file_operations* %123, i64 0, i32 7
  %129 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %128, align 8
  %130 = getelementptr inbounds %struct.file* %8, i64 0, i32 2
  %131 = load %struct.inode** %130, align 8
  %132 = getelementptr inbounds %struct.inode* %131, i64 0, i32 0
  %133 = load i16* %132, align 2
  %134 = and i16 %133, -4096
  %135 = icmp eq i16 %134, -32768
  br i1 %135, label %136, label %file_start_write.exit.i

; <label>:136                                     ; preds = %121
  %137 = getelementptr inbounds %struct.inode* %131, i64 0, i32 8
  %138 = load %struct.super_block** %137, align 8
  %139 = call i32 @__sb_start_write(%struct.super_block* %138, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %136, %121
  %140 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %129, null
  br i1 %140, label %162, label %141

; <label>:141                                     ; preds = %file_start_write.exit.i
  %142 = load %struct.iovec** %iov.i, align 8
  %143 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %143) #4
  %144 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %144) #4
  %145 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %145) #4
  %146 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %146) #4
  call void @llvm.memset.p0i8.i64(i8* %145, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %146, i8 0, i64 48, i32 8, i1 false) #4
  %147 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %148 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %8, %struct.file** %148, align 8
  %149 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %150 = bitcast %struct.kioctx** %149 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %150, i8* %145, i64 24, i32 8, i1 false) #4
  %151 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %147 to i8*
  store i8* %.c.i.i.i, i8** %151, align 8
  %152 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %153 = bitcast i64* %152 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %153, i8* %146, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %145) #4
  call void @llvm.lifetime.end(i64 48, i8* %146) #4
  %154 = load i64* %pos.i, align 8
  %155 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %154, i64* %155, align 8
  %156 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %156, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 1, %struct.iovec* %142, i64 %vlen, i64 %ret.1.i.i) #6
  %157 = call i64 %129(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %158 = icmp eq i64 %157, -529
  br i1 %158, label %159, label %do_iter_readv_writev.exit.i

; <label>:159                                     ; preds = %141
  %160 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %159, %141
  %ret.0.i.i = phi i64 [ %160, %159 ], [ %157, %141 ]
  %161 = load i64* %155, align 8
  store i64 %161, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %144) #4
  call void @llvm.lifetime.end(i64 88, i8* %143) #4
  br label %do_loop_readv_writev.exit.i

; <label>:162                                     ; preds = %file_start_write.exit.i
  %163 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %127, null
  %164 = load %struct.iovec** %iov.i, align 8
  br i1 %163, label %184, label %165

; <label>:165                                     ; preds = %162
  %166 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %166) #4
  %167 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %167) #4
  %168 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %168) #4
  call void @llvm.memset.p0i8.i64(i8* %167, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %168, i8 0, i64 48, i32 8, i1 false) #4
  %169 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %170 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %8, %struct.file** %170, align 8
  %171 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %172 = bitcast %struct.kioctx** %171 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %172, i8* %167, i64 24, i32 8, i1 false) #4
  %173 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %169 to i8*
  store i8* %.c.i.i4.i, i8** %173, align 8
  %174 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %175 = bitcast i64* %174 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %175, i8* %168, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %167) #4
  call void @llvm.lifetime.end(i64 48, i8* %168) #4
  %176 = load i64* %pos.i, align 8
  %177 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %176, i64* %177, align 8
  %178 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %ret.1.i.i, i64* %178, align 8
  %179 = call i64 %127(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %164, i64 %vlen, i64 %176) #6
  %180 = icmp eq i64 %179, -529
  br i1 %180, label %181, label %do_sync_readv_writev.exit.i

; <label>:181                                     ; preds = %165
  %182 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %181, %165
  %ret.0.i5.i = phi i64 [ %182, %181 ], [ %179, %165 ]
  %183 = load i64* %177, align 8
  store i64 %183, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %166) #4
  br label %do_loop_readv_writev.exit.i

; <label>:184                                     ; preds = %162
  %.old1.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %194, %184
  %ret.0.i6.i = phi i64 [ %196, %194 ], [ 0, %184 ]
  %vector.0.i.i = phi %struct.iovec* [ %195, %194 ], [ %164, %184 ]
  %.0.i.i = phi i64 [ %189, %194 ], [ %vlen, %184 ]
  %185 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %186 = load i8** %185, align 8
  %187 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %188 = load i64* %187, align 8
  %189 = add i64 %.0.i.i, -1
  %190 = call i64 %125(%struct.file* %8, i8* %186, i64 %188, i64* %pos.i) #6
  %191 = icmp slt i64 %190, 0
  br i1 %191, label %192, label %194

; <label>:192                                     ; preds = %.preheader.i.i
  %193 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %193, i64 %190, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:194                                     ; preds = %.preheader.i.i
  %195 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %196 = add i64 %190, %ret.0.i6.i
  %197 = icmp eq i64 %190, %188
  %198 = icmp ne i64 %189, 0
  %or.cond.i.i = and i1 %197, %198
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %194, %192, %184, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i1 = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %192 ], [ 0, %184 ], [ %196, %194 ]
  %199 = getelementptr inbounds %struct.file* %8, i64 0, i32 2
  %200 = load %struct.inode** %199, align 8
  %201 = getelementptr inbounds %struct.inode* %200, i64 0, i32 0
  %202 = load i16* %201, align 2
  %203 = and i16 %202, -4096
  %204 = icmp eq i16 %203, -32768
  br i1 %204, label %205, label %file_end_write.exit.i

; <label>:205                                     ; preds = %do_loop_readv_writev.exit.i
  %206 = getelementptr inbounds %struct.inode* %200, i64 0, i32 8
  %207 = load %struct.super_block** %206, align 8
  call void @__sb_end_write(%struct.super_block* %207, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %205, %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i64 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %119, %rw_verify_area.exit.i ], [ %ret.0.i1, %do_loop_readv_writev.exit.i ], [ %ret.0.i1, %205 ]
  %208 = load %struct.iovec** %iov.i, align 8
  %209 = icmp eq %struct.iovec* %208, %24
  br i1 %209, label %212, label %210

; <label>:210                                     ; preds = %file_end_write.exit.i
  %211 = bitcast %struct.iovec* %208 to i8*
  call void @kfree(i8* %211) #6
  br label %212

; <label>:212                                     ; preds = %210, %file_end_write.exit.i
  %213 = icmp sgt i64 %ret.1.i, 0
  br i1 %213, label %214, label %do_readv_writev.exit

; <label>:214                                     ; preds = %212
  %215 = getelementptr inbounds %struct.file* %8, i64 0, i32 1
  %216 = getelementptr inbounds %struct.file* %8, i64 0, i32 2
  %217 = load %struct.inode** %216, align 8
  %218 = getelementptr inbounds %struct.inode* %217, i64 0, i32 0
  %219 = load i16* %218, align 2
  %220 = and i16 %219, -4096
  %221 = icmp eq i16 %220, 16384
  %..i7.i = select i1 %221, i32 1073741826, i32 2
  %222 = getelementptr inbounds %struct.file* %8, i64 0, i32 7
  %223 = load i32* %222, align 4
  %224 = and i32 %223, 67108864
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %226, label %do_readv_writev.exit

; <label>:226                                     ; preds = %214
  %227 = getelementptr inbounds %struct.file* %8, i64 0, i32 1, i32 1
  %228 = load %struct.dentry** %227, align 8
  %229 = call i32 @__fsnotify_parent(%struct.path* %215, %struct.dentry* %228, i32 %..i7.i) #6
  %230 = bitcast %struct.path* %215 to i8*
  %231 = call i32 @fsnotify(%struct.inode* %217, i32 %..i7.i, i8* %230, i32 1, i8* null, i32 0) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %226, %214, %212
  call void @llvm.lifetime.end(i64 128, i8* %23) #4
  %232 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %232) #4
  br label %vfs_writev.exit.i

vfs_writev.exit.i:                                ; preds = %do_readv_writev.exit, %18, %15, %10
  %ret.0.i = phi i64 [ -29, %10 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %15 ], [ -22, %18 ]
  %233 = and i64 %6, 1
  %234 = icmp eq i64 %233, 0
  br i1 %234, label %fdput.exit.i, label %235

; <label>:235                                     ; preds = %vfs_writev.exit.i
  call void @fput(%struct.file* %8) #6
  br label %fdput.exit.i

fdput.exit.i:                                     ; preds = %235, %vfs_writev.exit.i
  %236 = icmp sgt i64 %ret.0.i, 0
  br i1 %236, label %237, label %fdput.exit.thread.i

; <label>:237                                     ; preds = %fdput.exit.i
  %238 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %239 = getelementptr inbounds %struct.task_struct* %238, i64 0, i32 113, i32 1
  %240 = load i64* %239, align 8
  %241 = add i64 %240, %ret.0.i
  store i64 %241, i64* %239, align 8
  br label %fdput.exit.thread.i

fdput.exit.thread.i:                              ; preds = %237, %fdput.exit.i, %4
  %ret.11.i = phi i64 [ %ret.0.i, %237 ], [ %ret.0.i, %fdput.exit.i ], [ -9, %4 ]
  %242 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %243 = getelementptr inbounds %struct.task_struct* %242, i64 0, i32 113, i32 3
  %244 = load i64* %243, align 8
  %245 = add i64 %244, 1
  store i64 %245, i64* %243, align 8
  br label %SYSC_pwritev.exit

SYSC_pwritev.exit:                                ; preds = %fdput.exit.thread.i, %0
  %.0.i = phi i64 [ %ret.11.i, %fdput.exit.thread.i ], [ -22, %0 ]
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_readv(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  %4 = call i64 @__fdget_pos(i32 %1) #6
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
  %20 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %20) #4
  %21 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %21) #4
  %22 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %22, %struct.iovec** %iov.i, align 8
  %23 = call i64 @compat_rw_copy_check_uvector(i32 0, %struct.compat_iovec* %2, i64 %11, i64 8, %struct.iovec* %22, %struct.iovec** %iov.i) #6
  %24 = icmp slt i64 %23, 1
  br i1 %24, label %file_end_write.exit.i, label %25

; <label>:25                                      ; preds = %19
  %sext.i = shl i64 %23, 32
  %26 = ashr exact i64 %sext.i, 32
  %27 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %28 = load %struct.inode** %27, align 8
  %29 = icmp slt i64 %26, 0
  br i1 %29, label %rw_verify_area.exit.i, label %30, !prof !4

; <label>:30                                      ; preds = %25
  %31 = load i64* %pos.i, align 8
  %32 = icmp slt i64 %31, 0
  br i1 %32, label %33, label %41, !prof !4

; <label>:33                                      ; preds = %30
  %34 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %35 = load i32* %34, align 4
  %36 = and i32 %35, 8192
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %rw_verify_area.exit.i, label %38

; <label>:38                                      ; preds = %33
  %39 = sub i64 0, %31
  %40 = icmp ult i64 %26, %39
  br i1 %40, label %49, label %rw_verify_area.exit.i

; <label>:41                                      ; preds = %30
  %42 = add i64 %31, %26
  %43 = icmp slt i64 %42, 0
  br i1 %43, label %44, label %49, !prof !4

; <label>:44                                      ; preds = %41
  %45 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %46 = load i32* %45, align 4
  %47 = and i32 %46, 8192
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %rw_verify_area.exit.i, label %49

; <label>:49                                      ; preds = %44, %41, %38
  %50 = getelementptr inbounds %struct.inode* %28, i64 0, i32 35
  %51 = load %struct.file_lock** %50, align 8
  %52 = icmp eq %struct.file_lock* %51, null
  br i1 %52, label %.critedge.i.i, label %53

; <label>:53                                      ; preds = %49
  %54 = getelementptr inbounds %struct.inode* %28, i64 0, i32 8
  %55 = load %struct.super_block** %54, align 8
  %56 = getelementptr inbounds %struct.super_block* %55, i64 0, i32 10
  %57 = load i64* %56, align 8
  %58 = and i64 %57, 64
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %53
  %60 = getelementptr inbounds %struct.inode* %28, i64 0, i32 0
  %61 = load i16* %60, align 2
  %62 = and i16 %61, 1032
  %63 = icmp eq i16 %62, 1024
  br i1 %63, label %64, label %.critedge.i.i, !prof !4

; <label>:64                                      ; preds = %mandatory_lock.exit.i.i
  %65 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %28, %struct.file* %6, i64 %31, i64 %26) #6
  %66 = icmp slt i32 %65, 0
  br i1 %66, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %64, %mandatory_lock.exit.i.i, %53, %49
  %67 = call i32 @security_file_permission(%struct.file* %6, i32 4) #6
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %rw_verify_area.exit.i

; <label>:69                                      ; preds = %.critedge.i.i
  %70 = icmp ugt i64 %26, 2147479552
  %71 = trunc i64 %26 to i32
  %72 = select i1 %70, i32 2147479552, i32 %71
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %69, %.critedge.i.i, %64, %44, %38, %33, %25
  %.0.i1.i = phi i32 [ %72, %69 ], [ -22, %25 ], [ -22, %33 ], [ -75, %38 ], [ -22, %44 ], [ %65, %64 ], [ %67, %.critedge.i.i ]
  %73 = sext i32 %.0.i1.i to i64
  %74 = icmp slt i32 %.0.i1.i, 0
  br i1 %74, label %file_end_write.exit.i, label %75

; <label>:75                                      ; preds = %rw_verify_area.exit.i
  %76 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %77 = load %struct.file_operations** %76, align 8
  %78 = getelementptr inbounds %struct.file_operations* %77, i64 0, i32 2
  %79 = load i64 (%struct.file*, i8*, i64, i64*)** %78, align 8
  %80 = getelementptr inbounds %struct.file_operations* %77, i64 0, i32 4
  %81 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %80, align 8
  %82 = getelementptr inbounds %struct.file_operations* %77, i64 0, i32 6
  %83 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %82, align 8
  %84 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %83, null
  br i1 %84, label %106, label %85

; <label>:85                                      ; preds = %75
  %86 = load %struct.iovec** %iov.i, align 8
  %87 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %87) #4
  %88 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %88) #4
  %89 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %89) #4
  %90 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %90) #4
  call void @llvm.memset.p0i8.i64(i8* %89, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %90, i8 0, i64 48, i32 8, i1 false) #4
  %91 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %92 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %92, align 8
  %93 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %94 = bitcast %struct.kioctx** %93 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %94, i8* %89, i64 24, i32 8, i1 false) #4
  %95 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %91 to i8*
  store i8* %.c.i.i.i, i8** %95, align 8
  %96 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %97 = bitcast i64* %96 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %97, i8* %90, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %89) #4
  call void @llvm.lifetime.end(i64 48, i8* %90) #4
  %98 = load i64* %pos.i, align 8
  %99 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %98, i64* %99, align 8
  %100 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %26, i64* %100, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 0, %struct.iovec* %86, i64 %11, i64 %26) #6
  %101 = call i64 %83(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %102 = icmp eq i64 %101, -529
  br i1 %102, label %103, label %do_iter_readv_writev.exit.i

; <label>:103                                     ; preds = %85
  %104 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %103, %85
  %ret.0.i.i = phi i64 [ %104, %103 ], [ %101, %85 ]
  %105 = load i64* %99, align 8
  store i64 %105, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %88) #4
  call void @llvm.lifetime.end(i64 88, i8* %87) #4
  br label %do_loop_readv_writev.exit.i

; <label>:106                                     ; preds = %75
  %107 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %81, null
  %108 = load %struct.iovec** %iov.i, align 8
  br i1 %107, label %128, label %109

; <label>:109                                     ; preds = %106
  %110 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %110) #4
  %111 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %111) #4
  %112 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %112) #4
  call void @llvm.memset.p0i8.i64(i8* %111, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %112, i8 0, i64 48, i32 8, i1 false) #4
  %113 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %114 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %114, align 8
  %115 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %116 = bitcast %struct.kioctx** %115 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %116, i8* %111, i64 24, i32 8, i1 false) #4
  %117 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %113 to i8*
  store i8* %.c.i.i4.i, i8** %117, align 8
  %118 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %119 = bitcast i64* %118 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %119, i8* %112, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %111) #4
  call void @llvm.lifetime.end(i64 48, i8* %112) #4
  %120 = load i64* %pos.i, align 8
  %121 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %120, i64* %121, align 8
  %122 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %26, i64* %122, align 8
  %123 = call i64 %81(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %108, i64 %11, i64 %120) #6
  %124 = icmp eq i64 %123, -529
  br i1 %124, label %125, label %do_sync_readv_writev.exit.i

; <label>:125                                     ; preds = %109
  %126 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %125, %109
  %ret.0.i5.i = phi i64 [ %126, %125 ], [ %123, %109 ]
  %127 = load i64* %121, align 8
  store i64 %127, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %110) #4
  br label %do_loop_readv_writev.exit.i

; <label>:128                                     ; preds = %106
  %.old1.i.i = icmp eq i64 %11, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %138, %128
  %ret.0.i6.i = phi i64 [ %140, %138 ], [ 0, %128 ]
  %vector.0.i.i = phi %struct.iovec* [ %139, %138 ], [ %108, %128 ]
  %.0.i.i = phi i64 [ %133, %138 ], [ %11, %128 ]
  %129 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %130 = load i8** %129, align 8
  %131 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %132 = load i64* %131, align 8
  %133 = add i64 %.0.i.i, -1
  %134 = call i64 %79(%struct.file* %6, i8* %130, i64 %132, i64* %pos.i) #6
  %135 = icmp slt i64 %134, 0
  br i1 %135, label %136, label %138

; <label>:136                                     ; preds = %.preheader.i.i
  %137 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %137, i64 %134, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:138                                     ; preds = %.preheader.i.i
  %139 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %140 = add i64 %134, %ret.0.i6.i
  %141 = icmp eq i64 %134, %132
  %142 = icmp ne i64 %133, 0
  %or.cond.i.i = and i1 %141, %142
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %138, %136, %128, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %136 ], [ 0, %128 ], [ %140, %138 ]
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %19
  %ret.1.i = phi i64 [ %23, %19 ], [ %73, %rw_verify_area.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ]
  %143 = load %struct.iovec** %iov.i, align 8
  %144 = icmp eq %struct.iovec* %143, %22
  br i1 %144, label %147, label %145

; <label>:145                                     ; preds = %file_end_write.exit.i
  %146 = bitcast %struct.iovec* %143 to i8*
  call void @kfree(i8* %146) #6
  br label %147

; <label>:147                                     ; preds = %145, %file_end_write.exit.i
  %148 = add i64 %ret.1.i, 1
  %149 = icmp sgt i64 %148, 0
  br i1 %149, label %150, label %compat_do_readv_writev.exit

; <label>:150                                     ; preds = %147
  %151 = getelementptr inbounds %struct.file* %6, i64 0, i32 1
  %152 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %153 = load %struct.inode** %152, align 8
  %154 = getelementptr inbounds %struct.inode* %153, i64 0, i32 0
  %155 = load i16* %154, align 2
  %156 = and i16 %155, -4096
  %157 = icmp eq i16 %156, 16384
  %..i.i = select i1 %157, i32 1073741825, i32 1
  %158 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %159 = load i32* %158, align 4
  %160 = and i32 %159, 67108864
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %compat_do_readv_writev.exit

; <label>:162                                     ; preds = %150
  %163 = getelementptr inbounds %struct.file* %6, i64 0, i32 1, i32 1
  %164 = load %struct.dentry** %163, align 8
  %165 = call i32 @__fsnotify_parent(%struct.path* %151, %struct.dentry* %164, i32 %..i.i) #6
  %166 = bitcast %struct.path* %151 to i8*
  %167 = call i32 @fsnotify(%struct.inode* %153, i32 %..i.i, i8* %166, i32 1, i8* null, i32 0) #6
  br label %compat_do_readv_writev.exit

compat_do_readv_writev.exit:                      ; preds = %162, %150, %147
  call void @llvm.lifetime.end(i64 128, i8* %21) #4
  %168 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %168) #4
  %169 = icmp sgt i64 %ret.1.i, 0
  br i1 %169, label %170, label %compat_readv.exit.i

; <label>:170                                     ; preds = %compat_do_readv_writev.exit
  %171 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %172 = getelementptr inbounds %struct.task_struct* %171, i64 0, i32 113, i32 0
  %173 = load i64* %172, align 8
  %174 = add i64 %173, %ret.1.i
  store i64 %174, i64* %172, align 8
  br label %compat_readv.exit.i

compat_readv.exit.i:                              ; preds = %170, %compat_do_readv_writev.exit, %16, %8
  %ret.01.i.i = phi i64 [ %ret.1.i, %170 ], [ %ret.1.i, %compat_do_readv_writev.exit ], [ -22, %16 ], [ -9, %8 ]
  %175 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %176 = getelementptr inbounds %struct.task_struct* %175, i64 0, i32 113, i32 2
  %177 = load i64* %176, align 8
  %178 = add i64 %177, 1
  store i64 %178, i64* %176, align 8
  %179 = icmp sgt i64 %ret.01.i.i, -1
  br i1 %179, label %180, label %182

; <label>:180                                     ; preds = %compat_readv.exit.i
  %181 = load i64* %pos.i, align 8
  store i64 %181, i64* %9, align 8
  br label %182

; <label>:182                                     ; preds = %180, %compat_readv.exit.i
  %183 = and i32 %v.tr.i.i.i, 2
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %187, label %185

; <label>:185                                     ; preds = %182
  %186 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %186) #6
  br label %187

; <label>:187                                     ; preds = %185, %182
  %188 = and i32 %v.tr.i.i.i, 1
  %189 = icmp eq i32 %188, 0
  br i1 %189, label %C_SYSC_readv.exit, label %190

; <label>:190                                     ; preds = %187
  call void @fput(%struct.file* %6) #6
  br label %C_SYSC_readv.exit

C_SYSC_readv.exit:                                ; preds = %190, %187, %0
  %.0.i = phi i64 [ -9, %0 ], [ %ret.01.i.i, %187 ], [ %ret.01.i.i, %190 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_preadv64(i64 %fd, i64 %vec, i64 %vlen, i64 %pos) #0 {
  %.sroa.3.i.i1.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i.i = alloca %struct.kiocb, align 8
  %iter.i.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i.i = alloca [8 x %struct.iovec], align 16
  %iov.i.i = alloca %struct.iovec*, align 8
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  store i64 %pos, i64* %1, align 8
  %4 = icmp slt i64 %pos, 0
  br i1 %4, label %__compat_sys_preadv64.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = trunc i64 %fd to i32
  %7 = call i64 @__fdget(i32 %6) #6
  %8 = and i64 %7, -4
  %9 = inttoptr i64 %8 to %struct.file*
  %10 = icmp eq i64 %8, 0
  br i1 %10, label %__compat_sys_preadv64.exit, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %182, label %16

; <label>:16                                      ; preds = %11
  %17 = and i32 %13, 1
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %compat_readv.exit.i, label %19

; <label>:19                                      ; preds = %16
  %20 = and i32 %13, 131072
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %compat_readv.exit.i, label %22

; <label>:22                                      ; preds = %19
  %23 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %23) #4
  %24 = bitcast [8 x %struct.iovec]* %iovstack.i.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %24) #4
  %25 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i.i, i64 0, i64 0
  store %struct.iovec* %25, %struct.iovec** %iov.i.i, align 8
  %26 = call i64 @compat_rw_copy_check_uvector(i32 0, %struct.compat_iovec* %2, i64 %vlen, i64 8, %struct.iovec* %25, %struct.iovec** %iov.i.i) #6
  %27 = icmp slt i64 %26, 1
  br i1 %27, label %file_end_write.exit.i.i, label %28

; <label>:28                                      ; preds = %22
  %sext.i.i = shl i64 %26, 32
  %29 = ashr exact i64 %sext.i.i, 32
  %30 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %31 = load %struct.inode** %30, align 8
  %32 = icmp slt i64 %29, 0
  br i1 %32, label %rw_verify_area.exit.i.i, label %33, !prof !4

; <label>:33                                      ; preds = %28
  %34 = load i64* %1, align 8
  %35 = icmp slt i64 %34, 0
  br i1 %35, label %36, label %44, !prof !4

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %38 = load i32* %37, align 4
  %39 = and i32 %38, 8192
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %rw_verify_area.exit.i.i, label %41

; <label>:41                                      ; preds = %36
  %42 = sub i64 0, %34
  %43 = icmp ult i64 %29, %42
  br i1 %43, label %52, label %rw_verify_area.exit.i.i

; <label>:44                                      ; preds = %33
  %45 = add i64 %34, %29
  %46 = icmp slt i64 %45, 0
  br i1 %46, label %47, label %52, !prof !4

; <label>:47                                      ; preds = %44
  %48 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %49 = load i32* %48, align 4
  %50 = and i32 %49, 8192
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %rw_verify_area.exit.i.i, label %52

; <label>:52                                      ; preds = %47, %44, %41
  %53 = getelementptr inbounds %struct.inode* %31, i64 0, i32 35
  %54 = load %struct.file_lock** %53, align 8
  %55 = icmp eq %struct.file_lock* %54, null
  br i1 %55, label %.critedge.i.i.i, label %56

; <label>:56                                      ; preds = %52
  %57 = getelementptr inbounds %struct.inode* %31, i64 0, i32 8
  %58 = load %struct.super_block** %57, align 8
  %59 = getelementptr inbounds %struct.super_block* %58, i64 0, i32 10
  %60 = load i64* %59, align 8
  %61 = and i64 %60, 64
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %.critedge.i.i.i, label %mandatory_lock.exit.i.i.i

mandatory_lock.exit.i.i.i:                        ; preds = %56
  %63 = getelementptr inbounds %struct.inode* %31, i64 0, i32 0
  %64 = load i16* %63, align 2
  %65 = and i16 %64, 1032
  %66 = icmp eq i16 %65, 1024
  br i1 %66, label %67, label %.critedge.i.i.i, !prof !4

; <label>:67                                      ; preds = %mandatory_lock.exit.i.i.i
  %68 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %31, %struct.file* %9, i64 %34, i64 %29) #6
  %69 = icmp slt i32 %68, 0
  br i1 %69, label %rw_verify_area.exit.i.i, label %.critedge.i.i.i

.critedge.i.i.i:                                  ; preds = %67, %mandatory_lock.exit.i.i.i, %56, %52
  %70 = call i32 @security_file_permission(%struct.file* %9, i32 4) #6
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %rw_verify_area.exit.i.i

; <label>:72                                      ; preds = %.critedge.i.i.i
  %73 = icmp ugt i64 %29, 2147479552
  %74 = trunc i64 %29 to i32
  %75 = select i1 %73, i32 2147479552, i32 %74
  br label %rw_verify_area.exit.i.i

rw_verify_area.exit.i.i:                          ; preds = %72, %.critedge.i.i.i, %67, %47, %41, %36, %28
  %.0.i1.i.i = phi i32 [ %75, %72 ], [ -22, %28 ], [ -22, %36 ], [ -75, %41 ], [ -22, %47 ], [ %68, %67 ], [ %70, %.critedge.i.i.i ]
  %76 = sext i32 %.0.i1.i.i to i64
  %77 = icmp slt i32 %.0.i1.i.i, 0
  br i1 %77, label %file_end_write.exit.i.i, label %78

; <label>:78                                      ; preds = %rw_verify_area.exit.i.i
  %79 = getelementptr inbounds %struct.file* %9, i64 0, i32 3
  %80 = load %struct.file_operations** %79, align 8
  %81 = getelementptr inbounds %struct.file_operations* %80, i64 0, i32 2
  %82 = load i64 (%struct.file*, i8*, i64, i64*)** %81, align 8
  %83 = getelementptr inbounds %struct.file_operations* %80, i64 0, i32 4
  %84 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %83, align 8
  %85 = getelementptr inbounds %struct.file_operations* %80, i64 0, i32 6
  %86 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %85, align 8
  %87 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %86, null
  br i1 %87, label %109, label %88

; <label>:88                                      ; preds = %78
  %89 = load %struct.iovec** %iov.i.i, align 8
  %90 = bitcast %struct.kiocb* %kiocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %90) #4
  %91 = bitcast %struct.iov_iter* %iter.i.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %91) #4
  %92 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %92) #4
  %93 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %93) #4
  call void @llvm.memset.p0i8.i64(i8* %92, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %93, i8 0, i64 48, i32 8, i1 false) #4
  %94 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %95 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %95, align 8
  %96 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 1
  %97 = bitcast %struct.kioctx** %96 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %97, i8* %92, i64 24, i32 8, i1 false) #4
  %98 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i.i = bitcast %struct.task_struct* %94 to i8*
  store i8* %.c.i.i.i.i, i8** %98, align 8
  %99 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 5
  %100 = bitcast i64* %99 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %100, i8* %93, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %92) #4
  call void @llvm.lifetime.end(i64 48, i8* %93) #4
  %101 = load i64* %1, align 8
  %102 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 6
  store i64 %101, i64* %102, align 8
  %103 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 7
  store i64 %29, i64* %103, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i.i, i32 0, %struct.iovec* %89, i64 %vlen, i64 %29) #6
  %104 = call i64 %86(%struct.kiocb* %kiocb.i.i.i, %struct.iov_iter* %iter.i.i.i) #6
  %105 = icmp eq i64 %104, -529
  br i1 %105, label %106, label %do_iter_readv_writev.exit.i.i

; <label>:106                                     ; preds = %88
  %107 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i.i) #6
  br label %do_iter_readv_writev.exit.i.i

do_iter_readv_writev.exit.i.i:                    ; preds = %106, %88
  %ret.0.i.i.i = phi i64 [ %107, %106 ], [ %104, %88 ]
  %108 = load i64* %102, align 8
  store i64 %108, i64* %1, align 8
  call void @llvm.lifetime.end(i64 40, i8* %91) #4
  call void @llvm.lifetime.end(i64 88, i8* %90) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:109                                     ; preds = %78
  %110 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %84, null
  %111 = load %struct.iovec** %iov.i.i, align 8
  br i1 %110, label %131, label %112

; <label>:112                                     ; preds = %109
  %113 = bitcast %struct.kiocb* %kiocb.i3.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %113) #4
  %114 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %114) #4
  %115 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %115) #4
  call void @llvm.memset.p0i8.i64(i8* %114, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %115, i8 0, i64 48, i32 8, i1 false) #4
  %116 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %117 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %117, align 8
  %118 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 1
  %119 = bitcast %struct.kioctx** %118 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %119, i8* %114, i64 24, i32 8, i1 false) #4
  %120 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 4, i32 0
  %.c.i.i4.i.i = bitcast %struct.task_struct* %116 to i8*
  store i8* %.c.i.i4.i.i, i8** %120, align 8
  %121 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 5
  %122 = bitcast i64* %121 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %115, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %114) #4
  call void @llvm.lifetime.end(i64 48, i8* %115) #4
  %123 = load i64* %1, align 8
  %124 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 6
  store i64 %123, i64* %124, align 8
  %125 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 7
  store i64 %29, i64* %125, align 8
  %126 = call i64 %84(%struct.kiocb* %kiocb.i3.i.i, %struct.iovec* %111, i64 %vlen, i64 %123) #6
  %127 = icmp eq i64 %126, -529
  br i1 %127, label %128, label %do_sync_readv_writev.exit.i.i

; <label>:128                                     ; preds = %112
  %129 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i.i) #6
  br label %do_sync_readv_writev.exit.i.i

do_sync_readv_writev.exit.i.i:                    ; preds = %128, %112
  %ret.0.i5.i.i = phi i64 [ %129, %128 ], [ %126, %112 ]
  %130 = load i64* %124, align 8
  store i64 %130, i64* %1, align 8
  call void @llvm.lifetime.end(i64 88, i8* %113) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:131                                     ; preds = %109
  %.old1.i.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i.i, label %do_loop_readv_writev.exit.i.i, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %141, %131
  %ret.0.i6.i.i = phi i64 [ %143, %141 ], [ 0, %131 ]
  %vector.0.i.i.i = phi %struct.iovec* [ %142, %141 ], [ %111, %131 ]
  %.0.i.i.i = phi i64 [ %136, %141 ], [ %vlen, %131 ]
  %132 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 0
  %133 = load i8** %132, align 8
  %134 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 1
  %135 = load i64* %134, align 8
  %136 = add i64 %.0.i.i.i, -1
  %137 = call i64 %82(%struct.file* %9, i8* %133, i64 %135, i64* %1) #6
  %138 = icmp slt i64 %137, 0
  br i1 %138, label %139, label %141

; <label>:139                                     ; preds = %.preheader.i.i.i
  %140 = icmp eq i64 %ret.0.i6.i.i, 0
  %.ret.0.i.i.i = select i1 %140, i64 %137, i64 %ret.0.i6.i.i
  br label %do_loop_readv_writev.exit.i.i

; <label>:141                                     ; preds = %.preheader.i.i.i
  %142 = getelementptr %struct.iovec* %vector.0.i.i.i, i64 1
  %143 = add i64 %137, %ret.0.i6.i.i
  %144 = icmp eq i64 %137, %135
  %145 = icmp ne i64 %136, 0
  %or.cond.i.i.i = and i1 %144, %145
  br i1 %or.cond.i.i.i, label %.preheader.i.i.i, label %do_loop_readv_writev.exit.i.i

do_loop_readv_writev.exit.i.i:                    ; preds = %141, %139, %131, %do_sync_readv_writev.exit.i.i, %do_iter_readv_writev.exit.i.i
  %ret.0.i.i = phi i64 [ %ret.0.i.i.i, %do_iter_readv_writev.exit.i.i ], [ %ret.0.i5.i.i, %do_sync_readv_writev.exit.i.i ], [ %.ret.0.i.i.i, %139 ], [ 0, %131 ], [ %143, %141 ]
  br label %file_end_write.exit.i.i

file_end_write.exit.i.i:                          ; preds = %do_loop_readv_writev.exit.i.i, %rw_verify_area.exit.i.i, %22
  %ret.1.i.i = phi i64 [ %26, %22 ], [ %76, %rw_verify_area.exit.i.i ], [ %ret.0.i.i, %do_loop_readv_writev.exit.i.i ]
  %146 = load %struct.iovec** %iov.i.i, align 8
  %147 = icmp eq %struct.iovec* %146, %25
  br i1 %147, label %150, label %148

; <label>:148                                     ; preds = %file_end_write.exit.i.i
  %149 = bitcast %struct.iovec* %146 to i8*
  call void @kfree(i8* %149) #6
  br label %150

; <label>:150                                     ; preds = %148, %file_end_write.exit.i.i
  %151 = add i64 %ret.1.i.i, 1
  %152 = icmp sgt i64 %151, 0
  br i1 %152, label %153, label %compat_do_readv_writev.exit.i

; <label>:153                                     ; preds = %150
  %154 = getelementptr inbounds %struct.file* %9, i64 0, i32 1
  %155 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %156 = load %struct.inode** %155, align 8
  %157 = getelementptr inbounds %struct.inode* %156, i64 0, i32 0
  %158 = load i16* %157, align 2
  %159 = and i16 %158, -4096
  %160 = icmp eq i16 %159, 16384
  %..i.i.i = select i1 %160, i32 1073741825, i32 1
  %161 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %162 = load i32* %161, align 4
  %163 = and i32 %162, 67108864
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %compat_do_readv_writev.exit.i

; <label>:165                                     ; preds = %153
  %166 = getelementptr inbounds %struct.file* %9, i64 0, i32 1, i32 1
  %167 = load %struct.dentry** %166, align 8
  %168 = call i32 @__fsnotify_parent(%struct.path* %154, %struct.dentry* %167, i32 %..i.i.i) #6
  %169 = bitcast %struct.path* %154 to i8*
  %170 = call i32 @fsnotify(%struct.inode* %156, i32 %..i.i.i, i8* %169, i32 1, i8* null, i32 0) #6
  br label %compat_do_readv_writev.exit.i

compat_do_readv_writev.exit.i:                    ; preds = %165, %153, %150
  call void @llvm.lifetime.end(i64 128, i8* %24) #4
  %171 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %171) #4
  %172 = icmp sgt i64 %ret.1.i.i, 0
  br i1 %172, label %173, label %compat_readv.exit.i

; <label>:173                                     ; preds = %compat_do_readv_writev.exit.i
  %174 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %175 = getelementptr inbounds %struct.task_struct* %174, i64 0, i32 113, i32 0
  %176 = load i64* %175, align 8
  %177 = add i64 %176, %ret.1.i.i
  store i64 %177, i64* %175, align 8
  br label %compat_readv.exit.i

compat_readv.exit.i:                              ; preds = %173, %compat_do_readv_writev.exit.i, %19, %16
  %ret.01.i.i = phi i64 [ %ret.1.i.i, %173 ], [ %ret.1.i.i, %compat_do_readv_writev.exit.i ], [ -22, %19 ], [ -9, %16 ]
  %178 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %179 = getelementptr inbounds %struct.task_struct* %178, i64 0, i32 113, i32 2
  %180 = load i64* %179, align 8
  %181 = add i64 %180, 1
  store i64 %181, i64* %179, align 8
  br label %182

; <label>:182                                     ; preds = %compat_readv.exit.i, %11
  %ret.0.i = phi i64 [ %ret.01.i.i, %compat_readv.exit.i ], [ -29, %11 ]
  %183 = and i64 %7, 1
  %184 = icmp eq i64 %183, 0
  br i1 %184, label %__compat_sys_preadv64.exit, label %185

; <label>:185                                     ; preds = %182
  call void @fput(%struct.file* %9) #6
  br label %__compat_sys_preadv64.exit

__compat_sys_preadv64.exit:                       ; preds = %185, %182, %5, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %5 ], [ %ret.0.i, %182 ], [ %ret.0.i, %185 ]
  %186 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %186) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_preadv(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_low, i64 %pos_high) #0 {
  %.sroa.3.i.i1.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i.i = alloca %struct.kiocb, align 8
  %iter.i.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i.i = alloca [8 x %struct.iovec], align 16
  %iov.i.i = alloca %struct.iovec*, align 8
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = shl i64 %pos_high, 32
  %4 = and i64 %pos_low, 4294967295
  %5 = or i64 %3, %4
  %6 = and i64 %fd, 4294967295
  %7 = and i64 %vlen, 4294967295
  %8 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %8) #4
  store i64 %5, i64* %1, align 8
  %9 = icmp slt i64 %5, 0
  br i1 %9, label %__compat_sys_preadv64.exit, label %10

; <label>:10                                      ; preds = %0
  %11 = trunc i64 %6 to i32
  %12 = call i64 @__fdget(i32 %11) #6
  %13 = and i64 %12, -4
  %14 = inttoptr i64 %13 to %struct.file*
  %15 = icmp eq i64 %13, 0
  br i1 %15, label %__compat_sys_preadv64.exit, label %16

; <label>:16                                      ; preds = %10
  %17 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 8
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %187, label %21

; <label>:21                                      ; preds = %16
  %22 = and i32 %18, 1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %compat_readv.exit.i, label %24

; <label>:24                                      ; preds = %21
  %25 = and i32 %18, 131072
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %compat_readv.exit.i, label %27

; <label>:27                                      ; preds = %24
  %28 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %28) #4
  %29 = bitcast [8 x %struct.iovec]* %iovstack.i.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %29) #4
  %30 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i.i, i64 0, i64 0
  store %struct.iovec* %30, %struct.iovec** %iov.i.i, align 8
  %31 = call i64 @compat_rw_copy_check_uvector(i32 0, %struct.compat_iovec* %2, i64 %7, i64 8, %struct.iovec* %30, %struct.iovec** %iov.i.i) #6
  %32 = icmp slt i64 %31, 1
  br i1 %32, label %file_end_write.exit.i.i, label %33

; <label>:33                                      ; preds = %27
  %sext.i.i = shl i64 %31, 32
  %34 = ashr exact i64 %sext.i.i, 32
  %35 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %36 = load %struct.inode** %35, align 8
  %37 = icmp slt i64 %34, 0
  br i1 %37, label %rw_verify_area.exit.i.i, label %38, !prof !4

; <label>:38                                      ; preds = %33
  %39 = load i64* %1, align 8
  %40 = icmp slt i64 %39, 0
  br i1 %40, label %41, label %49, !prof !4

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %43 = load i32* %42, align 4
  %44 = and i32 %43, 8192
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %rw_verify_area.exit.i.i, label %46

; <label>:46                                      ; preds = %41
  %47 = sub i64 0, %39
  %48 = icmp ult i64 %34, %47
  br i1 %48, label %57, label %rw_verify_area.exit.i.i

; <label>:49                                      ; preds = %38
  %50 = add i64 %39, %34
  %51 = icmp slt i64 %50, 0
  br i1 %51, label %52, label %57, !prof !4

; <label>:52                                      ; preds = %49
  %53 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %54 = load i32* %53, align 4
  %55 = and i32 %54, 8192
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %rw_verify_area.exit.i.i, label %57

; <label>:57                                      ; preds = %52, %49, %46
  %58 = getelementptr inbounds %struct.inode* %36, i64 0, i32 35
  %59 = load %struct.file_lock** %58, align 8
  %60 = icmp eq %struct.file_lock* %59, null
  br i1 %60, label %.critedge.i.i.i, label %61

; <label>:61                                      ; preds = %57
  %62 = getelementptr inbounds %struct.inode* %36, i64 0, i32 8
  %63 = load %struct.super_block** %62, align 8
  %64 = getelementptr inbounds %struct.super_block* %63, i64 0, i32 10
  %65 = load i64* %64, align 8
  %66 = and i64 %65, 64
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %.critedge.i.i.i, label %mandatory_lock.exit.i.i.i

mandatory_lock.exit.i.i.i:                        ; preds = %61
  %68 = getelementptr inbounds %struct.inode* %36, i64 0, i32 0
  %69 = load i16* %68, align 2
  %70 = and i16 %69, 1032
  %71 = icmp eq i16 %70, 1024
  br i1 %71, label %72, label %.critedge.i.i.i, !prof !4

; <label>:72                                      ; preds = %mandatory_lock.exit.i.i.i
  %73 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %36, %struct.file* %14, i64 %39, i64 %34) #6
  %74 = icmp slt i32 %73, 0
  br i1 %74, label %rw_verify_area.exit.i.i, label %.critedge.i.i.i

.critedge.i.i.i:                                  ; preds = %72, %mandatory_lock.exit.i.i.i, %61, %57
  %75 = call i32 @security_file_permission(%struct.file* %14, i32 4) #6
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %rw_verify_area.exit.i.i

; <label>:77                                      ; preds = %.critedge.i.i.i
  %78 = icmp ugt i64 %34, 2147479552
  %79 = trunc i64 %34 to i32
  %80 = select i1 %78, i32 2147479552, i32 %79
  br label %rw_verify_area.exit.i.i

rw_verify_area.exit.i.i:                          ; preds = %77, %.critedge.i.i.i, %72, %52, %46, %41, %33
  %.0.i1.i.i = phi i32 [ %80, %77 ], [ -22, %33 ], [ -22, %41 ], [ -75, %46 ], [ -22, %52 ], [ %73, %72 ], [ %75, %.critedge.i.i.i ]
  %81 = sext i32 %.0.i1.i.i to i64
  %82 = icmp slt i32 %.0.i1.i.i, 0
  br i1 %82, label %file_end_write.exit.i.i, label %83

; <label>:83                                      ; preds = %rw_verify_area.exit.i.i
  %84 = getelementptr inbounds %struct.file* %14, i64 0, i32 3
  %85 = load %struct.file_operations** %84, align 8
  %86 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 2
  %87 = load i64 (%struct.file*, i8*, i64, i64*)** %86, align 8
  %88 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 4
  %89 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %88, align 8
  %90 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 6
  %91 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %90, align 8
  %92 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %91, null
  br i1 %92, label %114, label %93

; <label>:93                                      ; preds = %83
  %94 = load %struct.iovec** %iov.i.i, align 8
  %95 = bitcast %struct.kiocb* %kiocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %95) #4
  %96 = bitcast %struct.iov_iter* %iter.i.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %96) #4
  %97 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %97) #4
  %98 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %98) #4
  call void @llvm.memset.p0i8.i64(i8* %97, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %98, i8 0, i64 48, i32 8, i1 false) #4
  %99 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %100 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 0
  store %struct.file* %14, %struct.file** %100, align 8
  %101 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 1
  %102 = bitcast %struct.kioctx** %101 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %102, i8* %97, i64 24, i32 8, i1 false) #4
  %103 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i.i = bitcast %struct.task_struct* %99 to i8*
  store i8* %.c.i.i.i.i, i8** %103, align 8
  %104 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 5
  %105 = bitcast i64* %104 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %105, i8* %98, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %97) #4
  call void @llvm.lifetime.end(i64 48, i8* %98) #4
  %106 = load i64* %1, align 8
  %107 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 6
  store i64 %106, i64* %107, align 8
  %108 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 7
  store i64 %34, i64* %108, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i.i, i32 0, %struct.iovec* %94, i64 %7, i64 %34) #6
  %109 = call i64 %91(%struct.kiocb* %kiocb.i.i.i, %struct.iov_iter* %iter.i.i.i) #6
  %110 = icmp eq i64 %109, -529
  br i1 %110, label %111, label %do_iter_readv_writev.exit.i.i

; <label>:111                                     ; preds = %93
  %112 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i.i) #6
  br label %do_iter_readv_writev.exit.i.i

do_iter_readv_writev.exit.i.i:                    ; preds = %111, %93
  %ret.0.i.i.i = phi i64 [ %112, %111 ], [ %109, %93 ]
  %113 = load i64* %107, align 8
  store i64 %113, i64* %1, align 8
  call void @llvm.lifetime.end(i64 40, i8* %96) #4
  call void @llvm.lifetime.end(i64 88, i8* %95) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:114                                     ; preds = %83
  %115 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %89, null
  %116 = load %struct.iovec** %iov.i.i, align 8
  br i1 %115, label %136, label %117

; <label>:117                                     ; preds = %114
  %118 = bitcast %struct.kiocb* %kiocb.i3.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %118) #4
  %119 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %119) #4
  %120 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %120) #4
  call void @llvm.memset.p0i8.i64(i8* %119, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %120, i8 0, i64 48, i32 8, i1 false) #4
  %121 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %122 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 0
  store %struct.file* %14, %struct.file** %122, align 8
  %123 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 1
  %124 = bitcast %struct.kioctx** %123 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %124, i8* %119, i64 24, i32 8, i1 false) #4
  %125 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 4, i32 0
  %.c.i.i4.i.i = bitcast %struct.task_struct* %121 to i8*
  store i8* %.c.i.i4.i.i, i8** %125, align 8
  %126 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 5
  %127 = bitcast i64* %126 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %127, i8* %120, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %119) #4
  call void @llvm.lifetime.end(i64 48, i8* %120) #4
  %128 = load i64* %1, align 8
  %129 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 6
  store i64 %128, i64* %129, align 8
  %130 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 7
  store i64 %34, i64* %130, align 8
  %131 = call i64 %89(%struct.kiocb* %kiocb.i3.i.i, %struct.iovec* %116, i64 %7, i64 %128) #6
  %132 = icmp eq i64 %131, -529
  br i1 %132, label %133, label %do_sync_readv_writev.exit.i.i

; <label>:133                                     ; preds = %117
  %134 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i.i) #6
  br label %do_sync_readv_writev.exit.i.i

do_sync_readv_writev.exit.i.i:                    ; preds = %133, %117
  %ret.0.i5.i.i = phi i64 [ %134, %133 ], [ %131, %117 ]
  %135 = load i64* %129, align 8
  store i64 %135, i64* %1, align 8
  call void @llvm.lifetime.end(i64 88, i8* %118) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:136                                     ; preds = %114
  %.old1.i.i.i = icmp eq i64 %7, 0
  br i1 %.old1.i.i.i, label %do_loop_readv_writev.exit.i.i, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %146, %136
  %ret.0.i6.i.i = phi i64 [ %148, %146 ], [ 0, %136 ]
  %vector.0.i.i.i = phi %struct.iovec* [ %147, %146 ], [ %116, %136 ]
  %.0.i.i.i = phi i64 [ %141, %146 ], [ %7, %136 ]
  %137 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 0
  %138 = load i8** %137, align 8
  %139 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 1
  %140 = load i64* %139, align 8
  %141 = add i64 %.0.i.i.i, -1
  %142 = call i64 %87(%struct.file* %14, i8* %138, i64 %140, i64* %1) #6
  %143 = icmp slt i64 %142, 0
  br i1 %143, label %144, label %146

; <label>:144                                     ; preds = %.preheader.i.i.i
  %145 = icmp eq i64 %ret.0.i6.i.i, 0
  %.ret.0.i.i.i = select i1 %145, i64 %142, i64 %ret.0.i6.i.i
  br label %do_loop_readv_writev.exit.i.i

; <label>:146                                     ; preds = %.preheader.i.i.i
  %147 = getelementptr %struct.iovec* %vector.0.i.i.i, i64 1
  %148 = add i64 %142, %ret.0.i6.i.i
  %149 = icmp eq i64 %142, %140
  %150 = icmp ne i64 %141, 0
  %or.cond.i.i.i = and i1 %149, %150
  br i1 %or.cond.i.i.i, label %.preheader.i.i.i, label %do_loop_readv_writev.exit.i.i

do_loop_readv_writev.exit.i.i:                    ; preds = %146, %144, %136, %do_sync_readv_writev.exit.i.i, %do_iter_readv_writev.exit.i.i
  %ret.0.i.i = phi i64 [ %ret.0.i.i.i, %do_iter_readv_writev.exit.i.i ], [ %ret.0.i5.i.i, %do_sync_readv_writev.exit.i.i ], [ %.ret.0.i.i.i, %144 ], [ 0, %136 ], [ %148, %146 ]
  br label %file_end_write.exit.i.i

file_end_write.exit.i.i:                          ; preds = %do_loop_readv_writev.exit.i.i, %rw_verify_area.exit.i.i, %27
  %ret.1.i.i = phi i64 [ %31, %27 ], [ %81, %rw_verify_area.exit.i.i ], [ %ret.0.i.i, %do_loop_readv_writev.exit.i.i ]
  %151 = load %struct.iovec** %iov.i.i, align 8
  %152 = icmp eq %struct.iovec* %151, %30
  br i1 %152, label %155, label %153

; <label>:153                                     ; preds = %file_end_write.exit.i.i
  %154 = bitcast %struct.iovec* %151 to i8*
  call void @kfree(i8* %154) #6
  br label %155

; <label>:155                                     ; preds = %153, %file_end_write.exit.i.i
  %156 = add i64 %ret.1.i.i, 1
  %157 = icmp sgt i64 %156, 0
  br i1 %157, label %158, label %compat_do_readv_writev.exit.i

; <label>:158                                     ; preds = %155
  %159 = getelementptr inbounds %struct.file* %14, i64 0, i32 1
  %160 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %161 = load %struct.inode** %160, align 8
  %162 = getelementptr inbounds %struct.inode* %161, i64 0, i32 0
  %163 = load i16* %162, align 2
  %164 = and i16 %163, -4096
  %165 = icmp eq i16 %164, 16384
  %..i.i.i = select i1 %165, i32 1073741825, i32 1
  %166 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %167 = load i32* %166, align 4
  %168 = and i32 %167, 67108864
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %compat_do_readv_writev.exit.i

; <label>:170                                     ; preds = %158
  %171 = getelementptr inbounds %struct.file* %14, i64 0, i32 1, i32 1
  %172 = load %struct.dentry** %171, align 8
  %173 = call i32 @__fsnotify_parent(%struct.path* %159, %struct.dentry* %172, i32 %..i.i.i) #6
  %174 = bitcast %struct.path* %159 to i8*
  %175 = call i32 @fsnotify(%struct.inode* %161, i32 %..i.i.i, i8* %174, i32 1, i8* null, i32 0) #6
  br label %compat_do_readv_writev.exit.i

compat_do_readv_writev.exit.i:                    ; preds = %170, %158, %155
  call void @llvm.lifetime.end(i64 128, i8* %29) #4
  %176 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %176) #4
  %177 = icmp sgt i64 %ret.1.i.i, 0
  br i1 %177, label %178, label %compat_readv.exit.i

; <label>:178                                     ; preds = %compat_do_readv_writev.exit.i
  %179 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %180 = getelementptr inbounds %struct.task_struct* %179, i64 0, i32 113, i32 0
  %181 = load i64* %180, align 8
  %182 = add i64 %181, %ret.1.i.i
  store i64 %182, i64* %180, align 8
  br label %compat_readv.exit.i

compat_readv.exit.i:                              ; preds = %178, %compat_do_readv_writev.exit.i, %24, %21
  %ret.01.i.i = phi i64 [ %ret.1.i.i, %178 ], [ %ret.1.i.i, %compat_do_readv_writev.exit.i ], [ -22, %24 ], [ -9, %21 ]
  %183 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %184 = getelementptr inbounds %struct.task_struct* %183, i64 0, i32 113, i32 2
  %185 = load i64* %184, align 8
  %186 = add i64 %185, 1
  store i64 %186, i64* %184, align 8
  br label %187

; <label>:187                                     ; preds = %compat_readv.exit.i, %16
  %ret.0.i = phi i64 [ %ret.01.i.i, %compat_readv.exit.i ], [ -29, %16 ]
  %188 = and i64 %12, 1
  %189 = icmp eq i64 %188, 0
  br i1 %189, label %__compat_sys_preadv64.exit, label %190

; <label>:190                                     ; preds = %187
  call void @fput(%struct.file* %14) #6
  br label %__compat_sys_preadv64.exit

__compat_sys_preadv64.exit:                       ; preds = %190, %187, %10, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %10 ], [ %ret.0.i, %187 ], [ %ret.0.i, %190 ]
  %191 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %191) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_writev(i64 %fd, i64 %vec, i64 %vlen) #0 {
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 8
  %iter.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i = alloca [8 x %struct.iovec], align 16
  %iov.i = alloca %struct.iovec*, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %fd to i32
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  %4 = call i64 @__fdget_pos(i32 %1) #6
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
  %20 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %20) #4
  %21 = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %21) #4
  %22 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i64 0, i64 0
  store %struct.iovec* %22, %struct.iovec** %iov.i, align 8
  %23 = call i64 @compat_rw_copy_check_uvector(i32 1, %struct.compat_iovec* %2, i64 %11, i64 8, %struct.iovec* %22, %struct.iovec** %iov.i) #6
  %24 = icmp slt i64 %23, 1
  br i1 %24, label %file_end_write.exit.i, label %25

; <label>:25                                      ; preds = %19
  %sext.i = shl i64 %23, 32
  %26 = ashr exact i64 %sext.i, 32
  %27 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %28 = load %struct.inode** %27, align 8
  %29 = icmp slt i64 %26, 0
  br i1 %29, label %rw_verify_area.exit.i, label %30, !prof !4

; <label>:30                                      ; preds = %25
  %31 = load i64* %pos.i, align 8
  %32 = icmp slt i64 %31, 0
  br i1 %32, label %33, label %41, !prof !4

; <label>:33                                      ; preds = %30
  %34 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %35 = load i32* %34, align 4
  %36 = and i32 %35, 8192
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %rw_verify_area.exit.i, label %38

; <label>:38                                      ; preds = %33
  %39 = sub i64 0, %31
  %40 = icmp ult i64 %26, %39
  br i1 %40, label %49, label %rw_verify_area.exit.i

; <label>:41                                      ; preds = %30
  %42 = add i64 %31, %26
  %43 = icmp slt i64 %42, 0
  br i1 %43, label %44, label %49, !prof !4

; <label>:44                                      ; preds = %41
  %45 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %46 = load i32* %45, align 4
  %47 = and i32 %46, 8192
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %rw_verify_area.exit.i, label %49

; <label>:49                                      ; preds = %44, %41, %38
  %50 = getelementptr inbounds %struct.inode* %28, i64 0, i32 35
  %51 = load %struct.file_lock** %50, align 8
  %52 = icmp eq %struct.file_lock* %51, null
  br i1 %52, label %.critedge.i.i, label %53

; <label>:53                                      ; preds = %49
  %54 = getelementptr inbounds %struct.inode* %28, i64 0, i32 8
  %55 = load %struct.super_block** %54, align 8
  %56 = getelementptr inbounds %struct.super_block* %55, i64 0, i32 10
  %57 = load i64* %56, align 8
  %58 = and i64 %57, 64
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %53
  %60 = getelementptr inbounds %struct.inode* %28, i64 0, i32 0
  %61 = load i16* %60, align 2
  %62 = and i16 %61, 1032
  %63 = icmp eq i16 %62, 1024
  br i1 %63, label %64, label %.critedge.i.i, !prof !4

; <label>:64                                      ; preds = %mandatory_lock.exit.i.i
  %65 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %28, %struct.file* %6, i64 %31, i64 %26) #6
  %66 = icmp slt i32 %65, 0
  br i1 %66, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %64, %mandatory_lock.exit.i.i, %53, %49
  %67 = call i32 @security_file_permission(%struct.file* %6, i32 2) #6
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %rw_verify_area.exit.i

; <label>:69                                      ; preds = %.critedge.i.i
  %70 = icmp ugt i64 %26, 2147479552
  %71 = trunc i64 %26 to i32
  %72 = select i1 %70, i32 2147479552, i32 %71
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %69, %.critedge.i.i, %64, %44, %38, %33, %25
  %.0.i1.i = phi i32 [ %72, %69 ], [ -22, %25 ], [ -22, %33 ], [ -75, %38 ], [ -22, %44 ], [ %65, %64 ], [ %67, %.critedge.i.i ]
  %73 = sext i32 %.0.i1.i to i64
  %74 = icmp slt i32 %.0.i1.i, 0
  br i1 %74, label %file_end_write.exit.i, label %75

; <label>:75                                      ; preds = %rw_verify_area.exit.i
  %76 = getelementptr inbounds %struct.file* %6, i64 0, i32 3
  %77 = load %struct.file_operations** %76, align 8
  %78 = getelementptr inbounds %struct.file_operations* %77, i64 0, i32 3
  %79 = load i64 (%struct.file*, i8*, i64, i64*)** %78, align 8
  %80 = getelementptr inbounds %struct.file_operations* %77, i64 0, i32 5
  %81 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %80, align 8
  %82 = getelementptr inbounds %struct.file_operations* %77, i64 0, i32 7
  %83 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %82, align 8
  %84 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %85 = load %struct.inode** %84, align 8
  %86 = getelementptr inbounds %struct.inode* %85, i64 0, i32 0
  %87 = load i16* %86, align 2
  %88 = and i16 %87, -4096
  %89 = icmp eq i16 %88, -32768
  br i1 %89, label %90, label %file_start_write.exit.i

; <label>:90                                      ; preds = %75
  %91 = getelementptr inbounds %struct.inode* %85, i64 0, i32 8
  %92 = load %struct.super_block** %91, align 8
  %93 = call i32 @__sb_start_write(%struct.super_block* %92, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %90, %75
  %94 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %83, null
  br i1 %94, label %116, label %95

; <label>:95                                      ; preds = %file_start_write.exit.i
  %96 = load %struct.iovec** %iov.i, align 8
  %97 = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %97) #4
  %98 = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %98) #4
  %99 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %99) #4
  %100 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %100) #4
  call void @llvm.memset.p0i8.i64(i8* %99, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %100, i8 0, i64 48, i32 8, i1 false) #4
  %101 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %102 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %102, align 8
  %103 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 1
  %104 = bitcast %struct.kioctx** %103 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %104, i8* %99, i64 24, i32 8, i1 false) #4
  %105 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %101 to i8*
  store i8* %.c.i.i.i, i8** %105, align 8
  %106 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 5
  %107 = bitcast i64* %106 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %107, i8* %100, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %99) #4
  call void @llvm.lifetime.end(i64 48, i8* %100) #4
  %108 = load i64* %pos.i, align 8
  %109 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 6
  store i64 %108, i64* %109, align 8
  %110 = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i64 0, i32 7
  store i64 %26, i64* %110, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i, i32 1, %struct.iovec* %96, i64 %11, i64 %26) #6
  %111 = call i64 %83(%struct.kiocb* %kiocb.i.i, %struct.iov_iter* %iter.i.i) #6
  %112 = icmp eq i64 %111, -529
  br i1 %112, label %113, label %do_iter_readv_writev.exit.i

; <label>:113                                     ; preds = %95
  %114 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i) #6
  br label %do_iter_readv_writev.exit.i

do_iter_readv_writev.exit.i:                      ; preds = %113, %95
  %ret.0.i.i = phi i64 [ %114, %113 ], [ %111, %95 ]
  %115 = load i64* %109, align 8
  store i64 %115, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 40, i8* %98) #4
  call void @llvm.lifetime.end(i64 88, i8* %97) #4
  br label %do_loop_readv_writev.exit.i

; <label>:116                                     ; preds = %file_start_write.exit.i
  %117 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %81, null
  %118 = load %struct.iovec** %iov.i, align 8
  br i1 %117, label %138, label %119

; <label>:119                                     ; preds = %116
  %120 = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %120) #4
  %121 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %121) #4
  %122 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %122) #4
  call void @llvm.memset.p0i8.i64(i8* %121, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %122, i8 0, i64 48, i32 8, i1 false) #4
  %123 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %124 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 0
  store %struct.file* %6, %struct.file** %124, align 8
  %125 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 1
  %126 = bitcast %struct.kioctx** %125 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %126, i8* %121, i64 24, i32 8, i1 false) #4
  %127 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %123 to i8*
  store i8* %.c.i.i4.i, i8** %127, align 8
  %128 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 5
  %129 = bitcast i64* %128 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %129, i8* %122, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %121) #4
  call void @llvm.lifetime.end(i64 48, i8* %122) #4
  %130 = load i64* %pos.i, align 8
  %131 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 6
  store i64 %130, i64* %131, align 8
  %132 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i64 0, i32 7
  store i64 %26, i64* %132, align 8
  %133 = call i64 %81(%struct.kiocb* %kiocb.i3.i, %struct.iovec* %118, i64 %11, i64 %130) #6
  %134 = icmp eq i64 %133, -529
  br i1 %134, label %135, label %do_sync_readv_writev.exit.i

; <label>:135                                     ; preds = %119
  %136 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i) #6
  br label %do_sync_readv_writev.exit.i

do_sync_readv_writev.exit.i:                      ; preds = %135, %119
  %ret.0.i5.i = phi i64 [ %136, %135 ], [ %133, %119 ]
  %137 = load i64* %131, align 8
  store i64 %137, i64* %pos.i, align 8
  call void @llvm.lifetime.end(i64 88, i8* %120) #4
  br label %do_loop_readv_writev.exit.i

; <label>:138                                     ; preds = %116
  %.old1.i.i = icmp eq i64 %11, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %148, %138
  %ret.0.i6.i = phi i64 [ %150, %148 ], [ 0, %138 ]
  %vector.0.i.i = phi %struct.iovec* [ %149, %148 ], [ %118, %138 ]
  %.0.i.i = phi i64 [ %143, %148 ], [ %11, %138 ]
  %139 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 0
  %140 = load i8** %139, align 8
  %141 = getelementptr inbounds %struct.iovec* %vector.0.i.i, i64 0, i32 1
  %142 = load i64* %141, align 8
  %143 = add i64 %.0.i.i, -1
  %144 = call i64 %79(%struct.file* %6, i8* %140, i64 %142, i64* %pos.i) #6
  %145 = icmp slt i64 %144, 0
  br i1 %145, label %146, label %148

; <label>:146                                     ; preds = %.preheader.i.i
  %147 = icmp eq i64 %ret.0.i6.i, 0
  %.ret.0.i.i = select i1 %147, i64 %144, i64 %ret.0.i6.i
  br label %do_loop_readv_writev.exit.i

; <label>:148                                     ; preds = %.preheader.i.i
  %149 = getelementptr %struct.iovec* %vector.0.i.i, i64 1
  %150 = add i64 %144, %ret.0.i6.i
  %151 = icmp eq i64 %144, %142
  %152 = icmp ne i64 %143, 0
  %or.cond.i.i = and i1 %151, %152
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %148, %146, %138, %do_sync_readv_writev.exit.i, %do_iter_readv_writev.exit.i
  %ret.0.i = phi i64 [ %ret.0.i.i, %do_iter_readv_writev.exit.i ], [ %ret.0.i5.i, %do_sync_readv_writev.exit.i ], [ %.ret.0.i.i, %146 ], [ 0, %138 ], [ %150, %148 ]
  %153 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %154 = load %struct.inode** %153, align 8
  %155 = getelementptr inbounds %struct.inode* %154, i64 0, i32 0
  %156 = load i16* %155, align 2
  %157 = and i16 %156, -4096
  %158 = icmp eq i16 %157, -32768
  br i1 %158, label %159, label %file_end_write.exit.i

; <label>:159                                     ; preds = %do_loop_readv_writev.exit.i
  %160 = getelementptr inbounds %struct.inode* %154, i64 0, i32 8
  %161 = load %struct.super_block** %160, align 8
  call void @__sb_end_write(%struct.super_block* %161, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %159, %do_loop_readv_writev.exit.i, %rw_verify_area.exit.i, %19
  %ret.1.i = phi i64 [ %23, %19 ], [ %73, %rw_verify_area.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ], [ %ret.0.i, %159 ]
  %162 = load %struct.iovec** %iov.i, align 8
  %163 = icmp eq %struct.iovec* %162, %22
  br i1 %163, label %166, label %164

; <label>:164                                     ; preds = %file_end_write.exit.i
  %165 = bitcast %struct.iovec* %162 to i8*
  call void @kfree(i8* %165) #6
  br label %166

; <label>:166                                     ; preds = %164, %file_end_write.exit.i
  %167 = icmp sgt i64 %ret.1.i, 0
  br i1 %167, label %168, label %compat_do_readv_writev.exit

; <label>:168                                     ; preds = %166
  %169 = getelementptr inbounds %struct.file* %6, i64 0, i32 1
  %170 = getelementptr inbounds %struct.file* %6, i64 0, i32 2
  %171 = load %struct.inode** %170, align 8
  %172 = getelementptr inbounds %struct.inode* %171, i64 0, i32 0
  %173 = load i16* %172, align 2
  %174 = and i16 %173, -4096
  %175 = icmp eq i16 %174, 16384
  %..i7.i = select i1 %175, i32 1073741826, i32 2
  %176 = getelementptr inbounds %struct.file* %6, i64 0, i32 7
  %177 = load i32* %176, align 4
  %178 = and i32 %177, 67108864
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %180, label %compat_do_readv_writev.exit

; <label>:180                                     ; preds = %168
  %181 = getelementptr inbounds %struct.file* %6, i64 0, i32 1, i32 1
  %182 = load %struct.dentry** %181, align 8
  %183 = call i32 @__fsnotify_parent(%struct.path* %169, %struct.dentry* %182, i32 %..i7.i) #6
  %184 = bitcast %struct.path* %169 to i8*
  %185 = call i32 @fsnotify(%struct.inode* %171, i32 %..i7.i, i8* %184, i32 1, i8* null, i32 0) #6
  br label %compat_do_readv_writev.exit

compat_do_readv_writev.exit:                      ; preds = %180, %168, %166
  call void @llvm.lifetime.end(i64 128, i8* %21) #4
  %186 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %186) #4
  %187 = icmp sgt i64 %ret.1.i, 0
  br i1 %187, label %188, label %compat_writev.exit.i

; <label>:188                                     ; preds = %compat_do_readv_writev.exit
  %189 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %190 = getelementptr inbounds %struct.task_struct* %189, i64 0, i32 113, i32 1
  %191 = load i64* %190, align 8
  %192 = add i64 %191, %ret.1.i
  store i64 %192, i64* %190, align 8
  br label %compat_writev.exit.i

compat_writev.exit.i:                             ; preds = %188, %compat_do_readv_writev.exit, %16, %8
  %ret.01.i.i = phi i64 [ %ret.1.i, %188 ], [ %ret.1.i, %compat_do_readv_writev.exit ], [ -22, %16 ], [ -9, %8 ]
  %193 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %194 = getelementptr inbounds %struct.task_struct* %193, i64 0, i32 113, i32 3
  %195 = load i64* %194, align 8
  %196 = add i64 %195, 1
  store i64 %196, i64* %194, align 8
  %197 = icmp sgt i64 %ret.01.i.i, -1
  br i1 %197, label %198, label %200

; <label>:198                                     ; preds = %compat_writev.exit.i
  %199 = load i64* %pos.i, align 8
  store i64 %199, i64* %9, align 8
  br label %200

; <label>:200                                     ; preds = %198, %compat_writev.exit.i
  %201 = and i32 %v.tr.i.i.i, 2
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %205, label %203

; <label>:203                                     ; preds = %200
  %204 = getelementptr inbounds %struct.file* %6, i64 0, i32 8
  call void @mutex_unlock(%struct.mutex* %204) #6
  br label %205

; <label>:205                                     ; preds = %203, %200
  %206 = and i32 %v.tr.i.i.i, 1
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %C_SYSC_writev.exit, label %208

; <label>:208                                     ; preds = %205
  call void @fput(%struct.file* %6) #6
  br label %C_SYSC_writev.exit

C_SYSC_writev.exit:                               ; preds = %208, %205, %0
  %.0.i = phi i64 [ -9, %0 ], [ %ret.01.i.i, %205 ], [ %ret.01.i.i, %208 ]
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_pwritev64(i64 %fd, i64 %vec, i64 %vlen, i64 %pos) #0 {
  %.sroa.3.i.i1.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i.i = alloca %struct.kiocb, align 8
  %iter.i.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i.i = alloca [8 x %struct.iovec], align 16
  %iov.i.i = alloca %struct.iovec*, align 8
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  store i64 %pos, i64* %1, align 8
  %4 = icmp slt i64 %pos, 0
  br i1 %4, label %__compat_sys_pwritev64.exit, label %5

; <label>:5                                       ; preds = %0
  %6 = trunc i64 %fd to i32
  %7 = call i64 @__fdget(i32 %6) #6
  %8 = and i64 %7, -4
  %9 = inttoptr i64 %8 to %struct.file*
  %10 = icmp eq i64 %8, 0
  br i1 %10, label %__compat_sys_pwritev64.exit, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 16
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %200, label %16

; <label>:16                                      ; preds = %11
  %17 = and i32 %13, 2
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %compat_writev.exit.i, label %19

; <label>:19                                      ; preds = %16
  %20 = and i32 %13, 262144
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %compat_writev.exit.i, label %22

; <label>:22                                      ; preds = %19
  %23 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %23) #4
  %24 = bitcast [8 x %struct.iovec]* %iovstack.i.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %24) #4
  %25 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i.i, i64 0, i64 0
  store %struct.iovec* %25, %struct.iovec** %iov.i.i, align 8
  %26 = call i64 @compat_rw_copy_check_uvector(i32 1, %struct.compat_iovec* %2, i64 %vlen, i64 8, %struct.iovec* %25, %struct.iovec** %iov.i.i) #6
  %27 = icmp slt i64 %26, 1
  br i1 %27, label %file_end_write.exit.i.i, label %28

; <label>:28                                      ; preds = %22
  %sext.i.i = shl i64 %26, 32
  %29 = ashr exact i64 %sext.i.i, 32
  %30 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %31 = load %struct.inode** %30, align 8
  %32 = icmp slt i64 %29, 0
  br i1 %32, label %rw_verify_area.exit.i.i, label %33, !prof !4

; <label>:33                                      ; preds = %28
  %34 = load i64* %1, align 8
  %35 = icmp slt i64 %34, 0
  br i1 %35, label %36, label %44, !prof !4

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %38 = load i32* %37, align 4
  %39 = and i32 %38, 8192
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %rw_verify_area.exit.i.i, label %41

; <label>:41                                      ; preds = %36
  %42 = sub i64 0, %34
  %43 = icmp ult i64 %29, %42
  br i1 %43, label %52, label %rw_verify_area.exit.i.i

; <label>:44                                      ; preds = %33
  %45 = add i64 %34, %29
  %46 = icmp slt i64 %45, 0
  br i1 %46, label %47, label %52, !prof !4

; <label>:47                                      ; preds = %44
  %48 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %49 = load i32* %48, align 4
  %50 = and i32 %49, 8192
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %rw_verify_area.exit.i.i, label %52

; <label>:52                                      ; preds = %47, %44, %41
  %53 = getelementptr inbounds %struct.inode* %31, i64 0, i32 35
  %54 = load %struct.file_lock** %53, align 8
  %55 = icmp eq %struct.file_lock* %54, null
  br i1 %55, label %.critedge.i.i.i, label %56

; <label>:56                                      ; preds = %52
  %57 = getelementptr inbounds %struct.inode* %31, i64 0, i32 8
  %58 = load %struct.super_block** %57, align 8
  %59 = getelementptr inbounds %struct.super_block* %58, i64 0, i32 10
  %60 = load i64* %59, align 8
  %61 = and i64 %60, 64
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %.critedge.i.i.i, label %mandatory_lock.exit.i.i.i

mandatory_lock.exit.i.i.i:                        ; preds = %56
  %63 = getelementptr inbounds %struct.inode* %31, i64 0, i32 0
  %64 = load i16* %63, align 2
  %65 = and i16 %64, 1032
  %66 = icmp eq i16 %65, 1024
  br i1 %66, label %67, label %.critedge.i.i.i, !prof !4

; <label>:67                                      ; preds = %mandatory_lock.exit.i.i.i
  %68 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %31, %struct.file* %9, i64 %34, i64 %29) #6
  %69 = icmp slt i32 %68, 0
  br i1 %69, label %rw_verify_area.exit.i.i, label %.critedge.i.i.i

.critedge.i.i.i:                                  ; preds = %67, %mandatory_lock.exit.i.i.i, %56, %52
  %70 = call i32 @security_file_permission(%struct.file* %9, i32 2) #6
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %rw_verify_area.exit.i.i

; <label>:72                                      ; preds = %.critedge.i.i.i
  %73 = icmp ugt i64 %29, 2147479552
  %74 = trunc i64 %29 to i32
  %75 = select i1 %73, i32 2147479552, i32 %74
  br label %rw_verify_area.exit.i.i

rw_verify_area.exit.i.i:                          ; preds = %72, %.critedge.i.i.i, %67, %47, %41, %36, %28
  %.0.i1.i.i = phi i32 [ %75, %72 ], [ -22, %28 ], [ -22, %36 ], [ -75, %41 ], [ -22, %47 ], [ %68, %67 ], [ %70, %.critedge.i.i.i ]
  %76 = sext i32 %.0.i1.i.i to i64
  %77 = icmp slt i32 %.0.i1.i.i, 0
  br i1 %77, label %file_end_write.exit.i.i, label %78

; <label>:78                                      ; preds = %rw_verify_area.exit.i.i
  %79 = getelementptr inbounds %struct.file* %9, i64 0, i32 3
  %80 = load %struct.file_operations** %79, align 8
  %81 = getelementptr inbounds %struct.file_operations* %80, i64 0, i32 3
  %82 = load i64 (%struct.file*, i8*, i64, i64*)** %81, align 8
  %83 = getelementptr inbounds %struct.file_operations* %80, i64 0, i32 5
  %84 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %83, align 8
  %85 = getelementptr inbounds %struct.file_operations* %80, i64 0, i32 7
  %86 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %85, align 8
  %87 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %88 = load %struct.inode** %87, align 8
  %89 = getelementptr inbounds %struct.inode* %88, i64 0, i32 0
  %90 = load i16* %89, align 2
  %91 = and i16 %90, -4096
  %92 = icmp eq i16 %91, -32768
  br i1 %92, label %93, label %file_start_write.exit.i.i

; <label>:93                                      ; preds = %78
  %94 = getelementptr inbounds %struct.inode* %88, i64 0, i32 8
  %95 = load %struct.super_block** %94, align 8
  %96 = call i32 @__sb_start_write(%struct.super_block* %95, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i.i

file_start_write.exit.i.i:                        ; preds = %93, %78
  %97 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %86, null
  br i1 %97, label %119, label %98

; <label>:98                                      ; preds = %file_start_write.exit.i.i
  %99 = load %struct.iovec** %iov.i.i, align 8
  %100 = bitcast %struct.kiocb* %kiocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %100) #4
  %101 = bitcast %struct.iov_iter* %iter.i.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %101) #4
  %102 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %102) #4
  %103 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %103) #4
  call void @llvm.memset.p0i8.i64(i8* %102, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %103, i8 0, i64 48, i32 8, i1 false) #4
  %104 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %105 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %105, align 8
  %106 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 1
  %107 = bitcast %struct.kioctx** %106 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %107, i8* %102, i64 24, i32 8, i1 false) #4
  %108 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i.i = bitcast %struct.task_struct* %104 to i8*
  store i8* %.c.i.i.i.i, i8** %108, align 8
  %109 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 5
  %110 = bitcast i64* %109 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %110, i8* %103, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %102) #4
  call void @llvm.lifetime.end(i64 48, i8* %103) #4
  %111 = load i64* %1, align 8
  %112 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 6
  store i64 %111, i64* %112, align 8
  %113 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 7
  store i64 %29, i64* %113, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i.i, i32 1, %struct.iovec* %99, i64 %vlen, i64 %29) #6
  %114 = call i64 %86(%struct.kiocb* %kiocb.i.i.i, %struct.iov_iter* %iter.i.i.i) #6
  %115 = icmp eq i64 %114, -529
  br i1 %115, label %116, label %do_iter_readv_writev.exit.i.i

; <label>:116                                     ; preds = %98
  %117 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i.i) #6
  br label %do_iter_readv_writev.exit.i.i

do_iter_readv_writev.exit.i.i:                    ; preds = %116, %98
  %ret.0.i.i.i = phi i64 [ %117, %116 ], [ %114, %98 ]
  %118 = load i64* %112, align 8
  store i64 %118, i64* %1, align 8
  call void @llvm.lifetime.end(i64 40, i8* %101) #4
  call void @llvm.lifetime.end(i64 88, i8* %100) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:119                                     ; preds = %file_start_write.exit.i.i
  %120 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %84, null
  %121 = load %struct.iovec** %iov.i.i, align 8
  br i1 %120, label %141, label %122

; <label>:122                                     ; preds = %119
  %123 = bitcast %struct.kiocb* %kiocb.i3.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %123) #4
  %124 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %124) #4
  %125 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %125) #4
  call void @llvm.memset.p0i8.i64(i8* %124, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %125, i8 0, i64 48, i32 8, i1 false) #4
  %126 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %127 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 0
  store %struct.file* %9, %struct.file** %127, align 8
  %128 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 1
  %129 = bitcast %struct.kioctx** %128 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %129, i8* %124, i64 24, i32 8, i1 false) #4
  %130 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 4, i32 0
  %.c.i.i4.i.i = bitcast %struct.task_struct* %126 to i8*
  store i8* %.c.i.i4.i.i, i8** %130, align 8
  %131 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 5
  %132 = bitcast i64* %131 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %132, i8* %125, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %124) #4
  call void @llvm.lifetime.end(i64 48, i8* %125) #4
  %133 = load i64* %1, align 8
  %134 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 6
  store i64 %133, i64* %134, align 8
  %135 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 7
  store i64 %29, i64* %135, align 8
  %136 = call i64 %84(%struct.kiocb* %kiocb.i3.i.i, %struct.iovec* %121, i64 %vlen, i64 %133) #6
  %137 = icmp eq i64 %136, -529
  br i1 %137, label %138, label %do_sync_readv_writev.exit.i.i

; <label>:138                                     ; preds = %122
  %139 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i.i) #6
  br label %do_sync_readv_writev.exit.i.i

do_sync_readv_writev.exit.i.i:                    ; preds = %138, %122
  %ret.0.i5.i.i = phi i64 [ %139, %138 ], [ %136, %122 ]
  %140 = load i64* %134, align 8
  store i64 %140, i64* %1, align 8
  call void @llvm.lifetime.end(i64 88, i8* %123) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:141                                     ; preds = %119
  %.old1.i.i.i = icmp eq i64 %vlen, 0
  br i1 %.old1.i.i.i, label %do_loop_readv_writev.exit.i.i, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %151, %141
  %ret.0.i6.i.i = phi i64 [ %153, %151 ], [ 0, %141 ]
  %vector.0.i.i.i = phi %struct.iovec* [ %152, %151 ], [ %121, %141 ]
  %.0.i.i.i = phi i64 [ %146, %151 ], [ %vlen, %141 ]
  %142 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 0
  %143 = load i8** %142, align 8
  %144 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 1
  %145 = load i64* %144, align 8
  %146 = add i64 %.0.i.i.i, -1
  %147 = call i64 %82(%struct.file* %9, i8* %143, i64 %145, i64* %1) #6
  %148 = icmp slt i64 %147, 0
  br i1 %148, label %149, label %151

; <label>:149                                     ; preds = %.preheader.i.i.i
  %150 = icmp eq i64 %ret.0.i6.i.i, 0
  %.ret.0.i.i.i = select i1 %150, i64 %147, i64 %ret.0.i6.i.i
  br label %do_loop_readv_writev.exit.i.i

; <label>:151                                     ; preds = %.preheader.i.i.i
  %152 = getelementptr %struct.iovec* %vector.0.i.i.i, i64 1
  %153 = add i64 %147, %ret.0.i6.i.i
  %154 = icmp eq i64 %147, %145
  %155 = icmp ne i64 %146, 0
  %or.cond.i.i.i = and i1 %154, %155
  br i1 %or.cond.i.i.i, label %.preheader.i.i.i, label %do_loop_readv_writev.exit.i.i

do_loop_readv_writev.exit.i.i:                    ; preds = %151, %149, %141, %do_sync_readv_writev.exit.i.i, %do_iter_readv_writev.exit.i.i
  %ret.0.i.i = phi i64 [ %ret.0.i.i.i, %do_iter_readv_writev.exit.i.i ], [ %ret.0.i5.i.i, %do_sync_readv_writev.exit.i.i ], [ %.ret.0.i.i.i, %149 ], [ 0, %141 ], [ %153, %151 ]
  %156 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %157 = load %struct.inode** %156, align 8
  %158 = getelementptr inbounds %struct.inode* %157, i64 0, i32 0
  %159 = load i16* %158, align 2
  %160 = and i16 %159, -4096
  %161 = icmp eq i16 %160, -32768
  br i1 %161, label %162, label %file_end_write.exit.i.i

; <label>:162                                     ; preds = %do_loop_readv_writev.exit.i.i
  %163 = getelementptr inbounds %struct.inode* %157, i64 0, i32 8
  %164 = load %struct.super_block** %163, align 8
  call void @__sb_end_write(%struct.super_block* %164, i32 1) #6
  br label %file_end_write.exit.i.i

file_end_write.exit.i.i:                          ; preds = %162, %do_loop_readv_writev.exit.i.i, %rw_verify_area.exit.i.i, %22
  %ret.1.i.i = phi i64 [ %26, %22 ], [ %76, %rw_verify_area.exit.i.i ], [ %ret.0.i.i, %do_loop_readv_writev.exit.i.i ], [ %ret.0.i.i, %162 ]
  %165 = load %struct.iovec** %iov.i.i, align 8
  %166 = icmp eq %struct.iovec* %165, %25
  br i1 %166, label %169, label %167

; <label>:167                                     ; preds = %file_end_write.exit.i.i
  %168 = bitcast %struct.iovec* %165 to i8*
  call void @kfree(i8* %168) #6
  br label %169

; <label>:169                                     ; preds = %167, %file_end_write.exit.i.i
  %170 = icmp sgt i64 %ret.1.i.i, 0
  br i1 %170, label %171, label %compat_do_readv_writev.exit.i

; <label>:171                                     ; preds = %169
  %172 = getelementptr inbounds %struct.file* %9, i64 0, i32 1
  %173 = getelementptr inbounds %struct.file* %9, i64 0, i32 2
  %174 = load %struct.inode** %173, align 8
  %175 = getelementptr inbounds %struct.inode* %174, i64 0, i32 0
  %176 = load i16* %175, align 2
  %177 = and i16 %176, -4096
  %178 = icmp eq i16 %177, 16384
  %..i7.i.i = select i1 %178, i32 1073741826, i32 2
  %179 = getelementptr inbounds %struct.file* %9, i64 0, i32 7
  %180 = load i32* %179, align 4
  %181 = and i32 %180, 67108864
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %183, label %compat_do_readv_writev.exit.i

; <label>:183                                     ; preds = %171
  %184 = getelementptr inbounds %struct.file* %9, i64 0, i32 1, i32 1
  %185 = load %struct.dentry** %184, align 8
  %186 = call i32 @__fsnotify_parent(%struct.path* %172, %struct.dentry* %185, i32 %..i7.i.i) #6
  %187 = bitcast %struct.path* %172 to i8*
  %188 = call i32 @fsnotify(%struct.inode* %174, i32 %..i7.i.i, i8* %187, i32 1, i8* null, i32 0) #6
  br label %compat_do_readv_writev.exit.i

compat_do_readv_writev.exit.i:                    ; preds = %183, %171, %169
  call void @llvm.lifetime.end(i64 128, i8* %24) #4
  %189 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %189) #4
  %190 = icmp sgt i64 %ret.1.i.i, 0
  br i1 %190, label %191, label %compat_writev.exit.i

; <label>:191                                     ; preds = %compat_do_readv_writev.exit.i
  %192 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %193 = getelementptr inbounds %struct.task_struct* %192, i64 0, i32 113, i32 1
  %194 = load i64* %193, align 8
  %195 = add i64 %194, %ret.1.i.i
  store i64 %195, i64* %193, align 8
  br label %compat_writev.exit.i

compat_writev.exit.i:                             ; preds = %191, %compat_do_readv_writev.exit.i, %19, %16
  %ret.01.i.i = phi i64 [ %ret.1.i.i, %191 ], [ %ret.1.i.i, %compat_do_readv_writev.exit.i ], [ -22, %19 ], [ -9, %16 ]
  %196 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %197 = getelementptr inbounds %struct.task_struct* %196, i64 0, i32 113, i32 3
  %198 = load i64* %197, align 8
  %199 = add i64 %198, 1
  store i64 %199, i64* %197, align 8
  br label %200

; <label>:200                                     ; preds = %compat_writev.exit.i, %11
  %ret.0.i = phi i64 [ %ret.01.i.i, %compat_writev.exit.i ], [ -29, %11 ]
  %201 = and i64 %7, 1
  %202 = icmp eq i64 %201, 0
  br i1 %202, label %__compat_sys_pwritev64.exit, label %203

; <label>:203                                     ; preds = %200
  call void @fput(%struct.file* %9) #6
  br label %__compat_sys_pwritev64.exit

__compat_sys_pwritev64.exit:                      ; preds = %203, %200, %5, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %5 ], [ %ret.0.i, %200 ], [ %ret.0.i, %203 ]
  %204 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %204) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_pwritev(i64 %fd, i64 %vec, i64 %vlen, i64 %pos_low, i64 %pos_high) #0 {
  %.sroa.3.i.i1.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i.i = alloca %struct.kiocb, align 8
  %.sroa.3.i.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i.i = alloca { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i.i = alloca %struct.kiocb, align 8
  %iter.i.i.i = alloca %struct.iov_iter, align 8
  %iovstack.i.i = alloca [8 x %struct.iovec], align 16
  %iov.i.i = alloca %struct.iovec*, align 8
  %1 = alloca i64, align 8
  %2 = inttoptr i64 %vec to %struct.compat_iovec*
  %3 = shl i64 %pos_high, 32
  %4 = and i64 %pos_low, 4294967295
  %5 = or i64 %3, %4
  %6 = and i64 %fd, 4294967295
  %7 = and i64 %vlen, 4294967295
  %8 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %8) #4
  store i64 %5, i64* %1, align 8
  %9 = icmp slt i64 %5, 0
  br i1 %9, label %__compat_sys_pwritev64.exit, label %10

; <label>:10                                      ; preds = %0
  %11 = trunc i64 %6 to i32
  %12 = call i64 @__fdget(i32 %11) #6
  %13 = and i64 %12, -4
  %14 = inttoptr i64 %13 to %struct.file*
  %15 = icmp eq i64 %13, 0
  br i1 %15, label %__compat_sys_pwritev64.exit, label %16

; <label>:16                                      ; preds = %10
  %17 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 16
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %205, label %21

; <label>:21                                      ; preds = %16
  %22 = and i32 %18, 2
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %compat_writev.exit.i, label %24

; <label>:24                                      ; preds = %21
  %25 = and i32 %18, 262144
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %compat_writev.exit.i, label %27

; <label>:27                                      ; preds = %24
  %28 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %28) #4
  %29 = bitcast [8 x %struct.iovec]* %iovstack.i.i to i8*
  call void @llvm.lifetime.start(i64 128, i8* %29) #4
  %30 = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i.i, i64 0, i64 0
  store %struct.iovec* %30, %struct.iovec** %iov.i.i, align 8
  %31 = call i64 @compat_rw_copy_check_uvector(i32 1, %struct.compat_iovec* %2, i64 %7, i64 8, %struct.iovec* %30, %struct.iovec** %iov.i.i) #6
  %32 = icmp slt i64 %31, 1
  br i1 %32, label %file_end_write.exit.i.i, label %33

; <label>:33                                      ; preds = %27
  %sext.i.i = shl i64 %31, 32
  %34 = ashr exact i64 %sext.i.i, 32
  %35 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %36 = load %struct.inode** %35, align 8
  %37 = icmp slt i64 %34, 0
  br i1 %37, label %rw_verify_area.exit.i.i, label %38, !prof !4

; <label>:38                                      ; preds = %33
  %39 = load i64* %1, align 8
  %40 = icmp slt i64 %39, 0
  br i1 %40, label %41, label %49, !prof !4

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %43 = load i32* %42, align 4
  %44 = and i32 %43, 8192
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %rw_verify_area.exit.i.i, label %46

; <label>:46                                      ; preds = %41
  %47 = sub i64 0, %39
  %48 = icmp ult i64 %34, %47
  br i1 %48, label %57, label %rw_verify_area.exit.i.i

; <label>:49                                      ; preds = %38
  %50 = add i64 %39, %34
  %51 = icmp slt i64 %50, 0
  br i1 %51, label %52, label %57, !prof !4

; <label>:52                                      ; preds = %49
  %53 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %54 = load i32* %53, align 4
  %55 = and i32 %54, 8192
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %rw_verify_area.exit.i.i, label %57

; <label>:57                                      ; preds = %52, %49, %46
  %58 = getelementptr inbounds %struct.inode* %36, i64 0, i32 35
  %59 = load %struct.file_lock** %58, align 8
  %60 = icmp eq %struct.file_lock* %59, null
  br i1 %60, label %.critedge.i.i.i, label %61

; <label>:61                                      ; preds = %57
  %62 = getelementptr inbounds %struct.inode* %36, i64 0, i32 8
  %63 = load %struct.super_block** %62, align 8
  %64 = getelementptr inbounds %struct.super_block* %63, i64 0, i32 10
  %65 = load i64* %64, align 8
  %66 = and i64 %65, 64
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %.critedge.i.i.i, label %mandatory_lock.exit.i.i.i

mandatory_lock.exit.i.i.i:                        ; preds = %61
  %68 = getelementptr inbounds %struct.inode* %36, i64 0, i32 0
  %69 = load i16* %68, align 2
  %70 = and i16 %69, 1032
  %71 = icmp eq i16 %70, 1024
  br i1 %71, label %72, label %.critedge.i.i.i, !prof !4

; <label>:72                                      ; preds = %mandatory_lock.exit.i.i.i
  %73 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %36, %struct.file* %14, i64 %39, i64 %34) #6
  %74 = icmp slt i32 %73, 0
  br i1 %74, label %rw_verify_area.exit.i.i, label %.critedge.i.i.i

.critedge.i.i.i:                                  ; preds = %72, %mandatory_lock.exit.i.i.i, %61, %57
  %75 = call i32 @security_file_permission(%struct.file* %14, i32 2) #6
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %rw_verify_area.exit.i.i

; <label>:77                                      ; preds = %.critedge.i.i.i
  %78 = icmp ugt i64 %34, 2147479552
  %79 = trunc i64 %34 to i32
  %80 = select i1 %78, i32 2147479552, i32 %79
  br label %rw_verify_area.exit.i.i

rw_verify_area.exit.i.i:                          ; preds = %77, %.critedge.i.i.i, %72, %52, %46, %41, %33
  %.0.i1.i.i = phi i32 [ %80, %77 ], [ -22, %33 ], [ -22, %41 ], [ -75, %46 ], [ -22, %52 ], [ %73, %72 ], [ %75, %.critedge.i.i.i ]
  %81 = sext i32 %.0.i1.i.i to i64
  %82 = icmp slt i32 %.0.i1.i.i, 0
  br i1 %82, label %file_end_write.exit.i.i, label %83

; <label>:83                                      ; preds = %rw_verify_area.exit.i.i
  %84 = getelementptr inbounds %struct.file* %14, i64 0, i32 3
  %85 = load %struct.file_operations** %84, align 8
  %86 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 3
  %87 = load i64 (%struct.file*, i8*, i64, i64*)** %86, align 8
  %88 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 5
  %89 = load i64 (%struct.kiocb*, %struct.iovec*, i64, i64)** %88, align 8
  %90 = getelementptr inbounds %struct.file_operations* %85, i64 0, i32 7
  %91 = load i64 (%struct.kiocb*, %struct.iov_iter*)** %90, align 8
  %92 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %93 = load %struct.inode** %92, align 8
  %94 = getelementptr inbounds %struct.inode* %93, i64 0, i32 0
  %95 = load i16* %94, align 2
  %96 = and i16 %95, -4096
  %97 = icmp eq i16 %96, -32768
  br i1 %97, label %98, label %file_start_write.exit.i.i

; <label>:98                                      ; preds = %83
  %99 = getelementptr inbounds %struct.inode* %93, i64 0, i32 8
  %100 = load %struct.super_block** %99, align 8
  %101 = call i32 @__sb_start_write(%struct.super_block* %100, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i.i

file_start_write.exit.i.i:                        ; preds = %98, %83
  %102 = icmp eq i64 (%struct.kiocb*, %struct.iov_iter*)* %91, null
  br i1 %102, label %124, label %103

; <label>:103                                     ; preds = %file_start_write.exit.i.i
  %104 = load %struct.iovec** %iov.i.i, align 8
  %105 = bitcast %struct.kiocb* %kiocb.i.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %105) #4
  %106 = bitcast %struct.iov_iter* %iter.i.i.i to i8*
  call void @llvm.lifetime.start(i64 40, i8* %106) #4
  %107 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %107) #4
  %108 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %108) #4
  call void @llvm.memset.p0i8.i64(i8* %107, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %108, i8 0, i64 48, i32 8, i1 false) #4
  %109 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %110 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 0
  store %struct.file* %14, %struct.file** %110, align 8
  %111 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 1
  %112 = bitcast %struct.kioctx** %111 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %112, i8* %107, i64 24, i32 8, i1 false) #4
  %113 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 4, i32 0
  %.c.i.i.i.i = bitcast %struct.task_struct* %109 to i8*
  store i8* %.c.i.i.i.i, i8** %113, align 8
  %114 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 5
  %115 = bitcast i64* %114 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %115, i8* %108, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %107) #4
  call void @llvm.lifetime.end(i64 48, i8* %108) #4
  %116 = load i64* %1, align 8
  %117 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 6
  store i64 %116, i64* %117, align 8
  %118 = getelementptr inbounds %struct.kiocb* %kiocb.i.i.i, i64 0, i32 7
  store i64 %34, i64* %118, align 8
  call void @iov_iter_init(%struct.iov_iter* %iter.i.i.i, i32 1, %struct.iovec* %104, i64 %7, i64 %34) #6
  %119 = call i64 %91(%struct.kiocb* %kiocb.i.i.i, %struct.iov_iter* %iter.i.i.i) #6
  %120 = icmp eq i64 %119, -529
  br i1 %120, label %121, label %do_iter_readv_writev.exit.i.i

; <label>:121                                     ; preds = %103
  %122 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i.i.i) #6
  br label %do_iter_readv_writev.exit.i.i

do_iter_readv_writev.exit.i.i:                    ; preds = %121, %103
  %ret.0.i.i.i = phi i64 [ %122, %121 ], [ %119, %103 ]
  %123 = load i64* %117, align 8
  store i64 %123, i64* %1, align 8
  call void @llvm.lifetime.end(i64 40, i8* %106) #4
  call void @llvm.lifetime.end(i64 88, i8* %105) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:124                                     ; preds = %file_start_write.exit.i.i
  %125 = icmp eq i64 (%struct.kiocb*, %struct.iovec*, i64, i64)* %89, null
  %126 = load %struct.iovec** %iov.i.i, align 8
  br i1 %125, label %146, label %127

; <label>:127                                     ; preds = %124
  %128 = bitcast %struct.kiocb* %kiocb.i3.i.i to i8*
  call void @llvm.lifetime.start(i64 88, i8* %128) #4
  %129 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %129) #4
  %130 = bitcast { i64, i64, i64, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i.i to i8*
  call void @llvm.lifetime.start(i64 48, i8* %130) #4
  call void @llvm.memset.p0i8.i64(i8* %129, i8 0, i64 24, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %130, i8 0, i64 48, i32 8, i1 false) #4
  %131 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %132 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 0
  store %struct.file* %14, %struct.file** %132, align 8
  %133 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 1
  %134 = bitcast %struct.kioctx** %133 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %134, i8* %129, i64 24, i32 8, i1 false) #4
  %135 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 4, i32 0
  %.c.i.i4.i.i = bitcast %struct.task_struct* %131 to i8*
  store i8* %.c.i.i4.i.i, i8** %135, align 8
  %136 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 5
  %137 = bitcast i64* %136 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %137, i8* %130, i64 48, i32 8, i1 false) #4
  call void @llvm.lifetime.end(i64 24, i8* %129) #4
  call void @llvm.lifetime.end(i64 48, i8* %130) #4
  %138 = load i64* %1, align 8
  %139 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 6
  store i64 %138, i64* %139, align 8
  %140 = getelementptr inbounds %struct.kiocb* %kiocb.i3.i.i, i64 0, i32 7
  store i64 %34, i64* %140, align 8
  %141 = call i64 %89(%struct.kiocb* %kiocb.i3.i.i, %struct.iovec* %126, i64 %7, i64 %138) #6
  %142 = icmp eq i64 %141, -529
  br i1 %142, label %143, label %do_sync_readv_writev.exit.i.i

; <label>:143                                     ; preds = %127
  %144 = call i64 @wait_on_sync_kiocb(%struct.kiocb* %kiocb.i3.i.i) #6
  br label %do_sync_readv_writev.exit.i.i

do_sync_readv_writev.exit.i.i:                    ; preds = %143, %127
  %ret.0.i5.i.i = phi i64 [ %144, %143 ], [ %141, %127 ]
  %145 = load i64* %139, align 8
  store i64 %145, i64* %1, align 8
  call void @llvm.lifetime.end(i64 88, i8* %128) #4
  br label %do_loop_readv_writev.exit.i.i

; <label>:146                                     ; preds = %124
  %.old1.i.i.i = icmp eq i64 %7, 0
  br i1 %.old1.i.i.i, label %do_loop_readv_writev.exit.i.i, label %.preheader.i.i.i

.preheader.i.i.i:                                 ; preds = %156, %146
  %ret.0.i6.i.i = phi i64 [ %158, %156 ], [ 0, %146 ]
  %vector.0.i.i.i = phi %struct.iovec* [ %157, %156 ], [ %126, %146 ]
  %.0.i.i.i = phi i64 [ %151, %156 ], [ %7, %146 ]
  %147 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 0
  %148 = load i8** %147, align 8
  %149 = getelementptr inbounds %struct.iovec* %vector.0.i.i.i, i64 0, i32 1
  %150 = load i64* %149, align 8
  %151 = add i64 %.0.i.i.i, -1
  %152 = call i64 %87(%struct.file* %14, i8* %148, i64 %150, i64* %1) #6
  %153 = icmp slt i64 %152, 0
  br i1 %153, label %154, label %156

; <label>:154                                     ; preds = %.preheader.i.i.i
  %155 = icmp eq i64 %ret.0.i6.i.i, 0
  %.ret.0.i.i.i = select i1 %155, i64 %152, i64 %ret.0.i6.i.i
  br label %do_loop_readv_writev.exit.i.i

; <label>:156                                     ; preds = %.preheader.i.i.i
  %157 = getelementptr %struct.iovec* %vector.0.i.i.i, i64 1
  %158 = add i64 %152, %ret.0.i6.i.i
  %159 = icmp eq i64 %152, %150
  %160 = icmp ne i64 %151, 0
  %or.cond.i.i.i = and i1 %159, %160
  br i1 %or.cond.i.i.i, label %.preheader.i.i.i, label %do_loop_readv_writev.exit.i.i

do_loop_readv_writev.exit.i.i:                    ; preds = %156, %154, %146, %do_sync_readv_writev.exit.i.i, %do_iter_readv_writev.exit.i.i
  %ret.0.i.i = phi i64 [ %ret.0.i.i.i, %do_iter_readv_writev.exit.i.i ], [ %ret.0.i5.i.i, %do_sync_readv_writev.exit.i.i ], [ %.ret.0.i.i.i, %154 ], [ 0, %146 ], [ %158, %156 ]
  %161 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %162 = load %struct.inode** %161, align 8
  %163 = getelementptr inbounds %struct.inode* %162, i64 0, i32 0
  %164 = load i16* %163, align 2
  %165 = and i16 %164, -4096
  %166 = icmp eq i16 %165, -32768
  br i1 %166, label %167, label %file_end_write.exit.i.i

; <label>:167                                     ; preds = %do_loop_readv_writev.exit.i.i
  %168 = getelementptr inbounds %struct.inode* %162, i64 0, i32 8
  %169 = load %struct.super_block** %168, align 8
  call void @__sb_end_write(%struct.super_block* %169, i32 1) #6
  br label %file_end_write.exit.i.i

file_end_write.exit.i.i:                          ; preds = %167, %do_loop_readv_writev.exit.i.i, %rw_verify_area.exit.i.i, %27
  %ret.1.i.i = phi i64 [ %31, %27 ], [ %81, %rw_verify_area.exit.i.i ], [ %ret.0.i.i, %do_loop_readv_writev.exit.i.i ], [ %ret.0.i.i, %167 ]
  %170 = load %struct.iovec** %iov.i.i, align 8
  %171 = icmp eq %struct.iovec* %170, %30
  br i1 %171, label %174, label %172

; <label>:172                                     ; preds = %file_end_write.exit.i.i
  %173 = bitcast %struct.iovec* %170 to i8*
  call void @kfree(i8* %173) #6
  br label %174

; <label>:174                                     ; preds = %172, %file_end_write.exit.i.i
  %175 = icmp sgt i64 %ret.1.i.i, 0
  br i1 %175, label %176, label %compat_do_readv_writev.exit.i

; <label>:176                                     ; preds = %174
  %177 = getelementptr inbounds %struct.file* %14, i64 0, i32 1
  %178 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %179 = load %struct.inode** %178, align 8
  %180 = getelementptr inbounds %struct.inode* %179, i64 0, i32 0
  %181 = load i16* %180, align 2
  %182 = and i16 %181, -4096
  %183 = icmp eq i16 %182, 16384
  %..i7.i.i = select i1 %183, i32 1073741826, i32 2
  %184 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %185 = load i32* %184, align 4
  %186 = and i32 %185, 67108864
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %188, label %compat_do_readv_writev.exit.i

; <label>:188                                     ; preds = %176
  %189 = getelementptr inbounds %struct.file* %14, i64 0, i32 1, i32 1
  %190 = load %struct.dentry** %189, align 8
  %191 = call i32 @__fsnotify_parent(%struct.path* %177, %struct.dentry* %190, i32 %..i7.i.i) #6
  %192 = bitcast %struct.path* %177 to i8*
  %193 = call i32 @fsnotify(%struct.inode* %179, i32 %..i7.i.i, i8* %192, i32 1, i8* null, i32 0) #6
  br label %compat_do_readv_writev.exit.i

compat_do_readv_writev.exit.i:                    ; preds = %188, %176, %174
  call void @llvm.lifetime.end(i64 128, i8* %29) #4
  %194 = bitcast %struct.iovec** %iov.i.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %194) #4
  %195 = icmp sgt i64 %ret.1.i.i, 0
  br i1 %195, label %196, label %compat_writev.exit.i

; <label>:196                                     ; preds = %compat_do_readv_writev.exit.i
  %197 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %198 = getelementptr inbounds %struct.task_struct* %197, i64 0, i32 113, i32 1
  %199 = load i64* %198, align 8
  %200 = add i64 %199, %ret.1.i.i
  store i64 %200, i64* %198, align 8
  br label %compat_writev.exit.i

compat_writev.exit.i:                             ; preds = %196, %compat_do_readv_writev.exit.i, %24, %21
  %ret.01.i.i = phi i64 [ %ret.1.i.i, %196 ], [ %ret.1.i.i, %compat_do_readv_writev.exit.i ], [ -22, %24 ], [ -9, %21 ]
  %201 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %202 = getelementptr inbounds %struct.task_struct* %201, i64 0, i32 113, i32 3
  %203 = load i64* %202, align 8
  %204 = add i64 %203, 1
  store i64 %204, i64* %202, align 8
  br label %205

; <label>:205                                     ; preds = %compat_writev.exit.i, %16
  %ret.0.i = phi i64 [ %ret.01.i.i, %compat_writev.exit.i ], [ -29, %16 ]
  %206 = and i64 %12, 1
  %207 = icmp eq i64 %206, 0
  br i1 %207, label %__compat_sys_pwritev64.exit, label %208

; <label>:208                                     ; preds = %205
  call void @fput(%struct.file* %14) #6
  br label %__compat_sys_pwritev64.exit

__compat_sys_pwritev64.exit:                      ; preds = %208, %205, %10, %0
  %.0.i = phi i64 [ -22, %0 ], [ -9, %10 ], [ %ret.0.i, %205 ], [ %ret.0.i, %208 ]
  %209 = bitcast i64* %1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %209) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_sendfile(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i4 = alloca i64, align 8
  %out_pos.i5 = alloca i64, align 8
  %pos.i1 = alloca i64, align 8
  %out_pos.i = alloca i64, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i64*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %236, label %6

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
  %14 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %14) #4
  %15 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %15) #4
  %16 = call i64 @__fdget(i32 %2) #6
  %17 = and i64 %16, -4
  %18 = inttoptr i64 %17 to %struct.file*
  %19 = icmp eq i64 %17, 0
  br i1 %19, label %do_sendfile.exit, label %20

; <label>:20                                      ; preds = %12
  %21 = getelementptr inbounds %struct.file* %18, i64 0, i32 7
  %22 = load i32* %21, align 4
  %23 = and i32 %22, 1
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %fdput.exit6.i, label %25

; <label>:25                                      ; preds = %20
  %26 = load i64* %pos.i, align 8
  store i64 %26, i64* %pos.i1, align 8
  %27 = load i32* %21, align 4
  %28 = and i32 %27, 8
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %fdput.exit6.i, label %30

; <label>:30                                      ; preds = %25
  %31 = getelementptr inbounds %struct.file* %18, i64 0, i32 2
  %32 = load %struct.inode** %31, align 8
  %33 = icmp slt i64 %count, 0
  br i1 %33, label %rw_verify_area.exit.i, label %34, !prof !4

; <label>:34                                      ; preds = %30
  %35 = load i64* %pos.i1, align 8
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %45, !prof !4

; <label>:37                                      ; preds = %34
  %38 = getelementptr inbounds %struct.file* %18, i64 0, i32 7
  %39 = load i32* %38, align 4
  %40 = and i32 %39, 8192
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %rw_verify_area.exit.i, label %42

; <label>:42                                      ; preds = %37
  %43 = sub i64 0, %35
  %44 = icmp ult i64 %count, %43
  br i1 %44, label %53, label %rw_verify_area.exit.i

; <label>:45                                      ; preds = %34
  %46 = add i64 %35, %count
  %47 = icmp slt i64 %46, 0
  br i1 %47, label %48, label %53, !prof !4

; <label>:48                                      ; preds = %45
  %49 = getelementptr inbounds %struct.file* %18, i64 0, i32 7
  %50 = load i32* %49, align 4
  %51 = and i32 %50, 8192
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %rw_verify_area.exit.i, label %53

; <label>:53                                      ; preds = %48, %45, %42
  %54 = getelementptr inbounds %struct.inode* %32, i64 0, i32 35
  %55 = load %struct.file_lock** %54, align 8
  %56 = icmp eq %struct.file_lock* %55, null
  br i1 %56, label %.critedge.i.i, label %57

; <label>:57                                      ; preds = %53
  %58 = getelementptr inbounds %struct.inode* %32, i64 0, i32 8
  %59 = load %struct.super_block** %58, align 8
  %60 = getelementptr inbounds %struct.super_block* %59, i64 0, i32 10
  %61 = load i64* %60, align 8
  %62 = and i64 %61, 64
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %57
  %64 = getelementptr inbounds %struct.inode* %32, i64 0, i32 0
  %65 = load i16* %64, align 2
  %66 = and i16 %65, 1032
  %67 = icmp eq i16 %66, 1024
  br i1 %67, label %68, label %.critedge.i.i, !prof !4

; <label>:68                                      ; preds = %mandatory_lock.exit.i.i
  %69 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %32, %struct.file* %18, i64 %35, i64 %count) #6
  %70 = icmp slt i32 %69, 0
  br i1 %70, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %68, %mandatory_lock.exit.i.i, %57, %53
  %71 = call i32 @security_file_permission(%struct.file* %18, i32 4) #6
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %rw_verify_area.exit.i

; <label>:73                                      ; preds = %.critedge.i.i
  %74 = icmp ugt i64 %count, 2147479552
  %75 = trunc i64 %count to i32
  %76 = select i1 %74, i32 2147479552, i32 %75
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %73, %.critedge.i.i, %68, %48, %42, %37, %30
  %.0.i.i = phi i32 [ %76, %73 ], [ -22, %30 ], [ -22, %37 ], [ -75, %42 ], [ -22, %48 ], [ %69, %68 ], [ %71, %.critedge.i.i ]
  %77 = sext i32 %.0.i.i to i64
  %78 = icmp slt i32 %.0.i.i, 0
  br i1 %78, label %fdput.exit6.i, label %79

; <label>:79                                      ; preds = %rw_verify_area.exit.i
  %80 = call i64 @__fdget(i32 %1) #6
  %81 = and i64 %80, -4
  %82 = inttoptr i64 %81 to %struct.file*
  %83 = icmp eq i64 %81, 0
  br i1 %83, label %fdput.exit6.i, label %84

; <label>:84                                      ; preds = %79
  %85 = getelementptr inbounds %struct.file* %82, i64 0, i32 7
  %86 = load i32* %85, align 4
  %87 = and i32 %86, 2
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %223, label %89

; <label>:89                                      ; preds = %84
  %90 = getelementptr inbounds %struct.file* %18, i64 0, i32 2
  %91 = load %struct.inode** %90, align 8
  %92 = getelementptr inbounds %struct.file* %82, i64 0, i32 2
  %93 = load %struct.inode** %92, align 8
  %94 = getelementptr inbounds %struct.file* %82, i64 0, i32 9
  %95 = load i64* %94, align 8
  store i64 %95, i64* %out_pos.i, align 8
  %96 = getelementptr inbounds %struct.file* %82, i64 0, i32 2
  %97 = load %struct.inode** %96, align 8
  %98 = icmp slt i64 %77, 0
  br i1 %98, label %rw_verify_area.exit4.i, label %99, !prof !4

; <label>:99                                      ; preds = %89
  %100 = load i64* %out_pos.i, align 8
  %101 = icmp slt i64 %100, 0
  br i1 %101, label %102, label %110, !prof !4

; <label>:102                                     ; preds = %99
  %103 = getelementptr inbounds %struct.file* %82, i64 0, i32 7
  %104 = load i32* %103, align 4
  %105 = and i32 %104, 8192
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %rw_verify_area.exit4.i, label %107

; <label>:107                                     ; preds = %102
  %108 = sub i64 0, %100
  %109 = icmp ult i64 %77, %108
  br i1 %109, label %118, label %rw_verify_area.exit4.i

; <label>:110                                     ; preds = %99
  %111 = add i64 %100, %77
  %112 = icmp slt i64 %111, 0
  br i1 %112, label %113, label %118, !prof !4

; <label>:113                                     ; preds = %110
  %114 = getelementptr inbounds %struct.file* %82, i64 0, i32 7
  %115 = load i32* %114, align 4
  %116 = and i32 %115, 8192
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %rw_verify_area.exit4.i, label %118

; <label>:118                                     ; preds = %113, %110, %107
  %119 = getelementptr inbounds %struct.inode* %97, i64 0, i32 35
  %120 = load %struct.file_lock** %119, align 8
  %121 = icmp eq %struct.file_lock* %120, null
  br i1 %121, label %.critedge.i2.i, label %122

; <label>:122                                     ; preds = %118
  %123 = getelementptr inbounds %struct.inode* %97, i64 0, i32 8
  %124 = load %struct.super_block** %123, align 8
  %125 = getelementptr inbounds %struct.super_block* %124, i64 0, i32 10
  %126 = load i64* %125, align 8
  %127 = and i64 %126, 64
  %128 = icmp eq i64 %127, 0
  br i1 %128, label %.critedge.i2.i, label %mandatory_lock.exit.i1.i

mandatory_lock.exit.i1.i:                         ; preds = %122
  %129 = getelementptr inbounds %struct.inode* %97, i64 0, i32 0
  %130 = load i16* %129, align 2
  %131 = and i16 %130, 1032
  %132 = icmp eq i16 %131, 1024
  br i1 %132, label %133, label %.critedge.i2.i, !prof !4

; <label>:133                                     ; preds = %mandatory_lock.exit.i1.i
  %134 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %97, %struct.file* %82, i64 %100, i64 %77) #6
  %135 = icmp slt i32 %134, 0
  br i1 %135, label %rw_verify_area.exit4.i, label %.critedge.i2.i

.critedge.i2.i:                                   ; preds = %133, %mandatory_lock.exit.i1.i, %122, %118
  %136 = call i32 @security_file_permission(%struct.file* %82, i32 2) #6
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %138, label %rw_verify_area.exit4.i

; <label>:138                                     ; preds = %.critedge.i2.i
  %139 = icmp ugt i64 %77, 2147479552
  %140 = trunc i64 %77 to i32
  %141 = select i1 %139, i32 2147479552, i32 %140
  br label %rw_verify_area.exit4.i

rw_verify_area.exit4.i:                           ; preds = %138, %.critedge.i2.i, %133, %113, %107, %102, %89
  %.0.i3.i = phi i32 [ %141, %138 ], [ -22, %89 ], [ -22, %102 ], [ -75, %107 ], [ -22, %113 ], [ %134, %133 ], [ %136, %.critedge.i2.i ]
  %142 = sext i32 %.0.i3.i to i64
  %143 = icmp slt i32 %.0.i3.i, 0
  br i1 %143, label %223, label %144

; <label>:144                                     ; preds = %rw_verify_area.exit4.i
  %145 = add i64 %26, %142
  %146 = icmp ugt i64 %145, 2147483647
  br i1 %146, label %147, label %151, !prof !4

; <label>:147                                     ; preds = %144
  %148 = icmp sgt i64 2147483647, %26
  br i1 %148, label %149, label %223

; <label>:149                                     ; preds = %147
  %150 = sub i64 2147483647, %26
  br label %151

; <label>:151                                     ; preds = %149, %144
  %.0.i2 = phi i64 [ %150, %149 ], [ %142, %144 ]
  %152 = load %struct.inode** %92, align 8
  %153 = getelementptr inbounds %struct.inode* %152, i64 0, i32 0
  %154 = load i16* %153, align 2
  %155 = and i16 %154, -4096
  %156 = icmp eq i16 %155, -32768
  br i1 %156, label %157, label %file_start_write.exit.i

; <label>:157                                     ; preds = %151
  %158 = getelementptr inbounds %struct.inode* %152, i64 0, i32 8
  %159 = load %struct.super_block** %158, align 8
  %160 = call i32 @__sb_start_write(%struct.super_block* %159, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %157, %151
  %161 = call i64 @do_splice_direct(%struct.file* %18, i64* %pos.i1, %struct.file* %82, i64* %out_pos.i, i64 %.0.i2, i32 0) #6
  %162 = load %struct.inode** %92, align 8
  %163 = getelementptr inbounds %struct.inode* %162, i64 0, i32 0
  %164 = load i16* %163, align 2
  %165 = and i16 %164, -4096
  %166 = icmp eq i16 %165, -32768
  br i1 %166, label %167, label %file_end_write.exit.i

; <label>:167                                     ; preds = %file_start_write.exit.i
  %168 = getelementptr inbounds %struct.inode* %162, i64 0, i32 8
  %169 = load %struct.super_block** %168, align 8
  call void @__sb_end_write(%struct.super_block* %169, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %167, %file_start_write.exit.i
  %170 = icmp sgt i64 %161, 0
  br i1 %170, label %171, label %212

; <label>:171                                     ; preds = %file_end_write.exit.i
  %172 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %173 = getelementptr inbounds %struct.task_struct* %172, i64 0, i32 113, i32 0
  %174 = load i64* %173, align 8
  %175 = add i64 %174, %161
  store i64 %175, i64* %173, align 8
  %176 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %177 = getelementptr inbounds %struct.task_struct* %176, i64 0, i32 113, i32 1
  %178 = load i64* %177, align 8
  %179 = add i64 %178, %161
  store i64 %179, i64* %177, align 8
  %180 = getelementptr inbounds %struct.file* %18, i64 0, i32 1
  %181 = load %struct.inode** %90, align 8
  %182 = getelementptr inbounds %struct.inode* %181, i64 0, i32 0
  %183 = load i16* %182, align 2
  %184 = and i16 %183, -4096
  %185 = icmp eq i16 %184, 16384
  %..i.i = select i1 %185, i32 1073741825, i32 1
  %186 = load i32* %21, align 4
  %187 = and i32 %186, 67108864
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %fsnotify_access.exit.i

; <label>:189                                     ; preds = %171
  %190 = getelementptr inbounds %struct.file* %18, i64 0, i32 1, i32 1
  %191 = load %struct.dentry** %190, align 8
  %192 = call i32 @__fsnotify_parent(%struct.path* %180, %struct.dentry* %191, i32 %..i.i) #6
  %193 = bitcast %struct.path* %180 to i8*
  %194 = call i32 @fsnotify(%struct.inode* %181, i32 %..i.i, i8* %193, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i

fsnotify_access.exit.i:                           ; preds = %189, %171
  %195 = getelementptr inbounds %struct.file* %82, i64 0, i32 1
  %196 = load %struct.inode** %92, align 8
  %197 = getelementptr inbounds %struct.inode* %196, i64 0, i32 0
  %198 = load i16* %197, align 2
  %199 = and i16 %198, -4096
  %200 = icmp eq i16 %199, 16384
  %..i7.i = select i1 %200, i32 1073741826, i32 2
  %201 = load i32* %85, align 4
  %202 = and i32 %201, 67108864
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %fsnotify_modify.exit.i

; <label>:204                                     ; preds = %fsnotify_access.exit.i
  %205 = getelementptr inbounds %struct.file* %82, i64 0, i32 1, i32 1
  %206 = load %struct.dentry** %205, align 8
  %207 = call i32 @__fsnotify_parent(%struct.path* %195, %struct.dentry* %206, i32 %..i7.i) #6
  %208 = bitcast %struct.path* %195 to i8*
  %209 = call i32 @fsnotify(%struct.inode* %196, i32 %..i7.i, i8* %208, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i

fsnotify_modify.exit.i:                           ; preds = %204, %fsnotify_access.exit.i
  %210 = load i64* %out_pos.i, align 8
  store i64 %210, i64* %94, align 8
  %211 = load i64* %pos.i1, align 8
  store i64 %211, i64* %pos.i, align 8
  br label %212

; <label>:212                                     ; preds = %fsnotify_modify.exit.i, %file_end_write.exit.i
  %213 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %214 = getelementptr inbounds %struct.task_struct* %213, i64 0, i32 113, i32 2
  %215 = load i64* %214, align 8
  %216 = add i64 %215, 1
  store i64 %216, i64* %214, align 8
  %217 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %218 = getelementptr inbounds %struct.task_struct* %217, i64 0, i32 113, i32 3
  %219 = load i64* %218, align 8
  %220 = add i64 %219, 1
  store i64 %220, i64* %218, align 8
  %221 = load i64* %pos.i1, align 8
  %222 = icmp sgt i64 %221, 2147483647
  %..i3 = select i1 %222, i64 -75, i64 %161
  br label %223

; <label>:223                                     ; preds = %212, %147, %rw_verify_area.exit4.i, %84
  %retval.0.i = phi i64 [ %142, %rw_verify_area.exit4.i ], [ -75, %147 ], [ -9, %84 ], [ %..i3, %212 ]
  %224 = and i64 %80, 1
  %225 = icmp eq i64 %224, 0
  br i1 %225, label %fdput.exit6.i, label %226

; <label>:226                                     ; preds = %223
  call void @fput(%struct.file* %82) #6
  br label %fdput.exit6.i

fdput.exit6.i:                                    ; preds = %226, %223, %79, %rw_verify_area.exit.i, %25, %20
  %retval.1.i = phi i64 [ %77, %rw_verify_area.exit.i ], [ -9, %79 ], [ -29, %25 ], [ -9, %20 ], [ %retval.0.i, %223 ], [ %retval.0.i, %226 ]
  %227 = and i64 %16, 1
  %228 = icmp eq i64 %227, 0
  br i1 %228, label %do_sendfile.exit, label %229

; <label>:229                                     ; preds = %fdput.exit6.i
  call void @fput(%struct.file* %18) #6
  br label %do_sendfile.exit

do_sendfile.exit:                                 ; preds = %229, %fdput.exit6.i, %12
  %retval.2.i = phi i64 [ -9, %12 ], [ %retval.1.i, %fdput.exit6.i ], [ %retval.1.i, %229 ]
  %230 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %230) #4
  %231 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %231) #4
  %232 = load i64* %pos.i, align 8
  %233 = call i64 asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i64 %232, i64* %3) #4, !srcloc !8
  %234 = trunc i64 %233 to i32
  %235 = icmp eq i32 %234, 0
  %..i = select i1 %235, i64 %retval.2.i, i64 -14
  br label %SYSC_sendfile.exit

; <label>:236                                     ; preds = %0
  %237 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %237) #4
  %238 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %238) #4
  %239 = call i64 @__fdget(i32 %2) #6
  %240 = and i64 %239, -4
  %241 = inttoptr i64 %240 to %struct.file*
  %242 = icmp eq i64 %240, 0
  br i1 %242, label %do_sendfile.exit26, label %243

; <label>:243                                     ; preds = %236
  %244 = getelementptr inbounds %struct.file* %241, i64 0, i32 7
  %245 = load i32* %244, align 4
  %246 = and i32 %245, 1
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %fdput.exit6.i24, label %248

; <label>:248                                     ; preds = %243
  %249 = getelementptr inbounds %struct.file* %241, i64 0, i32 9
  %250 = load i64* %249, align 8
  store i64 %250, i64* %pos.i4, align 8
  %251 = getelementptr inbounds %struct.file* %241, i64 0, i32 2
  %252 = load %struct.inode** %251, align 8
  %253 = icmp slt i64 %count, 0
  br i1 %253, label %rw_verify_area.exit.i9, label %254, !prof !4

; <label>:254                                     ; preds = %248
  %255 = load i64* %pos.i4, align 8
  %256 = icmp slt i64 %255, 0
  br i1 %256, label %257, label %265, !prof !4

; <label>:257                                     ; preds = %254
  %258 = getelementptr inbounds %struct.file* %241, i64 0, i32 7
  %259 = load i32* %258, align 4
  %260 = and i32 %259, 8192
  %261 = icmp eq i32 %260, 0
  br i1 %261, label %rw_verify_area.exit.i9, label %262

; <label>:262                                     ; preds = %257
  %263 = sub i64 0, %255
  %264 = icmp ult i64 %count, %263
  br i1 %264, label %273, label %rw_verify_area.exit.i9

; <label>:265                                     ; preds = %254
  %266 = add i64 %255, %count
  %267 = icmp slt i64 %266, 0
  br i1 %267, label %268, label %273, !prof !4

; <label>:268                                     ; preds = %265
  %269 = getelementptr inbounds %struct.file* %241, i64 0, i32 7
  %270 = load i32* %269, align 4
  %271 = and i32 %270, 8192
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %rw_verify_area.exit.i9, label %273

; <label>:273                                     ; preds = %268, %265, %262
  %274 = getelementptr inbounds %struct.inode* %252, i64 0, i32 35
  %275 = load %struct.file_lock** %274, align 8
  %276 = icmp eq %struct.file_lock* %275, null
  br i1 %276, label %.critedge.i.i7, label %277

; <label>:277                                     ; preds = %273
  %278 = getelementptr inbounds %struct.inode* %252, i64 0, i32 8
  %279 = load %struct.super_block** %278, align 8
  %280 = getelementptr inbounds %struct.super_block* %279, i64 0, i32 10
  %281 = load i64* %280, align 8
  %282 = and i64 %281, 64
  %283 = icmp eq i64 %282, 0
  br i1 %283, label %.critedge.i.i7, label %mandatory_lock.exit.i.i6

mandatory_lock.exit.i.i6:                         ; preds = %277
  %284 = getelementptr inbounds %struct.inode* %252, i64 0, i32 0
  %285 = load i16* %284, align 2
  %286 = and i16 %285, 1032
  %287 = icmp eq i16 %286, 1024
  br i1 %287, label %288, label %.critedge.i.i7, !prof !4

; <label>:288                                     ; preds = %mandatory_lock.exit.i.i6
  %289 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %252, %struct.file* %241, i64 %255, i64 %count) #6
  %290 = icmp slt i32 %289, 0
  br i1 %290, label %rw_verify_area.exit.i9, label %.critedge.i.i7

.critedge.i.i7:                                   ; preds = %288, %mandatory_lock.exit.i.i6, %277, %273
  %291 = call i32 @security_file_permission(%struct.file* %241, i32 4) #6
  %292 = icmp eq i32 %291, 0
  br i1 %292, label %293, label %rw_verify_area.exit.i9

; <label>:293                                     ; preds = %.critedge.i.i7
  %294 = icmp ugt i64 %count, 2147479552
  %295 = trunc i64 %count to i32
  %296 = select i1 %294, i32 2147479552, i32 %295
  br label %rw_verify_area.exit.i9

rw_verify_area.exit.i9:                           ; preds = %293, %.critedge.i.i7, %288, %268, %262, %257, %248
  %.0.i.i8 = phi i32 [ %296, %293 ], [ -22, %248 ], [ -22, %257 ], [ -75, %262 ], [ -22, %268 ], [ %289, %288 ], [ %291, %.critedge.i.i7 ]
  %297 = sext i32 %.0.i.i8 to i64
  %298 = icmp slt i32 %.0.i.i8, 0
  br i1 %298, label %fdput.exit6.i24, label %299

; <label>:299                                     ; preds = %rw_verify_area.exit.i9
  %300 = call i64 @__fdget(i32 %1) #6
  %301 = and i64 %300, -4
  %302 = inttoptr i64 %301 to %struct.file*
  %303 = icmp eq i64 %301, 0
  br i1 %303, label %fdput.exit6.i24, label %304

; <label>:304                                     ; preds = %299
  %305 = getelementptr inbounds %struct.file* %302, i64 0, i32 7
  %306 = load i32* %305, align 4
  %307 = and i32 %306, 2
  %308 = icmp eq i32 %307, 0
  br i1 %308, label %454, label %309

; <label>:309                                     ; preds = %304
  %310 = getelementptr inbounds %struct.file* %241, i64 0, i32 2
  %311 = load %struct.inode** %310, align 8
  %312 = getelementptr inbounds %struct.file* %302, i64 0, i32 2
  %313 = load %struct.inode** %312, align 8
  %314 = getelementptr inbounds %struct.file* %302, i64 0, i32 9
  %315 = load i64* %314, align 8
  store i64 %315, i64* %out_pos.i5, align 8
  %316 = getelementptr inbounds %struct.file* %302, i64 0, i32 2
  %317 = load %struct.inode** %316, align 8
  %318 = icmp slt i64 %297, 0
  br i1 %318, label %rw_verify_area.exit4.i13, label %319, !prof !4

; <label>:319                                     ; preds = %309
  %320 = load i64* %out_pos.i5, align 8
  %321 = icmp slt i64 %320, 0
  br i1 %321, label %322, label %330, !prof !4

; <label>:322                                     ; preds = %319
  %323 = getelementptr inbounds %struct.file* %302, i64 0, i32 7
  %324 = load i32* %323, align 4
  %325 = and i32 %324, 8192
  %326 = icmp eq i32 %325, 0
  br i1 %326, label %rw_verify_area.exit4.i13, label %327

; <label>:327                                     ; preds = %322
  %328 = sub i64 0, %320
  %329 = icmp ult i64 %297, %328
  br i1 %329, label %338, label %rw_verify_area.exit4.i13

; <label>:330                                     ; preds = %319
  %331 = add i64 %320, %297
  %332 = icmp slt i64 %331, 0
  br i1 %332, label %333, label %338, !prof !4

; <label>:333                                     ; preds = %330
  %334 = getelementptr inbounds %struct.file* %302, i64 0, i32 7
  %335 = load i32* %334, align 4
  %336 = and i32 %335, 8192
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %rw_verify_area.exit4.i13, label %338

; <label>:338                                     ; preds = %333, %330, %327
  %339 = getelementptr inbounds %struct.inode* %317, i64 0, i32 35
  %340 = load %struct.file_lock** %339, align 8
  %341 = icmp eq %struct.file_lock* %340, null
  br i1 %341, label %.critedge.i2.i11, label %342

; <label>:342                                     ; preds = %338
  %343 = getelementptr inbounds %struct.inode* %317, i64 0, i32 8
  %344 = load %struct.super_block** %343, align 8
  %345 = getelementptr inbounds %struct.super_block* %344, i64 0, i32 10
  %346 = load i64* %345, align 8
  %347 = and i64 %346, 64
  %348 = icmp eq i64 %347, 0
  br i1 %348, label %.critedge.i2.i11, label %mandatory_lock.exit.i1.i10

mandatory_lock.exit.i1.i10:                       ; preds = %342
  %349 = getelementptr inbounds %struct.inode* %317, i64 0, i32 0
  %350 = load i16* %349, align 2
  %351 = and i16 %350, 1032
  %352 = icmp eq i16 %351, 1024
  br i1 %352, label %353, label %.critedge.i2.i11, !prof !4

; <label>:353                                     ; preds = %mandatory_lock.exit.i1.i10
  %354 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %317, %struct.file* %302, i64 %320, i64 %297) #6
  %355 = icmp slt i32 %354, 0
  br i1 %355, label %rw_verify_area.exit4.i13, label %.critedge.i2.i11

.critedge.i2.i11:                                 ; preds = %353, %mandatory_lock.exit.i1.i10, %342, %338
  %356 = call i32 @security_file_permission(%struct.file* %302, i32 2) #6
  %357 = icmp eq i32 %356, 0
  br i1 %357, label %358, label %rw_verify_area.exit4.i13

; <label>:358                                     ; preds = %.critedge.i2.i11
  %359 = icmp ugt i64 %297, 2147479552
  %360 = trunc i64 %297 to i32
  %361 = select i1 %359, i32 2147479552, i32 %360
  br label %rw_verify_area.exit4.i13

rw_verify_area.exit4.i13:                         ; preds = %358, %.critedge.i2.i11, %353, %333, %327, %322, %309
  %.0.i3.i12 = phi i32 [ %361, %358 ], [ -22, %309 ], [ -22, %322 ], [ -75, %327 ], [ -22, %333 ], [ %354, %353 ], [ %356, %.critedge.i2.i11 ]
  %362 = sext i32 %.0.i3.i12 to i64
  %363 = icmp slt i32 %.0.i3.i12, 0
  br i1 %363, label %454, label %364

; <label>:364                                     ; preds = %rw_verify_area.exit4.i13
  %365 = getelementptr inbounds %struct.inode* %311, i64 0, i32 8
  %366 = load %struct.super_block** %365, align 8
  %367 = getelementptr inbounds %struct.super_block* %366, i64 0, i32 4
  %368 = load i64* %367, align 8
  %369 = getelementptr inbounds %struct.inode* %313, i64 0, i32 8
  %370 = load %struct.super_block** %369, align 8
  %371 = getelementptr inbounds %struct.super_block* %370, i64 0, i32 4
  %372 = load i64* %371, align 8
  %373 = icmp slt i64 %368, %372
  %374 = select i1 %373, i64 %368, i64 %372
  %375 = add i64 %250, %362
  %376 = icmp ugt i64 %375, %374
  br i1 %376, label %377, label %381, !prof !4

; <label>:377                                     ; preds = %364
  %378 = icmp sgt i64 %374, %250
  br i1 %378, label %379, label %454

; <label>:379                                     ; preds = %377
  %380 = sub i64 %374, %250
  br label %381

; <label>:381                                     ; preds = %379, %364
  %.0.i14 = phi i64 [ %380, %379 ], [ %362, %364 ]
  %382 = load %struct.inode** %312, align 8
  %383 = getelementptr inbounds %struct.inode* %382, i64 0, i32 0
  %384 = load i16* %383, align 2
  %385 = and i16 %384, -4096
  %386 = icmp eq i16 %385, -32768
  br i1 %386, label %387, label %file_start_write.exit.i15

; <label>:387                                     ; preds = %381
  %388 = getelementptr inbounds %struct.inode* %382, i64 0, i32 8
  %389 = load %struct.super_block** %388, align 8
  %390 = call i32 @__sb_start_write(%struct.super_block* %389, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i15

file_start_write.exit.i15:                        ; preds = %387, %381
  %391 = call i64 @do_splice_direct(%struct.file* %241, i64* %pos.i4, %struct.file* %302, i64* %out_pos.i5, i64 %.0.i14, i32 0) #6
  %392 = load %struct.inode** %312, align 8
  %393 = getelementptr inbounds %struct.inode* %392, i64 0, i32 0
  %394 = load i16* %393, align 2
  %395 = and i16 %394, -4096
  %396 = icmp eq i16 %395, -32768
  br i1 %396, label %397, label %file_end_write.exit.i16

; <label>:397                                     ; preds = %file_start_write.exit.i15
  %398 = getelementptr inbounds %struct.inode* %392, i64 0, i32 8
  %399 = load %struct.super_block** %398, align 8
  call void @__sb_end_write(%struct.super_block* %399, i32 1) #6
  br label %file_end_write.exit.i16

file_end_write.exit.i16:                          ; preds = %397, %file_start_write.exit.i15
  %400 = icmp sgt i64 %391, 0
  br i1 %400, label %401, label %443

; <label>:401                                     ; preds = %file_end_write.exit.i16
  %402 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %403 = getelementptr inbounds %struct.task_struct* %402, i64 0, i32 113, i32 0
  %404 = load i64* %403, align 8
  %405 = add i64 %404, %391
  store i64 %405, i64* %403, align 8
  %406 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %407 = getelementptr inbounds %struct.task_struct* %406, i64 0, i32 113, i32 1
  %408 = load i64* %407, align 8
  %409 = add i64 %408, %391
  store i64 %409, i64* %407, align 8
  %410 = getelementptr inbounds %struct.file* %241, i64 0, i32 1
  %411 = load %struct.inode** %310, align 8
  %412 = getelementptr inbounds %struct.inode* %411, i64 0, i32 0
  %413 = load i16* %412, align 2
  %414 = and i16 %413, -4096
  %415 = icmp eq i16 %414, 16384
  %..i.i17 = select i1 %415, i32 1073741825, i32 1
  %416 = load i32* %244, align 4
  %417 = and i32 %416, 67108864
  %418 = icmp eq i32 %417, 0
  br i1 %418, label %419, label %fsnotify_access.exit.i19

; <label>:419                                     ; preds = %401
  %420 = getelementptr inbounds %struct.file* %241, i64 0, i32 1, i32 1
  %421 = load %struct.dentry** %420, align 8
  %422 = call i32 @__fsnotify_parent(%struct.path* %410, %struct.dentry* %421, i32 %..i.i17) #6
  %423 = bitcast %struct.path* %410 to i8*
  %424 = call i32 @fsnotify(%struct.inode* %411, i32 %..i.i17, i8* %423, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i19

fsnotify_access.exit.i19:                         ; preds = %419, %401
  %425 = getelementptr inbounds %struct.file* %302, i64 0, i32 1
  %426 = load %struct.inode** %312, align 8
  %427 = getelementptr inbounds %struct.inode* %426, i64 0, i32 0
  %428 = load i16* %427, align 2
  %429 = and i16 %428, -4096
  %430 = icmp eq i16 %429, 16384
  %..i7.i18 = select i1 %430, i32 1073741826, i32 2
  %431 = load i32* %305, align 4
  %432 = and i32 %431, 67108864
  %433 = icmp eq i32 %432, 0
  br i1 %433, label %434, label %fsnotify_modify.exit.i20

; <label>:434                                     ; preds = %fsnotify_access.exit.i19
  %435 = getelementptr inbounds %struct.file* %302, i64 0, i32 1, i32 1
  %436 = load %struct.dentry** %435, align 8
  %437 = call i32 @__fsnotify_parent(%struct.path* %425, %struct.dentry* %436, i32 %..i7.i18) #6
  %438 = bitcast %struct.path* %425 to i8*
  %439 = call i32 @fsnotify(%struct.inode* %426, i32 %..i7.i18, i8* %438, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i20

fsnotify_modify.exit.i20:                         ; preds = %434, %fsnotify_access.exit.i19
  %440 = load i64* %out_pos.i5, align 8
  store i64 %440, i64* %314, align 8
  %441 = load i64* %pos.i4, align 8
  %442 = getelementptr inbounds %struct.file* %241, i64 0, i32 9
  store i64 %441, i64* %442, align 8
  br label %443

; <label>:443                                     ; preds = %fsnotify_modify.exit.i20, %file_end_write.exit.i16
  %444 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %445 = getelementptr inbounds %struct.task_struct* %444, i64 0, i32 113, i32 2
  %446 = load i64* %445, align 8
  %447 = add i64 %446, 1
  store i64 %447, i64* %445, align 8
  %448 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %449 = getelementptr inbounds %struct.task_struct* %448, i64 0, i32 113, i32 3
  %450 = load i64* %449, align 8
  %451 = add i64 %450, 1
  store i64 %451, i64* %449, align 8
  %452 = load i64* %pos.i4, align 8
  %453 = icmp sgt i64 %452, %374
  %..i21 = select i1 %453, i64 -75, i64 %391
  br label %454

; <label>:454                                     ; preds = %443, %377, %rw_verify_area.exit4.i13, %304
  %retval.0.i22 = phi i64 [ %362, %rw_verify_area.exit4.i13 ], [ -75, %377 ], [ -9, %304 ], [ %..i21, %443 ]
  %455 = and i64 %300, 1
  %456 = icmp eq i64 %455, 0
  br i1 %456, label %fdput.exit6.i24, label %457

; <label>:457                                     ; preds = %454
  call void @fput(%struct.file* %302) #6
  br label %fdput.exit6.i24

fdput.exit6.i24:                                  ; preds = %457, %454, %299, %rw_verify_area.exit.i9, %243
  %retval.1.i23 = phi i64 [ %297, %rw_verify_area.exit.i9 ], [ -9, %299 ], [ -9, %243 ], [ %retval.0.i22, %454 ], [ %retval.0.i22, %457 ]
  %458 = and i64 %239, 1
  %459 = icmp eq i64 %458, 0
  br i1 %459, label %do_sendfile.exit26, label %460

; <label>:460                                     ; preds = %fdput.exit6.i24
  call void @fput(%struct.file* %241) #6
  br label %do_sendfile.exit26

do_sendfile.exit26:                               ; preds = %460, %fdput.exit6.i24, %236
  %retval.2.i25 = phi i64 [ -9, %236 ], [ %retval.1.i23, %fdput.exit6.i24 ], [ %retval.1.i23, %460 ]
  %461 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %461) #4
  %462 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %462) #4
  br label %SYSC_sendfile.exit

SYSC_sendfile.exit:                               ; preds = %do_sendfile.exit26, %do_sendfile.exit, %6
  %.0.i = phi i64 [ %retval.2.i25, %do_sendfile.exit26 ], [ -14, %6 ], [ %..i, %do_sendfile.exit ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @SyS_sendfile64(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i4 = alloca i64, align 8
  %out_pos.i5 = alloca i64, align 8
  %pos.i1 = alloca i64, align 8
  %out_pos.i = alloca i64, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i64*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %242, label %copy_from_user.exit.i

copy_from_user.exit.i:                            ; preds = %0
  %6 = inttoptr i64 %offset to i8*
  %7 = call i64 @_copy_from_user(i8* %4, i8* %6, i32 8) #6
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %SYSC_sendfile64.exit, !prof !7

; <label>:9                                       ; preds = %copy_from_user.exit.i
  %10 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %10) #4
  %11 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %11) #4
  %12 = call i64 @__fdget(i32 %2) #6
  %13 = and i64 %12, -4
  %14 = inttoptr i64 %13 to %struct.file*
  %15 = icmp eq i64 %13, 0
  br i1 %15, label %do_sendfile.exit, label %16

; <label>:16                                      ; preds = %9
  %17 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %fdput.exit6.i, label %21

; <label>:21                                      ; preds = %16
  %22 = load i64* %pos.i, align 8
  store i64 %22, i64* %pos.i1, align 8
  %23 = load i32* %17, align 4
  %24 = and i32 %23, 8
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %fdput.exit6.i, label %26

; <label>:26                                      ; preds = %21
  %27 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %28 = load %struct.inode** %27, align 8
  %29 = icmp slt i64 %count, 0
  br i1 %29, label %rw_verify_area.exit.i, label %30, !prof !4

; <label>:30                                      ; preds = %26
  %31 = load i64* %pos.i1, align 8
  %32 = icmp slt i64 %31, 0
  br i1 %32, label %33, label %41, !prof !4

; <label>:33                                      ; preds = %30
  %34 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %35 = load i32* %34, align 4
  %36 = and i32 %35, 8192
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %rw_verify_area.exit.i, label %38

; <label>:38                                      ; preds = %33
  %39 = sub i64 0, %31
  %40 = icmp ult i64 %count, %39
  br i1 %40, label %49, label %rw_verify_area.exit.i

; <label>:41                                      ; preds = %30
  %42 = add i64 %31, %count
  %43 = icmp slt i64 %42, 0
  br i1 %43, label %44, label %49, !prof !4

; <label>:44                                      ; preds = %41
  %45 = getelementptr inbounds %struct.file* %14, i64 0, i32 7
  %46 = load i32* %45, align 4
  %47 = and i32 %46, 8192
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %rw_verify_area.exit.i, label %49

; <label>:49                                      ; preds = %44, %41, %38
  %50 = getelementptr inbounds %struct.inode* %28, i64 0, i32 35
  %51 = load %struct.file_lock** %50, align 8
  %52 = icmp eq %struct.file_lock* %51, null
  br i1 %52, label %.critedge.i.i, label %53

; <label>:53                                      ; preds = %49
  %54 = getelementptr inbounds %struct.inode* %28, i64 0, i32 8
  %55 = load %struct.super_block** %54, align 8
  %56 = getelementptr inbounds %struct.super_block* %55, i64 0, i32 10
  %57 = load i64* %56, align 8
  %58 = and i64 %57, 64
  %59 = icmp eq i64 %58, 0
  br i1 %59, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %53
  %60 = getelementptr inbounds %struct.inode* %28, i64 0, i32 0
  %61 = load i16* %60, align 2
  %62 = and i16 %61, 1032
  %63 = icmp eq i16 %62, 1024
  br i1 %63, label %64, label %.critedge.i.i, !prof !4

; <label>:64                                      ; preds = %mandatory_lock.exit.i.i
  %65 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %28, %struct.file* %14, i64 %31, i64 %count) #6
  %66 = icmp slt i32 %65, 0
  br i1 %66, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %64, %mandatory_lock.exit.i.i, %53, %49
  %67 = call i32 @security_file_permission(%struct.file* %14, i32 4) #6
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %rw_verify_area.exit.i

; <label>:69                                      ; preds = %.critedge.i.i
  %70 = icmp ugt i64 %count, 2147479552
  %71 = trunc i64 %count to i32
  %72 = select i1 %70, i32 2147479552, i32 %71
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %69, %.critedge.i.i, %64, %44, %38, %33, %26
  %.0.i.i = phi i32 [ %72, %69 ], [ -22, %26 ], [ -22, %33 ], [ -75, %38 ], [ -22, %44 ], [ %65, %64 ], [ %67, %.critedge.i.i ]
  %73 = sext i32 %.0.i.i to i64
  %74 = icmp slt i32 %.0.i.i, 0
  br i1 %74, label %fdput.exit6.i, label %75

; <label>:75                                      ; preds = %rw_verify_area.exit.i
  %76 = call i64 @__fdget(i32 %1) #6
  %77 = and i64 %76, -4
  %78 = inttoptr i64 %77 to %struct.file*
  %79 = icmp eq i64 %77, 0
  br i1 %79, label %fdput.exit6.i, label %80

; <label>:80                                      ; preds = %75
  %81 = getelementptr inbounds %struct.file* %78, i64 0, i32 7
  %82 = load i32* %81, align 4
  %83 = and i32 %82, 2
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %229, label %85

; <label>:85                                      ; preds = %80
  %86 = getelementptr inbounds %struct.file* %14, i64 0, i32 2
  %87 = load %struct.inode** %86, align 8
  %88 = getelementptr inbounds %struct.file* %78, i64 0, i32 2
  %89 = load %struct.inode** %88, align 8
  %90 = getelementptr inbounds %struct.file* %78, i64 0, i32 9
  %91 = load i64* %90, align 8
  store i64 %91, i64* %out_pos.i, align 8
  %92 = getelementptr inbounds %struct.file* %78, i64 0, i32 2
  %93 = load %struct.inode** %92, align 8
  %94 = icmp slt i64 %73, 0
  br i1 %94, label %rw_verify_area.exit4.i, label %95, !prof !4

; <label>:95                                      ; preds = %85
  %96 = load i64* %out_pos.i, align 8
  %97 = icmp slt i64 %96, 0
  br i1 %97, label %98, label %106, !prof !4

; <label>:98                                      ; preds = %95
  %99 = getelementptr inbounds %struct.file* %78, i64 0, i32 7
  %100 = load i32* %99, align 4
  %101 = and i32 %100, 8192
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %rw_verify_area.exit4.i, label %103

; <label>:103                                     ; preds = %98
  %104 = sub i64 0, %96
  %105 = icmp ult i64 %73, %104
  br i1 %105, label %114, label %rw_verify_area.exit4.i

; <label>:106                                     ; preds = %95
  %107 = add i64 %96, %73
  %108 = icmp slt i64 %107, 0
  br i1 %108, label %109, label %114, !prof !4

; <label>:109                                     ; preds = %106
  %110 = getelementptr inbounds %struct.file* %78, i64 0, i32 7
  %111 = load i32* %110, align 4
  %112 = and i32 %111, 8192
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %rw_verify_area.exit4.i, label %114

; <label>:114                                     ; preds = %109, %106, %103
  %115 = getelementptr inbounds %struct.inode* %93, i64 0, i32 35
  %116 = load %struct.file_lock** %115, align 8
  %117 = icmp eq %struct.file_lock* %116, null
  br i1 %117, label %.critedge.i2.i, label %118

; <label>:118                                     ; preds = %114
  %119 = getelementptr inbounds %struct.inode* %93, i64 0, i32 8
  %120 = load %struct.super_block** %119, align 8
  %121 = getelementptr inbounds %struct.super_block* %120, i64 0, i32 10
  %122 = load i64* %121, align 8
  %123 = and i64 %122, 64
  %124 = icmp eq i64 %123, 0
  br i1 %124, label %.critedge.i2.i, label %mandatory_lock.exit.i1.i

mandatory_lock.exit.i1.i:                         ; preds = %118
  %125 = getelementptr inbounds %struct.inode* %93, i64 0, i32 0
  %126 = load i16* %125, align 2
  %127 = and i16 %126, 1032
  %128 = icmp eq i16 %127, 1024
  br i1 %128, label %129, label %.critedge.i2.i, !prof !4

; <label>:129                                     ; preds = %mandatory_lock.exit.i1.i
  %130 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %93, %struct.file* %78, i64 %96, i64 %73) #6
  %131 = icmp slt i32 %130, 0
  br i1 %131, label %rw_verify_area.exit4.i, label %.critedge.i2.i

.critedge.i2.i:                                   ; preds = %129, %mandatory_lock.exit.i1.i, %118, %114
  %132 = call i32 @security_file_permission(%struct.file* %78, i32 2) #6
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %rw_verify_area.exit4.i

; <label>:134                                     ; preds = %.critedge.i2.i
  %135 = icmp ugt i64 %73, 2147479552
  %136 = trunc i64 %73 to i32
  %137 = select i1 %135, i32 2147479552, i32 %136
  br label %rw_verify_area.exit4.i

rw_verify_area.exit4.i:                           ; preds = %134, %.critedge.i2.i, %129, %109, %103, %98, %85
  %.0.i3.i = phi i32 [ %137, %134 ], [ -22, %85 ], [ -22, %98 ], [ -75, %103 ], [ -22, %109 ], [ %130, %129 ], [ %132, %.critedge.i2.i ]
  %138 = sext i32 %.0.i3.i to i64
  %139 = icmp slt i32 %.0.i3.i, 0
  br i1 %139, label %229, label %140

; <label>:140                                     ; preds = %rw_verify_area.exit4.i
  %141 = getelementptr inbounds %struct.inode* %87, i64 0, i32 8
  %142 = load %struct.super_block** %141, align 8
  %143 = getelementptr inbounds %struct.super_block* %142, i64 0, i32 4
  %144 = load i64* %143, align 8
  %145 = getelementptr inbounds %struct.inode* %89, i64 0, i32 8
  %146 = load %struct.super_block** %145, align 8
  %147 = getelementptr inbounds %struct.super_block* %146, i64 0, i32 4
  %148 = load i64* %147, align 8
  %149 = icmp slt i64 %144, %148
  %150 = select i1 %149, i64 %144, i64 %148
  %151 = add i64 %22, %138
  %152 = icmp ugt i64 %151, %150
  br i1 %152, label %153, label %157, !prof !4

; <label>:153                                     ; preds = %140
  %154 = icmp sgt i64 %150, %22
  br i1 %154, label %155, label %229

; <label>:155                                     ; preds = %153
  %156 = sub i64 %150, %22
  br label %157

; <label>:157                                     ; preds = %155, %140
  %.0.i2 = phi i64 [ %156, %155 ], [ %138, %140 ]
  %158 = load %struct.inode** %88, align 8
  %159 = getelementptr inbounds %struct.inode* %158, i64 0, i32 0
  %160 = load i16* %159, align 2
  %161 = and i16 %160, -4096
  %162 = icmp eq i16 %161, -32768
  br i1 %162, label %163, label %file_start_write.exit.i

; <label>:163                                     ; preds = %157
  %164 = getelementptr inbounds %struct.inode* %158, i64 0, i32 8
  %165 = load %struct.super_block** %164, align 8
  %166 = call i32 @__sb_start_write(%struct.super_block* %165, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %163, %157
  %167 = call i64 @do_splice_direct(%struct.file* %14, i64* %pos.i1, %struct.file* %78, i64* %out_pos.i, i64 %.0.i2, i32 0) #6
  %168 = load %struct.inode** %88, align 8
  %169 = getelementptr inbounds %struct.inode* %168, i64 0, i32 0
  %170 = load i16* %169, align 2
  %171 = and i16 %170, -4096
  %172 = icmp eq i16 %171, -32768
  br i1 %172, label %173, label %file_end_write.exit.i

; <label>:173                                     ; preds = %file_start_write.exit.i
  %174 = getelementptr inbounds %struct.inode* %168, i64 0, i32 8
  %175 = load %struct.super_block** %174, align 8
  call void @__sb_end_write(%struct.super_block* %175, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %173, %file_start_write.exit.i
  %176 = icmp sgt i64 %167, 0
  br i1 %176, label %177, label %218

; <label>:177                                     ; preds = %file_end_write.exit.i
  %178 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %179 = getelementptr inbounds %struct.task_struct* %178, i64 0, i32 113, i32 0
  %180 = load i64* %179, align 8
  %181 = add i64 %180, %167
  store i64 %181, i64* %179, align 8
  %182 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %183 = getelementptr inbounds %struct.task_struct* %182, i64 0, i32 113, i32 1
  %184 = load i64* %183, align 8
  %185 = add i64 %184, %167
  store i64 %185, i64* %183, align 8
  %186 = getelementptr inbounds %struct.file* %14, i64 0, i32 1
  %187 = load %struct.inode** %86, align 8
  %188 = getelementptr inbounds %struct.inode* %187, i64 0, i32 0
  %189 = load i16* %188, align 2
  %190 = and i16 %189, -4096
  %191 = icmp eq i16 %190, 16384
  %..i.i = select i1 %191, i32 1073741825, i32 1
  %192 = load i32* %17, align 4
  %193 = and i32 %192, 67108864
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %fsnotify_access.exit.i

; <label>:195                                     ; preds = %177
  %196 = getelementptr inbounds %struct.file* %14, i64 0, i32 1, i32 1
  %197 = load %struct.dentry** %196, align 8
  %198 = call i32 @__fsnotify_parent(%struct.path* %186, %struct.dentry* %197, i32 %..i.i) #6
  %199 = bitcast %struct.path* %186 to i8*
  %200 = call i32 @fsnotify(%struct.inode* %187, i32 %..i.i, i8* %199, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i

fsnotify_access.exit.i:                           ; preds = %195, %177
  %201 = getelementptr inbounds %struct.file* %78, i64 0, i32 1
  %202 = load %struct.inode** %88, align 8
  %203 = getelementptr inbounds %struct.inode* %202, i64 0, i32 0
  %204 = load i16* %203, align 2
  %205 = and i16 %204, -4096
  %206 = icmp eq i16 %205, 16384
  %..i7.i = select i1 %206, i32 1073741826, i32 2
  %207 = load i32* %81, align 4
  %208 = and i32 %207, 67108864
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %210, label %fsnotify_modify.exit.i

; <label>:210                                     ; preds = %fsnotify_access.exit.i
  %211 = getelementptr inbounds %struct.file* %78, i64 0, i32 1, i32 1
  %212 = load %struct.dentry** %211, align 8
  %213 = call i32 @__fsnotify_parent(%struct.path* %201, %struct.dentry* %212, i32 %..i7.i) #6
  %214 = bitcast %struct.path* %201 to i8*
  %215 = call i32 @fsnotify(%struct.inode* %202, i32 %..i7.i, i8* %214, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i

fsnotify_modify.exit.i:                           ; preds = %210, %fsnotify_access.exit.i
  %216 = load i64* %out_pos.i, align 8
  store i64 %216, i64* %90, align 8
  %217 = load i64* %pos.i1, align 8
  store i64 %217, i64* %pos.i, align 8
  br label %218

; <label>:218                                     ; preds = %fsnotify_modify.exit.i, %file_end_write.exit.i
  %219 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %220 = getelementptr inbounds %struct.task_struct* %219, i64 0, i32 113, i32 2
  %221 = load i64* %220, align 8
  %222 = add i64 %221, 1
  store i64 %222, i64* %220, align 8
  %223 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %224 = getelementptr inbounds %struct.task_struct* %223, i64 0, i32 113, i32 3
  %225 = load i64* %224, align 8
  %226 = add i64 %225, 1
  store i64 %226, i64* %224, align 8
  %227 = load i64* %pos.i1, align 8
  %228 = icmp sgt i64 %227, %150
  %..i3 = select i1 %228, i64 -75, i64 %167
  br label %229

; <label>:229                                     ; preds = %218, %153, %rw_verify_area.exit4.i, %80
  %retval.0.i = phi i64 [ %138, %rw_verify_area.exit4.i ], [ -75, %153 ], [ -9, %80 ], [ %..i3, %218 ]
  %230 = and i64 %76, 1
  %231 = icmp eq i64 %230, 0
  br i1 %231, label %fdput.exit6.i, label %232

; <label>:232                                     ; preds = %229
  call void @fput(%struct.file* %78) #6
  br label %fdput.exit6.i

fdput.exit6.i:                                    ; preds = %232, %229, %75, %rw_verify_area.exit.i, %21, %16
  %retval.1.i = phi i64 [ %73, %rw_verify_area.exit.i ], [ -9, %75 ], [ -29, %21 ], [ -9, %16 ], [ %retval.0.i, %229 ], [ %retval.0.i, %232 ]
  %233 = and i64 %12, 1
  %234 = icmp eq i64 %233, 0
  br i1 %234, label %do_sendfile.exit, label %235

; <label>:235                                     ; preds = %fdput.exit6.i
  call void @fput(%struct.file* %14) #6
  br label %do_sendfile.exit

do_sendfile.exit:                                 ; preds = %235, %fdput.exit6.i, %9
  %retval.2.i = phi i64 [ -9, %9 ], [ %retval.1.i, %fdput.exit6.i ], [ %retval.1.i, %235 ]
  %236 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %236) #4
  %237 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %237) #4
  %238 = load i64* %pos.i, align 8
  %239 = call i64 asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i64 %238, i64* %3) #4, !srcloc !9
  %240 = trunc i64 %239 to i32
  %241 = icmp eq i32 %240, 0
  %..i = select i1 %241, i64 %retval.2.i, i64 -14
  br label %SYSC_sendfile64.exit

; <label>:242                                     ; preds = %0
  %243 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %243) #4
  %244 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %244) #4
  %245 = call i64 @__fdget(i32 %2) #6
  %246 = and i64 %245, -4
  %247 = inttoptr i64 %246 to %struct.file*
  %248 = icmp eq i64 %246, 0
  br i1 %248, label %do_sendfile.exit26, label %249

; <label>:249                                     ; preds = %242
  %250 = getelementptr inbounds %struct.file* %247, i64 0, i32 7
  %251 = load i32* %250, align 4
  %252 = and i32 %251, 1
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %fdput.exit6.i24, label %254

; <label>:254                                     ; preds = %249
  %255 = getelementptr inbounds %struct.file* %247, i64 0, i32 9
  %256 = load i64* %255, align 8
  store i64 %256, i64* %pos.i4, align 8
  %257 = getelementptr inbounds %struct.file* %247, i64 0, i32 2
  %258 = load %struct.inode** %257, align 8
  %259 = icmp slt i64 %count, 0
  br i1 %259, label %rw_verify_area.exit.i9, label %260, !prof !4

; <label>:260                                     ; preds = %254
  %261 = load i64* %pos.i4, align 8
  %262 = icmp slt i64 %261, 0
  br i1 %262, label %263, label %271, !prof !4

; <label>:263                                     ; preds = %260
  %264 = getelementptr inbounds %struct.file* %247, i64 0, i32 7
  %265 = load i32* %264, align 4
  %266 = and i32 %265, 8192
  %267 = icmp eq i32 %266, 0
  br i1 %267, label %rw_verify_area.exit.i9, label %268

; <label>:268                                     ; preds = %263
  %269 = sub i64 0, %261
  %270 = icmp ult i64 %count, %269
  br i1 %270, label %279, label %rw_verify_area.exit.i9

; <label>:271                                     ; preds = %260
  %272 = add i64 %261, %count
  %273 = icmp slt i64 %272, 0
  br i1 %273, label %274, label %279, !prof !4

; <label>:274                                     ; preds = %271
  %275 = getelementptr inbounds %struct.file* %247, i64 0, i32 7
  %276 = load i32* %275, align 4
  %277 = and i32 %276, 8192
  %278 = icmp eq i32 %277, 0
  br i1 %278, label %rw_verify_area.exit.i9, label %279

; <label>:279                                     ; preds = %274, %271, %268
  %280 = getelementptr inbounds %struct.inode* %258, i64 0, i32 35
  %281 = load %struct.file_lock** %280, align 8
  %282 = icmp eq %struct.file_lock* %281, null
  br i1 %282, label %.critedge.i.i7, label %283

; <label>:283                                     ; preds = %279
  %284 = getelementptr inbounds %struct.inode* %258, i64 0, i32 8
  %285 = load %struct.super_block** %284, align 8
  %286 = getelementptr inbounds %struct.super_block* %285, i64 0, i32 10
  %287 = load i64* %286, align 8
  %288 = and i64 %287, 64
  %289 = icmp eq i64 %288, 0
  br i1 %289, label %.critedge.i.i7, label %mandatory_lock.exit.i.i6

mandatory_lock.exit.i.i6:                         ; preds = %283
  %290 = getelementptr inbounds %struct.inode* %258, i64 0, i32 0
  %291 = load i16* %290, align 2
  %292 = and i16 %291, 1032
  %293 = icmp eq i16 %292, 1024
  br i1 %293, label %294, label %.critedge.i.i7, !prof !4

; <label>:294                                     ; preds = %mandatory_lock.exit.i.i6
  %295 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %258, %struct.file* %247, i64 %261, i64 %count) #6
  %296 = icmp slt i32 %295, 0
  br i1 %296, label %rw_verify_area.exit.i9, label %.critedge.i.i7

.critedge.i.i7:                                   ; preds = %294, %mandatory_lock.exit.i.i6, %283, %279
  %297 = call i32 @security_file_permission(%struct.file* %247, i32 4) #6
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %299, label %rw_verify_area.exit.i9

; <label>:299                                     ; preds = %.critedge.i.i7
  %300 = icmp ugt i64 %count, 2147479552
  %301 = trunc i64 %count to i32
  %302 = select i1 %300, i32 2147479552, i32 %301
  br label %rw_verify_area.exit.i9

rw_verify_area.exit.i9:                           ; preds = %299, %.critedge.i.i7, %294, %274, %268, %263, %254
  %.0.i.i8 = phi i32 [ %302, %299 ], [ -22, %254 ], [ -22, %263 ], [ -75, %268 ], [ -22, %274 ], [ %295, %294 ], [ %297, %.critedge.i.i7 ]
  %303 = sext i32 %.0.i.i8 to i64
  %304 = icmp slt i32 %.0.i.i8, 0
  br i1 %304, label %fdput.exit6.i24, label %305

; <label>:305                                     ; preds = %rw_verify_area.exit.i9
  %306 = call i64 @__fdget(i32 %1) #6
  %307 = and i64 %306, -4
  %308 = inttoptr i64 %307 to %struct.file*
  %309 = icmp eq i64 %307, 0
  br i1 %309, label %fdput.exit6.i24, label %310

; <label>:310                                     ; preds = %305
  %311 = getelementptr inbounds %struct.file* %308, i64 0, i32 7
  %312 = load i32* %311, align 4
  %313 = and i32 %312, 2
  %314 = icmp eq i32 %313, 0
  br i1 %314, label %460, label %315

; <label>:315                                     ; preds = %310
  %316 = getelementptr inbounds %struct.file* %247, i64 0, i32 2
  %317 = load %struct.inode** %316, align 8
  %318 = getelementptr inbounds %struct.file* %308, i64 0, i32 2
  %319 = load %struct.inode** %318, align 8
  %320 = getelementptr inbounds %struct.file* %308, i64 0, i32 9
  %321 = load i64* %320, align 8
  store i64 %321, i64* %out_pos.i5, align 8
  %322 = getelementptr inbounds %struct.file* %308, i64 0, i32 2
  %323 = load %struct.inode** %322, align 8
  %324 = icmp slt i64 %303, 0
  br i1 %324, label %rw_verify_area.exit4.i13, label %325, !prof !4

; <label>:325                                     ; preds = %315
  %326 = load i64* %out_pos.i5, align 8
  %327 = icmp slt i64 %326, 0
  br i1 %327, label %328, label %336, !prof !4

; <label>:328                                     ; preds = %325
  %329 = getelementptr inbounds %struct.file* %308, i64 0, i32 7
  %330 = load i32* %329, align 4
  %331 = and i32 %330, 8192
  %332 = icmp eq i32 %331, 0
  br i1 %332, label %rw_verify_area.exit4.i13, label %333

; <label>:333                                     ; preds = %328
  %334 = sub i64 0, %326
  %335 = icmp ult i64 %303, %334
  br i1 %335, label %344, label %rw_verify_area.exit4.i13

; <label>:336                                     ; preds = %325
  %337 = add i64 %326, %303
  %338 = icmp slt i64 %337, 0
  br i1 %338, label %339, label %344, !prof !4

; <label>:339                                     ; preds = %336
  %340 = getelementptr inbounds %struct.file* %308, i64 0, i32 7
  %341 = load i32* %340, align 4
  %342 = and i32 %341, 8192
  %343 = icmp eq i32 %342, 0
  br i1 %343, label %rw_verify_area.exit4.i13, label %344

; <label>:344                                     ; preds = %339, %336, %333
  %345 = getelementptr inbounds %struct.inode* %323, i64 0, i32 35
  %346 = load %struct.file_lock** %345, align 8
  %347 = icmp eq %struct.file_lock* %346, null
  br i1 %347, label %.critedge.i2.i11, label %348

; <label>:348                                     ; preds = %344
  %349 = getelementptr inbounds %struct.inode* %323, i64 0, i32 8
  %350 = load %struct.super_block** %349, align 8
  %351 = getelementptr inbounds %struct.super_block* %350, i64 0, i32 10
  %352 = load i64* %351, align 8
  %353 = and i64 %352, 64
  %354 = icmp eq i64 %353, 0
  br i1 %354, label %.critedge.i2.i11, label %mandatory_lock.exit.i1.i10

mandatory_lock.exit.i1.i10:                       ; preds = %348
  %355 = getelementptr inbounds %struct.inode* %323, i64 0, i32 0
  %356 = load i16* %355, align 2
  %357 = and i16 %356, 1032
  %358 = icmp eq i16 %357, 1024
  br i1 %358, label %359, label %.critedge.i2.i11, !prof !4

; <label>:359                                     ; preds = %mandatory_lock.exit.i1.i10
  %360 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %323, %struct.file* %308, i64 %326, i64 %303) #6
  %361 = icmp slt i32 %360, 0
  br i1 %361, label %rw_verify_area.exit4.i13, label %.critedge.i2.i11

.critedge.i2.i11:                                 ; preds = %359, %mandatory_lock.exit.i1.i10, %348, %344
  %362 = call i32 @security_file_permission(%struct.file* %308, i32 2) #6
  %363 = icmp eq i32 %362, 0
  br i1 %363, label %364, label %rw_verify_area.exit4.i13

; <label>:364                                     ; preds = %.critedge.i2.i11
  %365 = icmp ugt i64 %303, 2147479552
  %366 = trunc i64 %303 to i32
  %367 = select i1 %365, i32 2147479552, i32 %366
  br label %rw_verify_area.exit4.i13

rw_verify_area.exit4.i13:                         ; preds = %364, %.critedge.i2.i11, %359, %339, %333, %328, %315
  %.0.i3.i12 = phi i32 [ %367, %364 ], [ -22, %315 ], [ -22, %328 ], [ -75, %333 ], [ -22, %339 ], [ %360, %359 ], [ %362, %.critedge.i2.i11 ]
  %368 = sext i32 %.0.i3.i12 to i64
  %369 = icmp slt i32 %.0.i3.i12, 0
  br i1 %369, label %460, label %370

; <label>:370                                     ; preds = %rw_verify_area.exit4.i13
  %371 = getelementptr inbounds %struct.inode* %317, i64 0, i32 8
  %372 = load %struct.super_block** %371, align 8
  %373 = getelementptr inbounds %struct.super_block* %372, i64 0, i32 4
  %374 = load i64* %373, align 8
  %375 = getelementptr inbounds %struct.inode* %319, i64 0, i32 8
  %376 = load %struct.super_block** %375, align 8
  %377 = getelementptr inbounds %struct.super_block* %376, i64 0, i32 4
  %378 = load i64* %377, align 8
  %379 = icmp slt i64 %374, %378
  %380 = select i1 %379, i64 %374, i64 %378
  %381 = add i64 %256, %368
  %382 = icmp ugt i64 %381, %380
  br i1 %382, label %383, label %387, !prof !4

; <label>:383                                     ; preds = %370
  %384 = icmp sgt i64 %380, %256
  br i1 %384, label %385, label %460

; <label>:385                                     ; preds = %383
  %386 = sub i64 %380, %256
  br label %387

; <label>:387                                     ; preds = %385, %370
  %.0.i14 = phi i64 [ %386, %385 ], [ %368, %370 ]
  %388 = load %struct.inode** %318, align 8
  %389 = getelementptr inbounds %struct.inode* %388, i64 0, i32 0
  %390 = load i16* %389, align 2
  %391 = and i16 %390, -4096
  %392 = icmp eq i16 %391, -32768
  br i1 %392, label %393, label %file_start_write.exit.i15

; <label>:393                                     ; preds = %387
  %394 = getelementptr inbounds %struct.inode* %388, i64 0, i32 8
  %395 = load %struct.super_block** %394, align 8
  %396 = call i32 @__sb_start_write(%struct.super_block* %395, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i15

file_start_write.exit.i15:                        ; preds = %393, %387
  %397 = call i64 @do_splice_direct(%struct.file* %247, i64* %pos.i4, %struct.file* %308, i64* %out_pos.i5, i64 %.0.i14, i32 0) #6
  %398 = load %struct.inode** %318, align 8
  %399 = getelementptr inbounds %struct.inode* %398, i64 0, i32 0
  %400 = load i16* %399, align 2
  %401 = and i16 %400, -4096
  %402 = icmp eq i16 %401, -32768
  br i1 %402, label %403, label %file_end_write.exit.i16

; <label>:403                                     ; preds = %file_start_write.exit.i15
  %404 = getelementptr inbounds %struct.inode* %398, i64 0, i32 8
  %405 = load %struct.super_block** %404, align 8
  call void @__sb_end_write(%struct.super_block* %405, i32 1) #6
  br label %file_end_write.exit.i16

file_end_write.exit.i16:                          ; preds = %403, %file_start_write.exit.i15
  %406 = icmp sgt i64 %397, 0
  br i1 %406, label %407, label %449

; <label>:407                                     ; preds = %file_end_write.exit.i16
  %408 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %409 = getelementptr inbounds %struct.task_struct* %408, i64 0, i32 113, i32 0
  %410 = load i64* %409, align 8
  %411 = add i64 %410, %397
  store i64 %411, i64* %409, align 8
  %412 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %413 = getelementptr inbounds %struct.task_struct* %412, i64 0, i32 113, i32 1
  %414 = load i64* %413, align 8
  %415 = add i64 %414, %397
  store i64 %415, i64* %413, align 8
  %416 = getelementptr inbounds %struct.file* %247, i64 0, i32 1
  %417 = load %struct.inode** %316, align 8
  %418 = getelementptr inbounds %struct.inode* %417, i64 0, i32 0
  %419 = load i16* %418, align 2
  %420 = and i16 %419, -4096
  %421 = icmp eq i16 %420, 16384
  %..i.i17 = select i1 %421, i32 1073741825, i32 1
  %422 = load i32* %250, align 4
  %423 = and i32 %422, 67108864
  %424 = icmp eq i32 %423, 0
  br i1 %424, label %425, label %fsnotify_access.exit.i19

; <label>:425                                     ; preds = %407
  %426 = getelementptr inbounds %struct.file* %247, i64 0, i32 1, i32 1
  %427 = load %struct.dentry** %426, align 8
  %428 = call i32 @__fsnotify_parent(%struct.path* %416, %struct.dentry* %427, i32 %..i.i17) #6
  %429 = bitcast %struct.path* %416 to i8*
  %430 = call i32 @fsnotify(%struct.inode* %417, i32 %..i.i17, i8* %429, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i19

fsnotify_access.exit.i19:                         ; preds = %425, %407
  %431 = getelementptr inbounds %struct.file* %308, i64 0, i32 1
  %432 = load %struct.inode** %318, align 8
  %433 = getelementptr inbounds %struct.inode* %432, i64 0, i32 0
  %434 = load i16* %433, align 2
  %435 = and i16 %434, -4096
  %436 = icmp eq i16 %435, 16384
  %..i7.i18 = select i1 %436, i32 1073741826, i32 2
  %437 = load i32* %311, align 4
  %438 = and i32 %437, 67108864
  %439 = icmp eq i32 %438, 0
  br i1 %439, label %440, label %fsnotify_modify.exit.i20

; <label>:440                                     ; preds = %fsnotify_access.exit.i19
  %441 = getelementptr inbounds %struct.file* %308, i64 0, i32 1, i32 1
  %442 = load %struct.dentry** %441, align 8
  %443 = call i32 @__fsnotify_parent(%struct.path* %431, %struct.dentry* %442, i32 %..i7.i18) #6
  %444 = bitcast %struct.path* %431 to i8*
  %445 = call i32 @fsnotify(%struct.inode* %432, i32 %..i7.i18, i8* %444, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i20

fsnotify_modify.exit.i20:                         ; preds = %440, %fsnotify_access.exit.i19
  %446 = load i64* %out_pos.i5, align 8
  store i64 %446, i64* %320, align 8
  %447 = load i64* %pos.i4, align 8
  %448 = getelementptr inbounds %struct.file* %247, i64 0, i32 9
  store i64 %447, i64* %448, align 8
  br label %449

; <label>:449                                     ; preds = %fsnotify_modify.exit.i20, %file_end_write.exit.i16
  %450 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %451 = getelementptr inbounds %struct.task_struct* %450, i64 0, i32 113, i32 2
  %452 = load i64* %451, align 8
  %453 = add i64 %452, 1
  store i64 %453, i64* %451, align 8
  %454 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %455 = getelementptr inbounds %struct.task_struct* %454, i64 0, i32 113, i32 3
  %456 = load i64* %455, align 8
  %457 = add i64 %456, 1
  store i64 %457, i64* %455, align 8
  %458 = load i64* %pos.i4, align 8
  %459 = icmp sgt i64 %458, %380
  %..i21 = select i1 %459, i64 -75, i64 %397
  br label %460

; <label>:460                                     ; preds = %449, %383, %rw_verify_area.exit4.i13, %310
  %retval.0.i22 = phi i64 [ %368, %rw_verify_area.exit4.i13 ], [ -75, %383 ], [ -9, %310 ], [ %..i21, %449 ]
  %461 = and i64 %306, 1
  %462 = icmp eq i64 %461, 0
  br i1 %462, label %fdput.exit6.i24, label %463

; <label>:463                                     ; preds = %460
  call void @fput(%struct.file* %308) #6
  br label %fdput.exit6.i24

fdput.exit6.i24:                                  ; preds = %463, %460, %305, %rw_verify_area.exit.i9, %249
  %retval.1.i23 = phi i64 [ %303, %rw_verify_area.exit.i9 ], [ -9, %305 ], [ -9, %249 ], [ %retval.0.i22, %460 ], [ %retval.0.i22, %463 ]
  %464 = and i64 %245, 1
  %465 = icmp eq i64 %464, 0
  br i1 %465, label %do_sendfile.exit26, label %466

; <label>:466                                     ; preds = %fdput.exit6.i24
  call void @fput(%struct.file* %247) #6
  br label %do_sendfile.exit26

do_sendfile.exit26:                               ; preds = %466, %fdput.exit6.i24, %242
  %retval.2.i25 = phi i64 [ -9, %242 ], [ %retval.1.i23, %fdput.exit6.i24 ], [ %retval.1.i23, %466 ]
  %467 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %467) #4
  %468 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %468) #4
  br label %SYSC_sendfile64.exit

SYSC_sendfile64.exit:                             ; preds = %do_sendfile.exit26, %do_sendfile.exit, %copy_from_user.exit.i
  %.0.i = phi i64 [ %retval.2.i25, %do_sendfile.exit26 ], [ -14, %copy_from_user.exit.i ], [ %..i, %do_sendfile.exit ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_sendfile(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i4 = alloca i64, align 8
  %out_pos.i5 = alloca i64, align 8
  %pos.i1 = alloca i64, align 8
  %out_pos.i = alloca i64, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i32*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %236, label %6

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
  %16 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %16) #4
  %17 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %17) #4
  %18 = call i64 @__fdget(i32 %2) #6
  %19 = and i64 %18, -4
  %20 = inttoptr i64 %19 to %struct.file*
  %21 = icmp eq i64 %19, 0
  br i1 %21, label %do_sendfile.exit, label %22

; <label>:22                                      ; preds = %12
  %23 = getelementptr inbounds %struct.file* %20, i64 0, i32 7
  %24 = load i32* %23, align 4
  %25 = and i32 %24, 1
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %fdput.exit6.i, label %27

; <label>:27                                      ; preds = %22
  %28 = load i64* %pos.i, align 8
  store i64 %28, i64* %pos.i1, align 8
  %29 = load i32* %23, align 4
  %30 = and i32 %29, 8
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %fdput.exit6.i, label %32

; <label>:32                                      ; preds = %27
  %33 = getelementptr inbounds %struct.file* %20, i64 0, i32 2
  %34 = load %struct.inode** %33, align 8
  %35 = load i64* %pos.i1, align 8
  %36 = icmp slt i64 %35, 0
  br i1 %36, label %37, label %45, !prof !4

; <label>:37                                      ; preds = %32
  %38 = getelementptr inbounds %struct.file* %20, i64 0, i32 7
  %39 = load i32* %38, align 4
  %40 = and i32 %39, 8192
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %rw_verify_area.exit.i, label %42

; <label>:42                                      ; preds = %37
  %43 = sub i64 0, %35
  %44 = icmp ult i64 %15, %43
  br i1 %44, label %53, label %rw_verify_area.exit.i

; <label>:45                                      ; preds = %32
  %46 = add i64 %35, %15
  %47 = icmp slt i64 %46, 0
  br i1 %47, label %48, label %53, !prof !4

; <label>:48                                      ; preds = %45
  %49 = getelementptr inbounds %struct.file* %20, i64 0, i32 7
  %50 = load i32* %49, align 4
  %51 = and i32 %50, 8192
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %rw_verify_area.exit.i, label %53

; <label>:53                                      ; preds = %48, %45, %42
  %54 = getelementptr inbounds %struct.inode* %34, i64 0, i32 35
  %55 = load %struct.file_lock** %54, align 8
  %56 = icmp eq %struct.file_lock* %55, null
  br i1 %56, label %.critedge.i.i, label %57

; <label>:57                                      ; preds = %53
  %58 = getelementptr inbounds %struct.inode* %34, i64 0, i32 8
  %59 = load %struct.super_block** %58, align 8
  %60 = getelementptr inbounds %struct.super_block* %59, i64 0, i32 10
  %61 = load i64* %60, align 8
  %62 = and i64 %61, 64
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %57
  %64 = getelementptr inbounds %struct.inode* %34, i64 0, i32 0
  %65 = load i16* %64, align 2
  %66 = and i16 %65, 1032
  %67 = icmp eq i16 %66, 1024
  br i1 %67, label %68, label %.critedge.i.i, !prof !4

; <label>:68                                      ; preds = %mandatory_lock.exit.i.i
  %69 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %34, %struct.file* %20, i64 %35, i64 %15) #6
  %70 = icmp slt i32 %69, 0
  br i1 %70, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %68, %mandatory_lock.exit.i.i, %57, %53
  %71 = call i32 @security_file_permission(%struct.file* %20, i32 4) #6
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %rw_verify_area.exit.i

; <label>:73                                      ; preds = %.critedge.i.i
  %74 = icmp ugt i64 %15, 2147479552
  %75 = trunc i64 %15 to i32
  %76 = select i1 %74, i32 2147479552, i32 %75
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %73, %.critedge.i.i, %68, %48, %42, %37
  %.0.i.i = phi i32 [ %76, %73 ], [ -22, %37 ], [ -75, %42 ], [ -22, %48 ], [ %69, %68 ], [ %71, %.critedge.i.i ]
  %77 = sext i32 %.0.i.i to i64
  %78 = icmp slt i32 %.0.i.i, 0
  br i1 %78, label %fdput.exit6.i, label %79

; <label>:79                                      ; preds = %rw_verify_area.exit.i
  %80 = call i64 @__fdget(i32 %1) #6
  %81 = and i64 %80, -4
  %82 = inttoptr i64 %81 to %struct.file*
  %83 = icmp eq i64 %81, 0
  br i1 %83, label %fdput.exit6.i, label %84

; <label>:84                                      ; preds = %79
  %85 = getelementptr inbounds %struct.file* %82, i64 0, i32 7
  %86 = load i32* %85, align 4
  %87 = and i32 %86, 2
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %223, label %89

; <label>:89                                      ; preds = %84
  %90 = getelementptr inbounds %struct.file* %20, i64 0, i32 2
  %91 = load %struct.inode** %90, align 8
  %92 = getelementptr inbounds %struct.file* %82, i64 0, i32 2
  %93 = load %struct.inode** %92, align 8
  %94 = getelementptr inbounds %struct.file* %82, i64 0, i32 9
  %95 = load i64* %94, align 8
  store i64 %95, i64* %out_pos.i, align 8
  %96 = getelementptr inbounds %struct.file* %82, i64 0, i32 2
  %97 = load %struct.inode** %96, align 8
  %98 = icmp slt i64 %77, 0
  br i1 %98, label %rw_verify_area.exit4.i, label %99, !prof !4

; <label>:99                                      ; preds = %89
  %100 = load i64* %out_pos.i, align 8
  %101 = icmp slt i64 %100, 0
  br i1 %101, label %102, label %110, !prof !4

; <label>:102                                     ; preds = %99
  %103 = getelementptr inbounds %struct.file* %82, i64 0, i32 7
  %104 = load i32* %103, align 4
  %105 = and i32 %104, 8192
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %rw_verify_area.exit4.i, label %107

; <label>:107                                     ; preds = %102
  %108 = sub i64 0, %100
  %109 = icmp ult i64 %77, %108
  br i1 %109, label %118, label %rw_verify_area.exit4.i

; <label>:110                                     ; preds = %99
  %111 = add i64 %100, %77
  %112 = icmp slt i64 %111, 0
  br i1 %112, label %113, label %118, !prof !4

; <label>:113                                     ; preds = %110
  %114 = getelementptr inbounds %struct.file* %82, i64 0, i32 7
  %115 = load i32* %114, align 4
  %116 = and i32 %115, 8192
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %rw_verify_area.exit4.i, label %118

; <label>:118                                     ; preds = %113, %110, %107
  %119 = getelementptr inbounds %struct.inode* %97, i64 0, i32 35
  %120 = load %struct.file_lock** %119, align 8
  %121 = icmp eq %struct.file_lock* %120, null
  br i1 %121, label %.critedge.i2.i, label %122

; <label>:122                                     ; preds = %118
  %123 = getelementptr inbounds %struct.inode* %97, i64 0, i32 8
  %124 = load %struct.super_block** %123, align 8
  %125 = getelementptr inbounds %struct.super_block* %124, i64 0, i32 10
  %126 = load i64* %125, align 8
  %127 = and i64 %126, 64
  %128 = icmp eq i64 %127, 0
  br i1 %128, label %.critedge.i2.i, label %mandatory_lock.exit.i1.i

mandatory_lock.exit.i1.i:                         ; preds = %122
  %129 = getelementptr inbounds %struct.inode* %97, i64 0, i32 0
  %130 = load i16* %129, align 2
  %131 = and i16 %130, 1032
  %132 = icmp eq i16 %131, 1024
  br i1 %132, label %133, label %.critedge.i2.i, !prof !4

; <label>:133                                     ; preds = %mandatory_lock.exit.i1.i
  %134 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %97, %struct.file* %82, i64 %100, i64 %77) #6
  %135 = icmp slt i32 %134, 0
  br i1 %135, label %rw_verify_area.exit4.i, label %.critedge.i2.i

.critedge.i2.i:                                   ; preds = %133, %mandatory_lock.exit.i1.i, %122, %118
  %136 = call i32 @security_file_permission(%struct.file* %82, i32 2) #6
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %138, label %rw_verify_area.exit4.i

; <label>:138                                     ; preds = %.critedge.i2.i
  %139 = icmp ugt i64 %77, 2147479552
  %140 = trunc i64 %77 to i32
  %141 = select i1 %139, i32 2147479552, i32 %140
  br label %rw_verify_area.exit4.i

rw_verify_area.exit4.i:                           ; preds = %138, %.critedge.i2.i, %133, %113, %107, %102, %89
  %.0.i3.i = phi i32 [ %141, %138 ], [ -22, %89 ], [ -22, %102 ], [ -75, %107 ], [ -22, %113 ], [ %134, %133 ], [ %136, %.critedge.i2.i ]
  %142 = sext i32 %.0.i3.i to i64
  %143 = icmp slt i32 %.0.i3.i, 0
  br i1 %143, label %223, label %144

; <label>:144                                     ; preds = %rw_verify_area.exit4.i
  %145 = add i64 %28, %142
  %146 = icmp ugt i64 %145, 2147483647
  br i1 %146, label %147, label %151, !prof !4

; <label>:147                                     ; preds = %144
  %148 = icmp sgt i64 2147483647, %28
  br i1 %148, label %149, label %223

; <label>:149                                     ; preds = %147
  %150 = sub i64 2147483647, %28
  br label %151

; <label>:151                                     ; preds = %149, %144
  %.0.i2 = phi i64 [ %150, %149 ], [ %142, %144 ]
  %152 = load %struct.inode** %92, align 8
  %153 = getelementptr inbounds %struct.inode* %152, i64 0, i32 0
  %154 = load i16* %153, align 2
  %155 = and i16 %154, -4096
  %156 = icmp eq i16 %155, -32768
  br i1 %156, label %157, label %file_start_write.exit.i

; <label>:157                                     ; preds = %151
  %158 = getelementptr inbounds %struct.inode* %152, i64 0, i32 8
  %159 = load %struct.super_block** %158, align 8
  %160 = call i32 @__sb_start_write(%struct.super_block* %159, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %157, %151
  %161 = call i64 @do_splice_direct(%struct.file* %20, i64* %pos.i1, %struct.file* %82, i64* %out_pos.i, i64 %.0.i2, i32 0) #6
  %162 = load %struct.inode** %92, align 8
  %163 = getelementptr inbounds %struct.inode* %162, i64 0, i32 0
  %164 = load i16* %163, align 2
  %165 = and i16 %164, -4096
  %166 = icmp eq i16 %165, -32768
  br i1 %166, label %167, label %file_end_write.exit.i

; <label>:167                                     ; preds = %file_start_write.exit.i
  %168 = getelementptr inbounds %struct.inode* %162, i64 0, i32 8
  %169 = load %struct.super_block** %168, align 8
  call void @__sb_end_write(%struct.super_block* %169, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %167, %file_start_write.exit.i
  %170 = icmp sgt i64 %161, 0
  br i1 %170, label %171, label %212

; <label>:171                                     ; preds = %file_end_write.exit.i
  %172 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %173 = getelementptr inbounds %struct.task_struct* %172, i64 0, i32 113, i32 0
  %174 = load i64* %173, align 8
  %175 = add i64 %174, %161
  store i64 %175, i64* %173, align 8
  %176 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %177 = getelementptr inbounds %struct.task_struct* %176, i64 0, i32 113, i32 1
  %178 = load i64* %177, align 8
  %179 = add i64 %178, %161
  store i64 %179, i64* %177, align 8
  %180 = getelementptr inbounds %struct.file* %20, i64 0, i32 1
  %181 = load %struct.inode** %90, align 8
  %182 = getelementptr inbounds %struct.inode* %181, i64 0, i32 0
  %183 = load i16* %182, align 2
  %184 = and i16 %183, -4096
  %185 = icmp eq i16 %184, 16384
  %..i.i = select i1 %185, i32 1073741825, i32 1
  %186 = load i32* %23, align 4
  %187 = and i32 %186, 67108864
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %fsnotify_access.exit.i

; <label>:189                                     ; preds = %171
  %190 = getelementptr inbounds %struct.file* %20, i64 0, i32 1, i32 1
  %191 = load %struct.dentry** %190, align 8
  %192 = call i32 @__fsnotify_parent(%struct.path* %180, %struct.dentry* %191, i32 %..i.i) #6
  %193 = bitcast %struct.path* %180 to i8*
  %194 = call i32 @fsnotify(%struct.inode* %181, i32 %..i.i, i8* %193, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i

fsnotify_access.exit.i:                           ; preds = %189, %171
  %195 = getelementptr inbounds %struct.file* %82, i64 0, i32 1
  %196 = load %struct.inode** %92, align 8
  %197 = getelementptr inbounds %struct.inode* %196, i64 0, i32 0
  %198 = load i16* %197, align 2
  %199 = and i16 %198, -4096
  %200 = icmp eq i16 %199, 16384
  %..i7.i = select i1 %200, i32 1073741826, i32 2
  %201 = load i32* %85, align 4
  %202 = and i32 %201, 67108864
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %fsnotify_modify.exit.i

; <label>:204                                     ; preds = %fsnotify_access.exit.i
  %205 = getelementptr inbounds %struct.file* %82, i64 0, i32 1, i32 1
  %206 = load %struct.dentry** %205, align 8
  %207 = call i32 @__fsnotify_parent(%struct.path* %195, %struct.dentry* %206, i32 %..i7.i) #6
  %208 = bitcast %struct.path* %195 to i8*
  %209 = call i32 @fsnotify(%struct.inode* %196, i32 %..i7.i, i8* %208, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i

fsnotify_modify.exit.i:                           ; preds = %204, %fsnotify_access.exit.i
  %210 = load i64* %out_pos.i, align 8
  store i64 %210, i64* %94, align 8
  %211 = load i64* %pos.i1, align 8
  store i64 %211, i64* %pos.i, align 8
  br label %212

; <label>:212                                     ; preds = %fsnotify_modify.exit.i, %file_end_write.exit.i
  %213 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %214 = getelementptr inbounds %struct.task_struct* %213, i64 0, i32 113, i32 2
  %215 = load i64* %214, align 8
  %216 = add i64 %215, 1
  store i64 %216, i64* %214, align 8
  %217 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %218 = getelementptr inbounds %struct.task_struct* %217, i64 0, i32 113, i32 3
  %219 = load i64* %218, align 8
  %220 = add i64 %219, 1
  store i64 %220, i64* %218, align 8
  %221 = load i64* %pos.i1, align 8
  %222 = icmp sgt i64 %221, 2147483647
  %..i3 = select i1 %222, i64 -75, i64 %161
  br label %223

; <label>:223                                     ; preds = %212, %147, %rw_verify_area.exit4.i, %84
  %retval.0.i = phi i64 [ %142, %rw_verify_area.exit4.i ], [ -75, %147 ], [ -9, %84 ], [ %..i3, %212 ]
  %224 = and i64 %80, 1
  %225 = icmp eq i64 %224, 0
  br i1 %225, label %fdput.exit6.i, label %226

; <label>:226                                     ; preds = %223
  call void @fput(%struct.file* %82) #6
  br label %fdput.exit6.i

fdput.exit6.i:                                    ; preds = %226, %223, %79, %rw_verify_area.exit.i, %27, %22
  %retval.1.i = phi i64 [ %77, %rw_verify_area.exit.i ], [ -9, %79 ], [ -29, %27 ], [ -9, %22 ], [ %retval.0.i, %223 ], [ %retval.0.i, %226 ]
  %227 = and i64 %18, 1
  %228 = icmp eq i64 %227, 0
  br i1 %228, label %do_sendfile.exit, label %229

; <label>:229                                     ; preds = %fdput.exit6.i
  call void @fput(%struct.file* %20) #6
  br label %do_sendfile.exit

do_sendfile.exit:                                 ; preds = %229, %fdput.exit6.i, %12
  %retval.2.i = phi i64 [ -9, %12 ], [ %retval.1.i, %fdput.exit6.i ], [ %retval.1.i, %229 ]
  %230 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %230) #4
  %231 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %231) #4
  %232 = load i64* %pos.i, align 8
  %233 = trunc i64 %232 to i32
  %234 = call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %233, i32* %3) #4, !srcloc !11
  %235 = icmp eq i32 %234, 0
  %..i = select i1 %235, i64 %retval.2.i, i64 -14
  br label %C_SYSC_sendfile.exit

; <label>:236                                     ; preds = %0
  %237 = and i64 %count, 4294967295
  %238 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %238) #4
  %239 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %239) #4
  %240 = call i64 @__fdget(i32 %2) #6
  %241 = and i64 %240, -4
  %242 = inttoptr i64 %241 to %struct.file*
  %243 = icmp eq i64 %241, 0
  br i1 %243, label %do_sendfile.exit26, label %244

; <label>:244                                     ; preds = %236
  %245 = getelementptr inbounds %struct.file* %242, i64 0, i32 7
  %246 = load i32* %245, align 4
  %247 = and i32 %246, 1
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %fdput.exit6.i24, label %249

; <label>:249                                     ; preds = %244
  %250 = getelementptr inbounds %struct.file* %242, i64 0, i32 9
  %251 = load i64* %250, align 8
  store i64 %251, i64* %pos.i4, align 8
  %252 = getelementptr inbounds %struct.file* %242, i64 0, i32 2
  %253 = load %struct.inode** %252, align 8
  %254 = load i64* %pos.i4, align 8
  %255 = icmp slt i64 %254, 0
  br i1 %255, label %256, label %264, !prof !4

; <label>:256                                     ; preds = %249
  %257 = getelementptr inbounds %struct.file* %242, i64 0, i32 7
  %258 = load i32* %257, align 4
  %259 = and i32 %258, 8192
  %260 = icmp eq i32 %259, 0
  br i1 %260, label %rw_verify_area.exit.i9, label %261

; <label>:261                                     ; preds = %256
  %262 = sub i64 0, %254
  %263 = icmp ult i64 %237, %262
  br i1 %263, label %272, label %rw_verify_area.exit.i9

; <label>:264                                     ; preds = %249
  %265 = add i64 %254, %237
  %266 = icmp slt i64 %265, 0
  br i1 %266, label %267, label %272, !prof !4

; <label>:267                                     ; preds = %264
  %268 = getelementptr inbounds %struct.file* %242, i64 0, i32 7
  %269 = load i32* %268, align 4
  %270 = and i32 %269, 8192
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %rw_verify_area.exit.i9, label %272

; <label>:272                                     ; preds = %267, %264, %261
  %273 = getelementptr inbounds %struct.inode* %253, i64 0, i32 35
  %274 = load %struct.file_lock** %273, align 8
  %275 = icmp eq %struct.file_lock* %274, null
  br i1 %275, label %.critedge.i.i7, label %276

; <label>:276                                     ; preds = %272
  %277 = getelementptr inbounds %struct.inode* %253, i64 0, i32 8
  %278 = load %struct.super_block** %277, align 8
  %279 = getelementptr inbounds %struct.super_block* %278, i64 0, i32 10
  %280 = load i64* %279, align 8
  %281 = and i64 %280, 64
  %282 = icmp eq i64 %281, 0
  br i1 %282, label %.critedge.i.i7, label %mandatory_lock.exit.i.i6

mandatory_lock.exit.i.i6:                         ; preds = %276
  %283 = getelementptr inbounds %struct.inode* %253, i64 0, i32 0
  %284 = load i16* %283, align 2
  %285 = and i16 %284, 1032
  %286 = icmp eq i16 %285, 1024
  br i1 %286, label %287, label %.critedge.i.i7, !prof !4

; <label>:287                                     ; preds = %mandatory_lock.exit.i.i6
  %288 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %253, %struct.file* %242, i64 %254, i64 %237) #6
  %289 = icmp slt i32 %288, 0
  br i1 %289, label %rw_verify_area.exit.i9, label %.critedge.i.i7

.critedge.i.i7:                                   ; preds = %287, %mandatory_lock.exit.i.i6, %276, %272
  %290 = call i32 @security_file_permission(%struct.file* %242, i32 4) #6
  %291 = icmp eq i32 %290, 0
  br i1 %291, label %292, label %rw_verify_area.exit.i9

; <label>:292                                     ; preds = %.critedge.i.i7
  %293 = icmp ugt i64 %237, 2147479552
  %294 = trunc i64 %237 to i32
  %295 = select i1 %293, i32 2147479552, i32 %294
  br label %rw_verify_area.exit.i9

rw_verify_area.exit.i9:                           ; preds = %292, %.critedge.i.i7, %287, %267, %261, %256
  %.0.i.i8 = phi i32 [ %295, %292 ], [ -22, %256 ], [ -75, %261 ], [ -22, %267 ], [ %288, %287 ], [ %290, %.critedge.i.i7 ]
  %296 = sext i32 %.0.i.i8 to i64
  %297 = icmp slt i32 %.0.i.i8, 0
  br i1 %297, label %fdput.exit6.i24, label %298

; <label>:298                                     ; preds = %rw_verify_area.exit.i9
  %299 = call i64 @__fdget(i32 %1) #6
  %300 = and i64 %299, -4
  %301 = inttoptr i64 %300 to %struct.file*
  %302 = icmp eq i64 %300, 0
  br i1 %302, label %fdput.exit6.i24, label %303

; <label>:303                                     ; preds = %298
  %304 = getelementptr inbounds %struct.file* %301, i64 0, i32 7
  %305 = load i32* %304, align 4
  %306 = and i32 %305, 2
  %307 = icmp eq i32 %306, 0
  br i1 %307, label %453, label %308

; <label>:308                                     ; preds = %303
  %309 = getelementptr inbounds %struct.file* %242, i64 0, i32 2
  %310 = load %struct.inode** %309, align 8
  %311 = getelementptr inbounds %struct.file* %301, i64 0, i32 2
  %312 = load %struct.inode** %311, align 8
  %313 = getelementptr inbounds %struct.file* %301, i64 0, i32 9
  %314 = load i64* %313, align 8
  store i64 %314, i64* %out_pos.i5, align 8
  %315 = getelementptr inbounds %struct.file* %301, i64 0, i32 2
  %316 = load %struct.inode** %315, align 8
  %317 = icmp slt i64 %296, 0
  br i1 %317, label %rw_verify_area.exit4.i13, label %318, !prof !4

; <label>:318                                     ; preds = %308
  %319 = load i64* %out_pos.i5, align 8
  %320 = icmp slt i64 %319, 0
  br i1 %320, label %321, label %329, !prof !4

; <label>:321                                     ; preds = %318
  %322 = getelementptr inbounds %struct.file* %301, i64 0, i32 7
  %323 = load i32* %322, align 4
  %324 = and i32 %323, 8192
  %325 = icmp eq i32 %324, 0
  br i1 %325, label %rw_verify_area.exit4.i13, label %326

; <label>:326                                     ; preds = %321
  %327 = sub i64 0, %319
  %328 = icmp ult i64 %296, %327
  br i1 %328, label %337, label %rw_verify_area.exit4.i13

; <label>:329                                     ; preds = %318
  %330 = add i64 %319, %296
  %331 = icmp slt i64 %330, 0
  br i1 %331, label %332, label %337, !prof !4

; <label>:332                                     ; preds = %329
  %333 = getelementptr inbounds %struct.file* %301, i64 0, i32 7
  %334 = load i32* %333, align 4
  %335 = and i32 %334, 8192
  %336 = icmp eq i32 %335, 0
  br i1 %336, label %rw_verify_area.exit4.i13, label %337

; <label>:337                                     ; preds = %332, %329, %326
  %338 = getelementptr inbounds %struct.inode* %316, i64 0, i32 35
  %339 = load %struct.file_lock** %338, align 8
  %340 = icmp eq %struct.file_lock* %339, null
  br i1 %340, label %.critedge.i2.i11, label %341

; <label>:341                                     ; preds = %337
  %342 = getelementptr inbounds %struct.inode* %316, i64 0, i32 8
  %343 = load %struct.super_block** %342, align 8
  %344 = getelementptr inbounds %struct.super_block* %343, i64 0, i32 10
  %345 = load i64* %344, align 8
  %346 = and i64 %345, 64
  %347 = icmp eq i64 %346, 0
  br i1 %347, label %.critedge.i2.i11, label %mandatory_lock.exit.i1.i10

mandatory_lock.exit.i1.i10:                       ; preds = %341
  %348 = getelementptr inbounds %struct.inode* %316, i64 0, i32 0
  %349 = load i16* %348, align 2
  %350 = and i16 %349, 1032
  %351 = icmp eq i16 %350, 1024
  br i1 %351, label %352, label %.critedge.i2.i11, !prof !4

; <label>:352                                     ; preds = %mandatory_lock.exit.i1.i10
  %353 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %316, %struct.file* %301, i64 %319, i64 %296) #6
  %354 = icmp slt i32 %353, 0
  br i1 %354, label %rw_verify_area.exit4.i13, label %.critedge.i2.i11

.critedge.i2.i11:                                 ; preds = %352, %mandatory_lock.exit.i1.i10, %341, %337
  %355 = call i32 @security_file_permission(%struct.file* %301, i32 2) #6
  %356 = icmp eq i32 %355, 0
  br i1 %356, label %357, label %rw_verify_area.exit4.i13

; <label>:357                                     ; preds = %.critedge.i2.i11
  %358 = icmp ugt i64 %296, 2147479552
  %359 = trunc i64 %296 to i32
  %360 = select i1 %358, i32 2147479552, i32 %359
  br label %rw_verify_area.exit4.i13

rw_verify_area.exit4.i13:                         ; preds = %357, %.critedge.i2.i11, %352, %332, %326, %321, %308
  %.0.i3.i12 = phi i32 [ %360, %357 ], [ -22, %308 ], [ -22, %321 ], [ -75, %326 ], [ -22, %332 ], [ %353, %352 ], [ %355, %.critedge.i2.i11 ]
  %361 = sext i32 %.0.i3.i12 to i64
  %362 = icmp slt i32 %.0.i3.i12, 0
  br i1 %362, label %453, label %363

; <label>:363                                     ; preds = %rw_verify_area.exit4.i13
  %364 = getelementptr inbounds %struct.inode* %310, i64 0, i32 8
  %365 = load %struct.super_block** %364, align 8
  %366 = getelementptr inbounds %struct.super_block* %365, i64 0, i32 4
  %367 = load i64* %366, align 8
  %368 = getelementptr inbounds %struct.inode* %312, i64 0, i32 8
  %369 = load %struct.super_block** %368, align 8
  %370 = getelementptr inbounds %struct.super_block* %369, i64 0, i32 4
  %371 = load i64* %370, align 8
  %372 = icmp slt i64 %367, %371
  %373 = select i1 %372, i64 %367, i64 %371
  %374 = add i64 %251, %361
  %375 = icmp ugt i64 %374, %373
  br i1 %375, label %376, label %380, !prof !4

; <label>:376                                     ; preds = %363
  %377 = icmp sgt i64 %373, %251
  br i1 %377, label %378, label %453

; <label>:378                                     ; preds = %376
  %379 = sub i64 %373, %251
  br label %380

; <label>:380                                     ; preds = %378, %363
  %.0.i14 = phi i64 [ %379, %378 ], [ %361, %363 ]
  %381 = load %struct.inode** %311, align 8
  %382 = getelementptr inbounds %struct.inode* %381, i64 0, i32 0
  %383 = load i16* %382, align 2
  %384 = and i16 %383, -4096
  %385 = icmp eq i16 %384, -32768
  br i1 %385, label %386, label %file_start_write.exit.i15

; <label>:386                                     ; preds = %380
  %387 = getelementptr inbounds %struct.inode* %381, i64 0, i32 8
  %388 = load %struct.super_block** %387, align 8
  %389 = call i32 @__sb_start_write(%struct.super_block* %388, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i15

file_start_write.exit.i15:                        ; preds = %386, %380
  %390 = call i64 @do_splice_direct(%struct.file* %242, i64* %pos.i4, %struct.file* %301, i64* %out_pos.i5, i64 %.0.i14, i32 0) #6
  %391 = load %struct.inode** %311, align 8
  %392 = getelementptr inbounds %struct.inode* %391, i64 0, i32 0
  %393 = load i16* %392, align 2
  %394 = and i16 %393, -4096
  %395 = icmp eq i16 %394, -32768
  br i1 %395, label %396, label %file_end_write.exit.i16

; <label>:396                                     ; preds = %file_start_write.exit.i15
  %397 = getelementptr inbounds %struct.inode* %391, i64 0, i32 8
  %398 = load %struct.super_block** %397, align 8
  call void @__sb_end_write(%struct.super_block* %398, i32 1) #6
  br label %file_end_write.exit.i16

file_end_write.exit.i16:                          ; preds = %396, %file_start_write.exit.i15
  %399 = icmp sgt i64 %390, 0
  br i1 %399, label %400, label %442

; <label>:400                                     ; preds = %file_end_write.exit.i16
  %401 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %402 = getelementptr inbounds %struct.task_struct* %401, i64 0, i32 113, i32 0
  %403 = load i64* %402, align 8
  %404 = add i64 %403, %390
  store i64 %404, i64* %402, align 8
  %405 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %406 = getelementptr inbounds %struct.task_struct* %405, i64 0, i32 113, i32 1
  %407 = load i64* %406, align 8
  %408 = add i64 %407, %390
  store i64 %408, i64* %406, align 8
  %409 = getelementptr inbounds %struct.file* %242, i64 0, i32 1
  %410 = load %struct.inode** %309, align 8
  %411 = getelementptr inbounds %struct.inode* %410, i64 0, i32 0
  %412 = load i16* %411, align 2
  %413 = and i16 %412, -4096
  %414 = icmp eq i16 %413, 16384
  %..i.i17 = select i1 %414, i32 1073741825, i32 1
  %415 = load i32* %245, align 4
  %416 = and i32 %415, 67108864
  %417 = icmp eq i32 %416, 0
  br i1 %417, label %418, label %fsnotify_access.exit.i19

; <label>:418                                     ; preds = %400
  %419 = getelementptr inbounds %struct.file* %242, i64 0, i32 1, i32 1
  %420 = load %struct.dentry** %419, align 8
  %421 = call i32 @__fsnotify_parent(%struct.path* %409, %struct.dentry* %420, i32 %..i.i17) #6
  %422 = bitcast %struct.path* %409 to i8*
  %423 = call i32 @fsnotify(%struct.inode* %410, i32 %..i.i17, i8* %422, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i19

fsnotify_access.exit.i19:                         ; preds = %418, %400
  %424 = getelementptr inbounds %struct.file* %301, i64 0, i32 1
  %425 = load %struct.inode** %311, align 8
  %426 = getelementptr inbounds %struct.inode* %425, i64 0, i32 0
  %427 = load i16* %426, align 2
  %428 = and i16 %427, -4096
  %429 = icmp eq i16 %428, 16384
  %..i7.i18 = select i1 %429, i32 1073741826, i32 2
  %430 = load i32* %304, align 4
  %431 = and i32 %430, 67108864
  %432 = icmp eq i32 %431, 0
  br i1 %432, label %433, label %fsnotify_modify.exit.i20

; <label>:433                                     ; preds = %fsnotify_access.exit.i19
  %434 = getelementptr inbounds %struct.file* %301, i64 0, i32 1, i32 1
  %435 = load %struct.dentry** %434, align 8
  %436 = call i32 @__fsnotify_parent(%struct.path* %424, %struct.dentry* %435, i32 %..i7.i18) #6
  %437 = bitcast %struct.path* %424 to i8*
  %438 = call i32 @fsnotify(%struct.inode* %425, i32 %..i7.i18, i8* %437, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i20

fsnotify_modify.exit.i20:                         ; preds = %433, %fsnotify_access.exit.i19
  %439 = load i64* %out_pos.i5, align 8
  store i64 %439, i64* %313, align 8
  %440 = load i64* %pos.i4, align 8
  %441 = getelementptr inbounds %struct.file* %242, i64 0, i32 9
  store i64 %440, i64* %441, align 8
  br label %442

; <label>:442                                     ; preds = %fsnotify_modify.exit.i20, %file_end_write.exit.i16
  %443 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %444 = getelementptr inbounds %struct.task_struct* %443, i64 0, i32 113, i32 2
  %445 = load i64* %444, align 8
  %446 = add i64 %445, 1
  store i64 %446, i64* %444, align 8
  %447 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %448 = getelementptr inbounds %struct.task_struct* %447, i64 0, i32 113, i32 3
  %449 = load i64* %448, align 8
  %450 = add i64 %449, 1
  store i64 %450, i64* %448, align 8
  %451 = load i64* %pos.i4, align 8
  %452 = icmp sgt i64 %451, %373
  %..i21 = select i1 %452, i64 -75, i64 %390
  br label %453

; <label>:453                                     ; preds = %442, %376, %rw_verify_area.exit4.i13, %303
  %retval.0.i22 = phi i64 [ %361, %rw_verify_area.exit4.i13 ], [ -75, %376 ], [ -9, %303 ], [ %..i21, %442 ]
  %454 = and i64 %299, 1
  %455 = icmp eq i64 %454, 0
  br i1 %455, label %fdput.exit6.i24, label %456

; <label>:456                                     ; preds = %453
  call void @fput(%struct.file* %301) #6
  br label %fdput.exit6.i24

fdput.exit6.i24:                                  ; preds = %456, %453, %298, %rw_verify_area.exit.i9, %244
  %retval.1.i23 = phi i64 [ %296, %rw_verify_area.exit.i9 ], [ -9, %298 ], [ -9, %244 ], [ %retval.0.i22, %453 ], [ %retval.0.i22, %456 ]
  %457 = and i64 %240, 1
  %458 = icmp eq i64 %457, 0
  br i1 %458, label %do_sendfile.exit26, label %459

; <label>:459                                     ; preds = %fdput.exit6.i24
  call void @fput(%struct.file* %242) #6
  br label %do_sendfile.exit26

do_sendfile.exit26:                               ; preds = %459, %fdput.exit6.i24, %236
  %retval.2.i25 = phi i64 [ -9, %236 ], [ %retval.1.i23, %fdput.exit6.i24 ], [ %retval.1.i23, %459 ]
  %460 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %460) #4
  %461 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %461) #4
  br label %C_SYSC_sendfile.exit

C_SYSC_sendfile.exit:                             ; preds = %do_sendfile.exit26, %do_sendfile.exit, %6
  %.0.i = phi i64 [ %retval.2.i25, %do_sendfile.exit26 ], [ -14, %6 ], [ %..i, %do_sendfile.exit ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noredzone nounwind
define i64 @compat_SyS_sendfile64(i64 %out_fd, i64 %in_fd, i64 %offset, i64 %count) #0 {
  %pos.i4 = alloca i64, align 8
  %out_pos.i5 = alloca i64, align 8
  %pos.i1 = alloca i64, align 8
  %out_pos.i = alloca i64, align 8
  %pos.i = alloca i64, align 8
  %1 = trunc i64 %out_fd to i32
  %2 = trunc i64 %in_fd to i32
  %3 = inttoptr i64 %offset to i64*
  %4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = icmp eq i64 %offset, 0
  br i1 %5, label %241, label %copy_from_user.exit.i

copy_from_user.exit.i:                            ; preds = %0
  %6 = inttoptr i64 %offset to i8*
  %7 = call i64 @_copy_from_user(i8* %4, i8* %6, i32 8) #6
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %C_SYSC_sendfile64.exit, !prof !7

; <label>:9                                       ; preds = %copy_from_user.exit.i
  %10 = and i64 %count, 4294967295
  %11 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %11) #4
  %12 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %12) #4
  %13 = call i64 @__fdget(i32 %2) #6
  %14 = and i64 %13, -4
  %15 = inttoptr i64 %14 to %struct.file*
  %16 = icmp eq i64 %14, 0
  br i1 %16, label %do_sendfile.exit, label %17

; <label>:17                                      ; preds = %9
  %18 = getelementptr inbounds %struct.file* %15, i64 0, i32 7
  %19 = load i32* %18, align 4
  %20 = and i32 %19, 1
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %fdput.exit6.i, label %22

; <label>:22                                      ; preds = %17
  %23 = load i64* %pos.i, align 8
  store i64 %23, i64* %pos.i1, align 8
  %24 = load i32* %18, align 4
  %25 = and i32 %24, 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %fdput.exit6.i, label %27

; <label>:27                                      ; preds = %22
  %28 = getelementptr inbounds %struct.file* %15, i64 0, i32 2
  %29 = load %struct.inode** %28, align 8
  %30 = load i64* %pos.i1, align 8
  %31 = icmp slt i64 %30, 0
  br i1 %31, label %32, label %40, !prof !4

; <label>:32                                      ; preds = %27
  %33 = getelementptr inbounds %struct.file* %15, i64 0, i32 7
  %34 = load i32* %33, align 4
  %35 = and i32 %34, 8192
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %rw_verify_area.exit.i, label %37

; <label>:37                                      ; preds = %32
  %38 = sub i64 0, %30
  %39 = icmp ult i64 %10, %38
  br i1 %39, label %48, label %rw_verify_area.exit.i

; <label>:40                                      ; preds = %27
  %41 = add i64 %30, %10
  %42 = icmp slt i64 %41, 0
  br i1 %42, label %43, label %48, !prof !4

; <label>:43                                      ; preds = %40
  %44 = getelementptr inbounds %struct.file* %15, i64 0, i32 7
  %45 = load i32* %44, align 4
  %46 = and i32 %45, 8192
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %rw_verify_area.exit.i, label %48

; <label>:48                                      ; preds = %43, %40, %37
  %49 = getelementptr inbounds %struct.inode* %29, i64 0, i32 35
  %50 = load %struct.file_lock** %49, align 8
  %51 = icmp eq %struct.file_lock* %50, null
  br i1 %51, label %.critedge.i.i, label %52

; <label>:52                                      ; preds = %48
  %53 = getelementptr inbounds %struct.inode* %29, i64 0, i32 8
  %54 = load %struct.super_block** %53, align 8
  %55 = getelementptr inbounds %struct.super_block* %54, i64 0, i32 10
  %56 = load i64* %55, align 8
  %57 = and i64 %56, 64
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %.critedge.i.i, label %mandatory_lock.exit.i.i

mandatory_lock.exit.i.i:                          ; preds = %52
  %59 = getelementptr inbounds %struct.inode* %29, i64 0, i32 0
  %60 = load i16* %59, align 2
  %61 = and i16 %60, 1032
  %62 = icmp eq i16 %61, 1024
  br i1 %62, label %63, label %.critedge.i.i, !prof !4

; <label>:63                                      ; preds = %mandatory_lock.exit.i.i
  %64 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %29, %struct.file* %15, i64 %30, i64 %10) #6
  %65 = icmp slt i32 %64, 0
  br i1 %65, label %rw_verify_area.exit.i, label %.critedge.i.i

.critedge.i.i:                                    ; preds = %63, %mandatory_lock.exit.i.i, %52, %48
  %66 = call i32 @security_file_permission(%struct.file* %15, i32 4) #6
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %rw_verify_area.exit.i

; <label>:68                                      ; preds = %.critedge.i.i
  %69 = icmp ugt i64 %10, 2147479552
  %70 = trunc i64 %10 to i32
  %71 = select i1 %69, i32 2147479552, i32 %70
  br label %rw_verify_area.exit.i

rw_verify_area.exit.i:                            ; preds = %68, %.critedge.i.i, %63, %43, %37, %32
  %.0.i.i = phi i32 [ %71, %68 ], [ -22, %32 ], [ -75, %37 ], [ -22, %43 ], [ %64, %63 ], [ %66, %.critedge.i.i ]
  %72 = sext i32 %.0.i.i to i64
  %73 = icmp slt i32 %.0.i.i, 0
  br i1 %73, label %fdput.exit6.i, label %74

; <label>:74                                      ; preds = %rw_verify_area.exit.i
  %75 = call i64 @__fdget(i32 %1) #6
  %76 = and i64 %75, -4
  %77 = inttoptr i64 %76 to %struct.file*
  %78 = icmp eq i64 %76, 0
  br i1 %78, label %fdput.exit6.i, label %79

; <label>:79                                      ; preds = %74
  %80 = getelementptr inbounds %struct.file* %77, i64 0, i32 7
  %81 = load i32* %80, align 4
  %82 = and i32 %81, 2
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %228, label %84

; <label>:84                                      ; preds = %79
  %85 = getelementptr inbounds %struct.file* %15, i64 0, i32 2
  %86 = load %struct.inode** %85, align 8
  %87 = getelementptr inbounds %struct.file* %77, i64 0, i32 2
  %88 = load %struct.inode** %87, align 8
  %89 = getelementptr inbounds %struct.file* %77, i64 0, i32 9
  %90 = load i64* %89, align 8
  store i64 %90, i64* %out_pos.i, align 8
  %91 = getelementptr inbounds %struct.file* %77, i64 0, i32 2
  %92 = load %struct.inode** %91, align 8
  %93 = icmp slt i64 %72, 0
  br i1 %93, label %rw_verify_area.exit4.i, label %94, !prof !4

; <label>:94                                      ; preds = %84
  %95 = load i64* %out_pos.i, align 8
  %96 = icmp slt i64 %95, 0
  br i1 %96, label %97, label %105, !prof !4

; <label>:97                                      ; preds = %94
  %98 = getelementptr inbounds %struct.file* %77, i64 0, i32 7
  %99 = load i32* %98, align 4
  %100 = and i32 %99, 8192
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %rw_verify_area.exit4.i, label %102

; <label>:102                                     ; preds = %97
  %103 = sub i64 0, %95
  %104 = icmp ult i64 %72, %103
  br i1 %104, label %113, label %rw_verify_area.exit4.i

; <label>:105                                     ; preds = %94
  %106 = add i64 %95, %72
  %107 = icmp slt i64 %106, 0
  br i1 %107, label %108, label %113, !prof !4

; <label>:108                                     ; preds = %105
  %109 = getelementptr inbounds %struct.file* %77, i64 0, i32 7
  %110 = load i32* %109, align 4
  %111 = and i32 %110, 8192
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %rw_verify_area.exit4.i, label %113

; <label>:113                                     ; preds = %108, %105, %102
  %114 = getelementptr inbounds %struct.inode* %92, i64 0, i32 35
  %115 = load %struct.file_lock** %114, align 8
  %116 = icmp eq %struct.file_lock* %115, null
  br i1 %116, label %.critedge.i2.i, label %117

; <label>:117                                     ; preds = %113
  %118 = getelementptr inbounds %struct.inode* %92, i64 0, i32 8
  %119 = load %struct.super_block** %118, align 8
  %120 = getelementptr inbounds %struct.super_block* %119, i64 0, i32 10
  %121 = load i64* %120, align 8
  %122 = and i64 %121, 64
  %123 = icmp eq i64 %122, 0
  br i1 %123, label %.critedge.i2.i, label %mandatory_lock.exit.i1.i

mandatory_lock.exit.i1.i:                         ; preds = %117
  %124 = getelementptr inbounds %struct.inode* %92, i64 0, i32 0
  %125 = load i16* %124, align 2
  %126 = and i16 %125, 1032
  %127 = icmp eq i16 %126, 1024
  br i1 %127, label %128, label %.critedge.i2.i, !prof !4

; <label>:128                                     ; preds = %mandatory_lock.exit.i1.i
  %129 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %92, %struct.file* %77, i64 %95, i64 %72) #6
  %130 = icmp slt i32 %129, 0
  br i1 %130, label %rw_verify_area.exit4.i, label %.critedge.i2.i

.critedge.i2.i:                                   ; preds = %128, %mandatory_lock.exit.i1.i, %117, %113
  %131 = call i32 @security_file_permission(%struct.file* %77, i32 2) #6
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %rw_verify_area.exit4.i

; <label>:133                                     ; preds = %.critedge.i2.i
  %134 = icmp ugt i64 %72, 2147479552
  %135 = trunc i64 %72 to i32
  %136 = select i1 %134, i32 2147479552, i32 %135
  br label %rw_verify_area.exit4.i

rw_verify_area.exit4.i:                           ; preds = %133, %.critedge.i2.i, %128, %108, %102, %97, %84
  %.0.i3.i = phi i32 [ %136, %133 ], [ -22, %84 ], [ -22, %97 ], [ -75, %102 ], [ -22, %108 ], [ %129, %128 ], [ %131, %.critedge.i2.i ]
  %137 = sext i32 %.0.i3.i to i64
  %138 = icmp slt i32 %.0.i3.i, 0
  br i1 %138, label %228, label %139

; <label>:139                                     ; preds = %rw_verify_area.exit4.i
  %140 = getelementptr inbounds %struct.inode* %86, i64 0, i32 8
  %141 = load %struct.super_block** %140, align 8
  %142 = getelementptr inbounds %struct.super_block* %141, i64 0, i32 4
  %143 = load i64* %142, align 8
  %144 = getelementptr inbounds %struct.inode* %88, i64 0, i32 8
  %145 = load %struct.super_block** %144, align 8
  %146 = getelementptr inbounds %struct.super_block* %145, i64 0, i32 4
  %147 = load i64* %146, align 8
  %148 = icmp slt i64 %143, %147
  %149 = select i1 %148, i64 %143, i64 %147
  %150 = add i64 %23, %137
  %151 = icmp ugt i64 %150, %149
  br i1 %151, label %152, label %156, !prof !4

; <label>:152                                     ; preds = %139
  %153 = icmp sgt i64 %149, %23
  br i1 %153, label %154, label %228

; <label>:154                                     ; preds = %152
  %155 = sub i64 %149, %23
  br label %156

; <label>:156                                     ; preds = %154, %139
  %.0.i2 = phi i64 [ %155, %154 ], [ %137, %139 ]
  %157 = load %struct.inode** %87, align 8
  %158 = getelementptr inbounds %struct.inode* %157, i64 0, i32 0
  %159 = load i16* %158, align 2
  %160 = and i16 %159, -4096
  %161 = icmp eq i16 %160, -32768
  br i1 %161, label %162, label %file_start_write.exit.i

; <label>:162                                     ; preds = %156
  %163 = getelementptr inbounds %struct.inode* %157, i64 0, i32 8
  %164 = load %struct.super_block** %163, align 8
  %165 = call i32 @__sb_start_write(%struct.super_block* %164, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %162, %156
  %166 = call i64 @do_splice_direct(%struct.file* %15, i64* %pos.i1, %struct.file* %77, i64* %out_pos.i, i64 %.0.i2, i32 0) #6
  %167 = load %struct.inode** %87, align 8
  %168 = getelementptr inbounds %struct.inode* %167, i64 0, i32 0
  %169 = load i16* %168, align 2
  %170 = and i16 %169, -4096
  %171 = icmp eq i16 %170, -32768
  br i1 %171, label %172, label %file_end_write.exit.i

; <label>:172                                     ; preds = %file_start_write.exit.i
  %173 = getelementptr inbounds %struct.inode* %167, i64 0, i32 8
  %174 = load %struct.super_block** %173, align 8
  call void @__sb_end_write(%struct.super_block* %174, i32 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %172, %file_start_write.exit.i
  %175 = icmp sgt i64 %166, 0
  br i1 %175, label %176, label %217

; <label>:176                                     ; preds = %file_end_write.exit.i
  %177 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %178 = getelementptr inbounds %struct.task_struct* %177, i64 0, i32 113, i32 0
  %179 = load i64* %178, align 8
  %180 = add i64 %179, %166
  store i64 %180, i64* %178, align 8
  %181 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %182 = getelementptr inbounds %struct.task_struct* %181, i64 0, i32 113, i32 1
  %183 = load i64* %182, align 8
  %184 = add i64 %183, %166
  store i64 %184, i64* %182, align 8
  %185 = getelementptr inbounds %struct.file* %15, i64 0, i32 1
  %186 = load %struct.inode** %85, align 8
  %187 = getelementptr inbounds %struct.inode* %186, i64 0, i32 0
  %188 = load i16* %187, align 2
  %189 = and i16 %188, -4096
  %190 = icmp eq i16 %189, 16384
  %..i.i = select i1 %190, i32 1073741825, i32 1
  %191 = load i32* %18, align 4
  %192 = and i32 %191, 67108864
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %fsnotify_access.exit.i

; <label>:194                                     ; preds = %176
  %195 = getelementptr inbounds %struct.file* %15, i64 0, i32 1, i32 1
  %196 = load %struct.dentry** %195, align 8
  %197 = call i32 @__fsnotify_parent(%struct.path* %185, %struct.dentry* %196, i32 %..i.i) #6
  %198 = bitcast %struct.path* %185 to i8*
  %199 = call i32 @fsnotify(%struct.inode* %186, i32 %..i.i, i8* %198, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i

fsnotify_access.exit.i:                           ; preds = %194, %176
  %200 = getelementptr inbounds %struct.file* %77, i64 0, i32 1
  %201 = load %struct.inode** %87, align 8
  %202 = getelementptr inbounds %struct.inode* %201, i64 0, i32 0
  %203 = load i16* %202, align 2
  %204 = and i16 %203, -4096
  %205 = icmp eq i16 %204, 16384
  %..i7.i = select i1 %205, i32 1073741826, i32 2
  %206 = load i32* %80, align 4
  %207 = and i32 %206, 67108864
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %fsnotify_modify.exit.i

; <label>:209                                     ; preds = %fsnotify_access.exit.i
  %210 = getelementptr inbounds %struct.file* %77, i64 0, i32 1, i32 1
  %211 = load %struct.dentry** %210, align 8
  %212 = call i32 @__fsnotify_parent(%struct.path* %200, %struct.dentry* %211, i32 %..i7.i) #6
  %213 = bitcast %struct.path* %200 to i8*
  %214 = call i32 @fsnotify(%struct.inode* %201, i32 %..i7.i, i8* %213, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i

fsnotify_modify.exit.i:                           ; preds = %209, %fsnotify_access.exit.i
  %215 = load i64* %out_pos.i, align 8
  store i64 %215, i64* %89, align 8
  %216 = load i64* %pos.i1, align 8
  store i64 %216, i64* %pos.i, align 8
  br label %217

; <label>:217                                     ; preds = %fsnotify_modify.exit.i, %file_end_write.exit.i
  %218 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %219 = getelementptr inbounds %struct.task_struct* %218, i64 0, i32 113, i32 2
  %220 = load i64* %219, align 8
  %221 = add i64 %220, 1
  store i64 %221, i64* %219, align 8
  %222 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %223 = getelementptr inbounds %struct.task_struct* %222, i64 0, i32 113, i32 3
  %224 = load i64* %223, align 8
  %225 = add i64 %224, 1
  store i64 %225, i64* %223, align 8
  %226 = load i64* %pos.i1, align 8
  %227 = icmp sgt i64 %226, %149
  %..i3 = select i1 %227, i64 -75, i64 %166
  br label %228

; <label>:228                                     ; preds = %217, %152, %rw_verify_area.exit4.i, %79
  %retval.0.i = phi i64 [ %137, %rw_verify_area.exit4.i ], [ -75, %152 ], [ -9, %79 ], [ %..i3, %217 ]
  %229 = and i64 %75, 1
  %230 = icmp eq i64 %229, 0
  br i1 %230, label %fdput.exit6.i, label %231

; <label>:231                                     ; preds = %228
  call void @fput(%struct.file* %77) #6
  br label %fdput.exit6.i

fdput.exit6.i:                                    ; preds = %231, %228, %74, %rw_verify_area.exit.i, %22, %17
  %retval.1.i = phi i64 [ %72, %rw_verify_area.exit.i ], [ -9, %74 ], [ -29, %22 ], [ -9, %17 ], [ %retval.0.i, %228 ], [ %retval.0.i, %231 ]
  %232 = and i64 %13, 1
  %233 = icmp eq i64 %232, 0
  br i1 %233, label %do_sendfile.exit, label %234

; <label>:234                                     ; preds = %fdput.exit6.i
  call void @fput(%struct.file* %15) #6
  br label %do_sendfile.exit

do_sendfile.exit:                                 ; preds = %234, %fdput.exit6.i, %9
  %retval.2.i = phi i64 [ -9, %9 ], [ %retval.1.i, %fdput.exit6.i ], [ %retval.1.i, %234 ]
  %235 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %235) #4
  %236 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %236) #4
  %237 = load i64* %pos.i, align 8
  %238 = call i64 asm sideeffect "call __put_user_8", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i64 %237, i64* %3) #4, !srcloc !12
  %239 = trunc i64 %238 to i32
  %240 = icmp eq i32 %239, 0
  %..i = select i1 %240, i64 %retval.2.i, i64 -14
  br label %C_SYSC_sendfile64.exit

; <label>:241                                     ; preds = %0
  %242 = and i64 %count, 4294967295
  %243 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %243) #4
  %244 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %244) #4
  %245 = call i64 @__fdget(i32 %2) #6
  %246 = and i64 %245, -4
  %247 = inttoptr i64 %246 to %struct.file*
  %248 = icmp eq i64 %246, 0
  br i1 %248, label %do_sendfile.exit26, label %249

; <label>:249                                     ; preds = %241
  %250 = getelementptr inbounds %struct.file* %247, i64 0, i32 7
  %251 = load i32* %250, align 4
  %252 = and i32 %251, 1
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %fdput.exit6.i24, label %254

; <label>:254                                     ; preds = %249
  %255 = getelementptr inbounds %struct.file* %247, i64 0, i32 9
  %256 = load i64* %255, align 8
  store i64 %256, i64* %pos.i4, align 8
  %257 = getelementptr inbounds %struct.file* %247, i64 0, i32 2
  %258 = load %struct.inode** %257, align 8
  %259 = load i64* %pos.i4, align 8
  %260 = icmp slt i64 %259, 0
  br i1 %260, label %261, label %269, !prof !4

; <label>:261                                     ; preds = %254
  %262 = getelementptr inbounds %struct.file* %247, i64 0, i32 7
  %263 = load i32* %262, align 4
  %264 = and i32 %263, 8192
  %265 = icmp eq i32 %264, 0
  br i1 %265, label %rw_verify_area.exit.i9, label %266

; <label>:266                                     ; preds = %261
  %267 = sub i64 0, %259
  %268 = icmp ult i64 %242, %267
  br i1 %268, label %277, label %rw_verify_area.exit.i9

; <label>:269                                     ; preds = %254
  %270 = add i64 %259, %242
  %271 = icmp slt i64 %270, 0
  br i1 %271, label %272, label %277, !prof !4

; <label>:272                                     ; preds = %269
  %273 = getelementptr inbounds %struct.file* %247, i64 0, i32 7
  %274 = load i32* %273, align 4
  %275 = and i32 %274, 8192
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %rw_verify_area.exit.i9, label %277

; <label>:277                                     ; preds = %272, %269, %266
  %278 = getelementptr inbounds %struct.inode* %258, i64 0, i32 35
  %279 = load %struct.file_lock** %278, align 8
  %280 = icmp eq %struct.file_lock* %279, null
  br i1 %280, label %.critedge.i.i7, label %281

; <label>:281                                     ; preds = %277
  %282 = getelementptr inbounds %struct.inode* %258, i64 0, i32 8
  %283 = load %struct.super_block** %282, align 8
  %284 = getelementptr inbounds %struct.super_block* %283, i64 0, i32 10
  %285 = load i64* %284, align 8
  %286 = and i64 %285, 64
  %287 = icmp eq i64 %286, 0
  br i1 %287, label %.critedge.i.i7, label %mandatory_lock.exit.i.i6

mandatory_lock.exit.i.i6:                         ; preds = %281
  %288 = getelementptr inbounds %struct.inode* %258, i64 0, i32 0
  %289 = load i16* %288, align 2
  %290 = and i16 %289, 1032
  %291 = icmp eq i16 %290, 1024
  br i1 %291, label %292, label %.critedge.i.i7, !prof !4

; <label>:292                                     ; preds = %mandatory_lock.exit.i.i6
  %293 = call i32 @locks_mandatory_area(i32 1, %struct.inode* %258, %struct.file* %247, i64 %259, i64 %242) #6
  %294 = icmp slt i32 %293, 0
  br i1 %294, label %rw_verify_area.exit.i9, label %.critedge.i.i7

.critedge.i.i7:                                   ; preds = %292, %mandatory_lock.exit.i.i6, %281, %277
  %295 = call i32 @security_file_permission(%struct.file* %247, i32 4) #6
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %297, label %rw_verify_area.exit.i9

; <label>:297                                     ; preds = %.critedge.i.i7
  %298 = icmp ugt i64 %242, 2147479552
  %299 = trunc i64 %242 to i32
  %300 = select i1 %298, i32 2147479552, i32 %299
  br label %rw_verify_area.exit.i9

rw_verify_area.exit.i9:                           ; preds = %297, %.critedge.i.i7, %292, %272, %266, %261
  %.0.i.i8 = phi i32 [ %300, %297 ], [ -22, %261 ], [ -75, %266 ], [ -22, %272 ], [ %293, %292 ], [ %295, %.critedge.i.i7 ]
  %301 = sext i32 %.0.i.i8 to i64
  %302 = icmp slt i32 %.0.i.i8, 0
  br i1 %302, label %fdput.exit6.i24, label %303

; <label>:303                                     ; preds = %rw_verify_area.exit.i9
  %304 = call i64 @__fdget(i32 %1) #6
  %305 = and i64 %304, -4
  %306 = inttoptr i64 %305 to %struct.file*
  %307 = icmp eq i64 %305, 0
  br i1 %307, label %fdput.exit6.i24, label %308

; <label>:308                                     ; preds = %303
  %309 = getelementptr inbounds %struct.file* %306, i64 0, i32 7
  %310 = load i32* %309, align 4
  %311 = and i32 %310, 2
  %312 = icmp eq i32 %311, 0
  br i1 %312, label %458, label %313

; <label>:313                                     ; preds = %308
  %314 = getelementptr inbounds %struct.file* %247, i64 0, i32 2
  %315 = load %struct.inode** %314, align 8
  %316 = getelementptr inbounds %struct.file* %306, i64 0, i32 2
  %317 = load %struct.inode** %316, align 8
  %318 = getelementptr inbounds %struct.file* %306, i64 0, i32 9
  %319 = load i64* %318, align 8
  store i64 %319, i64* %out_pos.i5, align 8
  %320 = getelementptr inbounds %struct.file* %306, i64 0, i32 2
  %321 = load %struct.inode** %320, align 8
  %322 = icmp slt i64 %301, 0
  br i1 %322, label %rw_verify_area.exit4.i13, label %323, !prof !4

; <label>:323                                     ; preds = %313
  %324 = load i64* %out_pos.i5, align 8
  %325 = icmp slt i64 %324, 0
  br i1 %325, label %326, label %334, !prof !4

; <label>:326                                     ; preds = %323
  %327 = getelementptr inbounds %struct.file* %306, i64 0, i32 7
  %328 = load i32* %327, align 4
  %329 = and i32 %328, 8192
  %330 = icmp eq i32 %329, 0
  br i1 %330, label %rw_verify_area.exit4.i13, label %331

; <label>:331                                     ; preds = %326
  %332 = sub i64 0, %324
  %333 = icmp ult i64 %301, %332
  br i1 %333, label %342, label %rw_verify_area.exit4.i13

; <label>:334                                     ; preds = %323
  %335 = add i64 %324, %301
  %336 = icmp slt i64 %335, 0
  br i1 %336, label %337, label %342, !prof !4

; <label>:337                                     ; preds = %334
  %338 = getelementptr inbounds %struct.file* %306, i64 0, i32 7
  %339 = load i32* %338, align 4
  %340 = and i32 %339, 8192
  %341 = icmp eq i32 %340, 0
  br i1 %341, label %rw_verify_area.exit4.i13, label %342

; <label>:342                                     ; preds = %337, %334, %331
  %343 = getelementptr inbounds %struct.inode* %321, i64 0, i32 35
  %344 = load %struct.file_lock** %343, align 8
  %345 = icmp eq %struct.file_lock* %344, null
  br i1 %345, label %.critedge.i2.i11, label %346

; <label>:346                                     ; preds = %342
  %347 = getelementptr inbounds %struct.inode* %321, i64 0, i32 8
  %348 = load %struct.super_block** %347, align 8
  %349 = getelementptr inbounds %struct.super_block* %348, i64 0, i32 10
  %350 = load i64* %349, align 8
  %351 = and i64 %350, 64
  %352 = icmp eq i64 %351, 0
  br i1 %352, label %.critedge.i2.i11, label %mandatory_lock.exit.i1.i10

mandatory_lock.exit.i1.i10:                       ; preds = %346
  %353 = getelementptr inbounds %struct.inode* %321, i64 0, i32 0
  %354 = load i16* %353, align 2
  %355 = and i16 %354, 1032
  %356 = icmp eq i16 %355, 1024
  br i1 %356, label %357, label %.critedge.i2.i11, !prof !4

; <label>:357                                     ; preds = %mandatory_lock.exit.i1.i10
  %358 = call i32 @locks_mandatory_area(i32 2, %struct.inode* %321, %struct.file* %306, i64 %324, i64 %301) #6
  %359 = icmp slt i32 %358, 0
  br i1 %359, label %rw_verify_area.exit4.i13, label %.critedge.i2.i11

.critedge.i2.i11:                                 ; preds = %357, %mandatory_lock.exit.i1.i10, %346, %342
  %360 = call i32 @security_file_permission(%struct.file* %306, i32 2) #6
  %361 = icmp eq i32 %360, 0
  br i1 %361, label %362, label %rw_verify_area.exit4.i13

; <label>:362                                     ; preds = %.critedge.i2.i11
  %363 = icmp ugt i64 %301, 2147479552
  %364 = trunc i64 %301 to i32
  %365 = select i1 %363, i32 2147479552, i32 %364
  br label %rw_verify_area.exit4.i13

rw_verify_area.exit4.i13:                         ; preds = %362, %.critedge.i2.i11, %357, %337, %331, %326, %313
  %.0.i3.i12 = phi i32 [ %365, %362 ], [ -22, %313 ], [ -22, %326 ], [ -75, %331 ], [ -22, %337 ], [ %358, %357 ], [ %360, %.critedge.i2.i11 ]
  %366 = sext i32 %.0.i3.i12 to i64
  %367 = icmp slt i32 %.0.i3.i12, 0
  br i1 %367, label %458, label %368

; <label>:368                                     ; preds = %rw_verify_area.exit4.i13
  %369 = getelementptr inbounds %struct.inode* %315, i64 0, i32 8
  %370 = load %struct.super_block** %369, align 8
  %371 = getelementptr inbounds %struct.super_block* %370, i64 0, i32 4
  %372 = load i64* %371, align 8
  %373 = getelementptr inbounds %struct.inode* %317, i64 0, i32 8
  %374 = load %struct.super_block** %373, align 8
  %375 = getelementptr inbounds %struct.super_block* %374, i64 0, i32 4
  %376 = load i64* %375, align 8
  %377 = icmp slt i64 %372, %376
  %378 = select i1 %377, i64 %372, i64 %376
  %379 = add i64 %256, %366
  %380 = icmp ugt i64 %379, %378
  br i1 %380, label %381, label %385, !prof !4

; <label>:381                                     ; preds = %368
  %382 = icmp sgt i64 %378, %256
  br i1 %382, label %383, label %458

; <label>:383                                     ; preds = %381
  %384 = sub i64 %378, %256
  br label %385

; <label>:385                                     ; preds = %383, %368
  %.0.i14 = phi i64 [ %384, %383 ], [ %366, %368 ]
  %386 = load %struct.inode** %316, align 8
  %387 = getelementptr inbounds %struct.inode* %386, i64 0, i32 0
  %388 = load i16* %387, align 2
  %389 = and i16 %388, -4096
  %390 = icmp eq i16 %389, -32768
  br i1 %390, label %391, label %file_start_write.exit.i15

; <label>:391                                     ; preds = %385
  %392 = getelementptr inbounds %struct.inode* %386, i64 0, i32 8
  %393 = load %struct.super_block** %392, align 8
  %394 = call i32 @__sb_start_write(%struct.super_block* %393, i32 1, i1 zeroext true) #6
  br label %file_start_write.exit.i15

file_start_write.exit.i15:                        ; preds = %391, %385
  %395 = call i64 @do_splice_direct(%struct.file* %247, i64* %pos.i4, %struct.file* %306, i64* %out_pos.i5, i64 %.0.i14, i32 0) #6
  %396 = load %struct.inode** %316, align 8
  %397 = getelementptr inbounds %struct.inode* %396, i64 0, i32 0
  %398 = load i16* %397, align 2
  %399 = and i16 %398, -4096
  %400 = icmp eq i16 %399, -32768
  br i1 %400, label %401, label %file_end_write.exit.i16

; <label>:401                                     ; preds = %file_start_write.exit.i15
  %402 = getelementptr inbounds %struct.inode* %396, i64 0, i32 8
  %403 = load %struct.super_block** %402, align 8
  call void @__sb_end_write(%struct.super_block* %403, i32 1) #6
  br label %file_end_write.exit.i16

file_end_write.exit.i16:                          ; preds = %401, %file_start_write.exit.i15
  %404 = icmp sgt i64 %395, 0
  br i1 %404, label %405, label %447

; <label>:405                                     ; preds = %file_end_write.exit.i16
  %406 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %407 = getelementptr inbounds %struct.task_struct* %406, i64 0, i32 113, i32 0
  %408 = load i64* %407, align 8
  %409 = add i64 %408, %395
  store i64 %409, i64* %407, align 8
  %410 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %411 = getelementptr inbounds %struct.task_struct* %410, i64 0, i32 113, i32 1
  %412 = load i64* %411, align 8
  %413 = add i64 %412, %395
  store i64 %413, i64* %411, align 8
  %414 = getelementptr inbounds %struct.file* %247, i64 0, i32 1
  %415 = load %struct.inode** %314, align 8
  %416 = getelementptr inbounds %struct.inode* %415, i64 0, i32 0
  %417 = load i16* %416, align 2
  %418 = and i16 %417, -4096
  %419 = icmp eq i16 %418, 16384
  %..i.i17 = select i1 %419, i32 1073741825, i32 1
  %420 = load i32* %250, align 4
  %421 = and i32 %420, 67108864
  %422 = icmp eq i32 %421, 0
  br i1 %422, label %423, label %fsnotify_access.exit.i19

; <label>:423                                     ; preds = %405
  %424 = getelementptr inbounds %struct.file* %247, i64 0, i32 1, i32 1
  %425 = load %struct.dentry** %424, align 8
  %426 = call i32 @__fsnotify_parent(%struct.path* %414, %struct.dentry* %425, i32 %..i.i17) #6
  %427 = bitcast %struct.path* %414 to i8*
  %428 = call i32 @fsnotify(%struct.inode* %415, i32 %..i.i17, i8* %427, i32 1, i8* null, i32 0) #6
  br label %fsnotify_access.exit.i19

fsnotify_access.exit.i19:                         ; preds = %423, %405
  %429 = getelementptr inbounds %struct.file* %306, i64 0, i32 1
  %430 = load %struct.inode** %316, align 8
  %431 = getelementptr inbounds %struct.inode* %430, i64 0, i32 0
  %432 = load i16* %431, align 2
  %433 = and i16 %432, -4096
  %434 = icmp eq i16 %433, 16384
  %..i7.i18 = select i1 %434, i32 1073741826, i32 2
  %435 = load i32* %309, align 4
  %436 = and i32 %435, 67108864
  %437 = icmp eq i32 %436, 0
  br i1 %437, label %438, label %fsnotify_modify.exit.i20

; <label>:438                                     ; preds = %fsnotify_access.exit.i19
  %439 = getelementptr inbounds %struct.file* %306, i64 0, i32 1, i32 1
  %440 = load %struct.dentry** %439, align 8
  %441 = call i32 @__fsnotify_parent(%struct.path* %429, %struct.dentry* %440, i32 %..i7.i18) #6
  %442 = bitcast %struct.path* %429 to i8*
  %443 = call i32 @fsnotify(%struct.inode* %430, i32 %..i7.i18, i8* %442, i32 1, i8* null, i32 0) #6
  br label %fsnotify_modify.exit.i20

fsnotify_modify.exit.i20:                         ; preds = %438, %fsnotify_access.exit.i19
  %444 = load i64* %out_pos.i5, align 8
  store i64 %444, i64* %318, align 8
  %445 = load i64* %pos.i4, align 8
  %446 = getelementptr inbounds %struct.file* %247, i64 0, i32 9
  store i64 %445, i64* %446, align 8
  br label %447

; <label>:447                                     ; preds = %fsnotify_modify.exit.i20, %file_end_write.exit.i16
  %448 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %449 = getelementptr inbounds %struct.task_struct* %448, i64 0, i32 113, i32 2
  %450 = load i64* %449, align 8
  %451 = add i64 %450, 1
  store i64 %451, i64* %449, align 8
  %452 = call %struct.task_struct* asm "movq %gs:${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %453 = getelementptr inbounds %struct.task_struct* %452, i64 0, i32 113, i32 3
  %454 = load i64* %453, align 8
  %455 = add i64 %454, 1
  store i64 %455, i64* %453, align 8
  %456 = load i64* %pos.i4, align 8
  %457 = icmp sgt i64 %456, %378
  %..i21 = select i1 %457, i64 -75, i64 %395
  br label %458

; <label>:458                                     ; preds = %447, %381, %rw_verify_area.exit4.i13, %308
  %retval.0.i22 = phi i64 [ %366, %rw_verify_area.exit4.i13 ], [ -75, %381 ], [ -9, %308 ], [ %..i21, %447 ]
  %459 = and i64 %304, 1
  %460 = icmp eq i64 %459, 0
  br i1 %460, label %fdput.exit6.i24, label %461

; <label>:461                                     ; preds = %458
  call void @fput(%struct.file* %306) #6
  br label %fdput.exit6.i24

fdput.exit6.i24:                                  ; preds = %461, %458, %303, %rw_verify_area.exit.i9, %249
  %retval.1.i23 = phi i64 [ %301, %rw_verify_area.exit.i9 ], [ -9, %303 ], [ -9, %249 ], [ %retval.0.i22, %458 ], [ %retval.0.i22, %461 ]
  %462 = and i64 %245, 1
  %463 = icmp eq i64 %462, 0
  br i1 %463, label %do_sendfile.exit26, label %464

; <label>:464                                     ; preds = %fdput.exit6.i24
  call void @fput(%struct.file* %247) #6
  br label %do_sendfile.exit26

do_sendfile.exit26:                               ; preds = %464, %fdput.exit6.i24, %241
  %retval.2.i25 = phi i64 [ -9, %241 ], [ %retval.1.i23, %fdput.exit6.i24 ], [ %retval.1.i23, %464 ]
  %465 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %465) #4
  %466 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %466) #4
  br label %C_SYSC_sendfile64.exit

C_SYSC_sendfile64.exit:                           ; preds = %do_sendfile.exit26, %do_sendfile.exit, %copy_from_user.exit.i
  %.0.i = phi i64 [ %retval.2.i25, %do_sendfile.exit26 ], [ -14, %copy_from_user.exit.i ], [ %..i, %do_sendfile.exit ]
  call void @llvm.lifetime.end(i64 8, i8* %4) #4
  ret i64 %.0.i
}

; Function Attrs: noredzone
declare i64 @do_splice_direct(%struct.file*, i64*, %struct.file*, i64*, i64, i32) #1

; Function Attrs: noredzone
declare void @fput(%struct.file*) #1

; Function Attrs: noredzone
declare i64 @__fdget(i32) #1

; Function Attrs: noredzone
declare i64 @compat_rw_copy_check_uvector(i32, %struct.compat_iovec*, i64, i64, %struct.iovec*, %struct.iovec**) #1

; Function Attrs: noredzone
declare void @kfree(i8*) #1

; Function Attrs: noredzone
declare i64 @__fdget_pos(i32) #1

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
attributes #6 = { nobuiltin noredzone nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!1 = metadata !{i32 -2146513298}
!2 = metadata !{i32 -2146491284}
!3 = metadata !{i32 -2146822019}
!4 = metadata !{metadata !"branch_weights", i32 4, i32 64}
!5 = metadata !{i32 -2146612126}
!6 = metadata !{i32 -2143334077}
!7 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!8 = metadata !{i32 -2143331293}
!9 = metadata !{i32 -2143316779}
!10 = metadata !{i32 -2143307477}
!11 = metadata !{i32 -2143304982}
!12 = metadata !{i32 -2143293506}
