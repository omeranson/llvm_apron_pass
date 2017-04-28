; ModuleID = '/home/oren/GIT/llvm_apron_pass/FOLDER_3_INLINE_SELECTED_FUNCTIONS/INLINE_ME/FOLDER_7_OUTPUT/OutputInlined.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct.module = type opaque
%struct.file = type { %union.anon, %struct.path, %struct.inode*, %struct.file_operations*, %struct.spinlock, %struct.atomic_t, i32, i32, %struct.mutex, i64, %struct.fown_struct, %struct.cred*, %struct.file_ra_state, i64, i8*, %struct.address_space* }
%union.anon = type { %struct.callback_head }
%struct.callback_head = type { %struct.callback_head*, void (%struct.callback_head*)* }
%struct.path = type { %struct.vfsmount*, %struct.dentry* }
%struct.vfsmount = type opaque
%struct.dentry = type { i32, %struct.seqcount, %struct.hlist_bl_node, %struct.dentry*, %struct.qstr, %struct.inode*, [40 x i8], %struct.lockref, %struct.dentry_operations*, %struct.super_block*, i32, i8*, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.57 }
%struct.seqcount = type { i32 }
%struct.hlist_bl_node = type { %struct.hlist_bl_node*, %struct.hlist_bl_node** }
%struct.qstr = type { %union.anon.0, i8* }
%union.anon.0 = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.lockref = type { %union.anon.55 }
%union.anon.55 = type { %struct.anon.56 }
%struct.anon.56 = type { %struct.spinlock, i32 }
%struct.dentry_operations = type { i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.qstr*)*, i32 (%struct.dentry*, %struct.dentry*, i32, i8*, %struct.qstr*)*, i32 (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*)*, void (%struct.dentry*, %struct.inode*)*, i8* (%struct.dentry*, i8*, i32)*, %struct.vfsmount* (%struct.path*)*, i32 (%struct.dentry*, i1)*, [20 x i8] }
%struct.super_block = type { %struct.list_head, i32, i8, i32, i64, %struct.file_system_type*, %struct.super_operations*, %struct.dquot_operations*, %struct.quotactl_ops*, %struct.export_operations*, i32, i32, %struct.dentry*, %struct.rw_semaphore, i32, %struct.atomic_t, %struct.xattr_handler**, %struct.list_head, %struct.hlist_bl_head, %struct.list_head, %struct.block_device*, %struct.backing_dev_info*, %struct.mtd_info*, %struct.hlist_node, i32, %struct.quota_info, %struct.sb_writers, [32 x i8], [16 x i8], i8*, i32, i32, i32, %struct.mutex, i8*, i8*, %struct.dentry_operations*, i32, %struct.shrinker, %struct.atomic_t, i32, %struct.workqueue_struct*, %struct.hlist_head, %struct.list_lru, %struct.list_lru, %struct.callback_head, i32 }
%struct.file_system_type = type { i8*, i32, %struct.dentry* (%struct.file_system_type*, i32, i8*, i8*)*, void (%struct.super_block*)*, %struct.module*, %struct.file_system_type*, %struct.hlist_head, %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key, [3 x %struct.lock_class_key], %struct.lock_class_key, %struct.lock_class_key, %struct.lock_class_key }
%struct.lock_class_key = type {}
%struct.super_operations = type { %struct.inode* (%struct.super_block*)*, void (%struct.inode*)*, void (%struct.inode*, i32)*, i32 (%struct.inode*, %struct.writeback_control*)*, i32 (%struct.inode*)*, void (%struct.inode*)*, void (%struct.super_block*)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.super_block*)*, i32 (%struct.dentry*, %struct.kstatfs*)*, i32 (%struct.super_block*, i32*, i8*)*, void (%struct.super_block*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.seq_file*, %struct.dentry*)*, i32 (%struct.super_block*, %struct.page*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, i32)* }
%struct.writeback_control = type opaque
%struct.kstatfs = type opaque
%struct.seq_file = type { i8*, i32, i32, i32, i32, i64, i64, i64, %struct.mutex, %struct.seq_operations*, i32, i8* }
%struct.seq_operations = type { i8* (%struct.seq_file*, i64*)*, void (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i8*, i64*)*, i32 (%struct.seq_file*, i8*)* }
%struct.page = type { i32, %union.anon.2, %struct.anon.40, %union.anon.46, %union.anon.48 }
%union.anon.2 = type { %struct.address_space* }
%struct.anon.40 = type { %union.anon.41, %union.anon.42 }
%union.anon.41 = type { i32 }
%union.anon.42 = type { %struct.anon.43 }
%struct.anon.43 = type { %union.anon.44, %struct.atomic_t }
%union.anon.44 = type { %struct.atomic_t }
%union.anon.46 = type { %struct.list_head }
%union.anon.48 = type { i32 }
%struct.dquot_operations = type { i32 (%struct.dquot*)*, %struct.dquot* (%struct.super_block*, i32)*, void (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.super_block*, i32)*, i64* (%struct.inode*)* }
%struct.dquot = type { %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %struct.mutex, %struct.atomic_t, %struct.__wait_queue_head, %struct.super_block*, %struct.kqid, i64, i32, %struct.mem_dqblk }
%struct.__wait_queue_head = type { %struct.spinlock, %struct.list_head }
%struct.kqid = type { %union.anon.49, i32 }
%union.anon.49 = type { %struct.kuid_t }
%struct.kuid_t = type { i32 }
%struct.mem_dqblk = type { i64, i64, i64, i64, i64, i64, i64, i32, i32 }
%struct.quotactl_ops = type { i32 (%struct.super_block*, i32, i32, %struct.path*)*, i32 (%struct.super_block*, i32, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32, %struct.if_dqinfo*)*, i32 (%struct.super_block*, i32, %struct.if_dqinfo*)*, i32 (%struct.super_block*, i32, i32, %struct.fs_disk_quota*)*, i32 (%struct.super_block*, i32, i32, %struct.fs_disk_quota*)*, i32 (%struct.super_block*, %struct.fs_quota_stat*)*, i32 (%struct.super_block*, i32, i32)*, i32 (%struct.super_block*, %struct.fs_quota_statv*)*, i32 (%struct.super_block*, i32)* }
%struct.if_dqinfo = type { i64, i64, i32, i32 }
%struct.fs_disk_quota = type { i8, i8, i16, i32, i64, i64, i64, i64, i64, i64, i32, i32, i16, i16, i32, i64, i64, i64, i32, i16, i16, [8 x i8] }
%struct.fs_quota_stat = type { i8, i16, i8, %struct.fs_qfilestat, %struct.fs_qfilestat, i32, i32, i32, i32, i16, i16 }
%struct.fs_qfilestat = type { i64, i64, i32 }
%struct.fs_quota_statv = type { i8, i8, i16, i32, %struct.fs_qfilestatv, %struct.fs_qfilestatv, %struct.fs_qfilestatv, i32, i32, i32, i16, i16, [8 x i64] }
%struct.fs_qfilestatv = type { i64, i64, i32, i32 }
%struct.export_operations = type opaque
%struct.rw_semaphore = type { i32, %struct.list_head, %struct.raw_spinlock }
%struct.raw_spinlock = type { %struct.arch_spinlock_t }
%struct.arch_spinlock_t = type {}
%struct.xattr_handler = type opaque
%struct.hlist_bl_head = type { %struct.hlist_bl_node* }
%struct.block_device = type { i32, i32, %struct.inode*, %struct.super_block*, %struct.mutex, %struct.list_head, i8*, i8*, i32, i8, %struct.block_device*, i32, %struct.hd_struct*, i32, i32, %struct.gendisk*, %struct.request_queue*, %struct.list_head, i32, i32, %struct.mutex }
%struct.hd_struct = type opaque
%struct.gendisk = type opaque
%struct.request_queue = type opaque
%struct.backing_dev_info = type opaque
%struct.mtd_info = type opaque
%struct.hlist_node = type { %struct.hlist_node*, %struct.hlist_node** }
%struct.quota_info = type { i32, %struct.mutex, %struct.mutex, [2 x %struct.inode*], [2 x %struct.mem_dqinfo], [2 x %struct.quota_format_ops*] }
%struct.mem_dqinfo = type { %struct.quota_format_type*, i32, %struct.list_head, i32, i32, i32, i64, i64, i8* }
%struct.quota_format_type = type { i32, %struct.quota_format_ops*, %struct.module*, %struct.quota_format_type* }
%struct.quota_format_ops = type { i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.super_block*, i32)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)*, i32 (%struct.dquot*)* }
%struct.sb_writers = type { [3 x %struct.percpu_counter], %struct.__wait_queue_head, i32, %struct.__wait_queue_head }
%struct.percpu_counter = type { i64 }
%struct.shrinker = type { i32 (%struct.shrinker*, %struct.shrink_control*)*, i32 (%struct.shrinker*, %struct.shrink_control*)*, i32, i32, i32, %struct.list_head, %struct.atomic_t* }
%struct.shrink_control = type { i32, i32, i32 }
%struct.workqueue_struct = type opaque
%struct.hlist_head = type { %struct.hlist_node* }
%struct.list_lru = type { %struct.list_lru_node*, %struct.nodemask_t }
%struct.list_lru_node = type { %struct.spinlock, %struct.list_head, i32 }
%struct.nodemask_t = type { [1 x i32] }
%struct.list_head = type { %struct.list_head*, %struct.list_head* }
%union.anon.57 = type { %struct.hlist_node }
%struct.inode = type { i16, i16, %struct.kuid_t, %struct.kgid_t, i32, %struct.inode_operations*, %struct.super_block*, %struct.address_space*, i32, %union.anon.50, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.spinlock, i16, i32, i32, i32, %struct.mutex, i32, %struct.hlist_node, %struct.list_head, %struct.list_head, %struct.list_head, %union.anon.51, i64, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, %struct.file_operations*, %struct.file_lock*, %struct.address_space, %struct.list_head, %union.anon.54, i32, i8* }
%struct.kgid_t = type { i32 }
%struct.inode_operations = type { %struct.dentry* (%struct.inode*, %struct.dentry*, i32)*, i8* (%struct.dentry*, %struct.nameidata*)*, i32 (%struct.inode*, i32)*, %struct.posix_acl* (%struct.inode*, i32)*, i32 (%struct.dentry*, i8*, i32)*, void (%struct.dentry*, %struct.nameidata*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16, i1)*, i32 (%struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, i16, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*)*, i32 (%struct.inode*, %struct.dentry*, %struct.inode*, %struct.dentry*, i32)*, i32 (%struct.dentry*, %struct.iattr*)*, i32 (%struct.vfsmount*, %struct.dentry*, %struct.kstat*)*, i32 (%struct.dentry*, i8*, i8*, i32, i32)*, i32 (%struct.dentry*, i8*, i8*, i32)*, i32 (%struct.dentry*, i8*, i32)*, i32 (%struct.dentry*, i8*)*, i32 (%struct.inode*, %struct.fiemap_extent_info*, i64, i64)*, i32 (%struct.inode*, %struct.timespec*, i32)*, i32 (%struct.inode*, %struct.dentry*, %struct.file*, i32, i16, i32*)*, i32 (%struct.inode*, %struct.dentry*, i16)*, i32 (%struct.inode*, %struct.posix_acl*, i32)*, i32 (%struct.dentry*, %struct.file*, %struct.cred*)*, [20 x i8] }
%struct.nameidata = type opaque
%struct.posix_acl = type opaque
%struct.iattr = type { i32, i16, %struct.kuid_t, %struct.kgid_t, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.file* }
%struct.kstat = type { i64, i32, i16, i32, %struct.kuid_t, %struct.kgid_t, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i32, i64 }
%struct.fiemap_extent_info = type { i32, i32, i32, %struct.fiemap_extent* }
%struct.fiemap_extent = type { i64, i64, i64, [2 x i64], i32, [3 x i32] }
%union.anon.50 = type { i32 }
%struct.timespec = type { i32, i32 }
%union.anon.51 = type { %struct.callback_head }
%struct.file_lock = type { %struct.file_lock*, %struct.hlist_node, %struct.list_head, i8*, i32, i8, i32, i32, %struct.pid*, %struct.__wait_queue_head, %struct.file*, i64, i64, %struct.fasync_struct*, i32, i32, %struct.file_lock_operations*, %struct.lock_manager_operations*, %union.anon.52 }
%struct.pid = type { %struct.atomic_t, i32, [3 x %struct.hlist_head], %struct.callback_head, [1 x %struct.upid] }
%struct.upid = type { i32, %struct.pid_namespace*, %struct.hlist_node }
%struct.pid_namespace = type { %struct.kref, [1 x %struct.pidmap], %struct.callback_head, i32, i32, %struct.task_struct*, %struct.kmem_cache*, i32, %struct.pid_namespace*, %struct.user_namespace*, %struct.work_struct, %struct.kgid_t, i32, i32, %struct.ns_common }
%struct.kref = type { %struct.atomic_t }
%struct.pidmap = type { %struct.atomic_t, i8* }
%struct.task_struct = type { i32, i8*, %struct.atomic_t, i32, i32, i32, i32, i32, i32, i32, %struct.sched_class*, %struct.sched_entity, %struct.sched_rt_entity, %struct.sched_dl_entity, i32, i32, %struct.cpumask, %struct.list_head, %struct.mm_struct*, %struct.mm_struct*, i32, [4 x %struct.vm_area_struct*], i32, i32, i32, i32, i32, i32, i8, i32, i32, i32, %struct.task_struct*, %struct.task_struct*, %struct.list_head, %struct.list_head, %struct.task_struct*, %struct.list_head, %struct.list_head, [3 x %struct.pid_link], %struct.list_head, %struct.list_head, %struct.completion*, i32*, i32*, i32, i32, i32, i32, i32, %struct.cputime, i32, i32, i64, i64, i32, i32, %struct.task_cputime, [3 x %struct.list_head], %struct.cred*, %struct.cred*, [16 x i8], i32, i32, %struct.thread_struct, %struct.fs_struct*, %struct.files_struct*, %struct.nsproxy*, %struct.signal_struct*, %struct.sighand_struct*, %struct.sigset_t, %struct.sigset_t, %struct.sigset_t, %struct.sigpending, i32, i32, i32 (i8*)*, i8*, %struct.sigset_t*, %struct.callback_head*, %struct.audit_context*, %struct.seccomp, i32, i32, %struct.spinlock, %struct.raw_spinlock, i8*, %struct.bio_list*, %struct.reclaim_state*, %struct.backing_dev_info*, %struct.io_context*, i32, %struct.siginfo*, %struct.task_io_accounting, [2 x %struct.perf_event_context*], %struct.mutex, %struct.list_head, %struct.callback_head, %struct.pipe_inode_info*, %struct.page_frag, i32, i32, i32, i32, i32 }
%struct.sched_class = type opaque
%struct.sched_entity = type { %struct.load_weight, %struct.rb_node, %struct.list_head, i32, i64, i64, i64, i64, i64 }
%struct.load_weight = type { i32, i32 }
%struct.rb_node = type { i32, %struct.rb_node*, %struct.rb_node* }
%struct.sched_rt_entity = type { %struct.list_head, i32, i32, i32, %struct.sched_rt_entity* }
%struct.sched_dl_entity = type { %struct.rb_node, i64, i64, i64, i64, i64, i64, i32, i32, i32, i32, i32, %struct.hrtimer }
%struct.hrtimer = type { %struct.timerqueue_node, %union.ktime, i32 (%struct.hrtimer*)*, %struct.hrtimer_clock_base*, i32 }
%struct.timerqueue_node = type { %struct.rb_node, %union.ktime }
%union.ktime = type { i64 }
%struct.hrtimer_clock_base = type { %struct.hrtimer_cpu_base*, i32, i32, %struct.timerqueue_head, %union.ktime, i64 ()*, %union.ktime, %union.ktime }
%struct.hrtimer_cpu_base = type { %struct.raw_spinlock, i32, i32, i32, [4 x %struct.hrtimer_clock_base] }
%struct.timerqueue_head = type { %struct.rb_root, %struct.timerqueue_node* }
%struct.rb_root = type { %struct.rb_node* }
%struct.cpumask = type { [1 x i32] }
%struct.mm_struct = type { %struct.vm_area_struct*, %struct.rb_root, i32, i32 (%struct.file*, i32, i32, i32, i32)*, i32, i32, i32, i32, %struct.pgd_t*, %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, %struct.spinlock, %struct.rw_semaphore, %struct.list_head, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [46 x i32], %struct.mm_rss_stat, %struct.linux_binfmt*, [1 x %struct.cpumask], %struct.mm_context_t, i32, %struct.core_state*, %struct.file*, %struct.uprobes_state }
%struct.vm_area_struct = type { i32, i32, %struct.vm_area_struct*, %struct.vm_area_struct*, %struct.rb_node, i32, %struct.mm_struct*, %struct.pgprot, i32, %union.anon.6, %struct.list_head, %struct.anon_vma*, %struct.vm_operations_struct*, i32, %struct.file*, i8* }
%struct.pgprot = type { i32 }
%union.anon.6 = type { %struct.anon.7 }
%struct.anon.7 = type { %struct.rb_node, i32 }
%struct.anon_vma = type opaque
%struct.vm_operations_struct = type { void (%struct.vm_area_struct*)*, void (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, %struct.vm_fault*)*, void (%struct.vm_area_struct*, %struct.vm_fault*)*, i32 (%struct.vm_area_struct*, %struct.vm_fault*)*, i32 (%struct.vm_area_struct*, i32, i8*, i32, i32)*, i8* (%struct.vm_area_struct*)*, i32 (%struct.vm_area_struct*, i32, i32, i32)* }
%struct.vm_fault = type { i32, i32, i8*, %struct.page*, i32, %union.pte_t* }
%union.pte_t = type { i32 }
%struct.pgd_t = type { i32 }
%struct.mm_rss_stat = type { [3 x %struct.atomic_t] }
%struct.linux_binfmt = type opaque
%struct.mm_context_t = type { i8*, i32, %struct.mutex, i8* }
%struct.core_state = type { %struct.atomic_t, %struct.core_thread, %struct.completion }
%struct.core_thread = type { %struct.task_struct*, %struct.core_thread* }
%struct.completion = type { i32, %struct.__wait_queue_head }
%struct.uprobes_state = type {}
%struct.pid_link = type { %struct.hlist_node, %struct.pid* }
%struct.cputime = type { i32, i32 }
%struct.task_cputime = type { i32, i32, i64 }
%struct.thread_struct = type { [3 x %struct.desc_struct], i32, i32, i32, i32, i32, [4 x %struct.perf_event*], i32, i32, i32, i32, i32, %struct.fpu, %struct.vm86_struct*, i32, i32, i32, i32, i32, i32, i32*, i32, i32, i8 }
%struct.desc_struct = type <{ %union.anon.8 }>
%union.anon.8 = type { %struct.anon.9 }
%struct.anon.9 = type { i32, i32 }
%struct.perf_event = type { %struct.list_head, %struct.list_head, %struct.list_head, %struct.list_head, %struct.hlist_node, %struct.list_head, i32, i32, %struct.perf_event*, %struct.pmu*, i32, i32, %struct.local64_t, %struct.atomic64_t, i64, i64, i64, i64, i64, i64, %struct.perf_event_attr, i16, i16, i16, %struct.hw_perf_event, %struct.perf_event_context*, %struct.atomic_t, %struct.atomic64_t, %struct.atomic64_t, %struct.mutex, %struct.list_head, %struct.perf_event*, i32, i32, %struct.list_head, %struct.task_struct*, %struct.mutex, %struct.atomic_t, %struct.ring_buffer*, %struct.list_head, i32, i32, %struct.__wait_queue_head, %struct.fasync_struct*, i32, i32, i32, %struct.irq_work, %struct.atomic_t, void (%struct.perf_event*)*, %struct.callback_head, %struct.pid_namespace*, i64, void (%struct.perf_event*, %struct.perf_sample_data*, %struct.pt_regs*)*, i8* }
%struct.pmu = type { %struct.list_head, %struct.module*, %struct.device*, %struct.attribute_group**, i8*, i32, i32, i32*, %struct.perf_cpu_context*, i32, i32, void (%struct.pmu*)*, void (%struct.pmu*)*, i32 (%struct.perf_event*)*, i32 (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*, i32)*, void (%struct.perf_event*)*, void (%struct.pmu*)*, i32 (%struct.pmu*)*, void (%struct.pmu*)*, i32 (%struct.perf_event*)*, void ()* }
%struct.device = type { %struct.device*, %struct.device_private*, %struct.kobject, i8*, %struct.device_type*, %struct.mutex, %struct.bus_type*, %struct.device_driver*, i8*, i8*, %struct.dev_pm_info, %struct.dev_pm_domain*, i64*, i64, i32, %struct.device_dma_parameters*, %struct.list_head, %struct.dma_coherent_mem*, %struct.dev_archdata, %struct.device_node*, %struct.acpi_dev_node, i32, i32, %struct.spinlock, %struct.list_head, %struct.klist_node, %struct.class*, %struct.attribute_group**, void (%struct.device*)*, %struct.iommu_group*, i8 }
%struct.device_private = type opaque
%struct.kobject = type { i8*, %struct.list_head, %struct.kobject*, %struct.kset*, %struct.kobj_type*, %struct.kernfs_node*, %struct.kref, i8 }
%struct.kset = type { %struct.list_head, %struct.spinlock, %struct.kobject, %struct.kset_uevent_ops* }
%struct.kset_uevent_ops = type { i32 (%struct.kset*, %struct.kobject*)*, i8* (%struct.kset*, %struct.kobject*)*, i32 (%struct.kset*, %struct.kobject*, %struct.kobj_uevent_env*)* }
%struct.kobj_uevent_env = type { [3 x i8*], [32 x i8*], i32, [2048 x i8], i32 }
%struct.kobj_type = type { void (%struct.kobject*)*, %struct.sysfs_ops*, %struct.attribute**, %struct.kobj_ns_type_operations* (%struct.kobject*)*, i8* (%struct.kobject*)* }
%struct.sysfs_ops = type { i32 (%struct.kobject*, %struct.attribute*, i8*)*, i32 (%struct.kobject*, %struct.attribute*, i8*, i32)* }
%struct.attribute = type { i8*, i16 }
%struct.kobj_ns_type_operations = type { i32, i1 ()*, i8* ()*, i8* (%struct.sock*)*, i8* ()*, void (i8*)* }
%struct.sock = type opaque
%struct.kernfs_node = type { %struct.atomic_t, %struct.atomic_t, %struct.kernfs_node*, i8*, %struct.rb_node, i8*, i32, %union.anon.11, i8*, i16, i16, i32, %struct.kernfs_iattrs* }
%union.anon.11 = type { %struct.kernfs_elem_attr }
%struct.kernfs_elem_attr = type { %struct.kernfs_ops*, %struct.kernfs_open_node*, i64, %struct.kernfs_node* }
%struct.kernfs_ops = type { i32 (%struct.seq_file*, i8*)*, i8* (%struct.seq_file*, i64*)*, i8* (%struct.seq_file*, i8*, i64*)*, void (%struct.seq_file*, i8*)*, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32, i8, i32 (%struct.kernfs_open_file*, i8*, i32, i64)*, i32 (%struct.kernfs_open_file*, %struct.vm_area_struct*)* }
%struct.kernfs_open_file = type { %struct.kernfs_node*, %struct.file*, i8*, %struct.mutex, i32, %struct.list_head, i8*, i32, i8, %struct.vm_operations_struct* }
%struct.kernfs_open_node = type opaque
%struct.kernfs_iattrs = type opaque
%struct.device_type = type { i8*, %struct.attribute_group**, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*, %struct.kuid_t*, %struct.kgid_t*)*, void (%struct.device*)*, %struct.dev_pm_ops* }
%struct.dev_pm_ops = type { i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)* }
%struct.bus_type = type { i8*, i8*, %struct.device*, %struct.device_attribute*, %struct.attribute_group**, %struct.attribute_group**, %struct.attribute_group**, i32 (%struct.device*, %struct.device_driver*)*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.dev_pm_ops*, %struct.iommu_ops*, %struct.subsys_private*, %struct.lock_class_key }
%struct.device_attribute = type { %struct.attribute, i32 (%struct.device*, %struct.device_attribute*, i8*)*, i32 (%struct.device*, %struct.device_attribute*, i8*, i32)* }
%struct.iommu_ops = type opaque
%struct.subsys_private = type opaque
%struct.device_driver = type { i8*, %struct.bus_type*, %struct.module*, i8*, i8, %struct.of_device_id*, %struct.acpi_device_id*, i32 (%struct.device*)*, i32 (%struct.device*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.attribute_group**, %struct.dev_pm_ops*, %struct.driver_private* }
%struct.of_device_id = type opaque
%struct.acpi_device_id = type opaque
%struct.driver_private = type opaque
%struct.dev_pm_info = type { %struct.pm_message, [2 x i8], %struct.spinlock, i8, %struct.pm_subsys_data*, void (%struct.device*, i32)*, %struct.dev_pm_qos* }
%struct.pm_message = type { i32 }
%struct.pm_subsys_data = type { %struct.spinlock, i32 }
%struct.dev_pm_qos = type opaque
%struct.dev_pm_domain = type { %struct.dev_pm_ops, void (%struct.device*, i1)* }
%struct.device_dma_parameters = type { i32, i32 }
%struct.dma_coherent_mem = type opaque
%struct.dev_archdata = type {}
%struct.device_node = type opaque
%struct.acpi_dev_node = type {}
%struct.klist_node = type { i8*, %struct.list_head, %struct.kref }
%struct.class = type { i8*, %struct.module*, %struct.class_attribute*, %struct.attribute_group**, %struct.kobject*, i32 (%struct.device*, %struct.kobj_uevent_env*)*, i8* (%struct.device*, i16*)*, void (%struct.class*)*, void (%struct.device*)*, i32 (%struct.device*, i32)*, i32 (%struct.device*)*, %struct.kobj_ns_type_operations*, i8* (%struct.device*)*, %struct.dev_pm_ops*, %struct.subsys_private* }
%struct.class_attribute = type { %struct.attribute, i32 (%struct.class*, %struct.class_attribute*, i8*)*, i32 (%struct.class*, %struct.class_attribute*, i8*, i32)* }
%struct.iommu_group = type opaque
%struct.attribute_group = type { i8*, i16 (%struct.kobject*, %struct.attribute*, i32)*, %struct.attribute**, %struct.bin_attribute** }
%struct.bin_attribute = type { %struct.attribute, i32, i8*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i32)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, i8*, i64, i32)*, i32 (%struct.file*, %struct.kobject*, %struct.bin_attribute*, %struct.vm_area_struct*)* }
%struct.perf_cpu_context = type { %struct.perf_event_context, %struct.perf_event_context*, i32, i32, %struct.hrtimer, %union.ktime, %struct.list_head, %struct.pmu*, %struct.perf_cgroup* }
%struct.perf_event_context = type { %struct.pmu*, i32, %struct.raw_spinlock, %struct.mutex, %struct.list_head, %struct.list_head, %struct.list_head, i32, i32, i32, i32, i32, i32, %struct.atomic_t, %struct.task_struct*, i64, i64, %struct.perf_event_context*, i64, i64, i32, i32, i32, %struct.callback_head, %struct.delayed_work, i8 }
%struct.delayed_work = type { %struct.work_struct, %struct.timer_list, %struct.workqueue_struct*, i32 }
%struct.timer_list = type { %struct.list_head, i32, %struct.tvec_base*, void (i32)*, i32, i32 }
%struct.tvec_base = type opaque
%struct.perf_cgroup = type opaque
%struct.local64_t = type { %struct.atomic64_t }
%struct.perf_event_attr = type { i32, i32, i64, %union.anon.13, i64, i64, [8 x i8], %union.anon.14, i32, %union.anon.15, %union.anon.16, i64, i64, i32, i32, i64 }
%union.anon.13 = type { i64 }
%union.anon.14 = type { i32 }
%union.anon.15 = type { i64 }
%union.anon.16 = type { i64 }
%struct.hw_perf_event = type { %union.anon.17, i32, %struct.local64_t, i64, i64, %struct.local64_t, i64, i64, i64, i64 }
%union.anon.17 = type { %struct.anon.18 }
%struct.anon.18 = type { i64, i64, i32, i32, i32, i32, i32, i32, %struct.hw_perf_event_extra, %struct.hw_perf_event_extra, %struct.event_constraint* }
%struct.hw_perf_event_extra = type { i64, i32, i32, i32 }
%struct.event_constraint = type opaque
%struct.atomic64_t = type { i64 }
%struct.ring_buffer = type opaque
%struct.irq_work = type { i32, %struct.llist_node, void (%struct.irq_work*)* }
%struct.llist_node = type { %struct.llist_node* }
%struct.perf_sample_data = type { i64, %struct.perf_raw_record*, %struct.perf_branch_stack*, i64, i64, i64, %union.perf_mem_data_src, i64, i64, %struct.anon.23, i64, i64, i64, %struct.anon.24, %struct.perf_callchain_entry*, %struct.perf_regs, %struct.pt_regs, %struct.perf_regs, i64, [16 x i8] }
%struct.perf_raw_record = type { i32, i8* }
%struct.perf_branch_stack = type { i64, [0 x %struct.perf_branch_entry] }
%struct.perf_branch_entry = type { i64, i64, [8 x i8] }
%union.perf_mem_data_src = type { i64 }
%struct.anon.23 = type { i32, i32 }
%struct.anon.24 = type { i32, i32 }
%struct.perf_callchain_entry = type { i64, [127 x i64] }
%struct.pt_regs = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.perf_regs = type { i64, %struct.pt_regs* }
%struct.fpu = type { i32, i32, %union.thread_xstate* }
%union.thread_xstate = type { %struct.i387_fxsave_struct, [576 x i8] }
%struct.i387_fxsave_struct = type { i16, i16, i16, i16, %union.anon.25, i32, i32, [32 x i32], [64 x i32], [12 x i32], %union.anon.28 }
%union.anon.25 = type { %struct.anon.26 }
%struct.anon.26 = type { i64, i64 }
%union.anon.28 = type { [12 x i32] }
%struct.vm86_struct = type { %struct.vm86_regs, i32, i32, i32, %struct.revectored_struct, %struct.revectored_struct }
%struct.vm86_regs = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16, i16, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i16, i16 }
%struct.revectored_struct = type { [8 x i32] }
%struct.fs_struct = type opaque
%struct.files_struct = type opaque
%struct.nsproxy = type { %struct.atomic_t, %struct.uts_namespace*, %struct.ipc_namespace*, %struct.mnt_namespace*, %struct.pid_namespace*, %struct.net* }
%struct.uts_namespace = type opaque
%struct.ipc_namespace = type opaque
%struct.mnt_namespace = type opaque
%struct.net = type opaque
%struct.signal_struct = type { %struct.atomic_t, %struct.atomic_t, i32, %struct.list_head, %struct.__wait_queue_head, %struct.task_struct*, %struct.sigpending, i32, i32, %struct.task_struct*, i32, i32, i8, i32, %struct.list_head, %struct.hrtimer, %struct.pid*, %union.ktime, [2 x %struct.cpu_itimer], %struct.thread_group_cputimer, %struct.task_cputime, [3 x %struct.list_head], %struct.pid*, i32, %struct.tty_struct*, %struct.seqlock_t, i32, i32, i32, i32, i32, i32, %struct.cputime, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.task_io_accounting, i64, [16 x %struct.rlimit], i32, i16, i16, %struct.mutex }
%struct.cpu_itimer = type { i32, i32, i32, i32 }
%struct.thread_group_cputimer = type { %struct.task_cputime, i32, %struct.raw_spinlock }
%struct.tty_struct = type opaque
%struct.seqlock_t = type { %struct.seqcount, %struct.spinlock }
%struct.rlimit = type { i32, i32 }
%struct.sighand_struct = type { %struct.atomic_t, [64 x %struct.k_sigaction], %struct.spinlock, %struct.__wait_queue_head }
%struct.k_sigaction = type { %struct.sigaction }
%struct.sigaction = type { void (i32)*, i32, void ()*, %struct.sigset_t }
%struct.sigset_t = type { [2 x i32] }
%struct.sigpending = type { %struct.list_head, %struct.sigset_t }
%struct.audit_context = type opaque
%struct.seccomp = type {}
%struct.bio_list = type opaque
%struct.reclaim_state = type opaque
%struct.io_context = type opaque
%struct.siginfo = type { i32, i32, i32, %union.anon.30 }
%union.anon.30 = type { [29 x i32] }
%struct.task_io_accounting = type {}
%struct.pipe_inode_info = type { %struct.mutex, %struct.__wait_queue_head, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.page*, %struct.fasync_struct*, %struct.fasync_struct*, %struct.pipe_buffer* }
%struct.pipe_buffer = type { %struct.page*, i32, i32, %struct.pipe_buf_operations*, i32, i32 }
%struct.pipe_buf_operations = type { i32, i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, i32 (%struct.pipe_inode_info*, %struct.pipe_buffer*)*, void (%struct.pipe_inode_info*, %struct.pipe_buffer*)* }
%struct.page_frag = type { %struct.page*, i16, i16 }
%struct.kmem_cache = type opaque
%struct.user_namespace = type opaque
%struct.work_struct = type { %struct.atomic_t, %struct.list_head, void (%struct.work_struct*)* }
%struct.ns_common = type { %struct.atomic_t, %struct.proc_ns_operations*, i32 }
%struct.proc_ns_operations = type opaque
%struct.fasync_struct = type { %struct.spinlock, i32, i32, %struct.fasync_struct*, %struct.file*, %struct.callback_head }
%struct.file_lock_operations = type { void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)* }
%struct.lock_manager_operations = type { i32 (%struct.file_lock*, %struct.file_lock*)*, i32 (%struct.file_lock*)*, void (%struct.file_lock*, %struct.file_lock*)*, void (%struct.file_lock*)*, void (%struct.file_lock*)*, i32 (%struct.file_lock*, i32)*, i1 (%struct.file_lock*)*, i32 (%struct.file_lock**, i32, %struct.list_head*)*, void (%struct.file_lock*, i8**)* }
%union.anon.52 = type { %struct.nfs_lock_info }
%struct.nfs_lock_info = type { i32, %struct.nlm_lockowner*, %struct.list_head }
%struct.nlm_lockowner = type opaque
%struct.address_space = type { %struct.inode*, %struct.radix_tree_root, %struct.spinlock, %struct.atomic_t, %struct.rb_root, %struct.list_head, %struct.rw_semaphore, i32, i32, i32, %struct.address_space_operations*, i32, %struct.backing_dev_info*, %struct.spinlock, %struct.list_head, i8* }
%struct.radix_tree_root = type { i32, i32, %struct.radix_tree_node* }
%struct.radix_tree_node = type { i32, i32, %union.anon.3, %struct.list_head, [16 x i8*], [3 x [1 x i32]] }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { %struct.radix_tree_node*, i8* }
%struct.address_space_operations = type { i32 (%struct.page*, %struct.writeback_control*)*, i32 (%struct.file*, %struct.page*)*, i32 (%struct.address_space*, %struct.writeback_control*)*, i32 (%struct.page*)*, i32 (%struct.file*, %struct.address_space*, %struct.list_head*, i32)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page**, i8**)*, i32 (%struct.file*, %struct.address_space*, i64, i32, i32, %struct.page*, i8*)*, i32 (%struct.address_space*, i32)*, void (%struct.page*, i32, i32)*, i32 (%struct.page*, i32)*, void (%struct.page*)*, i32 (i32, %struct.kiocb*, %struct.iov_iter*, i64)*, i32 (%struct.address_space*, i32, i32, i8**, i32*)*, i32 (%struct.address_space*, %struct.page*, %struct.page*, i32)*, i32 (%struct.page*)*, i32 (%struct.page*, i32, i32)*, void (%struct.page*, i8*, i8*)*, i32 (%struct.address_space*, %struct.page*)*, i32 (%struct.swap_info_struct*, %struct.file*, i32*)*, void (%struct.file*)* }
%struct.kiocb = type { %struct.file*, %struct.kioctx*, i32 (%struct.kiocb*)*, i8*, %union.anon.5, i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }
%struct.kioctx = type opaque
%union.anon.5 = type { i8* }
%struct.eventfd_ctx = type opaque
%struct.iov_iter = type { i32, i32, i32, %union.anon.39, i32 }
%union.anon.39 = type { %struct.iovec* }
%struct.iovec = type { i8*, i32 }
%struct.swap_info_struct = type opaque
%union.anon.54 = type { %struct.pipe_inode_info* }
%struct.file_operations = type { %struct.module*, {}*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.kiocb*, %struct.iovec*, i32, i64)*, i32 (%struct.kiocb*, %struct.iovec*, i32, i64)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.vm_area_struct*)*, void (%struct.file*, %struct.vm_area_struct*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (%struct.kiocb*, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.file*, %struct.page*, i32, i32, i64*, i32)*, i32 (%struct.file*, i32, i32, i32, i32)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.pipe_inode_info*, %struct.file*, i64*, i32, i32)*, i32 (%struct.file*, i64*, %struct.pipe_inode_info*, i32, i32)*, i32 (%struct.file*, i32, %struct.file_lock**, i8**)*, i32 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)* }
%struct.spinlock = type { %union.anon.1 }
%union.anon.1 = type { %struct.raw_spinlock }
%struct.atomic_t = type { i32 }
%struct.mutex = type { %struct.atomic_t, %struct.spinlock, %struct.list_head }
%struct.fown_struct = type { %struct.rwlock_t, %struct.pid*, i32, %struct.kuid_t, %struct.kuid_t, i32 }
%struct.rwlock_t = type { %struct.arch_rwlock_t }
%struct.arch_rwlock_t = type {}
%struct.cred = type { %struct.atomic_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, %struct.kuid_t, %struct.kgid_t, i32, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.kernel_cap_struct, %struct.user_struct*, %struct.user_namespace*, %struct.group_info*, %struct.callback_head }
%struct.kernel_cap_struct = type { [2 x i32] }
%struct.user_struct = type { %struct.atomic_t, %struct.atomic_t, %struct.atomic_t, i32, %struct.hlist_node, %struct.kuid_t, %struct.atomic_t }
%struct.group_info = type { %struct.atomic_t, i32, i32, [32 x %struct.kgid_t], [0 x %struct.kgid_t*] }
%struct.file_ra_state = type { i32, i32, i32, i32, i32, i64 }
%struct.dir_context = type { i32 (%struct.dir_context*, i8*, i32, i64, i64, i32)*, i64 }
%struct.poll_table_struct = type { void (%struct.file*, %struct.__wait_queue_head*, %struct.poll_table_struct*)*, i32 }
%struct.thread_info = type { %struct.task_struct*, %struct.exec_domain*, i32, i32, i32, i32, %struct.mm_segment_t, %struct.restart_block, i8*, i8 }
%struct.exec_domain = type { i8*, void (i32, %struct.pt_regs*)*, i8, i8, i32*, i32*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.map_segment*, %struct.module*, %struct.exec_domain* }
%struct.map_segment = type opaque
%struct.mm_segment_t = type { i32 }
%struct.restart_block = type { i32 (%struct.restart_block*)*, %union.anon.58 }
%union.anon.58 = type { %struct.anon.59 }
%struct.anon.59 = type { i32*, i32, i32, i32, i64, i32* }

@generic_ro_fops = constant { %struct.module*, i64 (%struct.file*, i64, i32)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.file*, i8*, i32, i64*)*, i32 (%struct.kiocb*, %struct.iovec*, i32, i64)*, i32 (%struct.kiocb*, %struct.iovec*, i32, i64)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.kiocb*, %struct.iov_iter*)*, i32 (%struct.file*, %struct.dir_context*)*, i32 (%struct.file*, %struct.poll_table_struct*)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, i32, i32)*, i32 (%struct.file*, %struct.vm_area_struct*)*, void (%struct.file*, %struct.vm_area_struct*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i8*)*, i32 (%struct.inode*, %struct.file*)*, i32 (%struct.file*, i64, i64, i32)*, i32 (%struct.kiocb*, i32)*, i32 (i32, %struct.file*, i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.file*, %struct.page*, i32, i32, i64*, i32)*, i32 (%struct.file*, i32, i32, i32, i32)*, i32 (i32)*, i32 (%struct.file*, i32, %struct.file_lock*)*, i32 (%struct.pipe_inode_info*, %struct.file*, i64*, i32, i32)*, i32 (%struct.file*, i64*, %struct.pipe_inode_info*, i32, i32)*, i32 (%struct.file*, i32, %struct.file_lock**, i8**)*, i32 (%struct.file*, i32, i64, i64)*, void (%struct.seq_file*, %struct.file*)* } { %struct.module* null, i64 (%struct.file*, i64, i32)* @generic_file_llseek, i32 (%struct.file*, i8*, i32, i64*)* @new_sync_read, i32 (%struct.file*, i8*, i32, i64*)* null, i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* null, i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* null, i32 (%struct.kiocb*, %struct.iov_iter*)* @generic_file_read_iter, i32 (%struct.kiocb*, %struct.iov_iter*)* null, i32 (%struct.file*, %struct.dir_context*)* null, i32 (%struct.file*, %struct.poll_table_struct*)* null, i32 (%struct.file*, i32, i32)* null, i32 (%struct.file*, i32, i32)* null, i32 (%struct.file*, %struct.vm_area_struct*)* @generic_file_readonly_mmap, void (%struct.file*, %struct.vm_area_struct*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i8*)* null, i32 (%struct.inode*, %struct.file*)* null, i32 (%struct.file*, i64, i64, i32)* null, i32 (%struct.kiocb*, i32)* null, i32 (i32, %struct.file*, i32)* null, i32 (%struct.file*, i32, %struct.file_lock*)* null, i32 (%struct.file*, %struct.page*, i32, i32, i64*, i32)* null, i32 (%struct.file*, i32, i32, i32, i32)* null, i32 (i32)* null, i32 (%struct.file*, i32, %struct.file_lock*)* null, i32 (%struct.pipe_inode_info*, %struct.file*, i64*, i32, i32)* null, i32 (%struct.file*, i64*, %struct.pipe_inode_info*, i32, i32)* @generic_file_splice_read, i32 (%struct.file*, i32, %struct.file_lock**, i8**)* null, i32 (%struct.file*, i32, i64, i64)* null, void (%struct.seq_file*, %struct.file*)* null }, align 4
@current_task = external global %struct.task_struct*
@kernel_stack = external global i32

@sys_lseek = alias i32 (i32, i32, i32)* @SyS_lseek
@sys_llseek = alias bitcast (i32 (i32, i32, i32, i32, i32)* @SyS_llseek to i32 (i32, i32, i32, i64*, i32)*)
@sys_read = alias bitcast (i32 (i32, i32, i32)* @SyS_read to i32 (i32, i8*, i32)*)
@sys_write = alias bitcast (i32 (i32, i32, i32)* @SyS_write to i32 (i32, i8*, i32)*)
@sys_pread64 = alias bitcast (i32 (i32, i32, i32, i64)* @SyS_pread64 to i32 (i32, i8*, i32, i64)*)
@sys_pwrite64 = alias bitcast (i32 (i32, i32, i32, i64)* @SyS_pwrite64 to i32 (i32, i8*, i32, i64)*)
@sys_readv = alias bitcast (i32 (i32, i32, i32)* @SyS_readv to i32 (i32, %struct.iovec*, i32)*)
@sys_writev = alias bitcast (i32 (i32, i32, i32)* @SyS_writev to i32 (i32, %struct.iovec*, i32)*)
@sys_preadv = alias bitcast (i32 (i32, i32, i32, i32, i32)* @SyS_preadv to i32 (i32, %struct.iovec*, i32, i32, i32)*)
@sys_pwritev = alias bitcast (i32 (i32, i32, i32, i32, i32)* @SyS_pwritev to i32 (i32, %struct.iovec*, i32, i32, i32)*)
@sys_sendfile = alias bitcast (i32 (i32, i32, i32, i32)* @SyS_sendfile to i32 (i32, i32, i32*, i32)*)
@sys_sendfile64 = alias bitcast (i32 (i32, i32, i32, i32)* @SyS_sendfile64 to i32 (i32, i32, i64*, i32)*)

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i64 @generic_file_llseek(%struct.file* inreg nocapture %file, i64 inreg %offset, i32 %whence) #0 {
bb:
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 15
  %tmp1 = load %struct.address_space** %tmp, align 4
  %tmp2 = getelementptr inbounds %struct.address_space* %tmp1, i32 0, i32 0
  %tmp3 = load %struct.inode** %tmp2, align 4
  %tmp4 = getelementptr inbounds %struct.inode* %tmp3, i32 0, i32 6
  %tmp5 = load %struct.super_block** %tmp4, align 4
  %tmp6 = getelementptr inbounds %struct.super_block* %tmp5, i32 0, i32 4
  %tmp7 = load i64* %tmp6, align 4
  %tmp8 = getelementptr inbounds %struct.inode* %tmp3, i32 0, i32 11
  %tmp9 = load i64* %tmp8, align 4
  switch i32 %whence, label %bb34 [
    i32 2, label %bb10
    i32 1, label %bb12
    i32 3, label %bb30
    i32 4, label %bb32
  ]

bb10:                                             ; preds = %bb
  %tmp11 = add i64 %tmp9, %offset
  br label %bb34

bb12:                                             ; preds = %bb
  %tmp13 = icmp eq i64 %offset, 0
  br i1 %tmp13, label %bb14, label %bb17

bb14:                                             ; preds = %bb12
  %tmp15 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp16 = load i64* %tmp15, align 4
  br label %generic_file_llseek_size.exit

bb17:                                             ; preds = %bb12
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !1
  %tmp18 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp19 = load i64* %tmp18, align 4
  %tmp20 = add i64 %tmp19, %offset
  %tmp21 = icmp slt i64 %tmp20, 0
  br i1 %tmp21, label %bb22, label %bb28

bb22:                                             ; preds = %bb17
  %tmp23 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp24 = load i32* %tmp23, align 4
  %tmp25 = and i32 %tmp24, 8192
  %tmp26 = icmp eq i32 %tmp25, 0
  %tmp27 = icmp sgt i64 %tmp20, %tmp7
  %or.cond.i.i = or i1 %tmp26, %tmp27
  br i1 %or.cond.i.i, label %vfs_setpos.exit.i, label %.thread

bb28:                                             ; preds = %bb17
  %.old.i.i = icmp sgt i64 %tmp20, %tmp7
  %.mux = select i1 %.old.i.i, i64 -22, i64 %tmp19
  br i1 %.old.i.i, label %vfs_setpos.exit.i, label %.thread

.thread:                                          ; preds = %bb28, %bb22
  store i64 %tmp20, i64* %tmp18, align 4
  %tmp29 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp29, align 4
  br label %vfs_setpos.exit.i

vfs_setpos.exit.i:                                ; preds = %.thread, %bb28, %bb22
  %.0.i.i = phi i64 [ -22, %bb22 ], [ %.mux, %bb28 ], [ %tmp20, %.thread ]
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !2
  br label %generic_file_llseek_size.exit

bb30:                                             ; preds = %bb
  %tmp31 = icmp sgt i64 %tmp9, %offset
  br i1 %tmp31, label %bb34, label %generic_file_llseek_size.exit

bb32:                                             ; preds = %bb
  %tmp33 = icmp sgt i64 %tmp9, %offset
  br i1 %tmp33, label %bb34, label %generic_file_llseek_size.exit

bb34:                                             ; preds = %bb32, %bb30, %bb10, %bb
  %.01.i = phi i64 [ %offset, %bb ], [ %offset, %bb30 ], [ %tmp11, %bb10 ], [ %tmp9, %bb32 ]
  %tmp35 = icmp slt i64 %.01.i, 0
  br i1 %tmp35, label %bb36, label %bb42

bb36:                                             ; preds = %bb34
  %tmp37 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp38 = load i32* %tmp37, align 4
  %tmp39 = and i32 %tmp38, 8192
  %tmp40 = icmp eq i32 %tmp39, 0
  %tmp41 = icmp sgt i64 %.01.i, %tmp7
  %or.cond.i2.i = or i1 %tmp40, %tmp41
  br i1 %or.cond.i2.i, label %generic_file_llseek_size.exit, label %bb43

bb42:                                             ; preds = %bb34
  %.old.i3.i = icmp sgt i64 %.01.i, %tmp7
  br i1 %.old.i3.i, label %generic_file_llseek_size.exit, label %bb43

bb43:                                             ; preds = %bb42, %bb36
  %tmp44 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp45 = load i64* %tmp44, align 4
  %tmp46 = icmp eq i64 %tmp45, %.01.i
  br i1 %tmp46, label %generic_file_llseek_size.exit, label %bb47

bb47:                                             ; preds = %bb43
  store i64 %.01.i, i64* %tmp44, align 4
  %tmp48 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp48, align 4
  br label %generic_file_llseek_size.exit

generic_file_llseek_size.exit:                    ; preds = %bb47, %bb43, %bb42, %bb36, %bb32, %bb30, %vfs_setpos.exit.i, %bb14
  %.0.i = phi i64 [ %tmp16, %bb14 ], [ %.0.i.i, %vfs_setpos.exit.i ], [ -6, %bb30 ], [ -6, %bb32 ], [ -22, %bb36 ], [ -22, %bb42 ], [ %.01.i, %bb43 ], [ %.01.i, %bb47 ]
  ret i64 %.0.i
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @new_sync_read(%struct.file* inreg %filp, i8* inreg %buf, i32 inreg %len, i64* nocapture %ppos) #0 {
bb:
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 4
  %kiocb = alloca %struct.kiocb, align 4
  %iter = alloca %struct.iov_iter, align 4
  %tmp = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 0
  store i8* %buf, i8** %tmp, align 4
  %tmp1 = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 1
  store i32 %len, i32* %tmp1, align 4
  %tmp2 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp2) #4
  %tmp3 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp3)
  %tmp4 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp4)
  call void @llvm.memset.p0i8.i64(i8* %tmp3, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp4, i8 0, i64 32, i32 8, i1 false)
  %tmp5 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp6 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 0
  store %struct.file* %filp, %struct.file** %tmp6, align 4
  %tmp7 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 1
  %tmp8 = bitcast %struct.kioctx** %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp8, i8* %tmp3, i32 12, i32 4, i1 false) #4
  %tmp9 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %tmp5 to i8*
  store i8* %.c.i, i8** %tmp9, align 4
  %tmp10 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 5
  %tmp11 = bitcast i64* %tmp10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp11, i8* %tmp4, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp3)
  call void @llvm.lifetime.end(i64 32, i8* %tmp4)
  %tmp12 = load i64* %ppos, align 4
  %tmp13 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 6
  store i64 %tmp12, i64* %tmp13, align 4
  %tmp14 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 7
  store i32 %len, i32* %tmp14, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter, i32 inreg 0, %struct.iovec* inreg %iov, i32 1, i32 %len) #6
  %tmp15 = getelementptr inbounds %struct.file* %filp, i32 0, i32 3
  %tmp16 = load %struct.file_operations** %tmp15, align 4
  %tmp17 = getelementptr inbounds %struct.file_operations* %tmp16, i32 0, i32 6
  %tmp18 = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp17, align 4
  %tmp19 = call i32 %tmp18(%struct.kiocb* inreg %kiocb, %struct.iov_iter* inreg %iter) #6
  %tmp20 = icmp eq i32 %tmp19, -529
  %. = select i1 %tmp20, i32 0, i32 %tmp19
  %tmp21 = load i64* %tmp13, align 4
  store i64 %tmp21, i64* %ppos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp2) #4
  ret i32 %.
}

; Function Attrs: noimplicitfloat
declare i32 @generic_file_read_iter(%struct.kiocb* inreg, %struct.iov_iter* inreg) #1

; Function Attrs: noimplicitfloat
declare i32 @generic_file_readonly_mmap(%struct.file* inreg, %struct.vm_area_struct* inreg) #1

; Function Attrs: noimplicitfloat
declare i32 @generic_file_splice_read(%struct.file* inreg, i64* inreg, %struct.pipe_inode_info* inreg, i32, i32) #1

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i64 @vfs_setpos(%struct.file* inreg nocapture %file, i64 inreg %offset, i64 %maxsize) #0 {
bb:
  %tmp = icmp slt i64 %offset, 0
  br i1 %tmp, label %bb1, label %bb7

bb1:                                              ; preds = %bb
  %tmp2 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp3 = load i32* %tmp2, align 4
  %tmp4 = and i32 %tmp3, 8192
  %tmp5 = icmp eq i32 %tmp4, 0
  %tmp6 = icmp sgt i64 %offset, %maxsize
  %or.cond = or i1 %tmp5, %tmp6
  br i1 %or.cond, label %bb14, label %bb8

bb7:                                              ; preds = %bb
  %.old = icmp sgt i64 %offset, %maxsize
  br i1 %.old, label %bb14, label %bb8

bb8:                                              ; preds = %bb7, %bb1
  %tmp9 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp10 = load i64* %tmp9, align 4
  %tmp11 = icmp eq i64 %tmp10, %offset
  br i1 %tmp11, label %bb14, label %bb12

bb12:                                             ; preds = %bb8
  store i64 %offset, i64* %tmp9, align 4
  %tmp13 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp13, align 4
  br label %bb14

bb14:                                             ; preds = %bb12, %bb8, %bb7, %bb1
  %.0 = phi i64 [ -22, %bb1 ], [ -22, %bb7 ], [ %offset, %bb8 ], [ %offset, %bb12 ]
  ret i64 %.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i64 @generic_file_llseek_size(%struct.file* inreg nocapture %file, i64 inreg %offset, i32 %whence, i64 %maxsize, i64 %eof) #0 {
bb:
  switch i32 %whence, label %bb25 [
    i32 2, label %bb1
    i32 1, label %bb2
    i32 3, label %bb21
    i32 4, label %bb23
  ]

bb1:                                              ; preds = %bb
  %tmp = add i64 %eof, %offset
  br label %bb25

bb2:                                              ; preds = %bb
  %tmp3 = icmp eq i64 %offset, 0
  br i1 %tmp3, label %bb4, label %bb7

bb4:                                              ; preds = %bb2
  %tmp5 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp6 = load i64* %tmp5, align 4
  br label %vfs_setpos.exit5

bb7:                                              ; preds = %bb2
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !1
  %tmp8 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp9 = load i64* %tmp8, align 4
  %tmp10 = add i64 %tmp9, %offset
  %tmp11 = icmp slt i64 %tmp10, 0
  br i1 %tmp11, label %bb12, label %bb18

bb12:                                             ; preds = %bb7
  %tmp13 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp14 = load i32* %tmp13, align 4
  %tmp15 = and i32 %tmp14, 8192
  %tmp16 = icmp eq i32 %tmp15, 0
  %tmp17 = icmp sgt i64 %tmp10, %maxsize
  %or.cond.i = or i1 %tmp16, %tmp17
  %.mux2 = select i1 %or.cond.i, i64 -22, i64 %tmp9
  br i1 %or.cond.i, label %vfs_setpos.exit, label %bb19

bb18:                                             ; preds = %bb7
  %.old.i = icmp sgt i64 %tmp10, %maxsize
  %.mux = select i1 %.old.i, i64 -22, i64 %tmp9
  br i1 %.old.i, label %vfs_setpos.exit, label %bb19

bb19:                                             ; preds = %bb18, %bb12
  store i64 %tmp10, i64* %tmp8, align 4
  %tmp20 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp20, align 4
  br label %vfs_setpos.exit

vfs_setpos.exit:                                  ; preds = %bb19, %bb18, %bb12
  %.0.i = phi i64 [ %.mux2, %bb12 ], [ %.mux, %bb18 ], [ %tmp10, %bb19 ]
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !2
  br label %vfs_setpos.exit5

bb21:                                             ; preds = %bb
  %tmp22 = icmp slt i64 %offset, %eof
  br i1 %tmp22, label %bb25, label %vfs_setpos.exit5

bb23:                                             ; preds = %bb
  %tmp24 = icmp slt i64 %offset, %eof
  br i1 %tmp24, label %bb25, label %vfs_setpos.exit5

bb25:                                             ; preds = %bb23, %bb21, %bb1, %bb
  %.01 = phi i64 [ %offset, %bb ], [ %offset, %bb21 ], [ %tmp, %bb1 ], [ %eof, %bb23 ]
  %tmp26 = icmp slt i64 %.01, 0
  br i1 %tmp26, label %bb27, label %bb33

bb27:                                             ; preds = %bb25
  %tmp28 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp29 = load i32* %tmp28, align 4
  %tmp30 = and i32 %tmp29, 8192
  %tmp31 = icmp eq i32 %tmp30, 0
  %tmp32 = icmp sgt i64 %.01, %maxsize
  %or.cond.i2 = or i1 %tmp31, %tmp32
  br i1 %or.cond.i2, label %vfs_setpos.exit5, label %bb34

bb33:                                             ; preds = %bb25
  %.old.i3 = icmp sgt i64 %.01, %maxsize
  br i1 %.old.i3, label %vfs_setpos.exit5, label %bb34

bb34:                                             ; preds = %bb33, %bb27
  %tmp35 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp36 = load i64* %tmp35, align 4
  %tmp37 = icmp eq i64 %tmp36, %.01
  br i1 %tmp37, label %vfs_setpos.exit5, label %bb38

bb38:                                             ; preds = %bb34
  store i64 %.01, i64* %tmp35, align 4
  %tmp39 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp39, align 4
  br label %vfs_setpos.exit5

vfs_setpos.exit5:                                 ; preds = %bb38, %bb34, %bb33, %bb27, %bb23, %bb21, %vfs_setpos.exit, %bb4
  %.0 = phi i64 [ %tmp6, %bb4 ], [ %.0.i, %vfs_setpos.exit ], [ -6, %bb21 ], [ -6, %bb23 ], [ -22, %bb27 ], [ -22, %bb33 ], [ %.01, %bb34 ], [ %.01, %bb38 ]
  ret i64 %.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i64 @fixed_size_llseek(%struct.file* inreg nocapture %file, i64 inreg %offset, i32 %whence, i64 %size) #0 {
bb:
  %switch = icmp ult i32 %whence, 3
  br i1 %switch, label %bb1, label %generic_file_llseek_size.exit

bb1:                                              ; preds = %bb
  switch i32 %whence, label %bb21 [
    i32 2, label %bb2
    i32 1, label %bb3
  ]

bb2:                                              ; preds = %bb1
  %tmp = add i64 %size, %offset
  br label %bb21

bb3:                                              ; preds = %bb1
  %tmp4 = icmp eq i64 %offset, 0
  br i1 %tmp4, label %bb5, label %bb8

bb5:                                              ; preds = %bb3
  %tmp6 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp7 = load i64* %tmp6, align 4
  br label %generic_file_llseek_size.exit

bb8:                                              ; preds = %bb3
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !1
  %tmp9 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp10 = load i64* %tmp9, align 4
  %tmp11 = add i64 %tmp10, %offset
  %tmp12 = icmp slt i64 %tmp11, 0
  br i1 %tmp12, label %bb13, label %bb19

bb13:                                             ; preds = %bb8
  %tmp14 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = and i32 %tmp15, 8192
  %tmp17 = icmp eq i32 %tmp16, 0
  %tmp18 = icmp sgt i64 %tmp11, %size
  %or.cond.i.i = or i1 %tmp17, %tmp18
  br i1 %or.cond.i.i, label %vfs_setpos.exit.i, label %.thread

bb19:                                             ; preds = %bb8
  %.old.i.i = icmp sgt i64 %tmp11, %size
  %.mux = select i1 %.old.i.i, i64 -22, i64 %tmp10
  br i1 %.old.i.i, label %vfs_setpos.exit.i, label %.thread

.thread:                                          ; preds = %bb19, %bb13
  store i64 %tmp11, i64* %tmp9, align 4
  %tmp20 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp20, align 4
  br label %vfs_setpos.exit.i

vfs_setpos.exit.i:                                ; preds = %.thread, %bb19, %bb13
  %.0.i.i = phi i64 [ -22, %bb13 ], [ %.mux, %bb19 ], [ %tmp11, %.thread ]
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !2
  br label %generic_file_llseek_size.exit

bb21:                                             ; preds = %bb2, %bb1
  %.01.i = phi i64 [ %offset, %bb1 ], [ %tmp, %bb2 ]
  %tmp22 = icmp slt i64 %.01.i, 0
  br i1 %tmp22, label %bb23, label %bb29

bb23:                                             ; preds = %bb21
  %tmp24 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp25 = load i32* %tmp24, align 4
  %tmp26 = and i32 %tmp25, 8192
  %tmp27 = icmp eq i32 %tmp26, 0
  %tmp28 = icmp sgt i64 %.01.i, %size
  %or.cond.i2.i = or i1 %tmp27, %tmp28
  br i1 %or.cond.i2.i, label %generic_file_llseek_size.exit, label %bb30

bb29:                                             ; preds = %bb21
  %.old.i3.i = icmp sgt i64 %.01.i, %size
  br i1 %.old.i3.i, label %generic_file_llseek_size.exit, label %bb30

bb30:                                             ; preds = %bb29, %bb23
  %tmp31 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp32 = load i64* %tmp31, align 4
  %tmp33 = icmp eq i64 %tmp32, %.01.i
  br i1 %tmp33, label %generic_file_llseek_size.exit, label %bb34

bb34:                                             ; preds = %bb30
  store i64 %.01.i, i64* %tmp31, align 4
  %tmp35 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp35, align 4
  br label %generic_file_llseek_size.exit

generic_file_llseek_size.exit:                    ; preds = %bb34, %bb30, %bb29, %bb23, %vfs_setpos.exit.i, %bb5, %bb
  %.0 = phi i64 [ -22, %bb ], [ %tmp7, %bb5 ], [ %.0.i.i, %vfs_setpos.exit.i ], [ -22, %bb23 ], [ -22, %bb29 ], [ %.01.i, %bb30 ], [ %.01.i, %bb34 ]
  ret i64 %.0
}

; Function Attrs: noimplicitfloat nounwind readonly
define i64 @noop_llseek(%struct.file* inreg nocapture readonly %file, i64 inreg %offset, i32 %whence) #2 {
bb:
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp1 = load i64* %tmp, align 4
  ret i64 %tmp1
}

; Function Attrs: noimplicitfloat nounwind readnone
define i64 @no_llseek(%struct.file* inreg nocapture readnone %file, i64 inreg %offset, i32 %whence) #3 {
bb:
  ret i64 -29
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i64 @default_llseek(%struct.file* inreg nocapture %file, i64 inreg %offset, i32 %whence) #0 {
bb:
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 2
  %tmp1 = load %struct.inode** %tmp, align 4
  %tmp2 = getelementptr inbounds %struct.inode* %tmp1, i32 0, i32 20
  tail call void @mutex_lock(%struct.mutex* inreg %tmp2) #6
  switch i32 %whence, label %bb21 [
    i32 2, label %bb3
    i32 1, label %bb7
    i32 3, label %bb13
    i32 4, label %bb17
  ]

bb3:                                              ; preds = %bb
  %tmp4 = getelementptr inbounds %struct.inode* %tmp1, i32 0, i32 11
  %tmp5 = load i64* %tmp4, align 4
  %tmp6 = add i64 %tmp5, %offset
  br label %bb21

bb7:                                              ; preds = %bb
  %tmp8 = icmp eq i64 %offset, 0
  %tmp9 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp10 = load i64* %tmp9, align 4
  br i1 %tmp8, label %bb34, label %bb11

bb11:                                             ; preds = %bb7
  %tmp12 = add i64 %tmp10, %offset
  br label %bb21

bb13:                                             ; preds = %bb
  %tmp14 = getelementptr inbounds %struct.inode* %tmp1, i32 0, i32 11
  %tmp15 = load i64* %tmp14, align 4
  %tmp16 = icmp sgt i64 %tmp15, %offset
  br i1 %tmp16, label %bb21, label %bb34

bb17:                                             ; preds = %bb
  %tmp18 = getelementptr inbounds %struct.inode* %tmp1, i32 0, i32 11
  %tmp19 = load i64* %tmp18, align 4
  %tmp20 = icmp sgt i64 %tmp19, %offset
  br i1 %tmp20, label %bb21, label %bb34

bb21:                                             ; preds = %bb17, %bb13, %bb11, %bb3, %bb
  %.0 = phi i64 [ %offset, %bb ], [ %offset, %bb13 ], [ %tmp12, %bb11 ], [ %tmp6, %bb3 ], [ %tmp19, %bb17 ]
  %tmp22 = icmp sgt i64 %.0, -1
  br i1 %tmp22, label %bb28, label %bb23

bb23:                                             ; preds = %bb21
  %tmp24 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp25 = load i32* %tmp24, align 4
  %tmp26 = and i32 %tmp25, 8192
  %tmp27 = icmp eq i32 %tmp26, 0
  br i1 %tmp27, label %bb34, label %bb28

bb28:                                             ; preds = %bb23, %bb21
  %tmp29 = getelementptr inbounds %struct.file* %file, i32 0, i32 9
  %tmp30 = load i64* %tmp29, align 4
  %tmp31 = icmp eq i64 %.0, %tmp30
  br i1 %tmp31, label %bb34, label %bb32

bb32:                                             ; preds = %bb28
  store i64 %.0, i64* %tmp29, align 4
  %tmp33 = getelementptr inbounds %struct.file* %file, i32 0, i32 13
  store i64 0, i64* %tmp33, align 4
  br label %bb34

bb34:                                             ; preds = %bb32, %bb28, %bb23, %bb17, %bb13, %bb7
  %retval.0 = phi i64 [ -22, %bb23 ], [ %tmp10, %bb7 ], [ -6, %bb13 ], [ -6, %bb17 ], [ %.0, %bb28 ], [ %.0, %bb32 ]
  tail call void @mutex_unlock(%struct.mutex* inreg %tmp2) #6
  ret i64 %retval.0
}

; Function Attrs: noimplicitfloat
declare void @mutex_lock(%struct.mutex* inreg) #1

; Function Attrs: noimplicitfloat
declare void @mutex_unlock(%struct.mutex* inreg) #1

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i64 @vfs_llseek(%struct.file* inreg %file, i64 inreg %offset, i32 %whence) #0 {
bb:
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = and i32 %tmp1, 4
  %tmp3 = icmp eq i32 %tmp2, 0
  br i1 %tmp3, label %bb12, label %bb4

bb4:                                              ; preds = %bb
  %tmp5 = getelementptr inbounds %struct.file* %file, i32 0, i32 3
  %tmp6 = load %struct.file_operations** %tmp5, align 4
  %tmp7 = getelementptr inbounds %struct.file_operations* %tmp6, i32 0, i32 1
  %tmp8 = load {}** %tmp7, align 4
  %tmp9 = icmp eq {}* %tmp8, null
  br i1 %tmp9, label %bb12, label %bb10

bb10:                                             ; preds = %bb4
  %tmp11 = bitcast {}* %tmp8 to i64 (%struct.file*, i64, i32)*
  br label %bb12

bb12:                                             ; preds = %bb10, %bb4, %bb
  %fn.0 = phi i64 (%struct.file*, i64, i32)* [ %tmp11, %bb10 ], [ @no_llseek, %bb4 ], [ @no_llseek, %bb ]
  %tmp13 = tail call i64 %fn.0(%struct.file* inreg %file, i64 inreg %offset, i32 %whence) #6
  ret i64 %tmp13
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_lseek(i32 %fd, i32 %offset, i32 %whence) #0 {
bb:
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %offset, i32* %tmp1, align 4
  store i32 %whence, i32* %tmp2, align 4
  %tmp3 = call i32 @__fdget_pos(i32 inreg %fd) #6
  %tmp4 = and i32 %tmp3, -4
  %tmp5 = inttoptr i32 %tmp4 to %struct.file*
  %tmp6 = icmp eq i32 %tmp4, 0
  br i1 %tmp6, label %SYSC_lseek.exit, label %bb7

bb7:                                              ; preds = %bb
  %tmp8 = icmp ult i32 %whence, 5
  br i1 %tmp8, label %bb9, label %bb27

bb9:                                              ; preds = %bb7
  %tmp10 = sext i32 %offset to i64
  %tmp11 = getelementptr inbounds %struct.file* %tmp5, i32 0, i32 7
  %tmp12 = load i32* %tmp11, align 4
  %tmp13 = and i32 %tmp12, 4
  %tmp14 = icmp eq i32 %tmp13, 0
  br i1 %tmp14, label %vfs_llseek.exit.i, label %bb15

bb15:                                             ; preds = %bb9
  %tmp16 = getelementptr inbounds %struct.file* %tmp5, i32 0, i32 3
  %tmp17 = load %struct.file_operations** %tmp16, align 4
  %tmp18 = getelementptr inbounds %struct.file_operations* %tmp17, i32 0, i32 1
  %tmp19 = load {}** %tmp18, align 4
  %tmp20 = icmp eq {}* %tmp19, null
  br i1 %tmp20, label %vfs_llseek.exit.i, label %bb21

bb21:                                             ; preds = %bb15
  %tmp22 = bitcast {}* %tmp19 to i64 (%struct.file*, i64, i32)*
  br label %vfs_llseek.exit.i

vfs_llseek.exit.i:                                ; preds = %bb21, %bb15, %bb9
  %fn.0.i.i = phi i64 (%struct.file*, i64, i32)* [ %tmp22, %bb21 ], [ @no_llseek, %bb15 ], [ @no_llseek, %bb9 ]
  %tmp23 = call i64 %fn.0.i.i(%struct.file* inreg %tmp5, i64 inreg %tmp10, i32 %whence) #6
  %tmp24 = trunc i64 %tmp23 to i32
  %tmp25 = sext i32 %tmp24 to i64
  %tmp26 = icmp ne i64 %tmp23, %tmp25
  %..i = select i1 %tmp26, i32 -75, i32 %tmp24
  br label %bb27

bb27:                                             ; preds = %vfs_llseek.exit.i, %bb7
  %retval.0.i = phi i32 [ %..i, %vfs_llseek.exit.i ], [ -22, %bb7 ]
  %tmp28 = and i32 %tmp3, 2
  %tmp29 = icmp eq i32 %tmp28, 0
  br i1 %tmp29, label %bb32, label %bb30

bb30:                                             ; preds = %bb27
  %tmp31 = getelementptr inbounds %struct.file* %tmp5, i32 0, i32 8
  call void @mutex_unlock(%struct.mutex* inreg %tmp31) #6
  br label %bb32

bb32:                                             ; preds = %bb30, %bb27
  %tmp33 = and i32 %tmp3, 1
  %tmp34 = icmp eq i32 %tmp33, 0
  br i1 %tmp34, label %SYSC_lseek.exit, label %bb35

bb35:                                             ; preds = %bb32
  call void @fput(%struct.file* inreg %tmp5) #6
  br label %SYSC_lseek.exit

SYSC_lseek.exit:                                  ; preds = %bb35, %bb32, %bb
  %.0.i = phi i32 [ -9, %bb ], [ %retval.0.i, %bb32 ], [ %retval.0.i, %bb35 ]
  %tmp36 = sub i32 36, 36
  ret i32 %tmp36
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_llseek(i32 %fd, i32 %offset_high, i32 %offset_low, i32 %result, i32 %whence) #0 {
bb:
  %offset.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %offset_high, i32* %tmp1, align 4
  store i32 %offset_low, i32* %tmp2, align 4
  store i32 %result, i32* %tmp3, align 4
  store i32 %whence, i32* %tmp4, align 4
  %tmp5 = bitcast i64* %offset.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp5) #4
  %tmp6 = call i32 @__fdget_pos(i32 inreg %fd) #6
  %tmp7 = and i32 %tmp6, -4
  %tmp8 = inttoptr i32 %tmp7 to %struct.file*
  %tmp9 = icmp eq i32 %tmp7, 0
  br i1 %tmp9, label %SYSC_llseek.exit, label %bb10

bb10:                                             ; preds = %bb
  %tmp11 = icmp ugt i32 %whence, 4
  br i1 %tmp11, label %bb34, label %bb12

bb12:                                             ; preds = %bb10
  %tmp13 = zext i32 %offset_high to i64
  %tmp14 = shl nuw i64 %tmp13, 32
  %tmp15 = zext i32 %offset_low to i64
  %tmp16 = or i64 %tmp14, %tmp15
  %tmp17 = getelementptr inbounds %struct.file* %tmp8, i32 0, i32 7
  %tmp18 = load i32* %tmp17, align 4
  %tmp19 = and i32 %tmp18, 4
  %tmp20 = icmp eq i32 %tmp19, 0
  br i1 %tmp20, label %vfs_llseek.exit.i, label %bb21

bb21:                                             ; preds = %bb12
  %tmp22 = getelementptr inbounds %struct.file* %tmp8, i32 0, i32 3
  %tmp23 = load %struct.file_operations** %tmp22, align 4
  %tmp24 = getelementptr inbounds %struct.file_operations* %tmp23, i32 0, i32 1
  %tmp25 = load {}** %tmp24, align 4
  %tmp26 = icmp eq {}* %tmp25, null
  br i1 %tmp26, label %vfs_llseek.exit.i, label %bb27

bb27:                                             ; preds = %bb21
  %tmp28 = bitcast {}* %tmp25 to i64 (%struct.file*, i64, i32)*
  br label %vfs_llseek.exit.i

vfs_llseek.exit.i:                                ; preds = %bb27, %bb21, %bb12
  %fn.0.i.i = phi i64 (%struct.file*, i64, i32)* [ %tmp28, %bb27 ], [ @no_llseek, %bb21 ], [ @no_llseek, %bb12 ]
  %tmp29 = call i64 %fn.0.i.i(%struct.file* inreg %tmp8, i64 inreg %tmp16, i32 %whence) #6
  store i64 %tmp29, i64* %offset.i, align 8
  %tmp30 = trunc i64 %tmp29 to i32
  %tmp31 = icmp sgt i64 %tmp29, -1
  br i1 %tmp31, label %copy_to_user.exit.i, label %bb34

copy_to_user.exit.i:                              ; preds = %vfs_llseek.exit.i
  %tmp32 = inttoptr i32 %result to i8*
  %tmp33 = call i32 @_copy_to_user(i8* inreg %tmp32, i8* inreg %tmp5, i32 inreg 8) #6
  %phitmp.i = icmp eq i32 %tmp33, 0
  %phitmp1.i = select i1 %phitmp.i, i32 0, i32 -14
  br label %bb34

bb34:                                             ; preds = %copy_to_user.exit.i, %vfs_llseek.exit.i, %bb10
  %retval.0.i = phi i32 [ -22, %bb10 ], [ %tmp30, %vfs_llseek.exit.i ], [ %phitmp1.i, %copy_to_user.exit.i ]
  %tmp35 = and i32 %tmp6, 2
  %tmp36 = icmp eq i32 %tmp35, 0
  br i1 %tmp36, label %bb39, label %bb37

bb37:                                             ; preds = %bb34
  %tmp38 = getelementptr inbounds %struct.file* %tmp8, i32 0, i32 8
  call void @mutex_unlock(%struct.mutex* inreg %tmp38) #6
  br label %bb39

bb39:                                             ; preds = %bb37, %bb34
  %tmp40 = and i32 %tmp6, 1
  %tmp41 = icmp eq i32 %tmp40, 0
  br i1 %tmp41, label %SYSC_llseek.exit, label %bb42

bb42:                                             ; preds = %bb39
  call void @fput(%struct.file* inreg %tmp8) #6
  br label %SYSC_llseek.exit

SYSC_llseek.exit:                                 ; preds = %bb42, %bb39, %bb
  %.0.i = phi i32 [ -9, %bb ], [ %retval.0.i, %bb39 ], [ %retval.0.i, %bb42 ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp5) #4
  %tmp43 = sub i32 43, 43
  ret i32 %tmp43
}

; Function Attrs: noimplicitfloat nounwind readonly
define i32 @rw_verify_area(i32 inreg %read_write, %struct.file* inreg nocapture readonly %file, i64* inreg nocapture readonly %ppos, i32 %count) #2 {
bb:
  %tmp = icmp slt i32 %count, 0
  br i1 %tmp, label %bb25, label %bb1, !prof !4

bb1:                                              ; preds = %bb
  %tmp2 = load i64* %ppos, align 4
  %tmp3 = icmp slt i64 %tmp2, 0
  br i1 %tmp3, label %bb4, label %bb13, !prof !4

bb4:                                              ; preds = %bb1
  %tmp5 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp6 = load i32* %tmp5, align 4
  %tmp7 = and i32 %tmp6, 8192
  %tmp8 = icmp eq i32 %tmp7, 0
  br i1 %tmp8, label %bb25, label %bb9

bb9:                                              ; preds = %bb4
  %tmp10 = zext i32 %count to i64
  %tmp11 = sub i64 0, %tmp2
  %tmp12 = icmp slt i64 %tmp10, %tmp11
  br i1 %tmp12, label %bb22, label %bb25

bb13:                                             ; preds = %bb1
  %tmp14 = zext i32 %count to i64
  %tmp15 = add i64 %tmp2, %tmp14
  %tmp16 = icmp slt i64 %tmp15, 0
  br i1 %tmp16, label %bb17, label %bb22, !prof !4

bb17:                                             ; preds = %bb13
  %tmp18 = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = and i32 %tmp19, 8192
  %tmp21 = icmp eq i32 %tmp20, 0
  br i1 %tmp21, label %bb25, label %bb22

bb22:                                             ; preds = %bb17, %bb13, %bb9
  %tmp23 = icmp ugt i32 %count, 2147479552
  %tmp24 = select i1 %tmp23, i32 2147479552, i32 %count
  br label %bb25

bb25:                                             ; preds = %bb22, %bb17, %bb9, %bb4, %bb
  %.0 = phi i32 [ %tmp24, %bb22 ], [ -22, %bb ], [ -22, %bb4 ], [ -75, %bb9 ], [ -22, %bb17 ]
  ret i32 %.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @do_sync_read(%struct.file* inreg %filp, i8* inreg %buf, i32 inreg %len, i64* nocapture %ppos) #0 {
bb:
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 4
  %kiocb = alloca %struct.kiocb, align 4
  %tmp = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 0
  store i8* %buf, i8** %tmp, align 4
  %tmp1 = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 1
  store i32 %len, i32* %tmp1, align 4
  %tmp2 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp2) #4
  %tmp3 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp3)
  %tmp4 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp4)
  call void @llvm.memset.p0i8.i64(i8* %tmp3, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp4, i8 0, i64 32, i32 8, i1 false)
  %tmp5 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp6 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 0
  store %struct.file* %filp, %struct.file** %tmp6, align 4
  %tmp7 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 1
  %tmp8 = bitcast %struct.kioctx** %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp8, i8* %tmp3, i32 12, i32 4, i1 false) #4
  %tmp9 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %tmp5 to i8*
  store i8* %.c.i, i8** %tmp9, align 4
  %tmp10 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 5
  %tmp11 = bitcast i64* %tmp10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp11, i8* %tmp4, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp3)
  call void @llvm.lifetime.end(i64 32, i8* %tmp4)
  %tmp12 = load i64* %ppos, align 4
  %tmp13 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 6
  store i64 %tmp12, i64* %tmp13, align 4
  %tmp14 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 7
  store i32 %len, i32* %tmp14, align 4
  %tmp15 = getelementptr inbounds %struct.file* %filp, i32 0, i32 3
  %tmp16 = load %struct.file_operations** %tmp15, align 4
  %tmp17 = getelementptr inbounds %struct.file_operations* %tmp16, i32 0, i32 4
  %tmp18 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp17, align 4
  %tmp19 = call i32 %tmp18(%struct.kiocb* inreg %kiocb, %struct.iovec* inreg %iov, i32 inreg 1, i64 %tmp12) #6
  %tmp20 = icmp eq i32 %tmp19, -529
  %. = select i1 %tmp20, i32 0, i32 %tmp19
  %tmp21 = load i64* %tmp13, align 4
  store i64 %tmp21, i64* %ppos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp2) #4
  ret i32 %.
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

; Function Attrs: noimplicitfloat
declare void @iov_iter_init(%struct.iov_iter* inreg, i32 inreg, %struct.iovec* inreg, i32, i32) #1

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @__vfs_read(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %count, i64* %pos) #0 {
bb:
  %.sroa.3.i.i1 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2 = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3 = alloca %struct.iovec, align 4
  %kiocb.i4 = alloca %struct.kiocb, align 4
  %iter.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i = alloca %struct.iovec, align 4
  %kiocb.i = alloca %struct.kiocb, align 4
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 3
  %tmp1 = load %struct.file_operations** %tmp, align 4
  %tmp2 = getelementptr inbounds %struct.file_operations* %tmp1, i32 0, i32 2
  %tmp3 = load i32 (%struct.file*, i8*, i32, i64*)** %tmp2, align 4
  %tmp4 = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp3, null
  br i1 %tmp4, label %bb7, label %bb5

bb5:                                              ; preds = %bb
  %tmp6 = call i32 %tmp3(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %count, i64* %pos) #6
  br label %bb62

bb7:                                              ; preds = %bb
  %tmp8 = getelementptr inbounds %struct.file_operations* %tmp1, i32 0, i32 4
  %tmp9 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp8, align 4
  %tmp10 = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp9, null
  br i1 %tmp10, label %bb34, label %bb11

bb11:                                             ; preds = %bb7
  %tmp12 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp12) #4
  %tmp13 = getelementptr inbounds %struct.iovec* %iov.i, i32 0, i32 0
  store i8* %buf, i8** %tmp13, align 4
  %tmp14 = getelementptr inbounds %struct.iovec* %iov.i, i32 0, i32 1
  store i32 %count, i32* %tmp14, align 4
  %tmp15 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp15) #4
  %tmp16 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp16)
  %tmp17 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp17)
  call void @llvm.memset.p0i8.i64(i8* %tmp16, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp17, i8 0, i64 32, i32 8, i1 false)
  %tmp18 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp19 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp19, align 4
  %tmp20 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 1
  %tmp21 = bitcast %struct.kioctx** %tmp20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp21, i8* %tmp16, i32 12, i32 4, i1 false) #4
  %tmp22 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %tmp18 to i8*
  store i8* %.c.i.i, i8** %tmp22, align 4
  %tmp23 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 5
  %tmp24 = bitcast i64* %tmp23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp24, i8* %tmp17, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp16)
  call void @llvm.lifetime.end(i64 32, i8* %tmp17)
  %tmp25 = load i64* %pos, align 4
  %tmp26 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 6
  store i64 %tmp25, i64* %tmp26, align 4
  %tmp27 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 7
  store i32 %count, i32* %tmp27, align 4
  %tmp28 = load %struct.file_operations** %tmp, align 4
  %tmp29 = getelementptr inbounds %struct.file_operations* %tmp28, i32 0, i32 4
  %tmp30 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp29, align 4
  %tmp31 = call i32 %tmp30(%struct.kiocb* inreg %kiocb.i, %struct.iovec* inreg %iov.i, i32 inreg 1, i64 %tmp25) #6
  %tmp32 = icmp eq i32 %tmp31, -529
  %..i = select i1 %tmp32, i32 0, i32 %tmp31
  %tmp33 = load i64* %tmp26, align 4
  store i64 %tmp33, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp15) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp12) #4
  br label %bb62

bb34:                                             ; preds = %bb7
  %tmp35 = getelementptr inbounds %struct.file_operations* %tmp1, i32 0, i32 6
  %tmp36 = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp35, align 4
  %tmp37 = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp36, null
  br i1 %tmp37, label %bb62, label %bb38

bb38:                                             ; preds = %bb34
  %tmp39 = bitcast %struct.iovec* %iov.i3 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp39) #4
  %tmp40 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp40) #4
  %tmp41 = getelementptr inbounds %struct.iovec* %iov.i3, i32 0, i32 0
  store i8* %buf, i8** %tmp41, align 4
  %tmp42 = getelementptr inbounds %struct.iovec* %iov.i3, i32 0, i32 1
  store i32 %count, i32* %tmp42, align 4
  %tmp43 = bitcast %struct.kiocb* %kiocb.i4 to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp43) #4
  %tmp44 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1 to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp44)
  %tmp45 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp45)
  call void @llvm.memset.p0i8.i64(i8* %tmp44, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp45, i8 0, i64 32, i32 8, i1 false)
  %tmp46 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp47 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp47, align 4
  %tmp48 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i32 0, i32 1
  %tmp49 = bitcast %struct.kioctx** %tmp48 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp49, i8* %tmp44, i32 12, i32 4, i1 false) #4
  %tmp50 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i32 0, i32 4, i32 0
  %.c.i.i5 = bitcast %struct.task_struct* %tmp46 to i8*
  store i8* %.c.i.i5, i8** %tmp50, align 4
  %tmp51 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i32 0, i32 5
  %tmp52 = bitcast i64* %tmp51 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp52, i8* %tmp45, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp44)
  call void @llvm.lifetime.end(i64 32, i8* %tmp45)
  %tmp53 = load i64* %pos, align 4
  %tmp54 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i32 0, i32 6
  store i64 %tmp53, i64* %tmp54, align 4
  %tmp55 = getelementptr inbounds %struct.kiocb* %kiocb.i4, i32 0, i32 7
  store i32 %count, i32* %tmp55, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i, i32 inreg 0, %struct.iovec* inreg %iov.i3, i32 1, i32 %count) #6
  %tmp56 = load %struct.file_operations** %tmp, align 4
  %tmp57 = getelementptr inbounds %struct.file_operations* %tmp56, i32 0, i32 6
  %tmp58 = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp57, align 4
  %tmp59 = call i32 %tmp58(%struct.kiocb* inreg %kiocb.i4, %struct.iov_iter* inreg %iter.i) #6
  %tmp60 = icmp eq i32 %tmp59, -529
  %..i6 = select i1 %tmp60, i32 0, i32 %tmp59
  %tmp61 = load i64* %tmp54, align 4
  store i64 %tmp61, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp43) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp39) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp40) #4
  br label %bb62

bb62:                                             ; preds = %bb38, %bb34, %bb11, %bb5
  %ret.0 = phi i32 [ %tmp6, %bb5 ], [ %..i, %bb11 ], [ %..i6, %bb38 ], [ -22, %bb34 ]
  ret i32 %ret.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @vfs_read(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %count, i64* %pos) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i = alloca %struct.iovec, align 4
  %kiocb.i4.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 4
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = and i32 %tmp1, 1
  %tmp3 = icmp eq i32 %tmp2, 0
  br i1 %tmp3, label %__chk_range_not_ok.exit.thread, label %bb4

bb4:                                              ; preds = %bb
  %tmp5 = and i32 %tmp1, 131072
  %tmp6 = icmp eq i32 %tmp5, 0
  br i1 %tmp6, label %__chk_range_not_ok.exit.thread, label %bb7

bb7:                                              ; preds = %bb4
  %tmp8 = ptrtoint i8* %buf to i32
  %tmp9 = tail call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp10 = add i32 %tmp9, -8172
  %tmp11 = inttoptr i32 %tmp10 to %struct.thread_info*
  %tmp12 = getelementptr inbounds %struct.thread_info* %tmp11, i32 0, i32 6, i32 0
  %tmp13 = load i32* %tmp12, align 4
  %uadd.i = add i32 %tmp8, %count
  %tmp14 = add i1 0, 0
  %tmp15 = add i32 %uadd.i, 0
  %tmp16 = icmp ugt i32 %tmp15, %tmp13
  %or.cond = or i1 %tmp14, %tmp16
  br i1 %or.cond, label %__chk_range_not_ok.exit.thread, label %bb17

bb17:                                             ; preds = %bb7
  %tmp18 = icmp slt i32 %count, 0
  br i1 %tmp18, label %__chk_range_not_ok.exit.thread, label %bb19, !prof !4

bb19:                                             ; preds = %bb17
  %tmp20 = load i64* %pos, align 4
  %tmp21 = icmp slt i64 %tmp20, 0
  br i1 %tmp21, label %bb22, label %bb30, !prof !4

bb22:                                             ; preds = %bb19
  %tmp23 = load i32* %tmp, align 4
  %tmp24 = and i32 %tmp23, 8192
  %tmp25 = icmp eq i32 %tmp24, 0
  br i1 %tmp25, label %__chk_range_not_ok.exit.thread, label %bb26

bb26:                                             ; preds = %bb22
  %tmp27 = zext i32 %count to i64
  %tmp28 = sub i64 0, %tmp20
  %tmp29 = icmp slt i64 %tmp27, %tmp28
  br i1 %tmp29, label %select.unfold, label %__chk_range_not_ok.exit.thread

bb30:                                             ; preds = %bb19
  %tmp31 = zext i32 %count to i64
  %tmp32 = add i64 %tmp20, %tmp31
  %tmp33 = icmp slt i64 %tmp32, 0
  br i1 %tmp33, label %bb34, label %select.unfold, !prof !4

bb34:                                             ; preds = %bb30
  %tmp35 = load i32* %tmp, align 4
  %tmp36 = and i32 %tmp35, 8192
  %tmp37 = icmp eq i32 %tmp36, 0
  br i1 %tmp37, label %__chk_range_not_ok.exit.thread, label %select.unfold

select.unfold:                                    ; preds = %bb34, %bb30, %bb26
  %tmp38 = icmp ugt i32 %count, 2147479552
  %.count = select i1 %tmp38, i32 2147479552, i32 %count
  %tmp.i = getelementptr inbounds %struct.file* %file, i32 0, i32 3
  %tmp1.i = load %struct.file_operations** %tmp.i, align 4
  %tmp2.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 2
  %tmp3.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp2.i, align 4
  %tmp4.i = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp3.i, null
  br i1 %tmp4.i, label %bb7.i, label %bb5.i

bb5.i:                                            ; preds = %select.unfold
  %tmp6.i = call i32 %tmp3.i(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %.count, i64* %pos) #6
  br label %__vfs_read.exit

bb7.i:                                            ; preds = %select.unfold
  %tmp8.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 4
  %tmp9.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp8.i, align 4
  %tmp10.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp9.i, null
  br i1 %tmp10.i, label %bb34.i, label %bb11.i

bb11.i:                                           ; preds = %bb7.i
  %tmp12.i = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp12.i) #4
  %tmp13.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 0
  store i8* %buf, i8** %tmp13.i, align 4
  %tmp14.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 1
  store i32 %.count, i32* %tmp14.i, align 4
  %tmp15.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp15.i) #4
  %tmp16.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp16.i) #4
  %tmp17.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp17.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp16.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp17.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp18.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp19.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp19.i, align 4
  %tmp20.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp21.i = bitcast %struct.kioctx** %tmp20.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp21.i, i8* %tmp16.i, i32 12, i32 4, i1 false) #4
  %tmp22.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp18.i to i8*
  store i8* %.c.i.i.i, i8** %tmp22.i, align 4
  %tmp23.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp24.i = bitcast i64* %tmp23.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp24.i, i8* %tmp17.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp16.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp17.i) #4
  %tmp25.i = load i64* %pos, align 4
  %tmp26.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp25.i, i64* %tmp26.i, align 4
  %tmp27.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %.count, i32* %tmp27.i, align 4
  %tmp28.i = load %struct.file_operations** %tmp.i, align 4
  %tmp29.i = getelementptr inbounds %struct.file_operations* %tmp28.i, i32 0, i32 4
  %tmp30.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp29.i, align 4
  %tmp31.i = call i32 %tmp30.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iovec* inreg %iov.i.i, i32 inreg 1, i64 %tmp25.i) #6
  %tmp32.i = icmp eq i32 %tmp31.i, -529
  %..i.i = select i1 %tmp32.i, i32 0, i32 %tmp31.i
  %tmp33.i = load i64* %tmp26.i, align 4
  store i64 %tmp33.i, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp15.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp12.i) #4
  br label %__vfs_read.exit

bb34.i:                                           ; preds = %bb7.i
  %tmp35.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 6
  %tmp36.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp35.i, align 4
  %tmp37.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp36.i, null
  br i1 %tmp37.i, label %__vfs_read.exit, label %bb38.i

bb38.i:                                           ; preds = %bb34.i
  %tmp39.i = bitcast %struct.iovec* %iov.i3.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp39.i) #4
  %tmp40.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp40.i) #4
  %tmp41.i = getelementptr inbounds %struct.iovec* %iov.i3.i, i32 0, i32 0
  store i8* %buf, i8** %tmp41.i, align 4
  %tmp42.i = getelementptr inbounds %struct.iovec* %iov.i3.i, i32 0, i32 1
  store i32 %.count, i32* %tmp42.i, align 4
  %tmp43.i = bitcast %struct.kiocb* %kiocb.i4.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp43.i) #4
  %tmp44.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp44.i) #4
  %tmp45.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp45.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp44.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp45.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp46.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp47.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp47.i, align 4
  %tmp48.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 1
  %tmp49.i = bitcast %struct.kioctx** %tmp48.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp49.i, i8* %tmp44.i, i32 12, i32 4, i1 false) #4
  %tmp50.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 4, i32 0
  %.c.i.i5.i = bitcast %struct.task_struct* %tmp46.i to i8*
  store i8* %.c.i.i5.i, i8** %tmp50.i, align 4
  %tmp51.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 5
  %tmp52.i = bitcast i64* %tmp51.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp52.i, i8* %tmp45.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp44.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp45.i) #4
  %tmp53.i = load i64* %pos, align 4
  %tmp54.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 6
  store i64 %tmp53.i, i64* %tmp54.i, align 4
  %tmp55.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 7
  store i32 %.count, i32* %tmp55.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 0, %struct.iovec* inreg %iov.i3.i, i32 1, i32 %.count) #6
  %tmp56.i = load %struct.file_operations** %tmp.i, align 4
  %tmp57.i = getelementptr inbounds %struct.file_operations* %tmp56.i, i32 0, i32 6
  %tmp58.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp57.i, align 4
  %tmp59.i = call i32 %tmp58.i(%struct.kiocb* inreg %kiocb.i4.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp60.i = icmp eq i32 %tmp59.i, -529
  %..i6.i = select i1 %tmp60.i, i32 0, i32 %tmp59.i
  %tmp61.i = load i64* %tmp54.i, align 4
  store i64 %tmp61.i, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp43.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp39.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp40.i) #4
  br label %__vfs_read.exit

__vfs_read.exit:                                  ; preds = %bb38.i, %bb34.i, %bb11.i, %bb5.i
  %ret.0.i = phi i32 [ %tmp6.i, %bb5.i ], [ %..i.i, %bb11.i ], [ %..i6.i, %bb38.i ], [ -22, %bb34.i ]
  %tmp40 = icmp sgt i32 %ret.0.i, 0
  br i1 %tmp40, label %bb41, label %bb43

bb41:                                             ; preds = %__vfs_read.exit
  %tmp42 = tail call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %bb43

bb43:                                             ; preds = %bb41, %__vfs_read.exit
  %tmp44 = tail call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %__chk_range_not_ok.exit.thread

__chk_range_not_ok.exit.thread:                   ; preds = %bb43, %bb34, %bb26, %bb22, %bb17, %bb7, %bb4, %bb
  %.0 = phi i32 [ -9, %bb ], [ -22, %bb4 ], [ %ret.0.i, %bb43 ], [ -14, %bb7 ], [ -22, %bb17 ], [ -22, %bb22 ], [ -75, %bb26 ], [ -22, %bb34 ]
  ret i32 %.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @do_sync_write(%struct.file* inreg %filp, i8* inreg %buf, i32 inreg %len, i64* nocapture %ppos) #0 {
bb:
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 4
  %kiocb = alloca %struct.kiocb, align 4
  %tmp = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 0
  store i8* %buf, i8** %tmp, align 4
  %tmp1 = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 1
  store i32 %len, i32* %tmp1, align 4
  %tmp2 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp2) #4
  %tmp3 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp3)
  %tmp4 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp4)
  call void @llvm.memset.p0i8.i64(i8* %tmp3, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp4, i8 0, i64 32, i32 8, i1 false)
  %tmp5 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp6 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 0
  store %struct.file* %filp, %struct.file** %tmp6, align 4
  %tmp7 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 1
  %tmp8 = bitcast %struct.kioctx** %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp8, i8* %tmp3, i32 12, i32 4, i1 false) #4
  %tmp9 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %tmp5 to i8*
  store i8* %.c.i, i8** %tmp9, align 4
  %tmp10 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 5
  %tmp11 = bitcast i64* %tmp10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp11, i8* %tmp4, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp3)
  call void @llvm.lifetime.end(i64 32, i8* %tmp4)
  %tmp12 = load i64* %ppos, align 4
  %tmp13 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 6
  store i64 %tmp12, i64* %tmp13, align 4
  %tmp14 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 7
  store i32 %len, i32* %tmp14, align 4
  %tmp15 = getelementptr inbounds %struct.file* %filp, i32 0, i32 3
  %tmp16 = load %struct.file_operations** %tmp15, align 4
  %tmp17 = getelementptr inbounds %struct.file_operations* %tmp16, i32 0, i32 5
  %tmp18 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp17, align 4
  %tmp19 = call i32 %tmp18(%struct.kiocb* inreg %kiocb, %struct.iovec* inreg %iov, i32 inreg 1, i64 %tmp12) #6
  %tmp20 = icmp eq i32 %tmp19, -529
  %. = select i1 %tmp20, i32 0, i32 %tmp19
  %tmp21 = load i64* %tmp13, align 4
  store i64 %tmp21, i64* %ppos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp2) #4
  ret i32 %.
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @new_sync_write(%struct.file* inreg %filp, i8* inreg %buf, i32 inreg %len, i64* nocapture %ppos) #0 {
bb:
  %.sroa.3.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov = alloca %struct.iovec, align 4
  %kiocb = alloca %struct.kiocb, align 4
  %iter = alloca %struct.iov_iter, align 4
  %tmp = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 0
  store i8* %buf, i8** %tmp, align 4
  %tmp1 = getelementptr inbounds %struct.iovec* %iov, i32 0, i32 1
  store i32 %len, i32* %tmp1, align 4
  %tmp2 = bitcast %struct.kiocb* %kiocb to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp2) #4
  %tmp3 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp3)
  %tmp4 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp4)
  call void @llvm.memset.p0i8.i64(i8* %tmp3, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp4, i8 0, i64 32, i32 8, i1 false)
  %tmp5 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp6 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 0
  store %struct.file* %filp, %struct.file** %tmp6, align 4
  %tmp7 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 1
  %tmp8 = bitcast %struct.kioctx** %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp8, i8* %tmp3, i32 12, i32 4, i1 false) #4
  %tmp9 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 4, i32 0
  %.c.i = bitcast %struct.task_struct* %tmp5 to i8*
  store i8* %.c.i, i8** %tmp9, align 4
  %tmp10 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 5
  %tmp11 = bitcast i64* %tmp10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp11, i8* %tmp4, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp3)
  call void @llvm.lifetime.end(i64 32, i8* %tmp4)
  %tmp12 = load i64* %ppos, align 4
  %tmp13 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 6
  store i64 %tmp12, i64* %tmp13, align 4
  %tmp14 = getelementptr inbounds %struct.kiocb* %kiocb, i32 0, i32 7
  store i32 %len, i32* %tmp14, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter, i32 inreg 1, %struct.iovec* inreg %iov, i32 1, i32 %len) #6
  %tmp15 = getelementptr inbounds %struct.file* %filp, i32 0, i32 3
  %tmp16 = load %struct.file_operations** %tmp15, align 4
  %tmp17 = getelementptr inbounds %struct.file_operations* %tmp16, i32 0, i32 7
  %tmp18 = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp17, align 4
  %tmp19 = call i32 %tmp18(%struct.kiocb* inreg %kiocb, %struct.iov_iter* inreg %iter) #6
  %tmp20 = icmp eq i32 %tmp19, -529
  %. = select i1 %tmp20, i32 0, i32 %tmp19
  %tmp21 = load i64* %tmp13, align 4
  store i64 %tmp21, i64* %ppos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp2) #4
  ret i32 %.
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @__kernel_write(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %count, i64* %pos) #0 {
bb:
  %.sroa.3.i.i2 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i3 = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i4 = alloca %struct.iovec, align 4
  %kiocb.i5 = alloca %struct.kiocb, align 4
  %iter.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i = alloca %struct.iovec, align 4
  %kiocb.i = alloca %struct.kiocb, align 4
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = and i32 %tmp1, 262144
  %tmp3 = icmp eq i32 %tmp2, 0
  br i1 %tmp3, label %bb82, label %bb4

bb4:                                              ; preds = %bb
  %tmp5 = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp6 = add i32 %tmp5, -8172
  %tmp7 = inttoptr i32 %tmp6 to %struct.thread_info*
  %tmp8 = getelementptr inbounds %struct.thread_info* %tmp7, i32 0, i32 6, i32 0
  %tmp9 = load i32* %tmp8, align 4
  %tmp10 = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp11 = add i32 %tmp10, -8172
  %tmp12 = inttoptr i32 %tmp11 to %struct.thread_info*
  %tmp13 = getelementptr inbounds %struct.thread_info* %tmp12, i32 0, i32 6, i32 0
  store i32 -1, i32* %tmp13, align 4
  %tmp14 = icmp ugt i32 %count, 2147479552
  %.count = select i1 %tmp14, i32 2147479552, i32 %count
  %tmp15 = getelementptr inbounds %struct.file* %file, i32 0, i32 3
  %tmp16 = load %struct.file_operations** %tmp15, align 4
  %tmp17 = getelementptr inbounds %struct.file_operations* %tmp16, i32 0, i32 3
  %tmp18 = load i32 (%struct.file*, i8*, i32, i64*)** %tmp17, align 4
  %tmp19 = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp18, null
  br i1 %tmp19, label %bb22, label %bb20

bb20:                                             ; preds = %bb4
  %tmp21 = call i32 %tmp18(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %.count, i64* %pos) #6
  br label %select.unfold

bb22:                                             ; preds = %bb4
  %tmp23 = getelementptr inbounds %struct.file_operations* %tmp16, i32 0, i32 5
  %tmp24 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp23, align 4
  %tmp25 = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp24, null
  br i1 %tmp25, label %bb49, label %bb26

bb26:                                             ; preds = %bb22
  %tmp27 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp27) #4
  %tmp28 = getelementptr inbounds %struct.iovec* %iov.i, i32 0, i32 0
  store i8* %buf, i8** %tmp28, align 4
  %tmp29 = getelementptr inbounds %struct.iovec* %iov.i, i32 0, i32 1
  store i32 %.count, i32* %tmp29, align 4
  %tmp30 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp30) #4
  %tmp31 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp31)
  %tmp32 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp32)
  call void @llvm.memset.p0i8.i64(i8* %tmp31, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp32, i8 0, i64 32, i32 8, i1 false)
  %tmp33 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp34 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp34, align 4
  %tmp35 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 1
  %tmp36 = bitcast %struct.kioctx** %tmp35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp36, i8* %tmp31, i32 12, i32 4, i1 false) #4
  %tmp37 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %tmp33 to i8*
  store i8* %.c.i.i, i8** %tmp37, align 4
  %tmp38 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 5
  %tmp39 = bitcast i64* %tmp38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp39, i8* %tmp32, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp31)
  call void @llvm.lifetime.end(i64 32, i8* %tmp32)
  %tmp40 = load i64* %pos, align 4
  %tmp41 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 6
  store i64 %tmp40, i64* %tmp41, align 4
  %tmp42 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 7
  store i32 %.count, i32* %tmp42, align 4
  %tmp43 = load %struct.file_operations** %tmp15, align 4
  %tmp44 = getelementptr inbounds %struct.file_operations* %tmp43, i32 0, i32 5
  %tmp45 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp44, align 4
  %tmp46 = call i32 %tmp45(%struct.kiocb* inreg %kiocb.i, %struct.iovec* inreg %iov.i, i32 inreg 1, i64 %tmp40) #6
  %tmp47 = icmp eq i32 %tmp46, -529
  %tmp48 = load i64* %tmp41, align 4
  store i64 %tmp48, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp30) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp27) #4
  %. = select i1 %tmp47, i32 0, i32 %tmp46
  br label %select.unfold

bb49:                                             ; preds = %bb22
  %tmp50 = bitcast %struct.iovec* %iov.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp50) #4
  %tmp51 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp51) #4
  %tmp52 = getelementptr inbounds %struct.iovec* %iov.i4, i32 0, i32 0
  store i8* %buf, i8** %tmp52, align 4
  %tmp53 = getelementptr inbounds %struct.iovec* %iov.i4, i32 0, i32 1
  store i32 %.count, i32* %tmp53, align 4
  %tmp54 = bitcast %struct.kiocb* %kiocb.i5 to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp54) #4
  %tmp55 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i2 to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp55)
  %tmp56 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i3 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp56)
  call void @llvm.memset.p0i8.i64(i8* %tmp55, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp56, i8 0, i64 32, i32 8, i1 false)
  %tmp57 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp58 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp58, align 4
  %tmp59 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 1
  %tmp60 = bitcast %struct.kioctx** %tmp59 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp60, i8* %tmp55, i32 12, i32 4, i1 false) #4
  %tmp61 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 4, i32 0
  %.c.i.i6 = bitcast %struct.task_struct* %tmp57 to i8*
  store i8* %.c.i.i6, i8** %tmp61, align 4
  %tmp62 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 5
  %tmp63 = bitcast i64* %tmp62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp63, i8* %tmp56, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp55)
  call void @llvm.lifetime.end(i64 32, i8* %tmp56)
  %tmp64 = load i64* %pos, align 4
  %tmp65 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 6
  store i64 %tmp64, i64* %tmp65, align 4
  %tmp66 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 7
  store i32 %.count, i32* %tmp66, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i, i32 inreg 1, %struct.iovec* inreg %iov.i4, i32 1, i32 %.count) #6
  %tmp67 = load %struct.file_operations** %tmp15, align 4
  %tmp68 = getelementptr inbounds %struct.file_operations* %tmp67, i32 0, i32 7
  %tmp69 = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp68, align 4
  %tmp70 = call i32 %tmp69(%struct.kiocb* inreg %kiocb.i5, %struct.iov_iter* inreg %iter.i) #6
  %tmp71 = icmp eq i32 %tmp70, -529
  %tmp72 = load i64* %tmp65, align 4
  store i64 %tmp72, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp54) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp50) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp51) #4
  %.22 = select i1 %tmp71, i32 0, i32 %tmp70
  br label %select.unfold

select.unfold:                                    ; preds = %bb49, %bb26, %bb20
  %ret.0 = phi i32 [ %tmp21, %bb20 ], [ %., %bb26 ], [ %.22, %bb49 ]
  %tmp73 = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp74 = add i32 %tmp73, -8172
  %tmp75 = inttoptr i32 %tmp74 to %struct.thread_info*
  %tmp76 = getelementptr inbounds %struct.thread_info* %tmp75, i32 0, i32 6, i32 0
  store i32 %tmp9, i32* %tmp76, align 4
  %tmp77 = icmp sgt i32 %ret.0, 0
  br i1 %tmp77, label %bb78, label %bb80

bb78:                                             ; preds = %select.unfold
  %tmp79 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %bb80

bb80:                                             ; preds = %bb78, %select.unfold
  %tmp81 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %bb82

bb82:                                             ; preds = %bb80, %bb
  %.0 = phi i32 [ %ret.0, %bb80 ], [ -22, %bb ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #4

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @vfs_write(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %count, i64* %pos) #0 {
bb:
  %.sroa.3.i.i2 = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i3 = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i4 = alloca %struct.iovec, align 4
  %kiocb.i5 = alloca %struct.kiocb, align 4
  %iter.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i = alloca %struct.iovec, align 4
  %kiocb.i = alloca %struct.kiocb, align 4
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = and i32 %tmp1, 2
  %tmp3 = icmp eq i32 %tmp2, 0
  br i1 %tmp3, label %file_end_write.exit, label %bb4

bb4:                                              ; preds = %bb
  %tmp5 = and i32 %tmp1, 262144
  %tmp6 = icmp eq i32 %tmp5, 0
  br i1 %tmp6, label %file_end_write.exit, label %bb7

bb7:                                              ; preds = %bb4
  %tmp8 = ptrtoint i8* %buf to i32
  %tmp9 = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp10 = add i32 %tmp9, -8172
  %tmp11 = inttoptr i32 %tmp10 to %struct.thread_info*
  %tmp12 = getelementptr inbounds %struct.thread_info* %tmp11, i32 0, i32 6, i32 0
  %tmp13 = load i32* %tmp12, align 4
  %uadd.i = add i32 %tmp8, %count
  %tmp14 = add i1 0, 0
  %tmp15 = add i32 %uadd.i, 0
  %tmp16 = icmp ugt i32 %tmp15, %tmp13
  %or.cond = or i1 %tmp14, %tmp16
  br i1 %or.cond, label %file_end_write.exit, label %bb17

bb17:                                             ; preds = %bb7
  %tmp18 = icmp slt i32 %count, 0
  br i1 %tmp18, label %file_end_write.exit, label %bb19, !prof !4

bb19:                                             ; preds = %bb17
  %tmp20 = load i64* %pos, align 4
  %tmp21 = icmp slt i64 %tmp20, 0
  br i1 %tmp21, label %bb22, label %bb30, !prof !4

bb22:                                             ; preds = %bb19
  %tmp23 = load i32* %tmp, align 4
  %tmp24 = and i32 %tmp23, 8192
  %tmp25 = icmp eq i32 %tmp24, 0
  br i1 %tmp25, label %file_end_write.exit, label %bb26

bb26:                                             ; preds = %bb22
  %tmp27 = zext i32 %count to i64
  %tmp28 = sub i64 0, %tmp20
  %tmp29 = icmp slt i64 %tmp27, %tmp28
  br i1 %tmp29, label %select.unfold, label %file_end_write.exit

bb30:                                             ; preds = %bb19
  %tmp31 = zext i32 %count to i64
  %tmp32 = add i64 %tmp20, %tmp31
  %tmp33 = icmp slt i64 %tmp32, 0
  br i1 %tmp33, label %bb34, label %select.unfold, !prof !4

bb34:                                             ; preds = %bb30
  %tmp35 = load i32* %tmp, align 4
  %tmp36 = and i32 %tmp35, 8192
  %tmp37 = icmp eq i32 %tmp36, 0
  br i1 %tmp37, label %file_end_write.exit, label %select.unfold

select.unfold:                                    ; preds = %bb34, %bb30, %bb26
  %tmp38 = icmp ugt i32 %count, 2147479552
  %.count = select i1 %tmp38, i32 2147479552, i32 %count
  %tmp39 = getelementptr inbounds %struct.file* %file, i32 0, i32 2
  %tmp40 = load %struct.inode** %tmp39, align 4
  %tmp41 = getelementptr inbounds %struct.inode* %tmp40, i32 0, i32 0
  %tmp42 = load i16* %tmp41, align 2
  %tmp43 = and i16 %tmp42, -4096
  %tmp44 = icmp eq i16 %tmp43, -32768
  br i1 %tmp44, label %bb45, label %file_start_write.exit

bb45:                                             ; preds = %select.unfold
  %tmp46 = getelementptr inbounds %struct.inode* %tmp40, i32 0, i32 6
  %tmp47 = load %struct.super_block** %tmp46, align 4
  %tmp48 = call i32 @__sb_start_write(%struct.super_block* inreg %tmp47, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit

file_start_write.exit:                            ; preds = %bb45, %select.unfold
  %tmp49 = getelementptr inbounds %struct.file* %file, i32 0, i32 3
  %tmp50 = load %struct.file_operations** %tmp49, align 4
  %tmp51 = getelementptr inbounds %struct.file_operations* %tmp50, i32 0, i32 3
  %tmp52 = load i32 (%struct.file*, i8*, i32, i64*)** %tmp51, align 4
  %tmp53 = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp52, null
  br i1 %tmp53, label %bb56, label %bb54

bb54:                                             ; preds = %file_start_write.exit
  %tmp55 = call i32 %tmp52(%struct.file* inreg %file, i8* inreg %buf, i32 inreg %.count, i64* %pos) #6
  br label %bb107

bb56:                                             ; preds = %file_start_write.exit
  %tmp57 = getelementptr inbounds %struct.file_operations* %tmp50, i32 0, i32 5
  %tmp58 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp57, align 4
  %tmp59 = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp58, null
  br i1 %tmp59, label %bb83, label %bb60

bb60:                                             ; preds = %bb56
  %tmp61 = bitcast %struct.iovec* %iov.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp61) #4
  %tmp62 = getelementptr inbounds %struct.iovec* %iov.i, i32 0, i32 0
  store i8* %buf, i8** %tmp62, align 4
  %tmp63 = getelementptr inbounds %struct.iovec* %iov.i, i32 0, i32 1
  store i32 %.count, i32* %tmp63, align 4
  %tmp64 = bitcast %struct.kiocb* %kiocb.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp64) #4
  %tmp65 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp65)
  %tmp66 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp66)
  call void @llvm.memset.p0i8.i64(i8* %tmp65, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp66, i8 0, i64 32, i32 8, i1 false)
  %tmp67 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp68 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp68, align 4
  %tmp69 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 1
  %tmp70 = bitcast %struct.kioctx** %tmp69 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp70, i8* %tmp65, i32 12, i32 4, i1 false) #4
  %tmp71 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 4, i32 0
  %.c.i.i = bitcast %struct.task_struct* %tmp67 to i8*
  store i8* %.c.i.i, i8** %tmp71, align 4
  %tmp72 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 5
  %tmp73 = bitcast i64* %tmp72 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp73, i8* %tmp66, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp65)
  call void @llvm.lifetime.end(i64 32, i8* %tmp66)
  %tmp74 = load i64* %pos, align 4
  %tmp75 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 6
  store i64 %tmp74, i64* %tmp75, align 4
  %tmp76 = getelementptr inbounds %struct.kiocb* %kiocb.i, i32 0, i32 7
  store i32 %.count, i32* %tmp76, align 4
  %tmp77 = load %struct.file_operations** %tmp49, align 4
  %tmp78 = getelementptr inbounds %struct.file_operations* %tmp77, i32 0, i32 5
  %tmp79 = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp78, align 4
  %tmp80 = call i32 %tmp79(%struct.kiocb* inreg %kiocb.i, %struct.iovec* inreg %iov.i, i32 inreg 1, i64 %tmp74) #6
  %tmp81 = icmp eq i32 %tmp80, -529
  %tmp82 = load i64* %tmp75, align 4
  store i64 %tmp82, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp64) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp61) #4
  br i1 %tmp81, label %.thread, label %bb107

bb83:                                             ; preds = %bb56
  %tmp84 = bitcast %struct.iovec* %iov.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp84) #4
  %tmp85 = bitcast %struct.iov_iter* %iter.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp85) #4
  %tmp86 = getelementptr inbounds %struct.iovec* %iov.i4, i32 0, i32 0
  store i8* %buf, i8** %tmp86, align 4
  %tmp87 = getelementptr inbounds %struct.iovec* %iov.i4, i32 0, i32 1
  store i32 %.count, i32* %tmp87, align 4
  %tmp88 = bitcast %struct.kiocb* %kiocb.i5 to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp88) #4
  %tmp89 = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i2 to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp89)
  %tmp90 = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i3 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp90)
  call void @llvm.memset.p0i8.i64(i8* %tmp89, i8 0, i64 12, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %tmp90, i8 0, i64 32, i32 8, i1 false)
  %tmp91 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp92 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp92, align 4
  %tmp93 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 1
  %tmp94 = bitcast %struct.kioctx** %tmp93 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp94, i8* %tmp89, i32 12, i32 4, i1 false) #4
  %tmp95 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 4, i32 0
  %.c.i.i6 = bitcast %struct.task_struct* %tmp91 to i8*
  store i8* %.c.i.i6, i8** %tmp95, align 4
  %tmp96 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 5
  %tmp97 = bitcast i64* %tmp96 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp97, i8* %tmp90, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp89)
  call void @llvm.lifetime.end(i64 32, i8* %tmp90)
  %tmp98 = load i64* %pos, align 4
  %tmp99 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 6
  store i64 %tmp98, i64* %tmp99, align 4
  %tmp100 = getelementptr inbounds %struct.kiocb* %kiocb.i5, i32 0, i32 7
  store i32 %.count, i32* %tmp100, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i, i32 inreg 1, %struct.iovec* inreg %iov.i4, i32 1, i32 %.count) #6
  %tmp101 = load %struct.file_operations** %tmp49, align 4
  %tmp102 = getelementptr inbounds %struct.file_operations* %tmp101, i32 0, i32 7
  %tmp103 = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp102, align 4
  %tmp104 = call i32 %tmp103(%struct.kiocb* inreg %kiocb.i5, %struct.iov_iter* inreg %iter.i) #6
  %tmp105 = icmp eq i32 %tmp104, -529
  %tmp106 = load i64* %tmp99, align 4
  store i64 %tmp106, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp88) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp84) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp85) #4
  br i1 %tmp105, label %.thread, label %bb107

bb107:                                            ; preds = %bb83, %bb60, %bb54
  %ret.0 = phi i32 [ %tmp55, %bb54 ], [ %tmp80, %bb60 ], [ %tmp104, %bb83 ]
  %tmp108 = icmp sgt i32 %ret.0, 0
  br i1 %tmp108, label %bb109, label %.thread

bb109:                                            ; preds = %bb107
  %tmp110 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %.thread

.thread:                                          ; preds = %bb109, %bb107, %bb83, %bb60
  %ret.014 = phi i32 [ %ret.0, %bb109 ], [ %ret.0, %bb107 ], [ 0, %bb60 ], [ 0, %bb83 ]
  %tmp111 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp112 = load %struct.inode** %tmp39, align 4
  %tmp113 = getelementptr inbounds %struct.inode* %tmp112, i32 0, i32 0
  %tmp114 = load i16* %tmp113, align 2
  %tmp115 = and i16 %tmp114, -4096
  %tmp116 = icmp eq i16 %tmp115, -32768
  br i1 %tmp116, label %bb117, label %file_end_write.exit

bb117:                                            ; preds = %.thread
  %tmp118 = getelementptr inbounds %struct.inode* %tmp112, i32 0, i32 6
  %tmp119 = load %struct.super_block** %tmp118, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp119, i32 inreg 1) #6
  br label %file_end_write.exit

file_end_write.exit:                              ; preds = %bb117, %.thread, %bb34, %bb26, %bb22, %bb17, %bb7, %bb4, %bb
  %.0 = phi i32 [ -9, %bb ], [ -22, %bb4 ], [ %ret.014, %.thread ], [ %ret.014, %bb117 ], [ -14, %bb7 ], [ -22, %bb17 ], [ -22, %bb22 ], [ -75, %bb26 ], [ -22, %bb34 ]
  ret i32 %.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_read(i32 %fd, i32 %buf, i32 %count) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i = alloca %struct.iovec, align 4
  %kiocb.i4.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 4
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %buf, i32* %tmp1, align 4
  store i32 %count, i32* %tmp2, align 4
  %tmp3 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp3) #4
  %tmp4 = call i32 @__fdget_pos(i32 inreg %fd) #6
  %tmp5 = and i32 %tmp4, -4
  %tmp6 = inttoptr i32 %tmp5 to %struct.file*
  %tmp7 = icmp eq i32 %tmp5, 0
  br i1 %tmp7, label %SYSC_read.exit, label %bb8

bb8:                                              ; preds = %bb
  %tmp9 = inttoptr i32 %buf to i8*
  %tmp10 = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 9
  %tmp11 = load i64* %tmp10, align 4
  store i64 %tmp11, i64* %pos.i, align 8
  %tmp12 = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 7
  %tmp13 = load i32* %tmp12, align 4
  %tmp14 = and i32 %tmp13, 1
  %tmp15 = icmp eq i32 %tmp14, 0
  br i1 %tmp15, label %vfs_read.exit.thread, label %bb16

bb16:                                             ; preds = %bb8
  %tmp17 = and i32 %tmp13, 131072
  %tmp18 = icmp eq i32 %tmp17, 0
  br i1 %tmp18, label %vfs_read.exit.thread, label %bb19

bb19:                                             ; preds = %bb16
  %tmp20 = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp21 = add i32 %tmp20, -8172
  %tmp22 = inttoptr i32 %tmp21 to %struct.thread_info*
  %tmp23 = getelementptr inbounds %struct.thread_info* %tmp22, i32 0, i32 6, i32 0
  %tmp24 = load i32* %tmp23, align 4
  %uadd.i.i = add i32 %buf, %count
  %tmp25 = add i1 0, 0
  %tmp26 = add i32 %uadd.i.i, 0
  %tmp27 = icmp ugt i32 %tmp26, %tmp24
  %or.cond.i = or i1 %tmp25, %tmp27
  br i1 %or.cond.i, label %vfs_read.exit.thread, label %bb28

bb28:                                             ; preds = %bb19
  %tmp29 = icmp slt i32 %count, 0
  br i1 %tmp29, label %vfs_read.exit.thread, label %bb30, !prof !4

bb30:                                             ; preds = %bb28
  %tmp31 = icmp slt i64 %tmp11, 0
  br i1 %tmp31, label %bb32, label %bb40, !prof !4

bb32:                                             ; preds = %bb30
  %tmp33 = load i32* %tmp12, align 4
  %tmp34 = and i32 %tmp33, 8192
  %tmp35 = icmp eq i32 %tmp34, 0
  br i1 %tmp35, label %vfs_read.exit.thread, label %bb36

bb36:                                             ; preds = %bb32
  %tmp37 = zext i32 %count to i64
  %tmp38 = sub i64 0, %tmp11
  %tmp39 = icmp slt i64 %tmp37, %tmp38
  br i1 %tmp39, label %select.unfold.i, label %vfs_read.exit.thread

bb40:                                             ; preds = %bb30
  %tmp41 = zext i32 %count to i64
  %tmp42 = add i64 %tmp11, %tmp41
  %tmp43 = icmp slt i64 %tmp42, 0
  br i1 %tmp43, label %bb44, label %select.unfold.i, !prof !4

bb44:                                             ; preds = %bb40
  %tmp45 = load i32* %tmp12, align 4
  %tmp46 = and i32 %tmp45, 8192
  %tmp47 = icmp eq i32 %tmp46, 0
  br i1 %tmp47, label %vfs_read.exit.thread, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb44, %bb40, %bb36
  %tmp48 = icmp ugt i32 %count, 2147479552
  %.count.i = select i1 %tmp48, i32 2147479552, i32 %count
  %tmp.i = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 3
  %tmp1.i = load %struct.file_operations** %tmp.i, align 4
  %tmp2.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 2
  %tmp3.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp2.i, align 4
  %tmp4.i = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp3.i, null
  br i1 %tmp4.i, label %bb7.i, label %bb5.i

bb5.i:                                            ; preds = %select.unfold.i
  %tmp6.i = call i32 %tmp3.i(%struct.file* inreg %tmp6, i8* inreg %tmp9, i32 inreg %.count.i, i64* %pos.i) #6
  br label %__vfs_read.exit

bb7.i:                                            ; preds = %select.unfold.i
  %tmp8.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 4
  %tmp9.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp8.i, align 4
  %tmp10.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp9.i, null
  br i1 %tmp10.i, label %bb34.i, label %bb11.i

bb11.i:                                           ; preds = %bb7.i
  %tmp12.i = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp12.i) #4
  %tmp13.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 0
  store i8* %tmp9, i8** %tmp13.i, align 4
  %tmp14.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp14.i, align 4
  %tmp15.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp15.i) #4
  %tmp16.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp16.i) #4
  %tmp17.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp17.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp16.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp17.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp18.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp19.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp6, %struct.file** %tmp19.i, align 4
  %tmp20.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp21.i = bitcast %struct.kioctx** %tmp20.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp21.i, i8* %tmp16.i, i32 12, i32 4, i1 false) #4
  %tmp22.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp18.i to i8*
  store i8* %.c.i.i.i, i8** %tmp22.i, align 4
  %tmp23.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp24.i = bitcast i64* %tmp23.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp24.i, i8* %tmp17.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp16.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp17.i) #4
  %tmp25.i = load i64* %pos.i, align 4
  %tmp26.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp25.i, i64* %tmp26.i, align 4
  %tmp27.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp27.i, align 4
  %tmp28.i = load %struct.file_operations** %tmp.i, align 4
  %tmp29.i = getelementptr inbounds %struct.file_operations* %tmp28.i, i32 0, i32 4
  %tmp30.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp29.i, align 4
  %tmp31.i = call i32 %tmp30.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iovec* inreg %iov.i.i, i32 inreg 1, i64 %tmp25.i) #6
  %tmp32.i = icmp eq i32 %tmp31.i, -529
  %..i.i = select i1 %tmp32.i, i32 0, i32 %tmp31.i
  %tmp33.i = load i64* %tmp26.i, align 4
  store i64 %tmp33.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp15.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp12.i) #4
  br label %__vfs_read.exit

bb34.i:                                           ; preds = %bb7.i
  %tmp35.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 6
  %tmp36.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp35.i, align 4
  %tmp37.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp36.i, null
  br i1 %tmp37.i, label %__vfs_read.exit, label %bb38.i

bb38.i:                                           ; preds = %bb34.i
  %tmp39.i = bitcast %struct.iovec* %iov.i3.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp39.i) #4
  %tmp40.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp40.i) #4
  %tmp41.i = getelementptr inbounds %struct.iovec* %iov.i3.i, i32 0, i32 0
  store i8* %tmp9, i8** %tmp41.i, align 4
  %tmp42.i = getelementptr inbounds %struct.iovec* %iov.i3.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp42.i, align 4
  %tmp43.i = bitcast %struct.kiocb* %kiocb.i4.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp43.i) #4
  %tmp44.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp44.i) #4
  %tmp45.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp45.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp44.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp45.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp46.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp47.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 0
  store %struct.file* %tmp6, %struct.file** %tmp47.i, align 4
  %tmp48.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 1
  %tmp49.i = bitcast %struct.kioctx** %tmp48.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp49.i, i8* %tmp44.i, i32 12, i32 4, i1 false) #4
  %tmp50.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 4, i32 0
  %.c.i.i5.i = bitcast %struct.task_struct* %tmp46.i to i8*
  store i8* %.c.i.i5.i, i8** %tmp50.i, align 4
  %tmp51.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 5
  %tmp52.i = bitcast i64* %tmp51.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp52.i, i8* %tmp45.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp44.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp45.i) #4
  %tmp53.i = load i64* %pos.i, align 4
  %tmp54.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 6
  store i64 %tmp53.i, i64* %tmp54.i, align 4
  %tmp55.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp55.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 0, %struct.iovec* inreg %iov.i3.i, i32 1, i32 %.count.i) #6
  %tmp56.i = load %struct.file_operations** %tmp.i, align 4
  %tmp57.i = getelementptr inbounds %struct.file_operations* %tmp56.i, i32 0, i32 6
  %tmp58.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp57.i, align 4
  %tmp59.i = call i32 %tmp58.i(%struct.kiocb* inreg %kiocb.i4.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp60.i = icmp eq i32 %tmp59.i, -529
  %..i6.i = select i1 %tmp60.i, i32 0, i32 %tmp59.i
  %tmp61.i = load i64* %tmp54.i, align 4
  store i64 %tmp61.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp43.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp39.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp40.i) #4
  br label %__vfs_read.exit

__vfs_read.exit:                                  ; preds = %bb38.i, %bb34.i, %bb11.i, %bb5.i
  %ret.0.i1 = phi i32 [ %tmp6.i, %bb5.i ], [ %..i.i, %bb11.i ], [ %..i6.i, %bb38.i ], [ -22, %bb34.i ]
  %tmp50 = icmp sgt i32 %ret.0.i1, 0
  %tmp51 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br i1 %tmp50, label %vfs_read.exit.thread2, label %vfs_read.exit

vfs_read.exit.thread2:                            ; preds = %__vfs_read.exit
  %tmp52 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %bb54

vfs_read.exit:                                    ; preds = %__vfs_read.exit
  %tmp53 = icmp sgt i32 %ret.0.i1, -1
  br i1 %tmp53, label %bb54, label %vfs_read.exit.thread

bb54:                                             ; preds = %vfs_read.exit, %vfs_read.exit.thread2
  %tmp55 = load i64* %pos.i, align 8
  store i64 %tmp55, i64* %tmp10, align 4
  br label %vfs_read.exit.thread

vfs_read.exit.thread:                             ; preds = %bb54, %vfs_read.exit, %bb44, %bb36, %bb32, %bb28, %bb19, %bb16, %bb8
  %.0.i1 = phi i32 [ %ret.0.i1, %bb54 ], [ %ret.0.i1, %vfs_read.exit ], [ -9, %bb8 ], [ -22, %bb16 ], [ -14, %bb19 ], [ -22, %bb28 ], [ -22, %bb32 ], [ -75, %bb36 ], [ -22, %bb44 ]
  %tmp56 = and i32 %tmp4, 2
  %tmp57 = icmp eq i32 %tmp56, 0
  br i1 %tmp57, label %bb60, label %bb58

bb58:                                             ; preds = %vfs_read.exit.thread
  %tmp59 = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 8
  call void @mutex_unlock(%struct.mutex* inreg %tmp59) #6
  br label %bb60

bb60:                                             ; preds = %bb58, %vfs_read.exit.thread
  %tmp61 = and i32 %tmp4, 1
  %tmp62 = icmp eq i32 %tmp61, 0
  br i1 %tmp62, label %SYSC_read.exit, label %bb63

bb63:                                             ; preds = %bb60
  call void @fput(%struct.file* inreg %tmp6) #6
  br label %SYSC_read.exit

SYSC_read.exit:                                   ; preds = %bb63, %bb60, %bb
  %ret.0.i = phi i32 [ -9, %bb ], [ %.0.i1, %bb60 ], [ %.0.i1, %bb63 ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp3) #4
  %tmp64 = sub i32 64, 64
  ret i32 %tmp64
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_write(i32 %fd, i32 %buf, i32 %count) #0 {
bb:
  %.sroa.3.i.i2.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i3.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i4.i = alloca %struct.iovec, align 4
  %kiocb.i5.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 4
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %buf, i32* %tmp1, align 4
  store i32 %count, i32* %tmp2, align 4
  %tmp3 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp3) #4
  %tmp4 = call i32 @__fdget_pos(i32 inreg %fd) #6
  %tmp5 = and i32 %tmp4, -4
  %tmp6 = inttoptr i32 %tmp5 to %struct.file*
  %tmp7 = icmp eq i32 %tmp5, 0
  br i1 %tmp7, label %SYSC_write.exit, label %bb8

bb8:                                              ; preds = %bb
  %tmp9 = inttoptr i32 %buf to i8*
  %tmp10 = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 9
  %tmp11 = load i64* %tmp10, align 4
  store i64 %tmp11, i64* %pos.i, align 8
  %tmp.i = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 7
  %tmp1.i = load i32* %tmp.i, align 4
  %tmp2.i = and i32 %tmp1.i, 2
  %tmp3.i = icmp eq i32 %tmp2.i, 0
  br i1 %tmp3.i, label %vfs_write.exit, label %bb4.i

bb4.i:                                            ; preds = %bb8
  %tmp5.i = and i32 %tmp1.i, 262144
  %tmp6.i = icmp eq i32 %tmp5.i, 0
  br i1 %tmp6.i, label %vfs_write.exit, label %bb7.i

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = ptrtoint i8* %tmp9 to i32
  %tmp9.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp10.i = add i32 %tmp9.i, -8172
  %tmp11.i = inttoptr i32 %tmp10.i to %struct.thread_info*
  %tmp12.i = getelementptr inbounds %struct.thread_info* %tmp11.i, i32 0, i32 6, i32 0
  %tmp13.i = load i32* %tmp12.i, align 4
  %uadd.i.i = add i32 %tmp8.i, %count
  %tmp14.i = add i1 0, 0
  %tmp15.i = add i32 %uadd.i.i, 0
  %tmp16.i = icmp ugt i32 %tmp15.i, %tmp13.i
  %or.cond.i = or i1 %tmp14.i, %tmp16.i
  br i1 %or.cond.i, label %vfs_write.exit, label %bb17.i

bb17.i:                                           ; preds = %bb7.i
  %tmp18.i = icmp slt i32 %count, 0
  br i1 %tmp18.i, label %vfs_write.exit, label %bb19.i, !prof !4

bb19.i:                                           ; preds = %bb17.i
  %tmp20.i = load i64* %pos.i, align 4
  %tmp21.i = icmp slt i64 %tmp20.i, 0
  br i1 %tmp21.i, label %bb22.i, label %bb30.i, !prof !4

bb22.i:                                           ; preds = %bb19.i
  %tmp23.i = load i32* %tmp.i, align 4
  %tmp24.i = and i32 %tmp23.i, 8192
  %tmp25.i = icmp eq i32 %tmp24.i, 0
  br i1 %tmp25.i, label %vfs_write.exit, label %bb26.i

bb26.i:                                           ; preds = %bb22.i
  %tmp27.i = zext i32 %count to i64
  %tmp28.i = sub i64 0, %tmp20.i
  %tmp29.i = icmp slt i64 %tmp27.i, %tmp28.i
  br i1 %tmp29.i, label %select.unfold.i, label %vfs_write.exit

bb30.i:                                           ; preds = %bb19.i
  %tmp31.i = zext i32 %count to i64
  %tmp32.i = add i64 %tmp20.i, %tmp31.i
  %tmp33.i = icmp slt i64 %tmp32.i, 0
  br i1 %tmp33.i, label %bb34.i, label %select.unfold.i, !prof !4

bb34.i:                                           ; preds = %bb30.i
  %tmp35.i = load i32* %tmp.i, align 4
  %tmp36.i = and i32 %tmp35.i, 8192
  %tmp37.i = icmp eq i32 %tmp36.i, 0
  br i1 %tmp37.i, label %vfs_write.exit, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb34.i, %bb30.i, %bb26.i
  %tmp38.i = icmp ugt i32 %count, 2147479552
  %.count.i = select i1 %tmp38.i, i32 2147479552, i32 %count
  %tmp39.i = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 2
  %tmp40.i = load %struct.inode** %tmp39.i, align 4
  %tmp41.i = getelementptr inbounds %struct.inode* %tmp40.i, i32 0, i32 0
  %tmp42.i = load i16* %tmp41.i, align 2
  %tmp43.i = and i16 %tmp42.i, -4096
  %tmp44.i = icmp eq i16 %tmp43.i, -32768
  br i1 %tmp44.i, label %bb45.i, label %file_start_write.exit.i

bb45.i:                                           ; preds = %select.unfold.i
  %tmp46.i = getelementptr inbounds %struct.inode* %tmp40.i, i32 0, i32 6
  %tmp47.i = load %struct.super_block** %tmp46.i, align 4
  %tmp48.i = call i32 @__sb_start_write(%struct.super_block* inreg %tmp47.i, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %bb45.i, %select.unfold.i
  %tmp49.i = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 3
  %tmp50.i = load %struct.file_operations** %tmp49.i, align 4
  %tmp51.i = getelementptr inbounds %struct.file_operations* %tmp50.i, i32 0, i32 3
  %tmp52.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp51.i, align 4
  %tmp53.i = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp52.i, null
  br i1 %tmp53.i, label %bb56.i, label %bb54.i

bb54.i:                                           ; preds = %file_start_write.exit.i
  %tmp55.i = call i32 %tmp52.i(%struct.file* inreg %tmp6, i8* inreg %tmp9, i32 inreg %.count.i, i64* %pos.i) #6
  br label %bb107.i

bb56.i:                                           ; preds = %file_start_write.exit.i
  %tmp57.i = getelementptr inbounds %struct.file_operations* %tmp50.i, i32 0, i32 5
  %tmp58.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp57.i, align 4
  %tmp59.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp58.i, null
  br i1 %tmp59.i, label %bb83.i, label %bb60.i

bb60.i:                                           ; preds = %bb56.i
  %tmp61.i = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp61.i) #4
  %tmp62.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 0
  store i8* %tmp9, i8** %tmp62.i, align 4
  %tmp63.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp63.i, align 4
  %tmp64.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp64.i) #4
  %tmp65.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp65.i) #4
  %tmp66.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp66.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp65.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp66.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp67.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp6, %struct.file** %tmp68.i, align 4
  %tmp69.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp70.i = bitcast %struct.kioctx** %tmp69.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp70.i, i8* %tmp65.i, i32 12, i32 4, i1 false) #4
  %tmp71.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp67.i to i8*
  store i8* %.c.i.i.i, i8** %tmp71.i, align 4
  %tmp72.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp73.i = bitcast i64* %tmp72.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp73.i, i8* %tmp66.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp65.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp66.i) #4
  %tmp74.i = load i64* %pos.i, align 4
  %tmp75.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp74.i, i64* %tmp75.i, align 4
  %tmp76.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp76.i, align 4
  %tmp77.i = load %struct.file_operations** %tmp49.i, align 4
  %tmp78.i = getelementptr inbounds %struct.file_operations* %tmp77.i, i32 0, i32 5
  %tmp79.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp78.i, align 4
  %tmp80.i = call i32 %tmp79.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iovec* inreg %iov.i.i, i32 inreg 1, i64 %tmp74.i) #6
  %tmp81.i = icmp eq i32 %tmp80.i, -529
  %tmp82.i = load i64* %tmp75.i, align 4
  store i64 %tmp82.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp64.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp61.i) #4
  br i1 %tmp81.i, label %.thread.i, label %bb107.i

bb83.i:                                           ; preds = %bb56.i
  %tmp84.i = bitcast %struct.iovec* %iov.i4.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp84.i) #4
  %tmp85.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp85.i) #4
  %tmp86.i = getelementptr inbounds %struct.iovec* %iov.i4.i, i32 0, i32 0
  store i8* %tmp9, i8** %tmp86.i, align 4
  %tmp87.i = getelementptr inbounds %struct.iovec* %iov.i4.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp87.i, align 4
  %tmp88.i = bitcast %struct.kiocb* %kiocb.i5.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp88.i) #4
  %tmp89.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp89.i) #4
  %tmp90.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i3.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp90.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp89.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp90.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp91.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp92.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 0
  store %struct.file* %tmp6, %struct.file** %tmp92.i, align 4
  %tmp93.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 1
  %tmp94.i = bitcast %struct.kioctx** %tmp93.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp94.i, i8* %tmp89.i, i32 12, i32 4, i1 false) #4
  %tmp95.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 4, i32 0
  %.c.i.i6.i = bitcast %struct.task_struct* %tmp91.i to i8*
  store i8* %.c.i.i6.i, i8** %tmp95.i, align 4
  %tmp96.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 5
  %tmp97.i = bitcast i64* %tmp96.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp97.i, i8* %tmp90.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp89.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp90.i) #4
  %tmp98.i = load i64* %pos.i, align 4
  %tmp99.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 6
  store i64 %tmp98.i, i64* %tmp99.i, align 4
  %tmp100.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp100.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 1, %struct.iovec* inreg %iov.i4.i, i32 1, i32 %.count.i) #6
  %tmp101.i = load %struct.file_operations** %tmp49.i, align 4
  %tmp102.i = getelementptr inbounds %struct.file_operations* %tmp101.i, i32 0, i32 7
  %tmp103.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp102.i, align 4
  %tmp104.i = call i32 %tmp103.i(%struct.kiocb* inreg %kiocb.i5.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp105.i = icmp eq i32 %tmp104.i, -529
  %tmp106.i = load i64* %tmp99.i, align 4
  store i64 %tmp106.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp88.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp84.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp85.i) #4
  br i1 %tmp105.i, label %.thread.i, label %bb107.i

bb107.i:                                          ; preds = %bb83.i, %bb60.i, %bb54.i
  %ret.0.i1 = phi i32 [ %tmp55.i, %bb54.i ], [ %tmp80.i, %bb60.i ], [ %tmp104.i, %bb83.i ]
  %tmp108.i = icmp sgt i32 %ret.0.i1, 0
  br i1 %tmp108.i, label %bb109.i, label %.thread.i

bb109.i:                                          ; preds = %bb107.i
  %tmp110.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %.thread.i

.thread.i:                                        ; preds = %bb109.i, %bb107.i, %bb83.i, %bb60.i
  %ret.014.i = phi i32 [ %ret.0.i1, %bb109.i ], [ %ret.0.i1, %bb107.i ], [ 0, %bb60.i ], [ 0, %bb83.i ]
  %tmp111.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp112.i = load %struct.inode** %tmp39.i, align 4
  %tmp113.i = getelementptr inbounds %struct.inode* %tmp112.i, i32 0, i32 0
  %tmp114.i = load i16* %tmp113.i, align 2
  %tmp115.i = and i16 %tmp114.i, -4096
  %tmp116.i = icmp eq i16 %tmp115.i, -32768
  br i1 %tmp116.i, label %bb117.i, label %vfs_write.exit

bb117.i:                                          ; preds = %.thread.i
  %tmp118.i = getelementptr inbounds %struct.inode* %tmp112.i, i32 0, i32 6
  %tmp119.i = load %struct.super_block** %tmp118.i, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp119.i, i32 inreg 1) #6
  br label %vfs_write.exit

vfs_write.exit:                                   ; preds = %bb117.i, %.thread.i, %bb34.i, %bb26.i, %bb22.i, %bb17.i, %bb7.i, %bb4.i, %bb8
  %.0.i = phi i32 [ -9, %bb8 ], [ -22, %bb4.i ], [ %ret.014.i, %.thread.i ], [ %ret.014.i, %bb117.i ], [ -14, %bb7.i ], [ -22, %bb17.i ], [ -22, %bb22.i ], [ -75, %bb26.i ], [ -22, %bb34.i ]
  %tmp13 = icmp sgt i32 %.0.i, -1
  br i1 %tmp13, label %bb14, label %bb16

bb14:                                             ; preds = %vfs_write.exit
  %tmp15 = load i64* %pos.i, align 8
  store i64 %tmp15, i64* %tmp10, align 4
  br label %bb16

bb16:                                             ; preds = %bb14, %vfs_write.exit
  %tmp17 = and i32 %tmp4, 2
  %tmp18 = icmp eq i32 %tmp17, 0
  br i1 %tmp18, label %bb21, label %bb19

bb19:                                             ; preds = %bb16
  %tmp20 = getelementptr inbounds %struct.file* %tmp6, i32 0, i32 8
  call void @mutex_unlock(%struct.mutex* inreg %tmp20) #6
  br label %bb21

bb21:                                             ; preds = %bb19, %bb16
  %tmp22 = and i32 %tmp4, 1
  %tmp23 = icmp eq i32 %tmp22, 0
  br i1 %tmp23, label %SYSC_write.exit, label %bb24

bb24:                                             ; preds = %bb21
  call void @fput(%struct.file* inreg %tmp6) #6
  br label %SYSC_write.exit

SYSC_write.exit:                                  ; preds = %bb24, %bb21, %bb
  %ret.0.i = phi i32 [ -9, %bb ], [ %.0.i, %bb21 ], [ %.0.i, %bb24 ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp3) #4
  %tmp25 = sub i32 25, 25
  ret i32 %tmp25
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_pread64(i32 %fd, i32 %buf, i32 %count, i64 %pos) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i3.i = alloca %struct.iovec, align 4
  %kiocb.i4.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 4
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %tmp = alloca i64, align 8
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i64, align 8
  store i32 %fd, i32* %tmp1, align 4
  store i32 %buf, i32* %tmp2, align 4
  store i32 %count, i32* %tmp3, align 4
  store i64 %pos, i64* %tmp4, align 8
  %tmp5 = inttoptr i32 %buf to i8*
  %tmp6 = bitcast i64* %tmp to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp6) #4
  store i64 %pos, i64* %tmp, align 8
  %tmp7 = icmp slt i64 %pos, 0
  br i1 %tmp7, label %SYSC_pread64.exit, label %bb8

bb8:                                              ; preds = %bb
  %tmp9 = call i32 @__fdget(i32 inreg %fd) #6
  %tmp10 = and i32 %tmp9, -4
  %tmp11 = inttoptr i32 %tmp10 to %struct.file*
  %tmp12 = icmp eq i32 %tmp10, 0
  br i1 %tmp12, label %SYSC_pread64.exit, label %bb13

bb13:                                             ; preds = %bb8
  %tmp14 = getelementptr inbounds %struct.file* %tmp11, i32 0, i32 7
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = and i32 %tmp15, 8
  %tmp17 = icmp eq i32 %tmp16, 0
  br i1 %tmp17, label %vfs_read.exit, label %bb18

bb18:                                             ; preds = %bb13
  %tmp19 = and i32 %tmp15, 1
  %tmp20 = icmp eq i32 %tmp19, 0
  br i1 %tmp20, label %vfs_read.exit, label %bb21

bb21:                                             ; preds = %bb18
  %tmp22 = and i32 %tmp15, 131072
  %tmp23 = icmp eq i32 %tmp22, 0
  br i1 %tmp23, label %vfs_read.exit, label %bb24

bb24:                                             ; preds = %bb21
  %tmp25 = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp26 = add i32 %tmp25, -8172
  %tmp27 = inttoptr i32 %tmp26 to %struct.thread_info*
  %tmp28 = getelementptr inbounds %struct.thread_info* %tmp27, i32 0, i32 6, i32 0
  %tmp29 = load i32* %tmp28, align 4
  %uadd.i.i = add i32 %buf, %count
  %tmp30 = add i1 0, 0
  %tmp31 = add i32 %uadd.i.i, 0
  %tmp32 = icmp ugt i32 %tmp31, %tmp29
  %or.cond.i = or i1 %tmp30, %tmp32
  br i1 %or.cond.i, label %vfs_read.exit, label %bb33

bb33:                                             ; preds = %bb24
  %tmp34 = icmp slt i32 %count, 0
  br i1 %tmp34, label %vfs_read.exit, label %bb35, !prof !4

bb35:                                             ; preds = %bb33
  %tmp36 = zext i32 %count to i64
  %tmp37 = add i64 %tmp36, %pos
  %tmp38 = icmp slt i64 %tmp37, 0
  br i1 %tmp38, label %bb39, label %select.unfold.i, !prof !4

bb39:                                             ; preds = %bb35
  %tmp40 = load i32* %tmp14, align 4
  %tmp41 = and i32 %tmp40, 8192
  %tmp42 = icmp eq i32 %tmp41, 0
  br i1 %tmp42, label %vfs_read.exit, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb39, %bb35
  %tmp43 = icmp ugt i32 %count, 2147479552
  %.count.i = select i1 %tmp43, i32 2147479552, i32 %count
  %tmp.i = getelementptr inbounds %struct.file* %tmp11, i32 0, i32 3
  %tmp1.i = load %struct.file_operations** %tmp.i, align 4
  %tmp2.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 2
  %tmp3.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp2.i, align 4
  %tmp4.i = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp3.i, null
  br i1 %tmp4.i, label %bb7.i, label %bb5.i

bb5.i:                                            ; preds = %select.unfold.i
  %tmp6.i = call i32 %tmp3.i(%struct.file* inreg %tmp11, i8* inreg %tmp5, i32 inreg %.count.i, i64* %tmp) #6
  br label %__vfs_read.exit

bb7.i:                                            ; preds = %select.unfold.i
  %tmp8.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 4
  %tmp9.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp8.i, align 4
  %tmp10.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp9.i, null
  br i1 %tmp10.i, label %bb34.i, label %bb11.i

bb11.i:                                           ; preds = %bb7.i
  %tmp12.i = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp12.i) #4
  %tmp13.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 0
  store i8* %tmp5, i8** %tmp13.i, align 4
  %tmp14.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp14.i, align 4
  %tmp15.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp15.i) #4
  %tmp16.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp16.i) #4
  %tmp17.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp17.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp16.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp17.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp18.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp19.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp11, %struct.file** %tmp19.i, align 4
  %tmp20.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp21.i = bitcast %struct.kioctx** %tmp20.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp21.i, i8* %tmp16.i, i32 12, i32 4, i1 false) #4
  %tmp22.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp18.i to i8*
  store i8* %.c.i.i.i, i8** %tmp22.i, align 4
  %tmp23.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp24.i = bitcast i64* %tmp23.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp24.i, i8* %tmp17.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp16.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp17.i) #4
  %tmp25.i = load i64* %tmp, align 4
  %tmp26.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp25.i, i64* %tmp26.i, align 4
  %tmp27.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp27.i, align 4
  %tmp28.i = load %struct.file_operations** %tmp.i, align 4
  %tmp29.i = getelementptr inbounds %struct.file_operations* %tmp28.i, i32 0, i32 4
  %tmp30.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp29.i, align 4
  %tmp31.i = call i32 %tmp30.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iovec* inreg %iov.i.i, i32 inreg 1, i64 %tmp25.i) #6
  %tmp32.i = icmp eq i32 %tmp31.i, -529
  %..i.i = select i1 %tmp32.i, i32 0, i32 %tmp31.i
  %tmp33.i = load i64* %tmp26.i, align 4
  store i64 %tmp33.i, i64* %tmp, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp15.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp12.i) #4
  br label %__vfs_read.exit

bb34.i:                                           ; preds = %bb7.i
  %tmp35.i = getelementptr inbounds %struct.file_operations* %tmp1.i, i32 0, i32 6
  %tmp36.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp35.i, align 4
  %tmp37.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp36.i, null
  br i1 %tmp37.i, label %__vfs_read.exit, label %bb38.i

bb38.i:                                           ; preds = %bb34.i
  %tmp39.i = bitcast %struct.iovec* %iov.i3.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp39.i) #4
  %tmp40.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp40.i) #4
  %tmp41.i = getelementptr inbounds %struct.iovec* %iov.i3.i, i32 0, i32 0
  store i8* %tmp5, i8** %tmp41.i, align 4
  %tmp42.i = getelementptr inbounds %struct.iovec* %iov.i3.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp42.i, align 4
  %tmp43.i = bitcast %struct.kiocb* %kiocb.i4.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp43.i) #4
  %tmp44.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp44.i) #4
  %tmp45.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp45.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp44.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp45.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp46.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp47.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 0
  store %struct.file* %tmp11, %struct.file** %tmp47.i, align 4
  %tmp48.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 1
  %tmp49.i = bitcast %struct.kioctx** %tmp48.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp49.i, i8* %tmp44.i, i32 12, i32 4, i1 false) #4
  %tmp50.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 4, i32 0
  %.c.i.i5.i = bitcast %struct.task_struct* %tmp46.i to i8*
  store i8* %.c.i.i5.i, i8** %tmp50.i, align 4
  %tmp51.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 5
  %tmp52.i = bitcast i64* %tmp51.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp52.i, i8* %tmp45.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp44.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp45.i) #4
  %tmp53.i = load i64* %tmp, align 4
  %tmp54.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 6
  store i64 %tmp53.i, i64* %tmp54.i, align 4
  %tmp55.i = getelementptr inbounds %struct.kiocb* %kiocb.i4.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp55.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 0, %struct.iovec* inreg %iov.i3.i, i32 1, i32 %.count.i) #6
  %tmp56.i = load %struct.file_operations** %tmp.i, align 4
  %tmp57.i = getelementptr inbounds %struct.file_operations* %tmp56.i, i32 0, i32 6
  %tmp58.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp57.i, align 4
  %tmp59.i = call i32 %tmp58.i(%struct.kiocb* inreg %kiocb.i4.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp60.i = icmp eq i32 %tmp59.i, -529
  %..i6.i = select i1 %tmp60.i, i32 0, i32 %tmp59.i
  %tmp61.i = load i64* %tmp54.i, align 4
  store i64 %tmp61.i, i64* %tmp, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp43.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp39.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp40.i) #4
  br label %__vfs_read.exit

__vfs_read.exit:                                  ; preds = %bb38.i, %bb34.i, %bb11.i, %bb5.i
  %ret.0.i1 = phi i32 [ %tmp6.i, %bb5.i ], [ %..i.i, %bb11.i ], [ %..i6.i, %bb38.i ], [ -22, %bb34.i ]
  %tmp45 = icmp sgt i32 %ret.0.i1, 0
  br i1 %tmp45, label %bb46, label %bb48

bb46:                                             ; preds = %__vfs_read.exit
  %tmp47 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %bb48

bb48:                                             ; preds = %bb46, %__vfs_read.exit
  %tmp49 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %vfs_read.exit

vfs_read.exit:                                    ; preds = %bb48, %bb39, %bb33, %bb24, %bb21, %bb18, %bb13
  %ret.0.i = phi i32 [ -29, %bb13 ], [ -9, %bb18 ], [ -22, %bb21 ], [ %ret.0.i1, %bb48 ], [ -14, %bb24 ], [ -22, %bb33 ], [ -22, %bb39 ]
  %tmp50 = and i32 %tmp9, 1
  %tmp51 = icmp eq i32 %tmp50, 0
  br i1 %tmp51, label %SYSC_pread64.exit, label %bb52

bb52:                                             ; preds = %vfs_read.exit
  call void @fput(%struct.file* inreg %tmp11) #6
  br label %SYSC_pread64.exit

SYSC_pread64.exit:                                ; preds = %bb52, %vfs_read.exit, %bb8, %bb
  %.0.i = phi i32 [ -22, %bb ], [ -9, %bb8 ], [ %ret.0.i, %vfs_read.exit ], [ %ret.0.i, %bb52 ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp6) #4
  %tmp53 = sub i32 53, 53
  ret i32 %tmp53
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_pwrite64(i32 %fd, i32 %buf, i32 %count, i64 %pos) #0 {
bb:
  %.sroa.3.i.i2.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i3.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i4.i = alloca %struct.iovec, align 4
  %kiocb.i5.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %iov.i.i = alloca %struct.iovec, align 4
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %tmp = alloca i64, align 8
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i64, align 8
  store i32 %fd, i32* %tmp1, align 4
  store i32 %buf, i32* %tmp2, align 4
  store i32 %count, i32* %tmp3, align 4
  store i64 %pos, i64* %tmp4, align 8
  %tmp5 = inttoptr i32 %buf to i8*
  %tmp6 = bitcast i64* %tmp to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp6) #4
  store i64 %pos, i64* %tmp, align 8
  %tmp7 = icmp slt i64 %pos, 0
  br i1 %tmp7, label %SYSC_pwrite64.exit, label %bb8

bb8:                                              ; preds = %bb
  %tmp9 = call i32 @__fdget(i32 inreg %fd) #6
  %tmp10 = and i32 %tmp9, -4
  %tmp11 = inttoptr i32 %tmp10 to %struct.file*
  %tmp12 = icmp eq i32 %tmp10, 0
  br i1 %tmp12, label %SYSC_pwrite64.exit, label %bb13

bb13:                                             ; preds = %bb8
  %tmp14 = getelementptr inbounds %struct.file* %tmp11, i32 0, i32 7
  %tmp15 = load i32* %tmp14, align 4
  %tmp16 = and i32 %tmp15, 16
  %tmp17 = icmp eq i32 %tmp16, 0
  br i1 %tmp17, label %bb20, label %bb18

bb18:                                             ; preds = %bb13
  %tmp.i = getelementptr inbounds %struct.file* %tmp11, i32 0, i32 7
  %tmp1.i = load i32* %tmp.i, align 4
  %tmp2.i = and i32 %tmp1.i, 2
  %tmp3.i = icmp eq i32 %tmp2.i, 0
  br i1 %tmp3.i, label %vfs_write.exit, label %bb4.i

bb4.i:                                            ; preds = %bb18
  %tmp5.i = and i32 %tmp1.i, 262144
  %tmp6.i = icmp eq i32 %tmp5.i, 0
  br i1 %tmp6.i, label %vfs_write.exit, label %bb7.i

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = ptrtoint i8* %tmp5 to i32
  %tmp9.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp10.i = add i32 %tmp9.i, -8172
  %tmp11.i = inttoptr i32 %tmp10.i to %struct.thread_info*
  %tmp12.i = getelementptr inbounds %struct.thread_info* %tmp11.i, i32 0, i32 6, i32 0
  %tmp13.i = load i32* %tmp12.i, align 4
  %uadd.i.i = add i32 %tmp8.i, %count
  %tmp14.i = add i1 0, 0
  %tmp15.i = add i32 %uadd.i.i, 0
  %tmp16.i = icmp ugt i32 %tmp15.i, %tmp13.i
  %or.cond.i = or i1 %tmp14.i, %tmp16.i
  br i1 %or.cond.i, label %vfs_write.exit, label %bb17.i

bb17.i:                                           ; preds = %bb7.i
  %tmp18.i = icmp slt i32 %count, 0
  br i1 %tmp18.i, label %vfs_write.exit, label %bb19.i, !prof !4

bb19.i:                                           ; preds = %bb17.i
  %tmp20.i = load i64* %tmp, align 4
  %tmp21.i = icmp slt i64 %tmp20.i, 0
  br i1 %tmp21.i, label %bb22.i, label %bb30.i, !prof !4

bb22.i:                                           ; preds = %bb19.i
  %tmp23.i = load i32* %tmp.i, align 4
  %tmp24.i = and i32 %tmp23.i, 8192
  %tmp25.i = icmp eq i32 %tmp24.i, 0
  br i1 %tmp25.i, label %vfs_write.exit, label %bb26.i

bb26.i:                                           ; preds = %bb22.i
  %tmp27.i = zext i32 %count to i64
  %tmp28.i = sub i64 0, %tmp20.i
  %tmp29.i = icmp slt i64 %tmp27.i, %tmp28.i
  br i1 %tmp29.i, label %select.unfold.i, label %vfs_write.exit

bb30.i:                                           ; preds = %bb19.i
  %tmp31.i = zext i32 %count to i64
  %tmp32.i = add i64 %tmp20.i, %tmp31.i
  %tmp33.i = icmp slt i64 %tmp32.i, 0
  br i1 %tmp33.i, label %bb34.i, label %select.unfold.i, !prof !4

bb34.i:                                           ; preds = %bb30.i
  %tmp35.i = load i32* %tmp.i, align 4
  %tmp36.i = and i32 %tmp35.i, 8192
  %tmp37.i = icmp eq i32 %tmp36.i, 0
  br i1 %tmp37.i, label %vfs_write.exit, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb34.i, %bb30.i, %bb26.i
  %tmp38.i = icmp ugt i32 %count, 2147479552
  %.count.i = select i1 %tmp38.i, i32 2147479552, i32 %count
  %tmp39.i = getelementptr inbounds %struct.file* %tmp11, i32 0, i32 2
  %tmp40.i = load %struct.inode** %tmp39.i, align 4
  %tmp41.i = getelementptr inbounds %struct.inode* %tmp40.i, i32 0, i32 0
  %tmp42.i = load i16* %tmp41.i, align 2
  %tmp43.i = and i16 %tmp42.i, -4096
  %tmp44.i = icmp eq i16 %tmp43.i, -32768
  br i1 %tmp44.i, label %bb45.i, label %file_start_write.exit.i

bb45.i:                                           ; preds = %select.unfold.i
  %tmp46.i = getelementptr inbounds %struct.inode* %tmp40.i, i32 0, i32 6
  %tmp47.i = load %struct.super_block** %tmp46.i, align 4
  %tmp48.i = call i32 @__sb_start_write(%struct.super_block* inreg %tmp47.i, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %bb45.i, %select.unfold.i
  %tmp49.i = getelementptr inbounds %struct.file* %tmp11, i32 0, i32 3
  %tmp50.i = load %struct.file_operations** %tmp49.i, align 4
  %tmp51.i = getelementptr inbounds %struct.file_operations* %tmp50.i, i32 0, i32 3
  %tmp52.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp51.i, align 4
  %tmp53.i = icmp eq i32 (%struct.file*, i8*, i32, i64*)* %tmp52.i, null
  br i1 %tmp53.i, label %bb56.i, label %bb54.i

bb54.i:                                           ; preds = %file_start_write.exit.i
  %tmp55.i = call i32 %tmp52.i(%struct.file* inreg %tmp11, i8* inreg %tmp5, i32 inreg %.count.i, i64* %tmp) #6
  br label %bb107.i

bb56.i:                                           ; preds = %file_start_write.exit.i
  %tmp57.i = getelementptr inbounds %struct.file_operations* %tmp50.i, i32 0, i32 5
  %tmp58.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp57.i, align 4
  %tmp59.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp58.i, null
  br i1 %tmp59.i, label %bb83.i, label %bb60.i

bb60.i:                                           ; preds = %bb56.i
  %tmp61.i = bitcast %struct.iovec* %iov.i.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp61.i) #4
  %tmp62.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 0
  store i8* %tmp5, i8** %tmp62.i, align 4
  %tmp63.i = getelementptr inbounds %struct.iovec* %iov.i.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp63.i, align 4
  %tmp64.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp64.i) #4
  %tmp65.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp65.i) #4
  %tmp66.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp66.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp65.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp66.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp67.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp11, %struct.file** %tmp68.i, align 4
  %tmp69.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp70.i = bitcast %struct.kioctx** %tmp69.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp70.i, i8* %tmp65.i, i32 12, i32 4, i1 false) #4
  %tmp71.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp67.i to i8*
  store i8* %.c.i.i.i, i8** %tmp71.i, align 4
  %tmp72.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp73.i = bitcast i64* %tmp72.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp73.i, i8* %tmp66.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp65.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp66.i) #4
  %tmp74.i = load i64* %tmp, align 4
  %tmp75.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp74.i, i64* %tmp75.i, align 4
  %tmp76.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp76.i, align 4
  %tmp77.i = load %struct.file_operations** %tmp49.i, align 4
  %tmp78.i = getelementptr inbounds %struct.file_operations* %tmp77.i, i32 0, i32 5
  %tmp79.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp78.i, align 4
  %tmp80.i = call i32 %tmp79.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iovec* inreg %iov.i.i, i32 inreg 1, i64 %tmp74.i) #6
  %tmp81.i = icmp eq i32 %tmp80.i, -529
  %tmp82.i = load i64* %tmp75.i, align 4
  store i64 %tmp82.i, i64* %tmp, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp64.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp61.i) #4
  br i1 %tmp81.i, label %.thread.i, label %bb107.i

bb83.i:                                           ; preds = %bb56.i
  %tmp84.i = bitcast %struct.iovec* %iov.i4.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp84.i) #4
  %tmp85.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp85.i) #4
  %tmp86.i = getelementptr inbounds %struct.iovec* %iov.i4.i, i32 0, i32 0
  store i8* %tmp5, i8** %tmp86.i, align 4
  %tmp87.i = getelementptr inbounds %struct.iovec* %iov.i4.i, i32 0, i32 1
  store i32 %.count.i, i32* %tmp87.i, align 4
  %tmp88.i = bitcast %struct.kiocb* %kiocb.i5.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp88.i) #4
  %tmp89.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp89.i) #4
  %tmp90.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i3.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp90.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp89.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp90.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp91.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp92.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 0
  store %struct.file* %tmp11, %struct.file** %tmp92.i, align 4
  %tmp93.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 1
  %tmp94.i = bitcast %struct.kioctx** %tmp93.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp94.i, i8* %tmp89.i, i32 12, i32 4, i1 false) #4
  %tmp95.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 4, i32 0
  %.c.i.i6.i = bitcast %struct.task_struct* %tmp91.i to i8*
  store i8* %.c.i.i6.i, i8** %tmp95.i, align 4
  %tmp96.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 5
  %tmp97.i = bitcast i64* %tmp96.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp97.i, i8* %tmp90.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp89.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp90.i) #4
  %tmp98.i = load i64* %tmp, align 4
  %tmp99.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 6
  store i64 %tmp98.i, i64* %tmp99.i, align 4
  %tmp100.i = getelementptr inbounds %struct.kiocb* %kiocb.i5.i, i32 0, i32 7
  store i32 %.count.i, i32* %tmp100.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 1, %struct.iovec* inreg %iov.i4.i, i32 1, i32 %.count.i) #6
  %tmp101.i = load %struct.file_operations** %tmp49.i, align 4
  %tmp102.i = getelementptr inbounds %struct.file_operations* %tmp101.i, i32 0, i32 7
  %tmp103.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp102.i, align 4
  %tmp104.i = call i32 %tmp103.i(%struct.kiocb* inreg %kiocb.i5.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp105.i = icmp eq i32 %tmp104.i, -529
  %tmp106.i = load i64* %tmp99.i, align 4
  store i64 %tmp106.i, i64* %tmp, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp88.i) #4
  call void @llvm.lifetime.end(i64 8, i8* %tmp84.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp85.i) #4
  br i1 %tmp105.i, label %.thread.i, label %bb107.i

bb107.i:                                          ; preds = %bb83.i, %bb60.i, %bb54.i
  %ret.0.i1 = phi i32 [ %tmp55.i, %bb54.i ], [ %tmp80.i, %bb60.i ], [ %tmp104.i, %bb83.i ]
  %tmp108.i = icmp sgt i32 %ret.0.i1, 0
  br i1 %tmp108.i, label %bb109.i, label %.thread.i

bb109.i:                                          ; preds = %bb107.i
  %tmp110.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %.thread.i

.thread.i:                                        ; preds = %bb109.i, %bb107.i, %bb83.i, %bb60.i
  %ret.014.i = phi i32 [ %ret.0.i1, %bb109.i ], [ %ret.0.i1, %bb107.i ], [ 0, %bb60.i ], [ 0, %bb83.i ]
  %tmp111.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp112.i = load %struct.inode** %tmp39.i, align 4
  %tmp113.i = getelementptr inbounds %struct.inode* %tmp112.i, i32 0, i32 0
  %tmp114.i = load i16* %tmp113.i, align 2
  %tmp115.i = and i16 %tmp114.i, -4096
  %tmp116.i = icmp eq i16 %tmp115.i, -32768
  br i1 %tmp116.i, label %bb117.i, label %vfs_write.exit

bb117.i:                                          ; preds = %.thread.i
  %tmp118.i = getelementptr inbounds %struct.inode* %tmp112.i, i32 0, i32 6
  %tmp119.i = load %struct.super_block** %tmp118.i, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp119.i, i32 inreg 1) #6
  br label %vfs_write.exit

vfs_write.exit:                                   ; preds = %bb117.i, %.thread.i, %bb34.i, %bb26.i, %bb22.i, %bb17.i, %bb7.i, %bb4.i, %bb18
  %.0.i2 = phi i32 [ -9, %bb18 ], [ -22, %bb4.i ], [ %ret.014.i, %.thread.i ], [ %ret.014.i, %bb117.i ], [ -14, %bb7.i ], [ -22, %bb17.i ], [ -22, %bb22.i ], [ -75, %bb26.i ], [ -22, %bb34.i ]
  br label %bb20

bb20:                                             ; preds = %vfs_write.exit, %bb13
  %ret.0.i = phi i32 [ %.0.i2, %vfs_write.exit ], [ -29, %bb13 ]
  %tmp21 = and i32 %tmp9, 1
  %tmp22 = icmp eq i32 %tmp21, 0
  br i1 %tmp22, label %SYSC_pwrite64.exit, label %bb23

bb23:                                             ; preds = %bb20
  call void @fput(%struct.file* inreg %tmp11) #6
  br label %SYSC_pwrite64.exit

SYSC_pwrite64.exit:                               ; preds = %bb23, %bb20, %bb8, %bb
  %.0.i = phi i32 [ -22, %bb ], [ -9, %bb8 ], [ %ret.0.i, %bb20 ], [ %ret.0.i, %bb23 ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp6) #4
  %tmp24 = sub i32 24, 24
  ret i32 %tmp24
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @iov_shorten(%struct.iovec* inreg nocapture %iov, i32 inreg %nr_segs, i32 inreg %to) #0 {
bb:
  %tmp = icmp eq i32 %nr_segs, 0
  br i1 %tmp, label %.loopexit, label %.lr.ph

bb1:                                              ; preds = %.lr.ph
  %tmp2 = getelementptr %struct.iovec* %.04, i32 1
  %tmp3 = icmp ult i32 %tmp4, %nr_segs
  br i1 %tmp3, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %bb1, %bb
  %len.06 = phi i32 [ %tmp7, %bb1 ], [ 0, %bb ]
  %seg.05 = phi i32 [ %tmp4, %bb1 ], [ 0, %bb ]
  %.04 = phi %struct.iovec* [ %tmp2, %bb1 ], [ %iov, %bb ]
  %tmp4 = add i32 %seg.05, 1
  %tmp5 = getelementptr inbounds %struct.iovec* %.04, i32 0, i32 1
  %tmp6 = load i32* %tmp5, align 4
  %tmp7 = add i32 %tmp6, %len.06
  %tmp8 = icmp ult i32 %tmp7, %to
  br i1 %tmp8, label %bb1, label %bb9

bb9:                                              ; preds = %.lr.ph
  %tmp10 = sub i32 %to, %len.06
  store i32 %tmp10, i32* %tmp5, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %bb9, %bb1, %bb
  %seg.1 = phi i32 [ %tmp4, %bb9 ], [ 0, %bb ], [ %tmp4, %bb1 ]
  ret i32 %seg.1
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @rw_copy_check_uvector(i32 inreg %type, %struct.iovec* inreg %uvector, i32 inreg %nr_segs, i32 %fast_segs, %struct.iovec* %fast_pointer, %struct.iovec** nocapture %ret_pointer) #0 {
bb:
  %tmp = icmp eq i32 %nr_segs, 0
  br i1 %tmp, label %__chk_range_not_ok.exit.thread, label %bb1

bb1:                                              ; preds = %bb
  %tmp2 = icmp ugt i32 %nr_segs, 1024
  br i1 %tmp2, label %__chk_range_not_ok.exit.thread, label %bb3

bb3:                                              ; preds = %bb1
  %tmp4 = icmp ugt i32 %nr_segs, %fast_segs
  %tmp5 = shl i32 %nr_segs, 3
  br i1 %tmp4, label %bb6, label %._crit_edge

bb6:                                              ; preds = %bb3
  %tmp7 = tail call i8* @__kmalloc(i32 inreg %tmp5, i32 inreg 208) #6
  %tmp8 = bitcast i8* %tmp7 to %struct.iovec*
  %tmp9 = icmp eq i8* %tmp7, null
  br i1 %tmp9, label %__chk_range_not_ok.exit.thread, label %._crit_edge

._crit_edge:                                      ; preds = %bb6, %bb3
  %iov.0 = phi %struct.iovec* [ %tmp8, %bb6 ], [ %fast_pointer, %bb3 ]
  %tmp10 = bitcast %struct.iovec* %iov.0 to i8*
  %tmp11 = tail call i32 @llvm.objectsize.i32.p0i8(i8* %tmp10, i1 false) #4
  %tmp12 = icmp slt i32 %tmp11, 0
  %tmp13 = icmp uge i32 %tmp11, %tmp5
  %..i = or i1 %tmp12, %tmp13
  br i1 %..i, label %bb14, label %copy_from_user.exit, !prof !6

bb14:                                             ; preds = %._crit_edge
  %tmp15 = bitcast %struct.iovec* %uvector to i8*
  %tmp16 = tail call i32 @_copy_from_user(i8* inreg %tmp10, i8* inreg %tmp15, i32 inreg %tmp5) #6
  br label %copy_from_user.exit

copy_from_user.exit:                              ; preds = %bb14, %._crit_edge
  %.0.i = phi i32 [ %tmp16, %bb14 ], [ %tmp5, %._crit_edge ]
  %tmp17 = icmp eq i32 %.0.i, 0
  br i1 %tmp17, label %.lr.ph, label %__chk_range_not_ok.exit.thread

.lr.ph:                                           ; preds = %copy_from_user.exit
  %tmp18 = icmp sgt i32 %type, -1
  br i1 %tmp18, label %.lr.ph.split.us, label %.lr.ph..lr.ph.split_crit_edge

.lr.ph.split.us:                                  ; preds = %bb38, %.lr.ph
  %seg.04.us = phi i32 [ %tmp40, %bb38 ], [ 0, %.lr.ph ]
  %ret.03.us = phi i32 [ %tmp39, %bb38 ], [ 0, %.lr.ph ]
  %tmp19 = getelementptr inbounds %struct.iovec* %iov.0, i32 %seg.04.us, i32 1
  %tmp20 = load i32* %tmp19, align 4
  %tmp21 = icmp slt i32 %tmp20, 0
  br i1 %tmp21, label %__chk_range_not_ok.exit.thread, label %bb22

bb22:                                             ; preds = %.lr.ph.split.us
  %tmp23 = getelementptr inbounds %struct.iovec* %iov.0, i32 %seg.04.us, i32 0
  %tmp24 = load i8** %tmp23, align 4
  %tmp25 = ptrtoint i8* %tmp24 to i32
  %tmp26 = tail call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp27 = add i32 %tmp26, -8172
  %tmp28 = inttoptr i32 %tmp27 to %struct.thread_info*
  %tmp29 = getelementptr inbounds %struct.thread_info* %tmp28, i32 0, i32 6, i32 0
  %tmp30 = load i32* %tmp29, align 4
  %uadd.i.us = add i32 %tmp25, %tmp20
  %tmp31 = add i1 0, 0
  %tmp32 = add i32 %uadd.i.us, 0
  %tmp33 = icmp ugt i32 %tmp32, %tmp30
  %or.cond.us = or i1 %tmp31, %tmp33
  br i1 %or.cond.us, label %__chk_range_not_ok.exit.thread, label %bb34

bb34:                                             ; preds = %bb22
  %tmp35 = sub i32 2147479552, %ret.03.us
  %tmp36 = icmp ugt i32 %tmp20, %tmp35
  br i1 %tmp36, label %bb37, label %bb38

bb37:                                             ; preds = %bb34
  store i32 %tmp35, i32* %tmp19, align 4
  br label %bb38

bb38:                                             ; preds = %bb37, %bb34
  %len.0.us = phi i32 [ %tmp35, %bb37 ], [ %tmp20, %bb34 ]
  %tmp39 = add i32 %len.0.us, %ret.03.us
  %tmp40 = add i32 %seg.04.us, 1
  %tmp41 = icmp ult i32 %tmp40, %nr_segs
  br i1 %tmp41, label %.lr.ph.split.us, label %__chk_range_not_ok.exit.thread

.lr.ph..lr.ph.split_crit_edge:                    ; preds = %bb49, %.lr.ph
  %seg.04 = phi i32 [ %tmp51, %bb49 ], [ 0, %.lr.ph ]
  %ret.03 = phi i32 [ %tmp50, %bb49 ], [ 0, %.lr.ph ]
  %tmp42 = getelementptr inbounds %struct.iovec* %iov.0, i32 %seg.04, i32 1
  %tmp43 = load i32* %tmp42, align 4
  %tmp44 = icmp slt i32 %tmp43, 0
  br i1 %tmp44, label %__chk_range_not_ok.exit.thread, label %bb45

bb45:                                             ; preds = %.lr.ph..lr.ph.split_crit_edge
  %tmp46 = sub i32 2147479552, %ret.03
  %tmp47 = icmp ugt i32 %tmp43, %tmp46
  br i1 %tmp47, label %bb48, label %bb49

bb48:                                             ; preds = %bb45
  store i32 %tmp46, i32* %tmp42, align 4
  br label %bb49

bb49:                                             ; preds = %bb48, %bb45
  %len.0 = phi i32 [ %tmp46, %bb48 ], [ %tmp43, %bb45 ]
  %tmp50 = add i32 %len.0, %ret.03
  %tmp51 = add i32 %seg.04, 1
  %tmp52 = icmp ult i32 %tmp51, %nr_segs
  br i1 %tmp52, label %.lr.ph..lr.ph.split_crit_edge, label %__chk_range_not_ok.exit.thread

__chk_range_not_ok.exit.thread:                   ; preds = %bb49, %.lr.ph..lr.ph.split_crit_edge, %bb38, %bb22, %.lr.ph.split.us, %copy_from_user.exit, %bb6, %bb1, %bb
  %iov.1 = phi %struct.iovec* [ %fast_pointer, %bb ], [ %fast_pointer, %bb1 ], [ %tmp8, %bb6 ], [ %iov.0, %copy_from_user.exit ], [ %iov.0, %.lr.ph.split.us ], [ %iov.0, %bb22 ], [ %iov.0, %bb38 ], [ %iov.0, %.lr.ph..lr.ph.split_crit_edge ], [ %iov.0, %bb49 ]
  %ret.1 = phi i32 [ 0, %bb ], [ -22, %bb1 ], [ -12, %bb6 ], [ -14, %copy_from_user.exit ], [ %tmp39, %bb38 ], [ -14, %bb22 ], [ -22, %.lr.ph.split.us ], [ %tmp50, %bb49 ], [ -22, %.lr.ph..lr.ph.split_crit_edge ]
  store %struct.iovec* %iov.1, %struct.iovec** %ret_pointer, align 4
  ret i32 %ret.1
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @vfs_readv(%struct.file* inreg %file, %struct.iovec* inreg %vec, i32 inreg %vlen, i64* %pos) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %iovstack.i = alloca [8 x %struct.iovec], align 4
  %iov.i = alloca %struct.iovec*, align 4
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = and i32 %tmp1, 1
  %tmp3 = icmp eq i32 %tmp2, 0
  br i1 %tmp3, label %bb9, label %bb4

bb4:                                              ; preds = %bb
  %tmp5 = and i32 %tmp1, 131072
  %tmp6 = icmp eq i32 %tmp5, 0
  br i1 %tmp6, label %bb9, label %bb7

bb7:                                              ; preds = %bb4
  %0 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #4
  %tmp.i = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp.i) #4
  %tmp1.i = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i32 0, i32 0
  store %struct.iovec* %tmp1.i, %struct.iovec** %iov.i, align 4
  %tmp.i.i = icmp eq i32 %vlen, 0
  br i1 %tmp.i.i, label %rw_copy_check_uvector.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb7
  %tmp2.i.i = icmp ugt i32 %vlen, 1024
  br i1 %tmp2.i.i, label %rw_copy_check_uvector.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %tmp4.i.i = icmp ugt i32 %vlen, 8
  %tmp5.i.i = shl i32 %vlen, 3
  br i1 %tmp4.i.i, label %bb6.i.i, label %._crit_edge.i.i

bb6.i.i:                                          ; preds = %bb3.i.i
  %tmp7.i.i = call i8* @__kmalloc(i32 inreg %tmp5.i.i, i32 inreg 208) #6
  %tmp8.i.i = bitcast i8* %tmp7.i.i to %struct.iovec*
  %tmp9.i.i = icmp eq i8* %tmp7.i.i, null
  br i1 %tmp9.i.i, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %bb6.i.i, %bb3.i.i
  %iov.0.i.i = phi %struct.iovec* [ %tmp8.i.i, %bb6.i.i ], [ %tmp1.i, %bb3.i.i ]
  %tmp10.i.i = bitcast %struct.iovec* %iov.0.i.i to i8*
  %tmp11.i.i = call i32 @llvm.objectsize.i32.p0i8(i8* %tmp10.i.i, i1 false) #4
  %tmp12.i.i = icmp slt i32 %tmp11.i.i, 0
  %tmp13.i.i = icmp uge i32 %tmp11.i.i, %tmp5.i.i
  %..i.i.i = or i1 %tmp12.i.i, %tmp13.i.i
  br i1 %..i.i.i, label %bb14.i.i, label %copy_from_user.exit.i.i, !prof !6

bb14.i.i:                                         ; preds = %._crit_edge.i.i
  %tmp15.i.i = bitcast %struct.iovec* %vec to i8*
  %tmp16.i.i = call i32 @_copy_from_user(i8* inreg %tmp10.i.i, i8* inreg %tmp15.i.i, i32 inreg %tmp5.i.i) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %bb14.i.i, %._crit_edge.i.i
  %.0.i.i.i = phi i32 [ %tmp16.i.i, %bb14.i.i ], [ %tmp5.i.i, %._crit_edge.i.i ]
  %tmp17.i.i = icmp eq i32 %.0.i.i.i, 0
  br i1 %tmp17.i.i, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %.lr.ph.split.us.i.i

.lr.ph.split.us.i.i:                              ; preds = %bb38.i.i, %.lr.ph.i.i
  %seg.04.us.i.i = phi i32 [ %tmp40.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %ret.03.us.i.i = phi i32 [ %tmp39.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %tmp19.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 1
  %tmp20.i.i = load i32* %tmp19.i.i, align 4
  %tmp21.i.i = icmp slt i32 %tmp20.i.i, 0
  br i1 %tmp21.i.i, label %rw_copy_check_uvector.exit.i, label %bb22.i.i

bb22.i.i:                                         ; preds = %.lr.ph.split.us.i.i
  %tmp23.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 0
  %tmp24.i.i = load i8** %tmp23.i.i, align 4
  %tmp25.i.i = ptrtoint i8* %tmp24.i.i to i32
  %tmp26.i.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp27.i.i = add i32 %tmp26.i.i, -8172
  %tmp28.i.i = inttoptr i32 %tmp27.i.i to %struct.thread_info*
  %tmp29.i.i = getelementptr inbounds %struct.thread_info* %tmp28.i.i, i32 0, i32 6, i32 0
  %tmp30.i.i = load i32* %tmp29.i.i, align 4
  %uadd.i.us.i.i = add i32 %tmp25.i.i, %tmp20.i.i
  %tmp31.i.i = add i1 0, 0
  %tmp32.i.i = add i32 %uadd.i.us.i.i, 0
  %tmp33.i.i = icmp ugt i32 %tmp32.i.i, %tmp30.i.i
  %or.cond.us.i.i = or i1 %tmp31.i.i, %tmp33.i.i
  br i1 %or.cond.us.i.i, label %rw_copy_check_uvector.exit.i, label %bb34.i.i

bb34.i.i:                                         ; preds = %bb22.i.i
  %tmp35.i.i = sub i32 2147479552, %ret.03.us.i.i
  %tmp36.i.i = icmp ugt i32 %tmp20.i.i, %tmp35.i.i
  br i1 %tmp36.i.i, label %bb37.i.i, label %bb38.i.i

bb37.i.i:                                         ; preds = %bb34.i.i
  store i32 %tmp35.i.i, i32* %tmp19.i.i, align 4
  br label %bb38.i.i

bb38.i.i:                                         ; preds = %bb37.i.i, %bb34.i.i
  %len.0.us.i.i = phi i32 [ %tmp35.i.i, %bb37.i.i ], [ %tmp20.i.i, %bb34.i.i ]
  %tmp39.i.i = add i32 %len.0.us.i.i, %ret.03.us.i.i
  %tmp40.i.i = add i32 %seg.04.us.i.i, 1
  %tmp41.i.i = icmp ult i32 %tmp40.i.i, %vlen
  br i1 %tmp41.i.i, label %.lr.ph.split.us.i.i, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %bb38.i.i, %bb22.i.i, %.lr.ph.split.us.i.i, %copy_from_user.exit.i.i, %bb6.i.i, %bb1.i.i, %bb7
  %iov.1.i.i = phi %struct.iovec* [ %tmp1.i, %bb7 ], [ %tmp1.i, %bb1.i.i ], [ %tmp8.i.i, %bb6.i.i ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %.lr.ph.split.us.i.i ], [ %iov.0.i.i, %bb22.i.i ], [ %iov.0.i.i, %bb38.i.i ]
  %ret.1.i.i = phi i32 [ 0, %bb7 ], [ -22, %bb1.i.i ], [ -12, %bb6.i.i ], [ -14, %copy_from_user.exit.i.i ], [ %tmp39.i.i, %bb38.i.i ], [ -14, %bb22.i.i ], [ -22, %.lr.ph.split.us.i.i ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 4
  %tmp3.i = icmp slt i32 %ret.1.i.i, 1
  br i1 %tmp3.i, label %file_end_write.exit.i, label %bb4.i

bb4.i:                                            ; preds = %rw_copy_check_uvector.exit.i
  %tmp5.i = load i64* %pos, align 4
  %tmp6.i = icmp slt i64 %tmp5.i, 0
  br i1 %tmp6.i, label %bb7.i, label %bb16.i, !prof !4

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp9.i = load i32* %tmp8.i, align 4
  %tmp10.i = and i32 %tmp9.i, 8192
  %tmp11.i = icmp eq i32 %tmp10.i, 0
  br i1 %tmp11.i, label %file_end_write.exit.i, label %bb12.i

bb12.i:                                           ; preds = %bb7.i
  %tmp13.i = zext i32 %ret.1.i.i to i64
  %tmp14.i = sub i64 0, %tmp5.i
  %tmp15.i = icmp slt i64 %tmp13.i, %tmp14.i
  br i1 %tmp15.i, label %select.unfold.i, label %file_end_write.exit.i

bb16.i:                                           ; preds = %bb4.i
  %tmp17.i = zext i32 %ret.1.i.i to i64
  %tmp18.i = add i64 %tmp5.i, %tmp17.i
  %tmp19.i = icmp slt i64 %tmp18.i, 0
  br i1 %tmp19.i, label %bb20.i, label %select.unfold.i, !prof !4

bb20.i:                                           ; preds = %bb16.i
  %tmp21.i = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp22.i = load i32* %tmp21.i, align 4
  %tmp23.i = and i32 %tmp22.i, 8192
  %tmp24.i = icmp eq i32 %tmp23.i, 0
  br i1 %tmp24.i, label %file_end_write.exit.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb20.i, %bb16.i, %bb12.i
  %tmp26.i = getelementptr inbounds %struct.file* %file, i32 0, i32 3
  %tmp27.i = load %struct.file_operations** %tmp26.i, align 4
  %tmp29.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 2
  %tmp30.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp29.i, align 4
  %tmp31.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 4
  %tmp32.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp31.i, align 4
  %tmp33.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 6
  %tmp34.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp33.i, align 4
  %tmp52.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp34.i, null
  br i1 %tmp52.i, label %bb72.i, label %bb53.i

bb53.i:                                           ; preds = %select.unfold.i
  %tmp54.i = load %struct.iovec** %iov.i, align 4
  %tmp55.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp55.i) #4
  %tmp56.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp56.i) #4
  %tmp57.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp57.i) #4
  %tmp58.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp58.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp57.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp58.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp59.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp60.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp60.i, align 4
  %tmp61.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp62.i = bitcast %struct.kioctx** %tmp61.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp62.i, i8* %tmp57.i, i32 12, i32 4, i1 false) #4
  %tmp63.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp59.i to i8*
  store i8* %.c.i.i.i, i8** %tmp63.i, align 4
  %tmp64.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp65.i = bitcast i64* %tmp64.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp65.i, i8* %tmp58.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp57.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp58.i) #4
  %tmp66.i = load i64* %pos, align 4
  %tmp67.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp66.i, i64* %tmp67.i, align 4
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp68.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 0, %struct.iovec* inreg %tmp54.i, i32 %vlen, i32 %ret.1.i.i) #6
  %tmp69.i = call i32 %tmp34.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp70.i = icmp eq i32 %tmp69.i, -529
  %..i.i = select i1 %tmp70.i, i32 0, i32 %tmp69.i
  %tmp71.i = load i64* %tmp67.i, align 4
  store i64 %tmp71.i, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp56.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp55.i) #4
  br label %do_loop_readv_writev.exit.i

bb72.i:                                           ; preds = %select.unfold.i
  %tmp73.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp32.i, null
  %tmp74.i = load %struct.iovec** %iov.i, align 4
  br i1 %tmp73.i, label %bb92.i, label %bb75.i

bb75.i:                                           ; preds = %bb72.i
  %tmp76.i = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp76.i) #4
  %tmp77.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp77.i) #4
  %tmp78.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp78.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp77.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp78.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp79.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp80.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp80.i, align 4
  %tmp81.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 1
  %tmp82.i = bitcast %struct.kioctx** %tmp81.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp82.i, i8* %tmp77.i, i32 12, i32 4, i1 false) #4
  %tmp83.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %tmp79.i to i8*
  store i8* %.c.i.i4.i, i8** %tmp83.i, align 4
  %tmp84.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 5
  %tmp85.i = bitcast i64* %tmp84.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp85.i, i8* %tmp78.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp77.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp78.i) #4
  %tmp86.i = load i64* %pos, align 4
  %tmp87.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 6
  store i64 %tmp86.i, i64* %tmp87.i, align 4
  %tmp88.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp88.i, align 4
  %tmp89.i = call i32 %tmp32.i(%struct.kiocb* inreg %kiocb.i3.i, %struct.iovec* inreg %tmp74.i, i32 inreg %vlen, i64 %tmp86.i) #6
  %tmp90.i = icmp eq i32 %tmp89.i, -529
  %..i5.i = select i1 %tmp90.i, i32 0, i32 %tmp89.i
  %tmp91.i = load i64* %tmp87.i, align 4
  store i64 %tmp91.i, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp76.i) #4
  br label %do_loop_readv_writev.exit.i

bb92.i:                                           ; preds = %bb72.i
  %.old1.i.i = icmp eq i32 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb102.i, %bb92.i
  %ret.0.i.i = phi i32 [ %tmp104.i, %bb102.i ], [ 0, %bb92.i ]
  %vector.0.i.i = phi %struct.iovec* [ %tmp103.i, %bb102.i ], [ %tmp74.i, %bb92.i ]
  %.0.i6.i = phi i32 [ %tmp97.i, %bb102.i ], [ %vlen, %bb92.i ]
  %tmp93.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 0
  %tmp94.i = load i8** %tmp93.i, align 4
  %tmp95.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 1
  %tmp96.i = load i32* %tmp95.i, align 4
  %tmp97.i = add i32 %.0.i6.i, -1
  %tmp98.i = call i32 %tmp30.i(%struct.file* inreg %file, i8* inreg %tmp94.i, i32 inreg %tmp96.i, i64* %pos) #6
  %tmp99.i = icmp slt i32 %tmp98.i, 0
  br i1 %tmp99.i, label %bb100.i, label %bb102.i

bb100.i:                                          ; preds = %.preheader.i.i
  %tmp101.i = icmp eq i32 %ret.0.i.i, 0
  %.ret.0.i.i = select i1 %tmp101.i, i32 %tmp98.i, i32 %ret.0.i.i
  br label %do_loop_readv_writev.exit.i

bb102.i:                                          ; preds = %.preheader.i.i
  %tmp103.i = getelementptr %struct.iovec* %vector.0.i.i, i32 1
  %tmp104.i = add i32 %tmp98.i, %ret.0.i.i
  %tmp105.i = icmp eq i32 %tmp98.i, %tmp96.i
  %tmp106.i = icmp ne i32 %tmp97.i, 0
  %or.cond.i.i = and i1 %tmp105.i, %tmp106.i
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %bb102.i, %bb100.i, %bb92.i, %bb75.i, %bb53.i
  %ret.0.i = phi i32 [ %..i.i, %bb53.i ], [ %..i5.i, %bb75.i ], [ %.ret.0.i.i, %bb100.i ], [ 0, %bb92.i ], [ %tmp104.i, %bb102.i ]
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %do_loop_readv_writev.exit.i, %bb20.i, %bb12.i, %bb7.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i32 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ], [ -22, %bb7.i ], [ -75, %bb12.i ], [ -22, %bb20.i ]
  %tmp117.i = load %struct.iovec** %iov.i, align 4
  %tmp118.i = icmp eq %struct.iovec* %tmp117.i, %tmp1.i
  br i1 %tmp118.i, label %do_readv_writev.exit, label %bb119.i

bb119.i:                                          ; preds = %file_end_write.exit.i
  %tmp120.i = bitcast %struct.iovec* %tmp117.i to i8*
  call void @kfree(i8* inreg %tmp120.i) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %bb119.i, %file_end_write.exit.i
  call void @llvm.lifetime.end(i64 64, i8* %tmp.i) #4
  %1 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 4, i8* %1) #4
  br label %bb9

bb9:                                              ; preds = %do_readv_writev.exit, %bb4, %bb
  %.0 = phi i32 [ %ret.1.i, %do_readv_writev.exit ], [ -9, %bb ], [ -22, %bb4 ]
  ret i32 %.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @vfs_writev(%struct.file* inreg %file, %struct.iovec* inreg %vec, i32 inreg %vlen, i64* %pos) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %iovstack.i = alloca [8 x %struct.iovec], align 4
  %iov.i = alloca %struct.iovec*, align 4
  %tmp = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp1 = load i32* %tmp, align 4
  %tmp2 = and i32 %tmp1, 2
  %tmp3 = icmp eq i32 %tmp2, 0
  br i1 %tmp3, label %bb9, label %bb4

bb4:                                              ; preds = %bb
  %tmp5 = and i32 %tmp1, 262144
  %tmp6 = icmp eq i32 %tmp5, 0
  br i1 %tmp6, label %bb9, label %bb7

bb7:                                              ; preds = %bb4
  %0 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #4
  %tmp.i = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp.i) #4
  %tmp1.i = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i32 0, i32 0
  store %struct.iovec* %tmp1.i, %struct.iovec** %iov.i, align 4
  %tmp.i.i = icmp eq i32 %vlen, 0
  br i1 %tmp.i.i, label %rw_copy_check_uvector.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb7
  %tmp2.i.i = icmp ugt i32 %vlen, 1024
  br i1 %tmp2.i.i, label %rw_copy_check_uvector.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %tmp4.i.i = icmp ugt i32 %vlen, 8
  %tmp5.i.i = shl i32 %vlen, 3
  br i1 %tmp4.i.i, label %bb6.i.i, label %._crit_edge.i.i

bb6.i.i:                                          ; preds = %bb3.i.i
  %tmp7.i.i = call i8* @__kmalloc(i32 inreg %tmp5.i.i, i32 inreg 208) #6
  %tmp8.i.i = bitcast i8* %tmp7.i.i to %struct.iovec*
  %tmp9.i.i = icmp eq i8* %tmp7.i.i, null
  br i1 %tmp9.i.i, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %bb6.i.i, %bb3.i.i
  %iov.0.i.i = phi %struct.iovec* [ %tmp8.i.i, %bb6.i.i ], [ %tmp1.i, %bb3.i.i ]
  %tmp10.i.i = bitcast %struct.iovec* %iov.0.i.i to i8*
  %tmp11.i.i = call i32 @llvm.objectsize.i32.p0i8(i8* %tmp10.i.i, i1 false) #4
  %tmp12.i.i = icmp slt i32 %tmp11.i.i, 0
  %tmp13.i.i = icmp uge i32 %tmp11.i.i, %tmp5.i.i
  %..i.i.i = or i1 %tmp12.i.i, %tmp13.i.i
  br i1 %..i.i.i, label %bb14.i.i, label %copy_from_user.exit.i.i, !prof !6

bb14.i.i:                                         ; preds = %._crit_edge.i.i
  %tmp15.i.i = bitcast %struct.iovec* %vec to i8*
  %tmp16.i.i = call i32 @_copy_from_user(i8* inreg %tmp10.i.i, i8* inreg %tmp15.i.i, i32 inreg %tmp5.i.i) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %bb14.i.i, %._crit_edge.i.i
  %.0.i.i.i = phi i32 [ %tmp16.i.i, %bb14.i.i ], [ %tmp5.i.i, %._crit_edge.i.i ]
  %tmp17.i.i = icmp eq i32 %.0.i.i.i, 0
  br i1 %tmp17.i.i, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %.lr.ph.split.us.i.i

.lr.ph.split.us.i.i:                              ; preds = %bb38.i.i, %.lr.ph.i.i
  %seg.04.us.i.i = phi i32 [ %tmp40.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %ret.03.us.i.i = phi i32 [ %tmp39.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %tmp19.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 1
  %tmp20.i.i = load i32* %tmp19.i.i, align 4
  %tmp21.i.i = icmp slt i32 %tmp20.i.i, 0
  br i1 %tmp21.i.i, label %rw_copy_check_uvector.exit.i, label %bb22.i.i

bb22.i.i:                                         ; preds = %.lr.ph.split.us.i.i
  %tmp23.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 0
  %tmp24.i.i = load i8** %tmp23.i.i, align 4
  %tmp25.i.i = ptrtoint i8* %tmp24.i.i to i32
  %tmp26.i.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp27.i.i = add i32 %tmp26.i.i, -8172
  %tmp28.i.i = inttoptr i32 %tmp27.i.i to %struct.thread_info*
  %tmp29.i.i = getelementptr inbounds %struct.thread_info* %tmp28.i.i, i32 0, i32 6, i32 0
  %tmp30.i.i = load i32* %tmp29.i.i, align 4
  %uadd.i.us.i.i = add i32 %tmp25.i.i, %tmp20.i.i
  %tmp31.i.i = add i1 0, 0
  %tmp32.i.i = add i32 %uadd.i.us.i.i, 0
  %tmp33.i.i = icmp ugt i32 %tmp32.i.i, %tmp30.i.i
  %or.cond.us.i.i = or i1 %tmp31.i.i, %tmp33.i.i
  br i1 %or.cond.us.i.i, label %rw_copy_check_uvector.exit.i, label %bb34.i.i

bb34.i.i:                                         ; preds = %bb22.i.i
  %tmp35.i.i = sub i32 2147479552, %ret.03.us.i.i
  %tmp36.i.i = icmp ugt i32 %tmp20.i.i, %tmp35.i.i
  br i1 %tmp36.i.i, label %bb37.i.i, label %bb38.i.i

bb37.i.i:                                         ; preds = %bb34.i.i
  store i32 %tmp35.i.i, i32* %tmp19.i.i, align 4
  br label %bb38.i.i

bb38.i.i:                                         ; preds = %bb37.i.i, %bb34.i.i
  %len.0.us.i.i = phi i32 [ %tmp35.i.i, %bb37.i.i ], [ %tmp20.i.i, %bb34.i.i ]
  %tmp39.i.i = add i32 %len.0.us.i.i, %ret.03.us.i.i
  %tmp40.i.i = add i32 %seg.04.us.i.i, 1
  %tmp41.i.i = icmp ult i32 %tmp40.i.i, %vlen
  br i1 %tmp41.i.i, label %.lr.ph.split.us.i.i, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %bb38.i.i, %bb22.i.i, %.lr.ph.split.us.i.i, %copy_from_user.exit.i.i, %bb6.i.i, %bb1.i.i, %bb7
  %iov.1.i.i = phi %struct.iovec* [ %tmp1.i, %bb7 ], [ %tmp1.i, %bb1.i.i ], [ %tmp8.i.i, %bb6.i.i ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %.lr.ph.split.us.i.i ], [ %iov.0.i.i, %bb22.i.i ], [ %iov.0.i.i, %bb38.i.i ]
  %ret.1.i.i = phi i32 [ 0, %bb7 ], [ -22, %bb1.i.i ], [ -12, %bb6.i.i ], [ -14, %copy_from_user.exit.i.i ], [ %tmp39.i.i, %bb38.i.i ], [ -14, %bb22.i.i ], [ -22, %.lr.ph.split.us.i.i ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 4
  %tmp3.i = icmp slt i32 %ret.1.i.i, 1
  br i1 %tmp3.i, label %file_end_write.exit.i, label %bb4.i

bb4.i:                                            ; preds = %rw_copy_check_uvector.exit.i
  %tmp5.i = load i64* %pos, align 4
  %tmp6.i = icmp slt i64 %tmp5.i, 0
  br i1 %tmp6.i, label %bb7.i, label %bb16.i, !prof !4

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp9.i = load i32* %tmp8.i, align 4
  %tmp10.i = and i32 %tmp9.i, 8192
  %tmp11.i = icmp eq i32 %tmp10.i, 0
  br i1 %tmp11.i, label %file_end_write.exit.i, label %bb12.i

bb12.i:                                           ; preds = %bb7.i
  %tmp13.i = zext i32 %ret.1.i.i to i64
  %tmp14.i = sub i64 0, %tmp5.i
  %tmp15.i = icmp slt i64 %tmp13.i, %tmp14.i
  br i1 %tmp15.i, label %select.unfold.i, label %file_end_write.exit.i

bb16.i:                                           ; preds = %bb4.i
  %tmp17.i = zext i32 %ret.1.i.i to i64
  %tmp18.i = add i64 %tmp5.i, %tmp17.i
  %tmp19.i = icmp slt i64 %tmp18.i, 0
  br i1 %tmp19.i, label %bb20.i, label %select.unfold.i, !prof !4

bb20.i:                                           ; preds = %bb16.i
  %tmp21.i = getelementptr inbounds %struct.file* %file, i32 0, i32 7
  %tmp22.i = load i32* %tmp21.i, align 4
  %tmp23.i = and i32 %tmp22.i, 8192
  %tmp24.i = icmp eq i32 %tmp23.i, 0
  br i1 %tmp24.i, label %file_end_write.exit.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb20.i, %bb16.i, %bb12.i
  %tmp26.i = getelementptr inbounds %struct.file* %file, i32 0, i32 3
  %tmp27.i = load %struct.file_operations** %tmp26.i, align 4
  %tmp36.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 3
  %tmp37.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp36.i, align 4
  %tmp38.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 5
  %tmp39.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp38.i, align 4
  %tmp40.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 7
  %tmp41.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp40.i, align 4
  %tmp42.i = getelementptr inbounds %struct.file* %file, i32 0, i32 2
  %tmp43.i = load %struct.inode** %tmp42.i, align 4
  %tmp44.i = getelementptr inbounds %struct.inode* %tmp43.i, i32 0, i32 0
  %tmp45.i = load i16* %tmp44.i, align 2
  %tmp46.i = and i16 %tmp45.i, -4096
  %tmp47.i = icmp eq i16 %tmp46.i, -32768
  br i1 %tmp47.i, label %bb48.i, label %file_start_write.exit.i

bb48.i:                                           ; preds = %select.unfold.i
  %tmp49.i = getelementptr inbounds %struct.inode* %tmp43.i, i32 0, i32 6
  %tmp50.i = load %struct.super_block** %tmp49.i, align 4
  %tmp51.i = call i32 @__sb_start_write(%struct.super_block* inreg %tmp50.i, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %bb48.i, %select.unfold.i
  %tmp52.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp41.i, null
  br i1 %tmp52.i, label %bb72.i, label %bb53.i

bb53.i:                                           ; preds = %file_start_write.exit.i
  %tmp54.i = load %struct.iovec** %iov.i, align 4
  %tmp55.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp55.i) #4
  %tmp56.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp56.i) #4
  %tmp57.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp57.i) #4
  %tmp58.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp58.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp57.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp58.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp59.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp60.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp60.i, align 4
  %tmp61.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp62.i = bitcast %struct.kioctx** %tmp61.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp62.i, i8* %tmp57.i, i32 12, i32 4, i1 false) #4
  %tmp63.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp59.i to i8*
  store i8* %.c.i.i.i, i8** %tmp63.i, align 4
  %tmp64.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp65.i = bitcast i64* %tmp64.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp65.i, i8* %tmp58.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp57.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp58.i) #4
  %tmp66.i = load i64* %pos, align 4
  %tmp67.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp66.i, i64* %tmp67.i, align 4
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp68.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 1, %struct.iovec* inreg %tmp54.i, i32 %vlen, i32 %ret.1.i.i) #6
  %tmp69.i = call i32 %tmp41.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp70.i = icmp eq i32 %tmp69.i, -529
  %..i.i = select i1 %tmp70.i, i32 0, i32 %tmp69.i
  %tmp71.i = load i64* %tmp67.i, align 4
  store i64 %tmp71.i, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp56.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp55.i) #4
  br label %do_loop_readv_writev.exit.i

bb72.i:                                           ; preds = %file_start_write.exit.i
  %tmp73.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp39.i, null
  %tmp74.i = load %struct.iovec** %iov.i, align 4
  br i1 %tmp73.i, label %bb92.i, label %bb75.i

bb75.i:                                           ; preds = %bb72.i
  %tmp76.i = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp76.i) #4
  %tmp77.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp77.i) #4
  %tmp78.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp78.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp77.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp78.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp79.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp80.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 0
  store %struct.file* %file, %struct.file** %tmp80.i, align 4
  %tmp81.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 1
  %tmp82.i = bitcast %struct.kioctx** %tmp81.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp82.i, i8* %tmp77.i, i32 12, i32 4, i1 false) #4
  %tmp83.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %tmp79.i to i8*
  store i8* %.c.i.i4.i, i8** %tmp83.i, align 4
  %tmp84.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 5
  %tmp85.i = bitcast i64* %tmp84.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp85.i, i8* %tmp78.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp77.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp78.i) #4
  %tmp86.i = load i64* %pos, align 4
  %tmp87.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 6
  store i64 %tmp86.i, i64* %tmp87.i, align 4
  %tmp88.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp88.i, align 4
  %tmp89.i = call i32 %tmp39.i(%struct.kiocb* inreg %kiocb.i3.i, %struct.iovec* inreg %tmp74.i, i32 inreg %vlen, i64 %tmp86.i) #6
  %tmp90.i = icmp eq i32 %tmp89.i, -529
  %..i5.i = select i1 %tmp90.i, i32 0, i32 %tmp89.i
  %tmp91.i = load i64* %tmp87.i, align 4
  store i64 %tmp91.i, i64* %pos, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp76.i) #4
  br label %do_loop_readv_writev.exit.i

bb92.i:                                           ; preds = %bb72.i
  %.old1.i.i = icmp eq i32 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb102.i, %bb92.i
  %ret.0.i.i = phi i32 [ %tmp104.i, %bb102.i ], [ 0, %bb92.i ]
  %vector.0.i.i = phi %struct.iovec* [ %tmp103.i, %bb102.i ], [ %tmp74.i, %bb92.i ]
  %.0.i6.i = phi i32 [ %tmp97.i, %bb102.i ], [ %vlen, %bb92.i ]
  %tmp93.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 0
  %tmp94.i = load i8** %tmp93.i, align 4
  %tmp95.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 1
  %tmp96.i = load i32* %tmp95.i, align 4
  %tmp97.i = add i32 %.0.i6.i, -1
  %tmp98.i = call i32 %tmp37.i(%struct.file* inreg %file, i8* inreg %tmp94.i, i32 inreg %tmp96.i, i64* %pos) #6
  %tmp99.i = icmp slt i32 %tmp98.i, 0
  br i1 %tmp99.i, label %bb100.i, label %bb102.i

bb100.i:                                          ; preds = %.preheader.i.i
  %tmp101.i = icmp eq i32 %ret.0.i.i, 0
  %.ret.0.i.i = select i1 %tmp101.i, i32 %tmp98.i, i32 %ret.0.i.i
  br label %do_loop_readv_writev.exit.i

bb102.i:                                          ; preds = %.preheader.i.i
  %tmp103.i = getelementptr %struct.iovec* %vector.0.i.i, i32 1
  %tmp104.i = add i32 %tmp98.i, %ret.0.i.i
  %tmp105.i = icmp eq i32 %tmp98.i, %tmp96.i
  %tmp106.i = icmp ne i32 %tmp97.i, 0
  %or.cond.i.i = and i1 %tmp105.i, %tmp106.i
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %bb102.i, %bb100.i, %bb92.i, %bb75.i, %bb53.i
  %ret.0.i = phi i32 [ %..i.i, %bb53.i ], [ %..i5.i, %bb75.i ], [ %.ret.0.i.i, %bb100.i ], [ 0, %bb92.i ], [ %tmp104.i, %bb102.i ]
  %tmp108.i = getelementptr inbounds %struct.file* %file, i32 0, i32 2
  %tmp109.i = load %struct.inode** %tmp108.i, align 4
  %tmp110.i = getelementptr inbounds %struct.inode* %tmp109.i, i32 0, i32 0
  %tmp111.i = load i16* %tmp110.i, align 2
  %tmp112.i = and i16 %tmp111.i, -4096
  %tmp113.i = icmp eq i16 %tmp112.i, -32768
  br i1 %tmp113.i, label %bb114.i, label %file_end_write.exit.i

bb114.i:                                          ; preds = %do_loop_readv_writev.exit.i
  %tmp115.i = getelementptr inbounds %struct.inode* %tmp109.i, i32 0, i32 6
  %tmp116.i = load %struct.super_block** %tmp115.i, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp116.i, i32 inreg 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %bb114.i, %do_loop_readv_writev.exit.i, %bb20.i, %bb12.i, %bb7.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i32 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ], [ %ret.0.i, %bb114.i ], [ -22, %bb7.i ], [ -75, %bb12.i ], [ -22, %bb20.i ]
  %tmp117.i = load %struct.iovec** %iov.i, align 4
  %tmp118.i = icmp eq %struct.iovec* %tmp117.i, %tmp1.i
  br i1 %tmp118.i, label %do_readv_writev.exit, label %bb119.i

bb119.i:                                          ; preds = %file_end_write.exit.i
  %tmp120.i = bitcast %struct.iovec* %tmp117.i to i8*
  call void @kfree(i8* inreg %tmp120.i) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %bb119.i, %file_end_write.exit.i
  call void @llvm.lifetime.end(i64 64, i8* %tmp.i) #4
  %1 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 4, i8* %1) #4
  br label %bb9

bb9:                                              ; preds = %do_readv_writev.exit, %bb4, %bb
  %.0 = phi i32 [ %ret.1.i, %do_readv_writev.exit ], [ -9, %bb ], [ -22, %bb4 ]
  ret i32 %.0
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_readv(i32 %fd, i32 %vec, i32 %vlen) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %iovstack.i = alloca [8 x %struct.iovec], align 4
  %iov.i = alloca %struct.iovec*, align 4
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %vec, i32* %tmp1, align 4
  store i32 %vlen, i32* %tmp2, align 4
  %tmp3 = inttoptr i32 %vec to %struct.iovec*
  %tmp4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp4) #4
  %tmp5 = call i32 @__fdget_pos(i32 inreg %fd) #6
  %tmp6 = and i32 %tmp5, -4
  %tmp7 = inttoptr i32 %tmp6 to %struct.file*
  %tmp8 = icmp eq i32 %tmp6, 0
  br i1 %tmp8, label %SYSC_readv.exit, label %bb9

bb9:                                              ; preds = %bb
  %tmp10 = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 9
  %tmp11 = load i64* %tmp10, align 4
  store i64 %tmp11, i64* %pos.i, align 8
  %tmp12 = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 7
  %tmp13 = load i32* %tmp12, align 4
  %tmp14 = and i32 %tmp13, 1
  %tmp15 = icmp eq i32 %tmp14, 0
  br i1 %tmp15, label %vfs_readv.exit.thread.i, label %bb16

bb16:                                             ; preds = %bb9
  %tmp17 = and i32 %tmp13, 131072
  %tmp18 = icmp eq i32 %tmp17, 0
  br i1 %tmp18, label %vfs_readv.exit.thread.i, label %vfs_readv.exit.i

vfs_readv.exit.i:                                 ; preds = %bb16
  %0 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #4
  %tmp.i = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp.i) #4
  %tmp1.i = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i32 0, i32 0
  store %struct.iovec* %tmp1.i, %struct.iovec** %iov.i, align 4
  %tmp.i.i = icmp eq i32 %vlen, 0
  br i1 %tmp.i.i, label %rw_copy_check_uvector.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %vfs_readv.exit.i
  %tmp2.i.i = icmp ugt i32 %vlen, 1024
  br i1 %tmp2.i.i, label %rw_copy_check_uvector.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %tmp4.i.i = icmp ugt i32 %vlen, 8
  %tmp5.i.i = shl i32 %vlen, 3
  br i1 %tmp4.i.i, label %bb6.i.i, label %._crit_edge.i.i

bb6.i.i:                                          ; preds = %bb3.i.i
  %tmp7.i.i = call i8* @__kmalloc(i32 inreg %tmp5.i.i, i32 inreg 208) #6
  %tmp8.i.i = bitcast i8* %tmp7.i.i to %struct.iovec*
  %tmp9.i.i = icmp eq i8* %tmp7.i.i, null
  br i1 %tmp9.i.i, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %bb6.i.i, %bb3.i.i
  %iov.0.i.i = phi %struct.iovec* [ %tmp8.i.i, %bb6.i.i ], [ %tmp1.i, %bb3.i.i ]
  %tmp10.i.i = bitcast %struct.iovec* %iov.0.i.i to i8*
  %tmp11.i.i = call i32 @llvm.objectsize.i32.p0i8(i8* %tmp10.i.i, i1 false) #4
  %tmp12.i.i = icmp slt i32 %tmp11.i.i, 0
  %tmp13.i.i = icmp uge i32 %tmp11.i.i, %tmp5.i.i
  %..i.i.i = or i1 %tmp12.i.i, %tmp13.i.i
  br i1 %..i.i.i, label %bb14.i.i, label %copy_from_user.exit.i.i, !prof !6

bb14.i.i:                                         ; preds = %._crit_edge.i.i
  %tmp15.i.i = bitcast %struct.iovec* %tmp3 to i8*
  %tmp16.i.i = call i32 @_copy_from_user(i8* inreg %tmp10.i.i, i8* inreg %tmp15.i.i, i32 inreg %tmp5.i.i) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %bb14.i.i, %._crit_edge.i.i
  %.0.i.i.i = phi i32 [ %tmp16.i.i, %bb14.i.i ], [ %tmp5.i.i, %._crit_edge.i.i ]
  %tmp17.i.i = icmp eq i32 %.0.i.i.i, 0
  br i1 %tmp17.i.i, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %.lr.ph.split.us.i.i

.lr.ph.split.us.i.i:                              ; preds = %bb38.i.i, %.lr.ph.i.i
  %seg.04.us.i.i = phi i32 [ %tmp40.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %ret.03.us.i.i = phi i32 [ %tmp39.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %tmp19.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 1
  %tmp20.i.i = load i32* %tmp19.i.i, align 4
  %tmp21.i.i = icmp slt i32 %tmp20.i.i, 0
  br i1 %tmp21.i.i, label %rw_copy_check_uvector.exit.i, label %bb22.i.i

bb22.i.i:                                         ; preds = %.lr.ph.split.us.i.i
  %tmp23.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 0
  %tmp24.i.i = load i8** %tmp23.i.i, align 4
  %tmp25.i.i = ptrtoint i8* %tmp24.i.i to i32
  %tmp26.i.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp27.i.i = add i32 %tmp26.i.i, -8172
  %tmp28.i.i = inttoptr i32 %tmp27.i.i to %struct.thread_info*
  %tmp29.i.i = getelementptr inbounds %struct.thread_info* %tmp28.i.i, i32 0, i32 6, i32 0
  %tmp30.i.i = load i32* %tmp29.i.i, align 4
  %uadd.i.us.i.i = add i32 %tmp25.i.i, %tmp20.i.i
  %tmp31.i.i = add i1 0, 0
  %tmp32.i.i = add i32 %uadd.i.us.i.i, 0
  %tmp33.i.i = icmp ugt i32 %tmp32.i.i, %tmp30.i.i
  %or.cond.us.i.i = or i1 %tmp31.i.i, %tmp33.i.i
  br i1 %or.cond.us.i.i, label %rw_copy_check_uvector.exit.i, label %bb34.i.i

bb34.i.i:                                         ; preds = %bb22.i.i
  %tmp35.i.i = sub i32 2147479552, %ret.03.us.i.i
  %tmp36.i.i = icmp ugt i32 %tmp20.i.i, %tmp35.i.i
  br i1 %tmp36.i.i, label %bb37.i.i, label %bb38.i.i

bb37.i.i:                                         ; preds = %bb34.i.i
  store i32 %tmp35.i.i, i32* %tmp19.i.i, align 4
  br label %bb38.i.i

bb38.i.i:                                         ; preds = %bb37.i.i, %bb34.i.i
  %len.0.us.i.i = phi i32 [ %tmp35.i.i, %bb37.i.i ], [ %tmp20.i.i, %bb34.i.i ]
  %tmp39.i.i = add i32 %len.0.us.i.i, %ret.03.us.i.i
  %tmp40.i.i = add i32 %seg.04.us.i.i, 1
  %tmp41.i.i = icmp ult i32 %tmp40.i.i, %vlen
  br i1 %tmp41.i.i, label %.lr.ph.split.us.i.i, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %bb38.i.i, %bb22.i.i, %.lr.ph.split.us.i.i, %copy_from_user.exit.i.i, %bb6.i.i, %bb1.i.i, %vfs_readv.exit.i
  %iov.1.i.i = phi %struct.iovec* [ %tmp1.i, %vfs_readv.exit.i ], [ %tmp1.i, %bb1.i.i ], [ %tmp8.i.i, %bb6.i.i ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %.lr.ph.split.us.i.i ], [ %iov.0.i.i, %bb22.i.i ], [ %iov.0.i.i, %bb38.i.i ]
  %ret.1.i.i = phi i32 [ 0, %vfs_readv.exit.i ], [ -22, %bb1.i.i ], [ -12, %bb6.i.i ], [ -14, %copy_from_user.exit.i.i ], [ %tmp39.i.i, %bb38.i.i ], [ -14, %bb22.i.i ], [ -22, %.lr.ph.split.us.i.i ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 4
  %tmp3.i = icmp slt i32 %ret.1.i.i, 1
  br i1 %tmp3.i, label %file_end_write.exit.i, label %bb4.i

bb4.i:                                            ; preds = %rw_copy_check_uvector.exit.i
  %tmp5.i = load i64* %pos.i, align 4
  %tmp6.i = icmp slt i64 %tmp5.i, 0
  br i1 %tmp6.i, label %bb7.i, label %bb16.i, !prof !4

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 7
  %tmp9.i = load i32* %tmp8.i, align 4
  %tmp10.i = and i32 %tmp9.i, 8192
  %tmp11.i = icmp eq i32 %tmp10.i, 0
  br i1 %tmp11.i, label %file_end_write.exit.i, label %bb12.i

bb12.i:                                           ; preds = %bb7.i
  %tmp13.i = zext i32 %ret.1.i.i to i64
  %tmp14.i = sub i64 0, %tmp5.i
  %tmp15.i = icmp slt i64 %tmp13.i, %tmp14.i
  br i1 %tmp15.i, label %select.unfold.i, label %file_end_write.exit.i

bb16.i:                                           ; preds = %bb4.i
  %tmp17.i = zext i32 %ret.1.i.i to i64
  %tmp18.i = add i64 %tmp5.i, %tmp17.i
  %tmp19.i = icmp slt i64 %tmp18.i, 0
  br i1 %tmp19.i, label %bb20.i, label %select.unfold.i, !prof !4

bb20.i:                                           ; preds = %bb16.i
  %tmp21.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 7
  %tmp22.i = load i32* %tmp21.i, align 4
  %tmp23.i = and i32 %tmp22.i, 8192
  %tmp24.i = icmp eq i32 %tmp23.i, 0
  br i1 %tmp24.i, label %file_end_write.exit.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb20.i, %bb16.i, %bb12.i
  %tmp26.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 3
  %tmp27.i = load %struct.file_operations** %tmp26.i, align 4
  %tmp29.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 2
  %tmp30.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp29.i, align 4
  %tmp31.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 4
  %tmp32.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp31.i, align 4
  %tmp33.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 6
  %tmp34.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp33.i, align 4
  %tmp52.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp34.i, null
  br i1 %tmp52.i, label %bb72.i, label %bb53.i

bb53.i:                                           ; preds = %select.unfold.i
  %tmp54.i = load %struct.iovec** %iov.i, align 4
  %tmp55.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp55.i) #4
  %tmp56.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp56.i) #4
  %tmp57.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp57.i) #4
  %tmp58.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp58.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp57.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp58.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp59.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp60.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp7, %struct.file** %tmp60.i, align 4
  %tmp61.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp62.i = bitcast %struct.kioctx** %tmp61.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp62.i, i8* %tmp57.i, i32 12, i32 4, i1 false) #4
  %tmp63.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp59.i to i8*
  store i8* %.c.i.i.i, i8** %tmp63.i, align 4
  %tmp64.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp65.i = bitcast i64* %tmp64.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp65.i, i8* %tmp58.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp57.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp58.i) #4
  %tmp66.i = load i64* %pos.i, align 4
  %tmp67.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp66.i, i64* %tmp67.i, align 4
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp68.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 0, %struct.iovec* inreg %tmp54.i, i32 %vlen, i32 %ret.1.i.i) #6
  %tmp69.i = call i32 %tmp34.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp70.i = icmp eq i32 %tmp69.i, -529
  %..i.i = select i1 %tmp70.i, i32 0, i32 %tmp69.i
  %tmp71.i = load i64* %tmp67.i, align 4
  store i64 %tmp71.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp56.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp55.i) #4
  br label %do_loop_readv_writev.exit.i

bb72.i:                                           ; preds = %select.unfold.i
  %tmp73.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp32.i, null
  %tmp74.i = load %struct.iovec** %iov.i, align 4
  br i1 %tmp73.i, label %bb92.i, label %bb75.i

bb75.i:                                           ; preds = %bb72.i
  %tmp76.i = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp76.i) #4
  %tmp77.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp77.i) #4
  %tmp78.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp78.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp77.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp78.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp79.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp80.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 0
  store %struct.file* %tmp7, %struct.file** %tmp80.i, align 4
  %tmp81.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 1
  %tmp82.i = bitcast %struct.kioctx** %tmp81.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp82.i, i8* %tmp77.i, i32 12, i32 4, i1 false) #4
  %tmp83.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %tmp79.i to i8*
  store i8* %.c.i.i4.i, i8** %tmp83.i, align 4
  %tmp84.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 5
  %tmp85.i = bitcast i64* %tmp84.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp85.i, i8* %tmp78.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp77.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp78.i) #4
  %tmp86.i = load i64* %pos.i, align 4
  %tmp87.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 6
  store i64 %tmp86.i, i64* %tmp87.i, align 4
  %tmp88.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp88.i, align 4
  %tmp89.i = call i32 %tmp32.i(%struct.kiocb* inreg %kiocb.i3.i, %struct.iovec* inreg %tmp74.i, i32 inreg %vlen, i64 %tmp86.i) #6
  %tmp90.i = icmp eq i32 %tmp89.i, -529
  %..i5.i = select i1 %tmp90.i, i32 0, i32 %tmp89.i
  %tmp91.i = load i64* %tmp87.i, align 4
  store i64 %tmp91.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp76.i) #4
  br label %do_loop_readv_writev.exit.i

bb92.i:                                           ; preds = %bb72.i
  %.old1.i.i = icmp eq i32 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb102.i, %bb92.i
  %ret.0.i.i = phi i32 [ %tmp104.i, %bb102.i ], [ 0, %bb92.i ]
  %vector.0.i.i = phi %struct.iovec* [ %tmp103.i, %bb102.i ], [ %tmp74.i, %bb92.i ]
  %.0.i6.i = phi i32 [ %tmp97.i, %bb102.i ], [ %vlen, %bb92.i ]
  %tmp93.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 0
  %tmp94.i = load i8** %tmp93.i, align 4
  %tmp95.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 1
  %tmp96.i = load i32* %tmp95.i, align 4
  %tmp97.i = add i32 %.0.i6.i, -1
  %tmp98.i = call i32 %tmp30.i(%struct.file* inreg %tmp7, i8* inreg %tmp94.i, i32 inreg %tmp96.i, i64* %pos.i) #6
  %tmp99.i = icmp slt i32 %tmp98.i, 0
  br i1 %tmp99.i, label %bb100.i, label %bb102.i

bb100.i:                                          ; preds = %.preheader.i.i
  %tmp101.i = icmp eq i32 %ret.0.i.i, 0
  %.ret.0.i.i = select i1 %tmp101.i, i32 %tmp98.i, i32 %ret.0.i.i
  br label %do_loop_readv_writev.exit.i

bb102.i:                                          ; preds = %.preheader.i.i
  %tmp103.i = getelementptr %struct.iovec* %vector.0.i.i, i32 1
  %tmp104.i = add i32 %tmp98.i, %ret.0.i.i
  %tmp105.i = icmp eq i32 %tmp98.i, %tmp96.i
  %tmp106.i = icmp ne i32 %tmp97.i, 0
  %or.cond.i.i = and i1 %tmp105.i, %tmp106.i
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %bb102.i, %bb100.i, %bb92.i, %bb75.i, %bb53.i
  %ret.0.i = phi i32 [ %..i.i, %bb53.i ], [ %..i5.i, %bb75.i ], [ %.ret.0.i.i, %bb100.i ], [ 0, %bb92.i ], [ %tmp104.i, %bb102.i ]
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %do_loop_readv_writev.exit.i, %bb20.i, %bb12.i, %bb7.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i32 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ], [ -22, %bb7.i ], [ -75, %bb12.i ], [ -22, %bb20.i ]
  %tmp117.i = load %struct.iovec** %iov.i, align 4
  %tmp118.i = icmp eq %struct.iovec* %tmp117.i, %tmp1.i
  br i1 %tmp118.i, label %do_readv_writev.exit, label %bb119.i

bb119.i:                                          ; preds = %file_end_write.exit.i
  %tmp120.i = bitcast %struct.iovec* %tmp117.i to i8*
  call void @kfree(i8* inreg %tmp120.i) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %bb119.i, %file_end_write.exit.i
  call void @llvm.lifetime.end(i64 64, i8* %tmp.i) #4
  %1 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 4, i8* %1) #4
  %tmp20 = icmp sgt i32 %ret.1.i, -1
  br i1 %tmp20, label %bb21, label %vfs_readv.exit.thread.i

bb21:                                             ; preds = %do_readv_writev.exit
  %tmp22 = load i64* %pos.i, align 8
  store i64 %tmp22, i64* %tmp10, align 4
  br label %vfs_readv.exit.thread.i

vfs_readv.exit.thread.i:                          ; preds = %bb21, %do_readv_writev.exit, %bb16, %bb9
  %.0.i1.i = phi i32 [ %ret.1.i, %bb21 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %bb9 ], [ -22, %bb16 ]
  %tmp23 = and i32 %tmp5, 2
  %tmp24 = icmp eq i32 %tmp23, 0
  br i1 %tmp24, label %bb27, label %bb25

bb25:                                             ; preds = %vfs_readv.exit.thread.i
  %tmp26 = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 8
  call void @mutex_unlock(%struct.mutex* inreg %tmp26) #6
  br label %bb27

bb27:                                             ; preds = %bb25, %vfs_readv.exit.thread.i
  %tmp28 = and i32 %tmp5, 1
  %tmp29 = icmp eq i32 %tmp28, 0
  br i1 %tmp29, label %fdput_pos.exit.i, label %bb30

bb30:                                             ; preds = %bb27
  call void @fput(%struct.file* inreg %tmp7) #6
  br label %fdput_pos.exit.i

fdput_pos.exit.i:                                 ; preds = %bb30, %bb27
  %tmp31 = icmp sgt i32 %.0.i1.i, 0
  br i1 %tmp31, label %bb32, label %SYSC_readv.exit

bb32:                                             ; preds = %fdput_pos.exit.i
  %tmp33 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %SYSC_readv.exit

SYSC_readv.exit:                                  ; preds = %bb32, %fdput_pos.exit.i, %bb
  %ret.02.i = phi i32 [ %.0.i1.i, %bb32 ], [ %.0.i1.i, %fdput_pos.exit.i ], [ -9, %bb ]
  %tmp34 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  call void @llvm.lifetime.end(i64 8, i8* %tmp4) #4
  %tmp35 = sub i32 35, 35
  ret i32 %tmp35
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_writev(i32 %fd, i32 %vec, i32 %vlen) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %iovstack.i = alloca [8 x %struct.iovec], align 4
  %iov.i = alloca %struct.iovec*, align 4
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %vec, i32* %tmp1, align 4
  store i32 %vlen, i32* %tmp2, align 4
  %tmp3 = inttoptr i32 %vec to %struct.iovec*
  %tmp4 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp4) #4
  %tmp5 = call i32 @__fdget_pos(i32 inreg %fd) #6
  %tmp6 = and i32 %tmp5, -4
  %tmp7 = inttoptr i32 %tmp6 to %struct.file*
  %tmp8 = icmp eq i32 %tmp6, 0
  br i1 %tmp8, label %SYSC_writev.exit, label %bb9

bb9:                                              ; preds = %bb
  %tmp10 = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 9
  %tmp11 = load i64* %tmp10, align 4
  store i64 %tmp11, i64* %pos.i, align 8
  %tmp12 = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 7
  %tmp13 = load i32* %tmp12, align 4
  %tmp14 = and i32 %tmp13, 2
  %tmp15 = icmp eq i32 %tmp14, 0
  br i1 %tmp15, label %vfs_writev.exit.thread.i, label %bb16

bb16:                                             ; preds = %bb9
  %tmp17 = and i32 %tmp13, 262144
  %tmp18 = icmp eq i32 %tmp17, 0
  br i1 %tmp18, label %vfs_writev.exit.thread.i, label %vfs_writev.exit.i

vfs_writev.exit.i:                                ; preds = %bb16
  %0 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #4
  %tmp.i = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp.i) #4
  %tmp1.i = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i32 0, i32 0
  store %struct.iovec* %tmp1.i, %struct.iovec** %iov.i, align 4
  %tmp.i.i = icmp eq i32 %vlen, 0
  br i1 %tmp.i.i, label %rw_copy_check_uvector.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %vfs_writev.exit.i
  %tmp2.i.i = icmp ugt i32 %vlen, 1024
  br i1 %tmp2.i.i, label %rw_copy_check_uvector.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %tmp4.i.i = icmp ugt i32 %vlen, 8
  %tmp5.i.i = shl i32 %vlen, 3
  br i1 %tmp4.i.i, label %bb6.i.i, label %._crit_edge.i.i

bb6.i.i:                                          ; preds = %bb3.i.i
  %tmp7.i.i = call i8* @__kmalloc(i32 inreg %tmp5.i.i, i32 inreg 208) #6
  %tmp8.i.i = bitcast i8* %tmp7.i.i to %struct.iovec*
  %tmp9.i.i = icmp eq i8* %tmp7.i.i, null
  br i1 %tmp9.i.i, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %bb6.i.i, %bb3.i.i
  %iov.0.i.i = phi %struct.iovec* [ %tmp8.i.i, %bb6.i.i ], [ %tmp1.i, %bb3.i.i ]
  %tmp10.i.i = bitcast %struct.iovec* %iov.0.i.i to i8*
  %tmp11.i.i = call i32 @llvm.objectsize.i32.p0i8(i8* %tmp10.i.i, i1 false) #4
  %tmp12.i.i = icmp slt i32 %tmp11.i.i, 0
  %tmp13.i.i = icmp uge i32 %tmp11.i.i, %tmp5.i.i
  %..i.i.i = or i1 %tmp12.i.i, %tmp13.i.i
  br i1 %..i.i.i, label %bb14.i.i, label %copy_from_user.exit.i.i, !prof !6

bb14.i.i:                                         ; preds = %._crit_edge.i.i
  %tmp15.i.i = bitcast %struct.iovec* %tmp3 to i8*
  %tmp16.i.i = call i32 @_copy_from_user(i8* inreg %tmp10.i.i, i8* inreg %tmp15.i.i, i32 inreg %tmp5.i.i) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %bb14.i.i, %._crit_edge.i.i
  %.0.i.i.i = phi i32 [ %tmp16.i.i, %bb14.i.i ], [ %tmp5.i.i, %._crit_edge.i.i ]
  %tmp17.i.i = icmp eq i32 %.0.i.i.i, 0
  br i1 %tmp17.i.i, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %.lr.ph.split.us.i.i

.lr.ph.split.us.i.i:                              ; preds = %bb38.i.i, %.lr.ph.i.i
  %seg.04.us.i.i = phi i32 [ %tmp40.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %ret.03.us.i.i = phi i32 [ %tmp39.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %tmp19.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 1
  %tmp20.i.i = load i32* %tmp19.i.i, align 4
  %tmp21.i.i = icmp slt i32 %tmp20.i.i, 0
  br i1 %tmp21.i.i, label %rw_copy_check_uvector.exit.i, label %bb22.i.i

bb22.i.i:                                         ; preds = %.lr.ph.split.us.i.i
  %tmp23.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 0
  %tmp24.i.i = load i8** %tmp23.i.i, align 4
  %tmp25.i.i = ptrtoint i8* %tmp24.i.i to i32
  %tmp26.i.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp27.i.i = add i32 %tmp26.i.i, -8172
  %tmp28.i.i = inttoptr i32 %tmp27.i.i to %struct.thread_info*
  %tmp29.i.i = getelementptr inbounds %struct.thread_info* %tmp28.i.i, i32 0, i32 6, i32 0
  %tmp30.i.i = load i32* %tmp29.i.i, align 4
  %uadd.i.us.i.i = add i32 %tmp25.i.i, %tmp20.i.i
  %tmp31.i.i = add i1 0, 0
  %tmp32.i.i = add i32 %uadd.i.us.i.i, 0
  %tmp33.i.i = icmp ugt i32 %tmp32.i.i, %tmp30.i.i
  %or.cond.us.i.i = or i1 %tmp31.i.i, %tmp33.i.i
  br i1 %or.cond.us.i.i, label %rw_copy_check_uvector.exit.i, label %bb34.i.i

bb34.i.i:                                         ; preds = %bb22.i.i
  %tmp35.i.i = sub i32 2147479552, %ret.03.us.i.i
  %tmp36.i.i = icmp ugt i32 %tmp20.i.i, %tmp35.i.i
  br i1 %tmp36.i.i, label %bb37.i.i, label %bb38.i.i

bb37.i.i:                                         ; preds = %bb34.i.i
  store i32 %tmp35.i.i, i32* %tmp19.i.i, align 4
  br label %bb38.i.i

bb38.i.i:                                         ; preds = %bb37.i.i, %bb34.i.i
  %len.0.us.i.i = phi i32 [ %tmp35.i.i, %bb37.i.i ], [ %tmp20.i.i, %bb34.i.i ]
  %tmp39.i.i = add i32 %len.0.us.i.i, %ret.03.us.i.i
  %tmp40.i.i = add i32 %seg.04.us.i.i, 1
  %tmp41.i.i = icmp ult i32 %tmp40.i.i, %vlen
  br i1 %tmp41.i.i, label %.lr.ph.split.us.i.i, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %bb38.i.i, %bb22.i.i, %.lr.ph.split.us.i.i, %copy_from_user.exit.i.i, %bb6.i.i, %bb1.i.i, %vfs_writev.exit.i
  %iov.1.i.i = phi %struct.iovec* [ %tmp1.i, %vfs_writev.exit.i ], [ %tmp1.i, %bb1.i.i ], [ %tmp8.i.i, %bb6.i.i ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %.lr.ph.split.us.i.i ], [ %iov.0.i.i, %bb22.i.i ], [ %iov.0.i.i, %bb38.i.i ]
  %ret.1.i.i = phi i32 [ 0, %vfs_writev.exit.i ], [ -22, %bb1.i.i ], [ -12, %bb6.i.i ], [ -14, %copy_from_user.exit.i.i ], [ %tmp39.i.i, %bb38.i.i ], [ -14, %bb22.i.i ], [ -22, %.lr.ph.split.us.i.i ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 4
  %tmp3.i = icmp slt i32 %ret.1.i.i, 1
  br i1 %tmp3.i, label %file_end_write.exit.i, label %bb4.i

bb4.i:                                            ; preds = %rw_copy_check_uvector.exit.i
  %tmp5.i = load i64* %pos.i, align 4
  %tmp6.i = icmp slt i64 %tmp5.i, 0
  br i1 %tmp6.i, label %bb7.i, label %bb16.i, !prof !4

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 7
  %tmp9.i = load i32* %tmp8.i, align 4
  %tmp10.i = and i32 %tmp9.i, 8192
  %tmp11.i = icmp eq i32 %tmp10.i, 0
  br i1 %tmp11.i, label %file_end_write.exit.i, label %bb12.i

bb12.i:                                           ; preds = %bb7.i
  %tmp13.i = zext i32 %ret.1.i.i to i64
  %tmp14.i = sub i64 0, %tmp5.i
  %tmp15.i = icmp slt i64 %tmp13.i, %tmp14.i
  br i1 %tmp15.i, label %select.unfold.i, label %file_end_write.exit.i

bb16.i:                                           ; preds = %bb4.i
  %tmp17.i = zext i32 %ret.1.i.i to i64
  %tmp18.i = add i64 %tmp5.i, %tmp17.i
  %tmp19.i = icmp slt i64 %tmp18.i, 0
  br i1 %tmp19.i, label %bb20.i, label %select.unfold.i, !prof !4

bb20.i:                                           ; preds = %bb16.i
  %tmp21.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 7
  %tmp22.i = load i32* %tmp21.i, align 4
  %tmp23.i = and i32 %tmp22.i, 8192
  %tmp24.i = icmp eq i32 %tmp23.i, 0
  br i1 %tmp24.i, label %file_end_write.exit.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb20.i, %bb16.i, %bb12.i
  %tmp26.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 3
  %tmp27.i = load %struct.file_operations** %tmp26.i, align 4
  %tmp36.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 3
  %tmp37.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp36.i, align 4
  %tmp38.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 5
  %tmp39.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp38.i, align 4
  %tmp40.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 7
  %tmp41.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp40.i, align 4
  %tmp42.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 2
  %tmp43.i = load %struct.inode** %tmp42.i, align 4
  %tmp44.i = getelementptr inbounds %struct.inode* %tmp43.i, i32 0, i32 0
  %tmp45.i = load i16* %tmp44.i, align 2
  %tmp46.i = and i16 %tmp45.i, -4096
  %tmp47.i = icmp eq i16 %tmp46.i, -32768
  br i1 %tmp47.i, label %bb48.i, label %file_start_write.exit.i

bb48.i:                                           ; preds = %select.unfold.i
  %tmp49.i = getelementptr inbounds %struct.inode* %tmp43.i, i32 0, i32 6
  %tmp50.i = load %struct.super_block** %tmp49.i, align 4
  %tmp51.i = call i32 @__sb_start_write(%struct.super_block* inreg %tmp50.i, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %bb48.i, %select.unfold.i
  %tmp52.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp41.i, null
  br i1 %tmp52.i, label %bb72.i, label %bb53.i

bb53.i:                                           ; preds = %file_start_write.exit.i
  %tmp54.i = load %struct.iovec** %iov.i, align 4
  %tmp55.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp55.i) #4
  %tmp56.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp56.i) #4
  %tmp57.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp57.i) #4
  %tmp58.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp58.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp57.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp58.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp59.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp60.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp7, %struct.file** %tmp60.i, align 4
  %tmp61.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp62.i = bitcast %struct.kioctx** %tmp61.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp62.i, i8* %tmp57.i, i32 12, i32 4, i1 false) #4
  %tmp63.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp59.i to i8*
  store i8* %.c.i.i.i, i8** %tmp63.i, align 4
  %tmp64.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp65.i = bitcast i64* %tmp64.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp65.i, i8* %tmp58.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp57.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp58.i) #4
  %tmp66.i = load i64* %pos.i, align 4
  %tmp67.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp66.i, i64* %tmp67.i, align 4
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp68.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 1, %struct.iovec* inreg %tmp54.i, i32 %vlen, i32 %ret.1.i.i) #6
  %tmp69.i = call i32 %tmp41.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp70.i = icmp eq i32 %tmp69.i, -529
  %..i.i = select i1 %tmp70.i, i32 0, i32 %tmp69.i
  %tmp71.i = load i64* %tmp67.i, align 4
  store i64 %tmp71.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp56.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp55.i) #4
  br label %do_loop_readv_writev.exit.i

bb72.i:                                           ; preds = %file_start_write.exit.i
  %tmp73.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp39.i, null
  %tmp74.i = load %struct.iovec** %iov.i, align 4
  br i1 %tmp73.i, label %bb92.i, label %bb75.i

bb75.i:                                           ; preds = %bb72.i
  %tmp76.i = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp76.i) #4
  %tmp77.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp77.i) #4
  %tmp78.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp78.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp77.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp78.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp79.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp80.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 0
  store %struct.file* %tmp7, %struct.file** %tmp80.i, align 4
  %tmp81.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 1
  %tmp82.i = bitcast %struct.kioctx** %tmp81.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp82.i, i8* %tmp77.i, i32 12, i32 4, i1 false) #4
  %tmp83.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %tmp79.i to i8*
  store i8* %.c.i.i4.i, i8** %tmp83.i, align 4
  %tmp84.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 5
  %tmp85.i = bitcast i64* %tmp84.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp85.i, i8* %tmp78.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp77.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp78.i) #4
  %tmp86.i = load i64* %pos.i, align 4
  %tmp87.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 6
  store i64 %tmp86.i, i64* %tmp87.i, align 4
  %tmp88.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp88.i, align 4
  %tmp89.i = call i32 %tmp39.i(%struct.kiocb* inreg %kiocb.i3.i, %struct.iovec* inreg %tmp74.i, i32 inreg %vlen, i64 %tmp86.i) #6
  %tmp90.i = icmp eq i32 %tmp89.i, -529
  %..i5.i = select i1 %tmp90.i, i32 0, i32 %tmp89.i
  %tmp91.i = load i64* %tmp87.i, align 4
  store i64 %tmp91.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp76.i) #4
  br label %do_loop_readv_writev.exit.i

bb92.i:                                           ; preds = %bb72.i
  %.old1.i.i = icmp eq i32 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb102.i, %bb92.i
  %ret.0.i.i = phi i32 [ %tmp104.i, %bb102.i ], [ 0, %bb92.i ]
  %vector.0.i.i = phi %struct.iovec* [ %tmp103.i, %bb102.i ], [ %tmp74.i, %bb92.i ]
  %.0.i6.i = phi i32 [ %tmp97.i, %bb102.i ], [ %vlen, %bb92.i ]
  %tmp93.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 0
  %tmp94.i = load i8** %tmp93.i, align 4
  %tmp95.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 1
  %tmp96.i = load i32* %tmp95.i, align 4
  %tmp97.i = add i32 %.0.i6.i, -1
  %tmp98.i = call i32 %tmp37.i(%struct.file* inreg %tmp7, i8* inreg %tmp94.i, i32 inreg %tmp96.i, i64* %pos.i) #6
  %tmp99.i = icmp slt i32 %tmp98.i, 0
  br i1 %tmp99.i, label %bb100.i, label %bb102.i

bb100.i:                                          ; preds = %.preheader.i.i
  %tmp101.i = icmp eq i32 %ret.0.i.i, 0
  %.ret.0.i.i = select i1 %tmp101.i, i32 %tmp98.i, i32 %ret.0.i.i
  br label %do_loop_readv_writev.exit.i

bb102.i:                                          ; preds = %.preheader.i.i
  %tmp103.i = getelementptr %struct.iovec* %vector.0.i.i, i32 1
  %tmp104.i = add i32 %tmp98.i, %ret.0.i.i
  %tmp105.i = icmp eq i32 %tmp98.i, %tmp96.i
  %tmp106.i = icmp ne i32 %tmp97.i, 0
  %or.cond.i.i = and i1 %tmp105.i, %tmp106.i
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %bb102.i, %bb100.i, %bb92.i, %bb75.i, %bb53.i
  %ret.0.i = phi i32 [ %..i.i, %bb53.i ], [ %..i5.i, %bb75.i ], [ %.ret.0.i.i, %bb100.i ], [ 0, %bb92.i ], [ %tmp104.i, %bb102.i ]
  %tmp108.i = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 2
  %tmp109.i = load %struct.inode** %tmp108.i, align 4
  %tmp110.i = getelementptr inbounds %struct.inode* %tmp109.i, i32 0, i32 0
  %tmp111.i = load i16* %tmp110.i, align 2
  %tmp112.i = and i16 %tmp111.i, -4096
  %tmp113.i = icmp eq i16 %tmp112.i, -32768
  br i1 %tmp113.i, label %bb114.i, label %file_end_write.exit.i

bb114.i:                                          ; preds = %do_loop_readv_writev.exit.i
  %tmp115.i = getelementptr inbounds %struct.inode* %tmp109.i, i32 0, i32 6
  %tmp116.i = load %struct.super_block** %tmp115.i, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp116.i, i32 inreg 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %bb114.i, %do_loop_readv_writev.exit.i, %bb20.i, %bb12.i, %bb7.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i32 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %ret.0.i, %do_loop_readv_writev.exit.i ], [ %ret.0.i, %bb114.i ], [ -22, %bb7.i ], [ -75, %bb12.i ], [ -22, %bb20.i ]
  %tmp117.i = load %struct.iovec** %iov.i, align 4
  %tmp118.i = icmp eq %struct.iovec* %tmp117.i, %tmp1.i
  br i1 %tmp118.i, label %do_readv_writev.exit, label %bb119.i

bb119.i:                                          ; preds = %file_end_write.exit.i
  %tmp120.i = bitcast %struct.iovec* %tmp117.i to i8*
  call void @kfree(i8* inreg %tmp120.i) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %bb119.i, %file_end_write.exit.i
  call void @llvm.lifetime.end(i64 64, i8* %tmp.i) #4
  %1 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 4, i8* %1) #4
  %tmp20 = icmp sgt i32 %ret.1.i, -1
  br i1 %tmp20, label %bb21, label %vfs_writev.exit.thread.i

bb21:                                             ; preds = %do_readv_writev.exit
  %tmp22 = load i64* %pos.i, align 8
  store i64 %tmp22, i64* %tmp10, align 4
  br label %vfs_writev.exit.thread.i

vfs_writev.exit.thread.i:                         ; preds = %bb21, %do_readv_writev.exit, %bb16, %bb9
  %.0.i1.i = phi i32 [ %ret.1.i, %bb21 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %bb9 ], [ -22, %bb16 ]
  %tmp23 = and i32 %tmp5, 2
  %tmp24 = icmp eq i32 %tmp23, 0
  br i1 %tmp24, label %bb27, label %bb25

bb25:                                             ; preds = %vfs_writev.exit.thread.i
  %tmp26 = getelementptr inbounds %struct.file* %tmp7, i32 0, i32 8
  call void @mutex_unlock(%struct.mutex* inreg %tmp26) #6
  br label %bb27

bb27:                                             ; preds = %bb25, %vfs_writev.exit.thread.i
  %tmp28 = and i32 %tmp5, 1
  %tmp29 = icmp eq i32 %tmp28, 0
  br i1 %tmp29, label %fdput_pos.exit.i, label %bb30

bb30:                                             ; preds = %bb27
  call void @fput(%struct.file* inreg %tmp7) #6
  br label %fdput_pos.exit.i

fdput_pos.exit.i:                                 ; preds = %bb30, %bb27
  %tmp31 = icmp sgt i32 %.0.i1.i, 0
  br i1 %tmp31, label %bb32, label %SYSC_writev.exit

bb32:                                             ; preds = %fdput_pos.exit.i
  %tmp33 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %SYSC_writev.exit

SYSC_writev.exit:                                 ; preds = %bb32, %fdput_pos.exit.i, %bb
  %ret.02.i = phi i32 [ %.0.i1.i, %bb32 ], [ %.0.i1.i, %fdput_pos.exit.i ], [ -9, %bb ]
  %tmp34 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  call void @llvm.lifetime.end(i64 8, i8* %tmp4) #4
  %tmp35 = sub i32 35, 35
  ret i32 %tmp35
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_preadv(i32 %fd, i32 %vec, i32 %vlen, i32 %pos_l, i32 %pos_h) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %iovstack.i = alloca [8 x %struct.iovec], align 4
  %iov.i = alloca %struct.iovec*, align 4
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %vec, i32* %tmp1, align 4
  store i32 %vlen, i32* %tmp2, align 4
  store i32 %pos_l, i32* %tmp3, align 4
  store i32 %pos_h, i32* %tmp4, align 4
  %tmp5 = inttoptr i32 %vec to %struct.iovec*
  %tmp6 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp6) #4
  %tmp7 = zext i32 %pos_h to i64
  %tmp8 = shl nuw i64 %tmp7, 32
  %tmp9 = zext i32 %pos_l to i64
  %tmp10 = or i64 %tmp8, %tmp9
  store i64 %tmp10, i64* %pos.i, align 8
  %tmp11 = icmp slt i64 %tmp10, 0
  br i1 %tmp11, label %SYSC_preadv.exit, label %bb12

bb12:                                             ; preds = %bb
  %tmp13 = call i32 @__fdget(i32 inreg %fd) #6
  %tmp14 = and i32 %tmp13, -4
  %tmp15 = inttoptr i32 %tmp14 to %struct.file*
  %tmp16 = icmp eq i32 %tmp14, 0
  br i1 %tmp16, label %fdput.exit.thread.i, label %bb17

bb17:                                             ; preds = %bb12
  %tmp18 = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 7
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = and i32 %tmp19, 8
  %tmp21 = icmp eq i32 %tmp20, 0
  br i1 %tmp21, label %vfs_readv.exit.i, label %bb22

bb22:                                             ; preds = %bb17
  %tmp23 = and i32 %tmp19, 1
  %tmp24 = icmp eq i32 %tmp23, 0
  br i1 %tmp24, label %vfs_readv.exit.i, label %bb25

bb25:                                             ; preds = %bb22
  %tmp26 = and i32 %tmp19, 131072
  %tmp27 = icmp eq i32 %tmp26, 0
  br i1 %tmp27, label %vfs_readv.exit.i, label %bb28

bb28:                                             ; preds = %bb25
  %0 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #4
  %tmp.i = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp.i) #4
  %tmp1.i = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i32 0, i32 0
  store %struct.iovec* %tmp1.i, %struct.iovec** %iov.i, align 4
  %tmp.i.i = icmp eq i32 %vlen, 0
  br i1 %tmp.i.i, label %rw_copy_check_uvector.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb28
  %tmp2.i.i = icmp ugt i32 %vlen, 1024
  br i1 %tmp2.i.i, label %rw_copy_check_uvector.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %tmp4.i.i = icmp ugt i32 %vlen, 8
  %tmp5.i.i = shl i32 %vlen, 3
  br i1 %tmp4.i.i, label %bb6.i.i, label %._crit_edge.i.i

bb6.i.i:                                          ; preds = %bb3.i.i
  %tmp7.i.i = call i8* @__kmalloc(i32 inreg %tmp5.i.i, i32 inreg 208) #6
  %tmp8.i.i = bitcast i8* %tmp7.i.i to %struct.iovec*
  %tmp9.i.i = icmp eq i8* %tmp7.i.i, null
  br i1 %tmp9.i.i, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %bb6.i.i, %bb3.i.i
  %iov.0.i.i = phi %struct.iovec* [ %tmp8.i.i, %bb6.i.i ], [ %tmp1.i, %bb3.i.i ]
  %tmp10.i.i = bitcast %struct.iovec* %iov.0.i.i to i8*
  %tmp11.i.i = call i32 @llvm.objectsize.i32.p0i8(i8* %tmp10.i.i, i1 false) #4
  %tmp12.i.i = icmp slt i32 %tmp11.i.i, 0
  %tmp13.i.i = icmp uge i32 %tmp11.i.i, %tmp5.i.i
  %..i.i.i = or i1 %tmp12.i.i, %tmp13.i.i
  br i1 %..i.i.i, label %bb14.i.i, label %copy_from_user.exit.i.i, !prof !6

bb14.i.i:                                         ; preds = %._crit_edge.i.i
  %tmp15.i.i = bitcast %struct.iovec* %tmp5 to i8*
  %tmp16.i.i = call i32 @_copy_from_user(i8* inreg %tmp10.i.i, i8* inreg %tmp15.i.i, i32 inreg %tmp5.i.i) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %bb14.i.i, %._crit_edge.i.i
  %.0.i.i.i = phi i32 [ %tmp16.i.i, %bb14.i.i ], [ %tmp5.i.i, %._crit_edge.i.i ]
  %tmp17.i.i = icmp eq i32 %.0.i.i.i, 0
  br i1 %tmp17.i.i, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %.lr.ph.split.us.i.i

.lr.ph.split.us.i.i:                              ; preds = %bb38.i.i, %.lr.ph.i.i
  %seg.04.us.i.i = phi i32 [ %tmp40.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %ret.03.us.i.i = phi i32 [ %tmp39.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %tmp19.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 1
  %tmp20.i.i = load i32* %tmp19.i.i, align 4
  %tmp21.i.i = icmp slt i32 %tmp20.i.i, 0
  br i1 %tmp21.i.i, label %rw_copy_check_uvector.exit.i, label %bb22.i.i

bb22.i.i:                                         ; preds = %.lr.ph.split.us.i.i
  %tmp23.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 0
  %tmp24.i.i = load i8** %tmp23.i.i, align 4
  %tmp25.i.i = ptrtoint i8* %tmp24.i.i to i32
  %tmp26.i.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp27.i.i = add i32 %tmp26.i.i, -8172
  %tmp28.i.i = inttoptr i32 %tmp27.i.i to %struct.thread_info*
  %tmp29.i.i = getelementptr inbounds %struct.thread_info* %tmp28.i.i, i32 0, i32 6, i32 0
  %tmp30.i.i = load i32* %tmp29.i.i, align 4
  %uadd.i.us.i.i = add i32 %tmp25.i.i, %tmp20.i.i
  %tmp31.i.i = add i1 0, 0
  %tmp32.i.i = add i32 %uadd.i.us.i.i, 0
  %tmp33.i.i = icmp ugt i32 %tmp32.i.i, %tmp30.i.i
  %or.cond.us.i.i = or i1 %tmp31.i.i, %tmp33.i.i
  br i1 %or.cond.us.i.i, label %rw_copy_check_uvector.exit.i, label %bb34.i.i

bb34.i.i:                                         ; preds = %bb22.i.i
  %tmp35.i.i = sub i32 2147479552, %ret.03.us.i.i
  %tmp36.i.i = icmp ugt i32 %tmp20.i.i, %tmp35.i.i
  br i1 %tmp36.i.i, label %bb37.i.i, label %bb38.i.i

bb37.i.i:                                         ; preds = %bb34.i.i
  store i32 %tmp35.i.i, i32* %tmp19.i.i, align 4
  br label %bb38.i.i

bb38.i.i:                                         ; preds = %bb37.i.i, %bb34.i.i
  %len.0.us.i.i = phi i32 [ %tmp35.i.i, %bb37.i.i ], [ %tmp20.i.i, %bb34.i.i ]
  %tmp39.i.i = add i32 %len.0.us.i.i, %ret.03.us.i.i
  %tmp40.i.i = add i32 %seg.04.us.i.i, 1
  %tmp41.i.i = icmp ult i32 %tmp40.i.i, %vlen
  br i1 %tmp41.i.i, label %.lr.ph.split.us.i.i, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %bb38.i.i, %bb22.i.i, %.lr.ph.split.us.i.i, %copy_from_user.exit.i.i, %bb6.i.i, %bb1.i.i, %bb28
  %iov.1.i.i = phi %struct.iovec* [ %tmp1.i, %bb28 ], [ %tmp1.i, %bb1.i.i ], [ %tmp8.i.i, %bb6.i.i ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %.lr.ph.split.us.i.i ], [ %iov.0.i.i, %bb22.i.i ], [ %iov.0.i.i, %bb38.i.i ]
  %ret.1.i.i = phi i32 [ 0, %bb28 ], [ -22, %bb1.i.i ], [ -12, %bb6.i.i ], [ -14, %copy_from_user.exit.i.i ], [ %tmp39.i.i, %bb38.i.i ], [ -14, %bb22.i.i ], [ -22, %.lr.ph.split.us.i.i ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 4
  %tmp3.i = icmp slt i32 %ret.1.i.i, 1
  br i1 %tmp3.i, label %file_end_write.exit.i, label %bb4.i

bb4.i:                                            ; preds = %rw_copy_check_uvector.exit.i
  %tmp5.i = load i64* %pos.i, align 4
  %tmp6.i = icmp slt i64 %tmp5.i, 0
  br i1 %tmp6.i, label %bb7.i, label %bb16.i, !prof !4

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 7
  %tmp9.i = load i32* %tmp8.i, align 4
  %tmp10.i = and i32 %tmp9.i, 8192
  %tmp11.i = icmp eq i32 %tmp10.i, 0
  br i1 %tmp11.i, label %file_end_write.exit.i, label %bb12.i

bb12.i:                                           ; preds = %bb7.i
  %tmp13.i = zext i32 %ret.1.i.i to i64
  %tmp14.i = sub i64 0, %tmp5.i
  %tmp15.i = icmp slt i64 %tmp13.i, %tmp14.i
  br i1 %tmp15.i, label %select.unfold.i, label %file_end_write.exit.i

bb16.i:                                           ; preds = %bb4.i
  %tmp17.i = zext i32 %ret.1.i.i to i64
  %tmp18.i = add i64 %tmp5.i, %tmp17.i
  %tmp19.i = icmp slt i64 %tmp18.i, 0
  br i1 %tmp19.i, label %bb20.i, label %select.unfold.i, !prof !4

bb20.i:                                           ; preds = %bb16.i
  %tmp21.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 7
  %tmp22.i = load i32* %tmp21.i, align 4
  %tmp23.i = and i32 %tmp22.i, 8192
  %tmp24.i = icmp eq i32 %tmp23.i, 0
  br i1 %tmp24.i, label %file_end_write.exit.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb20.i, %bb16.i, %bb12.i
  %tmp26.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 3
  %tmp27.i = load %struct.file_operations** %tmp26.i, align 4
  %tmp29.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 2
  %tmp30.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp29.i, align 4
  %tmp31.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 4
  %tmp32.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp31.i, align 4
  %tmp33.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 6
  %tmp34.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp33.i, align 4
  %tmp52.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp34.i, null
  br i1 %tmp52.i, label %bb72.i, label %bb53.i

bb53.i:                                           ; preds = %select.unfold.i
  %tmp54.i = load %struct.iovec** %iov.i, align 4
  %tmp55.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp55.i) #4
  %tmp56.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp56.i) #4
  %tmp57.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp57.i) #4
  %tmp58.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp58.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp57.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp58.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp59.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp60.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp15, %struct.file** %tmp60.i, align 4
  %tmp61.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp62.i = bitcast %struct.kioctx** %tmp61.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp62.i, i8* %tmp57.i, i32 12, i32 4, i1 false) #4
  %tmp63.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp59.i to i8*
  store i8* %.c.i.i.i, i8** %tmp63.i, align 4
  %tmp64.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp65.i = bitcast i64* %tmp64.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp65.i, i8* %tmp58.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp57.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp58.i) #4
  %tmp66.i = load i64* %pos.i, align 4
  %tmp67.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp66.i, i64* %tmp67.i, align 4
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp68.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 0, %struct.iovec* inreg %tmp54.i, i32 %vlen, i32 %ret.1.i.i) #6
  %tmp69.i = call i32 %tmp34.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp70.i = icmp eq i32 %tmp69.i, -529
  %..i.i = select i1 %tmp70.i, i32 0, i32 %tmp69.i
  %tmp71.i = load i64* %tmp67.i, align 4
  store i64 %tmp71.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp56.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp55.i) #4
  br label %do_loop_readv_writev.exit.i

bb72.i:                                           ; preds = %select.unfold.i
  %tmp73.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp32.i, null
  %tmp74.i = load %struct.iovec** %iov.i, align 4
  br i1 %tmp73.i, label %bb92.i, label %bb75.i

bb75.i:                                           ; preds = %bb72.i
  %tmp76.i = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp76.i) #4
  %tmp77.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp77.i) #4
  %tmp78.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp78.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp77.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp78.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp79.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp80.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 0
  store %struct.file* %tmp15, %struct.file** %tmp80.i, align 4
  %tmp81.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 1
  %tmp82.i = bitcast %struct.kioctx** %tmp81.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp82.i, i8* %tmp77.i, i32 12, i32 4, i1 false) #4
  %tmp83.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %tmp79.i to i8*
  store i8* %.c.i.i4.i, i8** %tmp83.i, align 4
  %tmp84.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 5
  %tmp85.i = bitcast i64* %tmp84.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp85.i, i8* %tmp78.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp77.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp78.i) #4
  %tmp86.i = load i64* %pos.i, align 4
  %tmp87.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 6
  store i64 %tmp86.i, i64* %tmp87.i, align 4
  %tmp88.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp88.i, align 4
  %tmp89.i = call i32 %tmp32.i(%struct.kiocb* inreg %kiocb.i3.i, %struct.iovec* inreg %tmp74.i, i32 inreg %vlen, i64 %tmp86.i) #6
  %tmp90.i = icmp eq i32 %tmp89.i, -529
  %..i5.i = select i1 %tmp90.i, i32 0, i32 %tmp89.i
  %tmp91.i = load i64* %tmp87.i, align 4
  store i64 %tmp91.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp76.i) #4
  br label %do_loop_readv_writev.exit.i

bb92.i:                                           ; preds = %bb72.i
  %.old1.i.i = icmp eq i32 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb102.i, %bb92.i
  %ret.0.i.i = phi i32 [ %tmp104.i, %bb102.i ], [ 0, %bb92.i ]
  %vector.0.i.i = phi %struct.iovec* [ %tmp103.i, %bb102.i ], [ %tmp74.i, %bb92.i ]
  %.0.i6.i = phi i32 [ %tmp97.i, %bb102.i ], [ %vlen, %bb92.i ]
  %tmp93.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 0
  %tmp94.i = load i8** %tmp93.i, align 4
  %tmp95.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 1
  %tmp96.i = load i32* %tmp95.i, align 4
  %tmp97.i = add i32 %.0.i6.i, -1
  %tmp98.i = call i32 %tmp30.i(%struct.file* inreg %tmp15, i8* inreg %tmp94.i, i32 inreg %tmp96.i, i64* %pos.i) #6
  %tmp99.i = icmp slt i32 %tmp98.i, 0
  br i1 %tmp99.i, label %bb100.i, label %bb102.i

bb100.i:                                          ; preds = %.preheader.i.i
  %tmp101.i = icmp eq i32 %ret.0.i.i, 0
  %.ret.0.i.i = select i1 %tmp101.i, i32 %tmp98.i, i32 %ret.0.i.i
  br label %do_loop_readv_writev.exit.i

bb102.i:                                          ; preds = %.preheader.i.i
  %tmp103.i = getelementptr %struct.iovec* %vector.0.i.i, i32 1
  %tmp104.i = add i32 %tmp98.i, %ret.0.i.i
  %tmp105.i = icmp eq i32 %tmp98.i, %tmp96.i
  %tmp106.i = icmp ne i32 %tmp97.i, 0
  %or.cond.i.i = and i1 %tmp105.i, %tmp106.i
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %bb102.i, %bb100.i, %bb92.i, %bb75.i, %bb53.i
  %ret.0.i1 = phi i32 [ %..i.i, %bb53.i ], [ %..i5.i, %bb75.i ], [ %.ret.0.i.i, %bb100.i ], [ 0, %bb92.i ], [ %tmp104.i, %bb102.i ]
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %do_loop_readv_writev.exit.i, %bb20.i, %bb12.i, %bb7.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i32 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %ret.0.i1, %do_loop_readv_writev.exit.i ], [ -22, %bb7.i ], [ -75, %bb12.i ], [ -22, %bb20.i ]
  %tmp117.i = load %struct.iovec** %iov.i, align 4
  %tmp118.i = icmp eq %struct.iovec* %tmp117.i, %tmp1.i
  br i1 %tmp118.i, label %do_readv_writev.exit, label %bb119.i

bb119.i:                                          ; preds = %file_end_write.exit.i
  %tmp120.i = bitcast %struct.iovec* %tmp117.i to i8*
  call void @kfree(i8* inreg %tmp120.i) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %bb119.i, %file_end_write.exit.i
  call void @llvm.lifetime.end(i64 64, i8* %tmp.i) #4
  %1 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 4, i8* %1) #4
  br label %vfs_readv.exit.i

vfs_readv.exit.i:                                 ; preds = %do_readv_writev.exit, %bb25, %bb22, %bb17
  %ret.0.i = phi i32 [ -29, %bb17 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %bb22 ], [ -22, %bb25 ]
  %tmp30 = and i32 %tmp13, 1
  %tmp31 = icmp eq i32 %tmp30, 0
  br i1 %tmp31, label %fdput.exit.i, label %bb32

bb32:                                             ; preds = %vfs_readv.exit.i
  call void @fput(%struct.file* inreg %tmp15) #6
  br label %fdput.exit.i

fdput.exit.i:                                     ; preds = %bb32, %vfs_readv.exit.i
  %tmp33 = icmp sgt i32 %ret.0.i, 0
  br i1 %tmp33, label %bb34, label %fdput.exit.thread.i

bb34:                                             ; preds = %fdput.exit.i
  %tmp35 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %fdput.exit.thread.i

fdput.exit.thread.i:                              ; preds = %bb34, %fdput.exit.i, %bb12
  %ret.11.i = phi i32 [ %ret.0.i, %bb34 ], [ %ret.0.i, %fdput.exit.i ], [ -9, %bb12 ]
  %tmp36 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %SYSC_preadv.exit

SYSC_preadv.exit:                                 ; preds = %fdput.exit.thread.i, %bb
  %.0.i = phi i32 [ %ret.11.i, %fdput.exit.thread.i ], [ -22, %bb ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp6) #4
  %tmp37 = sub i32 37, 37
  ret i32 %tmp37
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_pwritev(i32 %fd, i32 %vec, i32 %vlen, i32 %pos_l, i32 %pos_h) #0 {
bb:
  %.sroa.3.i.i1.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i2.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i3.i = alloca %struct.kiocb, align 4
  %.sroa.3.i.i.i = alloca { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }, align 8
  %.sroa.4.i.i.i = alloca { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }, align 8
  %kiocb.i.i = alloca %struct.kiocb, align 4
  %iter.i.i = alloca %struct.iov_iter, align 4
  %iovstack.i = alloca [8 x %struct.iovec], align 4
  %iov.i = alloca %struct.iovec*, align 4
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  store i32 %fd, i32* %tmp, align 4
  store i32 %vec, i32* %tmp1, align 4
  store i32 %vlen, i32* %tmp2, align 4
  store i32 %pos_l, i32* %tmp3, align 4
  store i32 %pos_h, i32* %tmp4, align 4
  %tmp5 = inttoptr i32 %vec to %struct.iovec*
  %tmp6 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp6) #4
  %tmp7 = zext i32 %pos_h to i64
  %tmp8 = shl nuw i64 %tmp7, 32
  %tmp9 = zext i32 %pos_l to i64
  %tmp10 = or i64 %tmp8, %tmp9
  store i64 %tmp10, i64* %pos.i, align 8
  %tmp11 = icmp slt i64 %tmp10, 0
  br i1 %tmp11, label %SYSC_pwritev.exit, label %bb12

bb12:                                             ; preds = %bb
  %tmp13 = call i32 @__fdget(i32 inreg %fd) #6
  %tmp14 = and i32 %tmp13, -4
  %tmp15 = inttoptr i32 %tmp14 to %struct.file*
  %tmp16 = icmp eq i32 %tmp14, 0
  br i1 %tmp16, label %fdput.exit.thread.i, label %bb17

bb17:                                             ; preds = %bb12
  %tmp18 = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 7
  %tmp19 = load i32* %tmp18, align 4
  %tmp20 = and i32 %tmp19, 16
  %tmp21 = icmp eq i32 %tmp20, 0
  br i1 %tmp21, label %vfs_writev.exit.i, label %bb22

bb22:                                             ; preds = %bb17
  %tmp23 = and i32 %tmp19, 2
  %tmp24 = icmp eq i32 %tmp23, 0
  br i1 %tmp24, label %vfs_writev.exit.i, label %bb25

bb25:                                             ; preds = %bb22
  %tmp26 = and i32 %tmp19, 262144
  %tmp27 = icmp eq i32 %tmp26, 0
  br i1 %tmp27, label %vfs_writev.exit.i, label %bb28

bb28:                                             ; preds = %bb25
  %0 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #4
  %tmp.i = bitcast [8 x %struct.iovec]* %iovstack.i to i8*
  call void @llvm.lifetime.start(i64 64, i8* %tmp.i) #4
  %tmp1.i = getelementptr inbounds [8 x %struct.iovec]* %iovstack.i, i32 0, i32 0
  store %struct.iovec* %tmp1.i, %struct.iovec** %iov.i, align 4
  %tmp.i.i = icmp eq i32 %vlen, 0
  br i1 %tmp.i.i, label %rw_copy_check_uvector.exit.i, label %bb1.i.i

bb1.i.i:                                          ; preds = %bb28
  %tmp2.i.i = icmp ugt i32 %vlen, 1024
  br i1 %tmp2.i.i, label %rw_copy_check_uvector.exit.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %tmp4.i.i = icmp ugt i32 %vlen, 8
  %tmp5.i.i = shl i32 %vlen, 3
  br i1 %tmp4.i.i, label %bb6.i.i, label %._crit_edge.i.i

bb6.i.i:                                          ; preds = %bb3.i.i
  %tmp7.i.i = call i8* @__kmalloc(i32 inreg %tmp5.i.i, i32 inreg 208) #6
  %tmp8.i.i = bitcast i8* %tmp7.i.i to %struct.iovec*
  %tmp9.i.i = icmp eq i8* %tmp7.i.i, null
  br i1 %tmp9.i.i, label %rw_copy_check_uvector.exit.i, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %bb6.i.i, %bb3.i.i
  %iov.0.i.i = phi %struct.iovec* [ %tmp8.i.i, %bb6.i.i ], [ %tmp1.i, %bb3.i.i ]
  %tmp10.i.i = bitcast %struct.iovec* %iov.0.i.i to i8*
  %tmp11.i.i = call i32 @llvm.objectsize.i32.p0i8(i8* %tmp10.i.i, i1 false) #4
  %tmp12.i.i = icmp slt i32 %tmp11.i.i, 0
  %tmp13.i.i = icmp uge i32 %tmp11.i.i, %tmp5.i.i
  %..i.i.i = or i1 %tmp12.i.i, %tmp13.i.i
  br i1 %..i.i.i, label %bb14.i.i, label %copy_from_user.exit.i.i, !prof !6

bb14.i.i:                                         ; preds = %._crit_edge.i.i
  %tmp15.i.i = bitcast %struct.iovec* %tmp5 to i8*
  %tmp16.i.i = call i32 @_copy_from_user(i8* inreg %tmp10.i.i, i8* inreg %tmp15.i.i, i32 inreg %tmp5.i.i) #6
  br label %copy_from_user.exit.i.i

copy_from_user.exit.i.i:                          ; preds = %bb14.i.i, %._crit_edge.i.i
  %.0.i.i.i = phi i32 [ %tmp16.i.i, %bb14.i.i ], [ %tmp5.i.i, %._crit_edge.i.i ]
  %tmp17.i.i = icmp eq i32 %.0.i.i.i, 0
  br i1 %tmp17.i.i, label %.lr.ph.i.i, label %rw_copy_check_uvector.exit.i

.lr.ph.i.i:                                       ; preds = %copy_from_user.exit.i.i
  br label %.lr.ph.split.us.i.i

.lr.ph.split.us.i.i:                              ; preds = %bb38.i.i, %.lr.ph.i.i
  %seg.04.us.i.i = phi i32 [ %tmp40.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %ret.03.us.i.i = phi i32 [ %tmp39.i.i, %bb38.i.i ], [ 0, %.lr.ph.i.i ]
  %tmp19.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 1
  %tmp20.i.i = load i32* %tmp19.i.i, align 4
  %tmp21.i.i = icmp slt i32 %tmp20.i.i, 0
  br i1 %tmp21.i.i, label %rw_copy_check_uvector.exit.i, label %bb22.i.i

bb22.i.i:                                         ; preds = %.lr.ph.split.us.i.i
  %tmp23.i.i = getelementptr inbounds %struct.iovec* %iov.0.i.i, i32 %seg.04.us.i.i, i32 0
  %tmp24.i.i = load i8** %tmp23.i.i, align 4
  %tmp25.i.i = ptrtoint i8* %tmp24.i.i to i32
  %tmp26.i.i = call i32 asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(i32* @kernel_stack) #4, !srcloc !5
  %tmp27.i.i = add i32 %tmp26.i.i, -8172
  %tmp28.i.i = inttoptr i32 %tmp27.i.i to %struct.thread_info*
  %tmp29.i.i = getelementptr inbounds %struct.thread_info* %tmp28.i.i, i32 0, i32 6, i32 0
  %tmp30.i.i = load i32* %tmp29.i.i, align 4
  %uadd.i.us.i.i = add i32 %tmp25.i.i, %tmp20.i.i
  %tmp31.i.i = add i1 0, 0
  %tmp32.i.i = add i32 %uadd.i.us.i.i, 0
  %tmp33.i.i = icmp ugt i32 %tmp32.i.i, %tmp30.i.i
  %or.cond.us.i.i = or i1 %tmp31.i.i, %tmp33.i.i
  br i1 %or.cond.us.i.i, label %rw_copy_check_uvector.exit.i, label %bb34.i.i

bb34.i.i:                                         ; preds = %bb22.i.i
  %tmp35.i.i = sub i32 2147479552, %ret.03.us.i.i
  %tmp36.i.i = icmp ugt i32 %tmp20.i.i, %tmp35.i.i
  br i1 %tmp36.i.i, label %bb37.i.i, label %bb38.i.i

bb37.i.i:                                         ; preds = %bb34.i.i
  store i32 %tmp35.i.i, i32* %tmp19.i.i, align 4
  br label %bb38.i.i

bb38.i.i:                                         ; preds = %bb37.i.i, %bb34.i.i
  %len.0.us.i.i = phi i32 [ %tmp35.i.i, %bb37.i.i ], [ %tmp20.i.i, %bb34.i.i ]
  %tmp39.i.i = add i32 %len.0.us.i.i, %ret.03.us.i.i
  %tmp40.i.i = add i32 %seg.04.us.i.i, 1
  %tmp41.i.i = icmp ult i32 %tmp40.i.i, %vlen
  br i1 %tmp41.i.i, label %.lr.ph.split.us.i.i, label %rw_copy_check_uvector.exit.i

rw_copy_check_uvector.exit.i:                     ; preds = %bb38.i.i, %bb22.i.i, %.lr.ph.split.us.i.i, %copy_from_user.exit.i.i, %bb6.i.i, %bb1.i.i, %bb28
  %iov.1.i.i = phi %struct.iovec* [ %tmp1.i, %bb28 ], [ %tmp1.i, %bb1.i.i ], [ %tmp8.i.i, %bb6.i.i ], [ %iov.0.i.i, %copy_from_user.exit.i.i ], [ %iov.0.i.i, %.lr.ph.split.us.i.i ], [ %iov.0.i.i, %bb22.i.i ], [ %iov.0.i.i, %bb38.i.i ]
  %ret.1.i.i = phi i32 [ 0, %bb28 ], [ -22, %bb1.i.i ], [ -12, %bb6.i.i ], [ -14, %copy_from_user.exit.i.i ], [ %tmp39.i.i, %bb38.i.i ], [ -14, %bb22.i.i ], [ -22, %.lr.ph.split.us.i.i ]
  store %struct.iovec* %iov.1.i.i, %struct.iovec** %iov.i, align 4
  %tmp3.i = icmp slt i32 %ret.1.i.i, 1
  br i1 %tmp3.i, label %file_end_write.exit.i, label %bb4.i

bb4.i:                                            ; preds = %rw_copy_check_uvector.exit.i
  %tmp5.i = load i64* %pos.i, align 4
  %tmp6.i = icmp slt i64 %tmp5.i, 0
  br i1 %tmp6.i, label %bb7.i, label %bb16.i, !prof !4

bb7.i:                                            ; preds = %bb4.i
  %tmp8.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 7
  %tmp9.i = load i32* %tmp8.i, align 4
  %tmp10.i = and i32 %tmp9.i, 8192
  %tmp11.i = icmp eq i32 %tmp10.i, 0
  br i1 %tmp11.i, label %file_end_write.exit.i, label %bb12.i

bb12.i:                                           ; preds = %bb7.i
  %tmp13.i = zext i32 %ret.1.i.i to i64
  %tmp14.i = sub i64 0, %tmp5.i
  %tmp15.i = icmp slt i64 %tmp13.i, %tmp14.i
  br i1 %tmp15.i, label %select.unfold.i, label %file_end_write.exit.i

bb16.i:                                           ; preds = %bb4.i
  %tmp17.i = zext i32 %ret.1.i.i to i64
  %tmp18.i = add i64 %tmp5.i, %tmp17.i
  %tmp19.i = icmp slt i64 %tmp18.i, 0
  br i1 %tmp19.i, label %bb20.i, label %select.unfold.i, !prof !4

bb20.i:                                           ; preds = %bb16.i
  %tmp21.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 7
  %tmp22.i = load i32* %tmp21.i, align 4
  %tmp23.i = and i32 %tmp22.i, 8192
  %tmp24.i = icmp eq i32 %tmp23.i, 0
  br i1 %tmp24.i, label %file_end_write.exit.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb20.i, %bb16.i, %bb12.i
  %tmp26.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 3
  %tmp27.i = load %struct.file_operations** %tmp26.i, align 4
  %tmp36.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 3
  %tmp37.i = load i32 (%struct.file*, i8*, i32, i64*)** %tmp36.i, align 4
  %tmp38.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 5
  %tmp39.i = load i32 (%struct.kiocb*, %struct.iovec*, i32, i64)** %tmp38.i, align 4
  %tmp40.i = getelementptr inbounds %struct.file_operations* %tmp27.i, i32 0, i32 7
  %tmp41.i = load i32 (%struct.kiocb*, %struct.iov_iter*)** %tmp40.i, align 4
  %tmp42.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 2
  %tmp43.i = load %struct.inode** %tmp42.i, align 4
  %tmp44.i = getelementptr inbounds %struct.inode* %tmp43.i, i32 0, i32 0
  %tmp45.i = load i16* %tmp44.i, align 2
  %tmp46.i = and i16 %tmp45.i, -4096
  %tmp47.i = icmp eq i16 %tmp46.i, -32768
  br i1 %tmp47.i, label %bb48.i, label %file_start_write.exit.i

bb48.i:                                           ; preds = %select.unfold.i
  %tmp49.i = getelementptr inbounds %struct.inode* %tmp43.i, i32 0, i32 6
  %tmp50.i = load %struct.super_block** %tmp49.i, align 4
  %tmp51.i = call i32 @__sb_start_write(%struct.super_block* inreg %tmp50.i, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %bb48.i, %select.unfold.i
  %tmp52.i = icmp eq i32 (%struct.kiocb*, %struct.iov_iter*)* %tmp41.i, null
  br i1 %tmp52.i, label %bb72.i, label %bb53.i

bb53.i:                                           ; preds = %file_start_write.exit.i
  %tmp54.i = load %struct.iovec** %iov.i, align 4
  %tmp55.i = bitcast %struct.iov_iter* %iter.i.i to i8*
  call void @llvm.lifetime.start(i64 20, i8* %tmp55.i) #4
  %tmp56.i = bitcast %struct.kiocb* %kiocb.i.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp56.i) #4
  %tmp57.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp57.i) #4
  %tmp58.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp58.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp57.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp58.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp59.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp60.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 0
  store %struct.file* %tmp15, %struct.file** %tmp60.i, align 4
  %tmp61.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 1
  %tmp62.i = bitcast %struct.kioctx** %tmp61.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp62.i, i8* %tmp57.i, i32 12, i32 4, i1 false) #4
  %tmp63.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 4, i32 0
  %.c.i.i.i = bitcast %struct.task_struct* %tmp59.i to i8*
  store i8* %.c.i.i.i, i8** %tmp63.i, align 4
  %tmp64.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 5
  %tmp65.i = bitcast i64* %tmp64.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp65.i, i8* %tmp58.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp57.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp58.i) #4
  %tmp66.i = load i64* %pos.i, align 4
  %tmp67.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 6
  store i64 %tmp66.i, i64* %tmp67.i, align 4
  %tmp68.i = getelementptr inbounds %struct.kiocb* %kiocb.i.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp68.i, align 4
  call void @iov_iter_init(%struct.iov_iter* inreg %iter.i.i, i32 inreg 1, %struct.iovec* inreg %tmp54.i, i32 %vlen, i32 %ret.1.i.i) #6
  %tmp69.i = call i32 %tmp41.i(%struct.kiocb* inreg %kiocb.i.i, %struct.iov_iter* inreg %iter.i.i) #6
  %tmp70.i = icmp eq i32 %tmp69.i, -529
  %..i.i = select i1 %tmp70.i, i32 0, i32 %tmp69.i
  %tmp71.i = load i64* %tmp67.i, align 4
  store i64 %tmp71.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp56.i) #4
  call void @llvm.lifetime.end(i64 20, i8* %tmp55.i) #4
  br label %do_loop_readv_writev.exit.i

bb72.i:                                           ; preds = %file_start_write.exit.i
  %tmp73.i = icmp eq i32 (%struct.kiocb*, %struct.iovec*, i32, i64)* %tmp39.i, null
  %tmp74.i = load %struct.iovec** %iov.i, align 4
  br i1 %tmp73.i, label %bb92.i, label %bb75.i

bb75.i:                                           ; preds = %bb72.i
  %tmp76.i = bitcast %struct.kiocb* %kiocb.i3.i to i8*
  call void @llvm.lifetime.start(i64 52, i8* %tmp76.i) #4
  %tmp77.i = bitcast { %struct.kioctx*, i32 (%struct.kiocb*)*, i8* }* %.sroa.3.i.i1.i to i8*
  call void @llvm.lifetime.start(i64 12, i8* %tmp77.i) #4
  %tmp78.i = bitcast { i64, i64, i32, %struct.list_head, %struct.eventfd_ctx* }* %.sroa.4.i.i2.i to i8*
  call void @llvm.lifetime.start(i64 32, i8* %tmp78.i) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp77.i, i8 0, i64 12, i32 8, i1 false) #4
  call void @llvm.memset.p0i8.i64(i8* %tmp78.i, i8 0, i64 32, i32 8, i1 false) #4
  %tmp79.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp80.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 0
  store %struct.file* %tmp15, %struct.file** %tmp80.i, align 4
  %tmp81.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 1
  %tmp82.i = bitcast %struct.kioctx** %tmp81.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp82.i, i8* %tmp77.i, i32 12, i32 4, i1 false) #4
  %tmp83.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 4, i32 0
  %.c.i.i4.i = bitcast %struct.task_struct* %tmp79.i to i8*
  store i8* %.c.i.i4.i, i8** %tmp83.i, align 4
  %tmp84.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 5
  %tmp85.i = bitcast i64* %tmp84.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %tmp85.i, i8* %tmp78.i, i32 32, i32 4, i1 false) #4
  call void @llvm.lifetime.end(i64 12, i8* %tmp77.i) #4
  call void @llvm.lifetime.end(i64 32, i8* %tmp78.i) #4
  %tmp86.i = load i64* %pos.i, align 4
  %tmp87.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 6
  store i64 %tmp86.i, i64* %tmp87.i, align 4
  %tmp88.i = getelementptr inbounds %struct.kiocb* %kiocb.i3.i, i32 0, i32 7
  store i32 %ret.1.i.i, i32* %tmp88.i, align 4
  %tmp89.i = call i32 %tmp39.i(%struct.kiocb* inreg %kiocb.i3.i, %struct.iovec* inreg %tmp74.i, i32 inreg %vlen, i64 %tmp86.i) #6
  %tmp90.i = icmp eq i32 %tmp89.i, -529
  %..i5.i = select i1 %tmp90.i, i32 0, i32 %tmp89.i
  %tmp91.i = load i64* %tmp87.i, align 4
  store i64 %tmp91.i, i64* %pos.i, align 4
  call void @llvm.lifetime.end(i64 52, i8* %tmp76.i) #4
  br label %do_loop_readv_writev.exit.i

bb92.i:                                           ; preds = %bb72.i
  %.old1.i.i = icmp eq i32 %vlen, 0
  br i1 %.old1.i.i, label %do_loop_readv_writev.exit.i, label %.preheader.i.i

.preheader.i.i:                                   ; preds = %bb102.i, %bb92.i
  %ret.0.i.i = phi i32 [ %tmp104.i, %bb102.i ], [ 0, %bb92.i ]
  %vector.0.i.i = phi %struct.iovec* [ %tmp103.i, %bb102.i ], [ %tmp74.i, %bb92.i ]
  %.0.i6.i = phi i32 [ %tmp97.i, %bb102.i ], [ %vlen, %bb92.i ]
  %tmp93.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 0
  %tmp94.i = load i8** %tmp93.i, align 4
  %tmp95.i = getelementptr inbounds %struct.iovec* %vector.0.i.i, i32 0, i32 1
  %tmp96.i = load i32* %tmp95.i, align 4
  %tmp97.i = add i32 %.0.i6.i, -1
  %tmp98.i = call i32 %tmp37.i(%struct.file* inreg %tmp15, i8* inreg %tmp94.i, i32 inreg %tmp96.i, i64* %pos.i) #6
  %tmp99.i = icmp slt i32 %tmp98.i, 0
  br i1 %tmp99.i, label %bb100.i, label %bb102.i

bb100.i:                                          ; preds = %.preheader.i.i
  %tmp101.i = icmp eq i32 %ret.0.i.i, 0
  %.ret.0.i.i = select i1 %tmp101.i, i32 %tmp98.i, i32 %ret.0.i.i
  br label %do_loop_readv_writev.exit.i

bb102.i:                                          ; preds = %.preheader.i.i
  %tmp103.i = getelementptr %struct.iovec* %vector.0.i.i, i32 1
  %tmp104.i = add i32 %tmp98.i, %ret.0.i.i
  %tmp105.i = icmp eq i32 %tmp98.i, %tmp96.i
  %tmp106.i = icmp ne i32 %tmp97.i, 0
  %or.cond.i.i = and i1 %tmp105.i, %tmp106.i
  br i1 %or.cond.i.i, label %.preheader.i.i, label %do_loop_readv_writev.exit.i

do_loop_readv_writev.exit.i:                      ; preds = %bb102.i, %bb100.i, %bb92.i, %bb75.i, %bb53.i
  %ret.0.i1 = phi i32 [ %..i.i, %bb53.i ], [ %..i5.i, %bb75.i ], [ %.ret.0.i.i, %bb100.i ], [ 0, %bb92.i ], [ %tmp104.i, %bb102.i ]
  %tmp108.i = getelementptr inbounds %struct.file* %tmp15, i32 0, i32 2
  %tmp109.i = load %struct.inode** %tmp108.i, align 4
  %tmp110.i = getelementptr inbounds %struct.inode* %tmp109.i, i32 0, i32 0
  %tmp111.i = load i16* %tmp110.i, align 2
  %tmp112.i = and i16 %tmp111.i, -4096
  %tmp113.i = icmp eq i16 %tmp112.i, -32768
  br i1 %tmp113.i, label %bb114.i, label %file_end_write.exit.i

bb114.i:                                          ; preds = %do_loop_readv_writev.exit.i
  %tmp115.i = getelementptr inbounds %struct.inode* %tmp109.i, i32 0, i32 6
  %tmp116.i = load %struct.super_block** %tmp115.i, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp116.i, i32 inreg 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %bb114.i, %do_loop_readv_writev.exit.i, %bb20.i, %bb12.i, %bb7.i, %rw_copy_check_uvector.exit.i
  %ret.1.i = phi i32 [ %ret.1.i.i, %rw_copy_check_uvector.exit.i ], [ %ret.0.i1, %do_loop_readv_writev.exit.i ], [ %ret.0.i1, %bb114.i ], [ -22, %bb7.i ], [ -75, %bb12.i ], [ -22, %bb20.i ]
  %tmp117.i = load %struct.iovec** %iov.i, align 4
  %tmp118.i = icmp eq %struct.iovec* %tmp117.i, %tmp1.i
  br i1 %tmp118.i, label %do_readv_writev.exit, label %bb119.i

bb119.i:                                          ; preds = %file_end_write.exit.i
  %tmp120.i = bitcast %struct.iovec* %tmp117.i to i8*
  call void @kfree(i8* inreg %tmp120.i) #6
  br label %do_readv_writev.exit

do_readv_writev.exit:                             ; preds = %bb119.i, %file_end_write.exit.i
  call void @llvm.lifetime.end(i64 64, i8* %tmp.i) #4
  %1 = bitcast %struct.iovec** %iov.i to i8*
  call void @llvm.lifetime.end(i64 4, i8* %1) #4
  br label %vfs_writev.exit.i

vfs_writev.exit.i:                                ; preds = %do_readv_writev.exit, %bb25, %bb22, %bb17
  %ret.0.i = phi i32 [ -29, %bb17 ], [ %ret.1.i, %do_readv_writev.exit ], [ -9, %bb22 ], [ -22, %bb25 ]
  %tmp30 = and i32 %tmp13, 1
  %tmp31 = icmp eq i32 %tmp30, 0
  br i1 %tmp31, label %fdput.exit.i, label %bb32

bb32:                                             ; preds = %vfs_writev.exit.i
  call void @fput(%struct.file* inreg %tmp15) #6
  br label %fdput.exit.i

fdput.exit.i:                                     ; preds = %bb32, %vfs_writev.exit.i
  %tmp33 = icmp sgt i32 %ret.0.i, 0
  br i1 %tmp33, label %bb34, label %fdput.exit.thread.i

bb34:                                             ; preds = %fdput.exit.i
  %tmp35 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %fdput.exit.thread.i

fdput.exit.thread.i:                              ; preds = %bb34, %fdput.exit.i, %bb12
  %ret.11.i = phi i32 [ %ret.0.i, %bb34 ], [ %ret.0.i, %fdput.exit.i ], [ -9, %bb12 ]
  %tmp36 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  br label %SYSC_pwritev.exit

SYSC_pwritev.exit:                                ; preds = %fdput.exit.thread.i, %bb
  %.0.i = phi i32 [ %ret.11.i, %fdput.exit.thread.i ], [ -22, %bb ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp6) #4
  %tmp37 = sub i32 37, 37
  ret i32 %tmp37
}

declare i32 @get_user(i32 *, i32) #1

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_sendfile(i32 %out_fd, i32 %in_fd, i32 %offset, i32 %count) #0 {
bb:
  %pos.i4 = alloca i64, align 8
  %out_pos.i5 = alloca i64, align 8
  %pos.i1 = alloca i64, align 8
  %out_pos.i = alloca i64, align 8
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  store i32 %out_fd, i32* %tmp, align 4
  store i32 %in_fd, i32* %tmp1, align 4
  store i32 %offset, i32* %tmp2, align 4
  store i32 %count, i32* %tmp3, align 4
  %tmp4 = inttoptr i32 %offset to i32*
  %tmp5 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp5) #4
  %tmp6 = icmp eq i32 %offset, 0
  br i1 %tmp6, label %bb19, label %bb7

bb7:                                              ; preds = %bb
  %tmp8 = call i32 @get_user(i32* %tmp4, i32 4)
  %tmp9 = add i32 %tmp8, 0
  %tmp10 = icmp eq i32 %tmp9, 0
  br i1 %tmp10, label %bb11, label %SYSC_sendfile.exit, !prof !6

bb11:                                             ; preds = %bb7
  %tmp12 = add i32 0, 0
  %tmp13 = sext i32 %tmp12 to i64
  store i64 %tmp13, i64* %pos.i, align 8
  %0 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #4
  %1 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1) #4
  %tmp.i = call i32 @__fdget(i32 inreg %in_fd) #6
  %tmp1.i = and i32 %tmp.i, -4
  %tmp2.i = inttoptr i32 %tmp1.i to %struct.file*
  %tmp3.i = icmp eq i32 %tmp1.i, 0
  br i1 %tmp3.i, label %do_sendfile.exit, label %bb4.i

bb4.i:                                            ; preds = %bb11
  %tmp5.i = getelementptr inbounds %struct.file* %tmp2.i, i32 0, i32 7
  %tmp6.i = load i32* %tmp5.i, align 4
  %tmp7.i = and i32 %tmp6.i, 1
  %tmp8.i = icmp eq i32 %tmp7.i, 0
  br i1 %tmp8.i, label %fdput.exit3.i, label %bb9.i

bb9.i:                                            ; preds = %bb4.i
  %tmp15.i = load i64* %pos.i, align 4
  store i64 %tmp15.i, i64* %pos.i1, align 8
  %tmp16.i = load i32* %tmp5.i, align 4
  %tmp17.i = and i32 %tmp16.i, 8
  %tmp18.i = icmp eq i32 %tmp17.i, 0
  br i1 %tmp18.i, label %fdput.exit3.i, label %bb19.i

bb19.i:                                           ; preds = %bb9.i
  %tmp21.i = icmp slt i32 %count, 0
  br i1 %tmp21.i, label %fdput.exit3.i, label %bb22.i, !prof !4

bb22.i:                                           ; preds = %bb19.i
  %tmp23.i = icmp slt i64 %tmp15.i, 0
  br i1 %tmp23.i, label %bb24.i, label %bb32.i, !prof !4

bb24.i:                                           ; preds = %bb22.i
  %tmp25.i = load i32* %tmp5.i, align 4
  %tmp26.i = and i32 %tmp25.i, 8192
  %tmp27.i = icmp eq i32 %tmp26.i, 0
  br i1 %tmp27.i, label %fdput.exit3.i, label %bb28.i

bb28.i:                                           ; preds = %bb24.i
  %tmp29.i = zext i32 %count to i64
  %tmp30.i = sub i64 0, %tmp15.i
  %tmp31.i = icmp slt i64 %tmp29.i, %tmp30.i
  br i1 %tmp31.i, label %select.unfold.i, label %fdput.exit3.i

bb32.i:                                           ; preds = %bb22.i
  %tmp33.i = zext i32 %count to i64
  %tmp34.i = add i64 %tmp15.i, %tmp33.i
  %tmp35.i = icmp slt i64 %tmp34.i, 0
  br i1 %tmp35.i, label %bb36.i, label %select.unfold.i, !prof !4

bb36.i:                                           ; preds = %bb32.i
  %tmp37.i = load i32* %tmp5.i, align 4
  %tmp38.i = and i32 %tmp37.i, 8192
  %tmp39.i = icmp eq i32 %tmp38.i, 0
  br i1 %tmp39.i, label %fdput.exit3.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb36.i, %bb32.i, %bb28.i
  %tmp40.i = icmp ugt i32 %count, 2147479552
  %.count.i = select i1 %tmp40.i, i32 2147479552, i32 %count
  %tmp41.i = icmp slt i32 %.count.i, 0
  %tmp42.i = call i32 @__fdget(i32 inreg %out_fd) #6
  %tmp43.i = and i32 %tmp42.i, -4
  %tmp44.i = inttoptr i32 %tmp43.i to %struct.file*
  %tmp45.i = icmp eq i32 %tmp43.i, 0
  br i1 %tmp45.i, label %fdput.exit3.i, label %bb46.i

bb46.i:                                           ; preds = %select.unfold.i
  %tmp47.i = getelementptr inbounds %struct.file* %tmp44.i, i32 0, i32 7
  %tmp48.i = load i32* %tmp47.i, align 4
  %tmp49.i = and i32 %tmp48.i, 2
  %tmp50.i = icmp eq i32 %tmp49.i, 0
  br i1 %tmp50.i, label %rw_verify_area.exit5.thread.i, label %bb51.i

bb51.i:                                           ; preds = %bb46.i
  %tmp52.i = getelementptr inbounds %struct.file* %tmp2.i, i32 0, i32 2
  %tmp53.i = load %struct.inode** %tmp52.i, align 4
  %tmp54.i = getelementptr inbounds %struct.file* %tmp44.i, i32 0, i32 2
  %tmp55.i = load %struct.inode** %tmp54.i, align 4
  %tmp56.i = getelementptr inbounds %struct.file* %tmp44.i, i32 0, i32 9
  %tmp57.i = load i64* %tmp56.i, align 4
  store i64 %tmp57.i, i64* %out_pos.i, align 8
  br i1 %tmp41.i, label %rw_verify_area.exit5.thread.i, label %bb58.i, !prof !4

bb58.i:                                           ; preds = %bb51.i
  %tmp59.i = icmp slt i64 %tmp57.i, 0
  br i1 %tmp59.i, label %bb60.i, label %bb68.i, !prof !4

bb60.i:                                           ; preds = %bb58.i
  %tmp61.i = load i32* %tmp47.i, align 4
  %tmp62.i = and i32 %tmp61.i, 8192
  %tmp63.i = icmp eq i32 %tmp62.i, 0
  br i1 %tmp63.i, label %rw_verify_area.exit5.thread.i, label %bb64.i

bb64.i:                                           ; preds = %bb60.i
  %tmp65.i = zext i32 %.count.i to i64
  %tmp66.i = sub i64 0, %tmp57.i
  %tmp67.i = icmp slt i64 %tmp65.i, %tmp66.i
  br i1 %tmp67.i, label %select.unfold10.i, label %rw_verify_area.exit5.thread.i

bb68.i:                                           ; preds = %bb58.i
  %tmp69.i = zext i32 %.count.i to i64
  %tmp70.i = add i64 %tmp57.i, %tmp69.i
  %tmp71.i = icmp slt i64 %tmp70.i, 0
  br i1 %tmp71.i, label %bb72.i, label %select.unfold10.i, !prof !4

bb72.i:                                           ; preds = %bb68.i
  %tmp73.i = load i32* %tmp47.i, align 4
  %tmp74.i = and i32 %tmp73.i, 8192
  %tmp75.i = icmp eq i32 %tmp74.i, 0
  br i1 %tmp75.i, label %rw_verify_area.exit5.thread.i, label %select.unfold10.i

select.unfold10.i:                                ; preds = %bb72.i, %bb68.i, %bb64.i
  %tmp89.i = zext i32 %.count.i to i64
  %tmp90.i = add i64 %tmp15.i, %tmp89.i
  %tmp91.i = icmp sgt i64 %tmp90.i, 2147483647
  br i1 %tmp91.i, label %bb92.i, label %bb97.i, !prof !4

bb92.i:                                           ; preds = %select.unfold10.i
  %tmp93.i = icmp sgt i64 2147483647, %tmp15.i
  br i1 %tmp93.i, label %bb94.i, label %rw_verify_area.exit5.thread.i

bb94.i:                                           ; preds = %bb92.i
  %tmp95.i = sub i64 2147483647, %tmp15.i
  %tmp96.i = trunc i64 %tmp95.i to i32
  br label %bb97.i

bb97.i:                                           ; preds = %bb94.i, %select.unfold10.i
  %.0.i2 = phi i32 [ %tmp96.i, %bb94.i ], [ %.count.i, %select.unfold10.i ]
  %tmp98.i = load %struct.inode** %tmp54.i, align 4
  %tmp99.i = getelementptr inbounds %struct.inode* %tmp98.i, i32 0, i32 0
  %tmp100.i = load i16* %tmp99.i, align 2
  %tmp101.i = and i16 %tmp100.i, -4096
  %tmp102.i = icmp eq i16 %tmp101.i, -32768
  br i1 %tmp102.i, label %bb103.i, label %file_start_write.exit.i

bb103.i:                                          ; preds = %bb97.i
  %tmp104.i = getelementptr inbounds %struct.inode* %tmp98.i, i32 0, i32 6
  %tmp105.i = load %struct.super_block** %tmp104.i, align 4
  %tmp106.i = call i32 @__sb_start_write(%struct.super_block* inreg %tmp105.i, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %bb103.i, %bb97.i
  %tmp107.i = call i32 @do_splice_direct(%struct.file* inreg %tmp2.i, i64* inreg %pos.i1, %struct.file* inreg %tmp44.i, i64* %out_pos.i, i32 %.0.i2, i32 0) #6
  %tmp108.i = load %struct.inode** %tmp54.i, align 4
  %tmp109.i = getelementptr inbounds %struct.inode* %tmp108.i, i32 0, i32 0
  %tmp110.i = load i16* %tmp109.i, align 2
  %tmp111.i = and i16 %tmp110.i, -4096
  %tmp112.i = icmp eq i16 %tmp111.i, -32768
  br i1 %tmp112.i, label %bb113.i, label %file_end_write.exit.i

bb113.i:                                          ; preds = %file_start_write.exit.i
  %tmp114.i = getelementptr inbounds %struct.inode* %tmp108.i, i32 0, i32 6
  %tmp115.i = load %struct.super_block** %tmp114.i, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp115.i, i32 inreg 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %bb113.i, %file_start_write.exit.i
  %tmp116.i = icmp sgt i32 %tmp107.i, 0
  br i1 %tmp116.i, label %bb117.i, label %bb125.i

bb117.i:                                          ; preds = %file_end_write.exit.i
  %tmp118.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp119.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp120.i = load i64* %out_pos.i, align 8
  store i64 %tmp120.i, i64* %tmp56.i, align 4
  %tmp121.i = load i64* %pos.i1, align 8
  store i64 %tmp121.i, i64* %pos.i, align 4
  br label %bb125.i

bb125.i:                                          ; preds = %bb117.i, %file_end_write.exit.i
  %tmp126.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp127.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp128.i = load i64* %pos.i1, align 8
  %tmp129.i = icmp sgt i64 %tmp128.i, 2147483647
  %..i3 = select i1 %tmp129.i, i32 -75, i32 %tmp107.i
  br label %rw_verify_area.exit5.thread.i

rw_verify_area.exit5.thread.i:                    ; preds = %bb125.i, %bb92.i, %bb72.i, %bb64.i, %bb60.i, %bb51.i, %bb46.i
  %retval.0.i = phi i32 [ -75, %bb92.i ], [ -9, %bb46.i ], [ %..i3, %bb125.i ], [ -22, %bb51.i ], [ -22, %bb60.i ], [ -75, %bb64.i ], [ -22, %bb72.i ]
  %tmp130.i = and i32 %tmp42.i, 1
  %tmp131.i = icmp eq i32 %tmp130.i, 0
  br i1 %tmp131.i, label %fdput.exit3.i, label %bb132.i

bb132.i:                                          ; preds = %rw_verify_area.exit5.thread.i
  call void @fput(%struct.file* inreg %tmp44.i) #6
  br label %fdput.exit3.i

fdput.exit3.i:                                    ; preds = %bb132.i, %rw_verify_area.exit5.thread.i, %select.unfold.i, %bb36.i, %bb28.i, %bb24.i, %bb19.i, %bb9.i, %bb4.i
  %retval.1.i = phi i32 [ -9, %select.unfold.i ], [ -29, %bb9.i ], [ -9, %bb4.i ], [ %retval.0.i, %rw_verify_area.exit5.thread.i ], [ %retval.0.i, %bb132.i ], [ -22, %bb19.i ], [ -22, %bb24.i ], [ -75, %bb28.i ], [ -22, %bb36.i ]
  %tmp133.i = and i32 %tmp.i, 1
  %tmp134.i = icmp eq i32 %tmp133.i, 0
  br i1 %tmp134.i, label %do_sendfile.exit, label %bb135.i

bb135.i:                                          ; preds = %fdput.exit3.i
  call void @fput(%struct.file* inreg %tmp2.i) #6
  br label %do_sendfile.exit

do_sendfile.exit:                                 ; preds = %bb135.i, %fdput.exit3.i, %bb11
  %retval.2.i = phi i32 [ -9, %bb11 ], [ %retval.1.i, %fdput.exit3.i ], [ %retval.1.i, %bb135.i ]
  %2 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  %3 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  %tmp15 = load i64* %pos.i, align 8
  %tmp16 = trunc i64 %tmp15 to i32
  %tmp17 = call i32 asm sideeffect "call __put_user_4", "={ax},0,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i32 %tmp16, i32* %tmp4) #4, !srcloc !8
  %tmp18 = icmp eq i32 %tmp17, 0
  %..i = select i1 %tmp18, i32 %retval.2.i, i32 -14
  br label %SYSC_sendfile.exit

bb19:                                             ; preds = %bb
  %4 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %5) #4
  %tmp.i6 = call i32 @__fdget(i32 inreg %in_fd) #6
  %tmp1.i7 = and i32 %tmp.i6, -4
  %tmp2.i8 = inttoptr i32 %tmp1.i7 to %struct.file*
  %tmp3.i9 = icmp eq i32 %tmp1.i7, 0
  br i1 %tmp3.i9, label %do_sendfile.exit128, label %bb4.i14

bb4.i14:                                          ; preds = %bb19
  %tmp5.i10 = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 7
  %tmp6.i11 = load i32* %tmp5.i10, align 4
  %tmp7.i12 = and i32 %tmp6.i11, 1
  %tmp8.i13 = icmp eq i32 %tmp7.i12, 0
  br i1 %tmp8.i13, label %fdput.exit3.i125, label %bb9.i15

bb9.i15:                                          ; preds = %bb4.i14
  %tmp12.i = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 9
  %tmp13.i = load i64* %tmp12.i, align 4
  store i64 %tmp13.i, i64* %pos.i4, align 8
  %tmp21.i16 = icmp slt i32 %count, 0
  br i1 %tmp21.i16, label %fdput.exit3.i125, label %bb22.i19, !prof !4

bb22.i19:                                         ; preds = %bb9.i15
  %tmp23.i18 = icmp slt i64 %tmp13.i, 0
  br i1 %tmp23.i18, label %bb24.i23, label %bb32.i31, !prof !4

bb24.i23:                                         ; preds = %bb22.i19
  %tmp25.i20 = load i32* %tmp5.i10, align 4
  %tmp26.i21 = and i32 %tmp25.i20, 8192
  %tmp27.i22 = icmp eq i32 %tmp26.i21, 0
  br i1 %tmp27.i22, label %fdput.exit3.i125, label %bb28.i27

bb28.i27:                                         ; preds = %bb24.i23
  %tmp29.i24 = zext i32 %count to i64
  %tmp30.i25 = sub i64 0, %tmp13.i
  %tmp31.i26 = icmp slt i64 %tmp29.i24, %tmp30.i25
  br i1 %tmp31.i26, label %select.unfold.i43, label %fdput.exit3.i125

bb32.i31:                                         ; preds = %bb22.i19
  %tmp33.i28 = zext i32 %count to i64
  %tmp34.i29 = add i64 %tmp13.i, %tmp33.i28
  %tmp35.i30 = icmp slt i64 %tmp34.i29, 0
  br i1 %tmp35.i30, label %bb36.i35, label %select.unfold.i43, !prof !4

bb36.i35:                                         ; preds = %bb32.i31
  %tmp37.i32 = load i32* %tmp5.i10, align 4
  %tmp38.i33 = and i32 %tmp37.i32, 8192
  %tmp39.i34 = icmp eq i32 %tmp38.i33, 0
  br i1 %tmp39.i34, label %fdput.exit3.i125, label %select.unfold.i43

select.unfold.i43:                                ; preds = %bb36.i35, %bb32.i31, %bb28.i27
  %tmp40.i36 = icmp ugt i32 %count, 2147479552
  %.count.i37 = select i1 %tmp40.i36, i32 2147479552, i32 %count
  %tmp41.i38 = icmp slt i32 %.count.i37, 0
  %tmp42.i39 = call i32 @__fdget(i32 inreg %out_fd) #6
  %tmp43.i40 = and i32 %tmp42.i39, -4
  %tmp44.i41 = inttoptr i32 %tmp43.i40 to %struct.file*
  %tmp45.i42 = icmp eq i32 %tmp43.i40, 0
  br i1 %tmp45.i42, label %fdput.exit3.i125, label %bb46.i48

bb46.i48:                                         ; preds = %select.unfold.i43
  %tmp47.i44 = getelementptr inbounds %struct.file* %tmp44.i41, i32 0, i32 7
  %tmp48.i45 = load i32* %tmp47.i44, align 4
  %tmp49.i46 = and i32 %tmp48.i45, 2
  %tmp50.i47 = icmp eq i32 %tmp49.i46, 0
  br i1 %tmp50.i47, label %rw_verify_area.exit5.thread.i120, label %bb51.i55

bb51.i55:                                         ; preds = %bb46.i48
  %tmp52.i49 = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 2
  %tmp53.i50 = load %struct.inode** %tmp52.i49, align 4
  %tmp54.i51 = getelementptr inbounds %struct.file* %tmp44.i41, i32 0, i32 2
  %tmp55.i52 = load %struct.inode** %tmp54.i51, align 4
  %tmp56.i53 = getelementptr inbounds %struct.file* %tmp44.i41, i32 0, i32 9
  %tmp57.i54 = load i64* %tmp56.i53, align 4
  store i64 %tmp57.i54, i64* %out_pos.i5, align 8
  br i1 %tmp41.i38, label %rw_verify_area.exit5.thread.i120, label %bb58.i57, !prof !4

bb58.i57:                                         ; preds = %bb51.i55
  %tmp59.i56 = icmp slt i64 %tmp57.i54, 0
  br i1 %tmp59.i56, label %bb60.i61, label %bb68.i69, !prof !4

bb60.i61:                                         ; preds = %bb58.i57
  %tmp61.i58 = load i32* %tmp47.i44, align 4
  %tmp62.i59 = and i32 %tmp61.i58, 8192
  %tmp63.i60 = icmp eq i32 %tmp62.i59, 0
  br i1 %tmp63.i60, label %rw_verify_area.exit5.thread.i120, label %bb64.i65

bb64.i65:                                         ; preds = %bb60.i61
  %tmp65.i62 = zext i32 %.count.i37 to i64
  %tmp66.i63 = sub i64 0, %tmp57.i54
  %tmp67.i64 = icmp slt i64 %tmp65.i62, %tmp66.i63
  br i1 %tmp67.i64, label %select.unfold10.i74, label %rw_verify_area.exit5.thread.i120

bb68.i69:                                         ; preds = %bb58.i57
  %tmp69.i66 = zext i32 %.count.i37 to i64
  %tmp70.i67 = add i64 %tmp57.i54, %tmp69.i66
  %tmp71.i68 = icmp slt i64 %tmp70.i67, 0
  br i1 %tmp71.i68, label %bb72.i73, label %select.unfold10.i74, !prof !4

bb72.i73:                                         ; preds = %bb68.i69
  %tmp73.i70 = load i32* %tmp47.i44, align 4
  %tmp74.i71 = and i32 %tmp73.i70, 8192
  %tmp75.i72 = icmp eq i32 %tmp74.i71, 0
  br i1 %tmp75.i72, label %rw_verify_area.exit5.thread.i120, label %select.unfold10.i74

select.unfold10.i74:                              ; preds = %bb72.i73, %bb68.i69, %bb64.i65
  %tmp78.i = getelementptr inbounds %struct.inode* %tmp53.i50, i32 0, i32 6
  %tmp79.i = load %struct.super_block** %tmp78.i, align 4
  %tmp80.i = getelementptr inbounds %struct.super_block* %tmp79.i, i32 0, i32 4
  %tmp81.i = load i64* %tmp80.i, align 4
  %tmp82.i = getelementptr inbounds %struct.inode* %tmp55.i52, i32 0, i32 6
  %tmp83.i = load %struct.super_block** %tmp82.i, align 4
  %tmp84.i = getelementptr inbounds %struct.super_block* %tmp83.i, i32 0, i32 4
  %tmp85.i = load i64* %tmp84.i, align 4
  %tmp86.i = icmp slt i64 %tmp81.i, %tmp85.i
  %tmp87.i = select i1 %tmp86.i, i64 %tmp81.i, i64 %tmp85.i
  %tmp89.i75 = zext i32 %.count.i37 to i64
  %tmp90.i76 = add i64 %tmp13.i, %tmp89.i75
  %tmp91.i77 = icmp sgt i64 %tmp90.i76, %tmp87.i
  br i1 %tmp91.i77, label %bb92.i79, label %bb97.i89, !prof !4

bb92.i79:                                         ; preds = %select.unfold10.i74
  %tmp93.i78 = icmp sgt i64 %tmp87.i, %tmp13.i
  br i1 %tmp93.i78, label %bb94.i82, label %rw_verify_area.exit5.thread.i120

bb94.i82:                                         ; preds = %bb92.i79
  %tmp95.i80 = sub i64 %tmp87.i, %tmp13.i
  %tmp96.i81 = trunc i64 %tmp95.i80 to i32
  br label %bb97.i89

bb97.i89:                                         ; preds = %bb94.i82, %select.unfold10.i74
  %.0.i83 = phi i32 [ %tmp96.i81, %bb94.i82 ], [ %.count.i37, %select.unfold10.i74 ]
  %tmp98.i84 = load %struct.inode** %tmp54.i51, align 4
  %tmp99.i85 = getelementptr inbounds %struct.inode* %tmp98.i84, i32 0, i32 0
  %tmp100.i86 = load i16* %tmp99.i85, align 2
  %tmp101.i87 = and i16 %tmp100.i86, -4096
  %tmp102.i88 = icmp eq i16 %tmp101.i87, -32768
  br i1 %tmp102.i88, label %bb103.i93, label %file_start_write.exit.i100

bb103.i93:                                        ; preds = %bb97.i89
  %tmp104.i90 = getelementptr inbounds %struct.inode* %tmp98.i84, i32 0, i32 6
  %tmp105.i91 = load %struct.super_block** %tmp104.i90, align 4
  %tmp106.i92 = call i32 @__sb_start_write(%struct.super_block* inreg %tmp105.i91, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i100

file_start_write.exit.i100:                       ; preds = %bb103.i93, %bb97.i89
  %tmp107.i94 = call i32 @do_splice_direct(%struct.file* inreg %tmp2.i8, i64* inreg %pos.i4, %struct.file* inreg %tmp44.i41, i64* %out_pos.i5, i32 %.0.i83, i32 0) #6
  %tmp108.i95 = load %struct.inode** %tmp54.i51, align 4
  %tmp109.i96 = getelementptr inbounds %struct.inode* %tmp108.i95, i32 0, i32 0
  %tmp110.i97 = load i16* %tmp109.i96, align 2
  %tmp111.i98 = and i16 %tmp110.i97, -4096
  %tmp112.i99 = icmp eq i16 %tmp111.i98, -32768
  br i1 %tmp112.i99, label %bb113.i103, label %file_end_write.exit.i105

bb113.i103:                                       ; preds = %file_start_write.exit.i100
  %tmp114.i101 = getelementptr inbounds %struct.inode* %tmp108.i95, i32 0, i32 6
  %tmp115.i102 = load %struct.super_block** %tmp114.i101, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp115.i102, i32 inreg 1) #6
  br label %file_end_write.exit.i105

file_end_write.exit.i105:                         ; preds = %bb113.i103, %file_start_write.exit.i100
  %tmp116.i104 = icmp sgt i32 %tmp107.i94, 0
  br i1 %tmp116.i104, label %bb117.i110, label %bb125.i116

bb117.i110:                                       ; preds = %file_end_write.exit.i105
  %tmp118.i106 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp119.i107 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp120.i108 = load i64* %out_pos.i5, align 8
  store i64 %tmp120.i108, i64* %tmp56.i53, align 4
  %tmp121.i109 = load i64* %pos.i4, align 8
  %tmp124.i = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 9
  store i64 %tmp121.i109, i64* %tmp124.i, align 4
  br label %bb125.i116

bb125.i116:                                       ; preds = %bb117.i110, %file_end_write.exit.i105
  %tmp126.i111 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp127.i112 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp128.i113 = load i64* %pos.i4, align 8
  %tmp129.i114 = icmp sgt i64 %tmp128.i113, %tmp87.i
  %..i115 = select i1 %tmp129.i114, i32 -75, i32 %tmp107.i94
  br label %rw_verify_area.exit5.thread.i120

rw_verify_area.exit5.thread.i120:                 ; preds = %bb125.i116, %bb92.i79, %bb72.i73, %bb64.i65, %bb60.i61, %bb51.i55, %bb46.i48
  %retval.0.i117 = phi i32 [ -75, %bb92.i79 ], [ -9, %bb46.i48 ], [ %..i115, %bb125.i116 ], [ -22, %bb51.i55 ], [ -22, %bb60.i61 ], [ -75, %bb64.i65 ], [ -22, %bb72.i73 ]
  %tmp130.i118 = and i32 %tmp42.i39, 1
  %tmp131.i119 = icmp eq i32 %tmp130.i118, 0
  br i1 %tmp131.i119, label %fdput.exit3.i125, label %bb132.i121

bb132.i121:                                       ; preds = %rw_verify_area.exit5.thread.i120
  call void @fput(%struct.file* inreg %tmp44.i41) #6
  br label %fdput.exit3.i125

fdput.exit3.i125:                                 ; preds = %bb132.i121, %rw_verify_area.exit5.thread.i120, %select.unfold.i43, %bb36.i35, %bb28.i27, %bb24.i23, %bb9.i15, %bb4.i14
  %retval.1.i122 = phi i32 [ -9, %select.unfold.i43 ], [ -9, %bb4.i14 ], [ %retval.0.i117, %rw_verify_area.exit5.thread.i120 ], [ %retval.0.i117, %bb132.i121 ], [ -22, %bb9.i15 ], [ -22, %bb24.i23 ], [ -75, %bb28.i27 ], [ -22, %bb36.i35 ]
  %tmp133.i123 = and i32 %tmp.i6, 1
  %tmp134.i124 = icmp eq i32 %tmp133.i123, 0
  br i1 %tmp134.i124, label %do_sendfile.exit128, label %bb135.i126

bb135.i126:                                       ; preds = %fdput.exit3.i125
  call void @fput(%struct.file* inreg %tmp2.i8) #6
  br label %do_sendfile.exit128

do_sendfile.exit128:                              ; preds = %bb135.i126, %fdput.exit3.i125, %bb19
  %retval.2.i127 = phi i32 [ -9, %bb19 ], [ %retval.1.i122, %fdput.exit3.i125 ], [ %retval.1.i122, %bb135.i126 ]
  %6 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %6) #4
  %7 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %7) #4
  br label %SYSC_sendfile.exit

SYSC_sendfile.exit:                               ; preds = %do_sendfile.exit128, %do_sendfile.exit, %bb7
  %.0.i = phi i32 [ %retval.2.i127, %do_sendfile.exit128 ], [ -14, %bb7 ], [ %..i, %do_sendfile.exit ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp5) #4
  %tmp21 = sub i32 21, 21
  ret i32 %tmp21
}

; Function Attrs: alwaysinline noimplicitfloat nounwind
define i32 @SyS_sendfile64(i32 %out_fd, i32 %in_fd, i32 %offset, i32 %count) #0 {
bb:
  %pos.i4 = alloca i64, align 8
  %out_pos.i5 = alloca i64, align 8
  %pos.i1 = alloca i64, align 8
  %out_pos.i = alloca i64, align 8
  %pos.i = alloca i64, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  store i32 %out_fd, i32* %tmp, align 4
  store i32 %in_fd, i32* %tmp1, align 4
  store i32 %offset, i32* %tmp2, align 4
  store i32 %count, i32* %tmp3, align 4
  %tmp4 = inttoptr i32 %offset to i64*
  %tmp5 = bitcast i64* %pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %tmp5) #4
  %tmp6 = icmp eq i32 %offset, 0
  br i1 %tmp6, label %bb15, label %copy_from_user.exit.i

copy_from_user.exit.i:                            ; preds = %bb
  %tmp7 = inttoptr i32 %offset to i8*
  %tmp8 = call i32 @_copy_from_user(i8* inreg %tmp5, i8* inreg %tmp7, i32 inreg 8) #6
  %tmp9 = icmp eq i32 %tmp8, 0
  br i1 %tmp9, label %bb10, label %SYSC_sendfile64.exit, !prof !6

bb10:                                             ; preds = %copy_from_user.exit.i
  %0 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #4
  %1 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1) #4
  %tmp.i = call i32 @__fdget(i32 inreg %in_fd) #6
  %tmp1.i = and i32 %tmp.i, -4
  %tmp2.i = inttoptr i32 %tmp1.i to %struct.file*
  %tmp3.i = icmp eq i32 %tmp1.i, 0
  br i1 %tmp3.i, label %do_sendfile.exit, label %bb4.i

bb4.i:                                            ; preds = %bb10
  %tmp5.i = getelementptr inbounds %struct.file* %tmp2.i, i32 0, i32 7
  %tmp6.i = load i32* %tmp5.i, align 4
  %tmp7.i = and i32 %tmp6.i, 1
  %tmp8.i = icmp eq i32 %tmp7.i, 0
  br i1 %tmp8.i, label %fdput.exit3.i, label %bb9.i

bb9.i:                                            ; preds = %bb4.i
  %tmp15.i = load i64* %pos.i, align 4
  store i64 %tmp15.i, i64* %pos.i1, align 8
  %tmp16.i = load i32* %tmp5.i, align 4
  %tmp17.i = and i32 %tmp16.i, 8
  %tmp18.i = icmp eq i32 %tmp17.i, 0
  br i1 %tmp18.i, label %fdput.exit3.i, label %bb19.i

bb19.i:                                           ; preds = %bb9.i
  %tmp21.i = icmp slt i32 %count, 0
  br i1 %tmp21.i, label %fdput.exit3.i, label %bb22.i, !prof !4

bb22.i:                                           ; preds = %bb19.i
  %tmp23.i = icmp slt i64 %tmp15.i, 0
  br i1 %tmp23.i, label %bb24.i, label %bb32.i, !prof !4

bb24.i:                                           ; preds = %bb22.i
  %tmp25.i = load i32* %tmp5.i, align 4
  %tmp26.i = and i32 %tmp25.i, 8192
  %tmp27.i = icmp eq i32 %tmp26.i, 0
  br i1 %tmp27.i, label %fdput.exit3.i, label %bb28.i

bb28.i:                                           ; preds = %bb24.i
  %tmp29.i = zext i32 %count to i64
  %tmp30.i = sub i64 0, %tmp15.i
  %tmp31.i = icmp slt i64 %tmp29.i, %tmp30.i
  br i1 %tmp31.i, label %select.unfold.i, label %fdput.exit3.i

bb32.i:                                           ; preds = %bb22.i
  %tmp33.i = zext i32 %count to i64
  %tmp34.i = add i64 %tmp15.i, %tmp33.i
  %tmp35.i = icmp slt i64 %tmp34.i, 0
  br i1 %tmp35.i, label %bb36.i, label %select.unfold.i, !prof !4

bb36.i:                                           ; preds = %bb32.i
  %tmp37.i = load i32* %tmp5.i, align 4
  %tmp38.i = and i32 %tmp37.i, 8192
  %tmp39.i = icmp eq i32 %tmp38.i, 0
  br i1 %tmp39.i, label %fdput.exit3.i, label %select.unfold.i

select.unfold.i:                                  ; preds = %bb36.i, %bb32.i, %bb28.i
  %tmp40.i = icmp ugt i32 %count, 2147479552
  %.count.i = select i1 %tmp40.i, i32 2147479552, i32 %count
  %tmp41.i = icmp slt i32 %.count.i, 0
  %tmp42.i = call i32 @__fdget(i32 inreg %out_fd) #6
  %tmp43.i = and i32 %tmp42.i, -4
  %tmp44.i = inttoptr i32 %tmp43.i to %struct.file*
  %tmp45.i = icmp eq i32 %tmp43.i, 0
  br i1 %tmp45.i, label %fdput.exit3.i, label %bb46.i

bb46.i:                                           ; preds = %select.unfold.i
  %tmp47.i = getelementptr inbounds %struct.file* %tmp44.i, i32 0, i32 7
  %tmp48.i = load i32* %tmp47.i, align 4
  %tmp49.i = and i32 %tmp48.i, 2
  %tmp50.i = icmp eq i32 %tmp49.i, 0
  br i1 %tmp50.i, label %rw_verify_area.exit5.thread.i, label %bb51.i

bb51.i:                                           ; preds = %bb46.i
  %tmp52.i = getelementptr inbounds %struct.file* %tmp2.i, i32 0, i32 2
  %tmp53.i = load %struct.inode** %tmp52.i, align 4
  %tmp54.i = getelementptr inbounds %struct.file* %tmp44.i, i32 0, i32 2
  %tmp55.i = load %struct.inode** %tmp54.i, align 4
  %tmp56.i = getelementptr inbounds %struct.file* %tmp44.i, i32 0, i32 9
  %tmp57.i = load i64* %tmp56.i, align 4
  store i64 %tmp57.i, i64* %out_pos.i, align 8
  br i1 %tmp41.i, label %rw_verify_area.exit5.thread.i, label %bb58.i, !prof !4

bb58.i:                                           ; preds = %bb51.i
  %tmp59.i = icmp slt i64 %tmp57.i, 0
  br i1 %tmp59.i, label %bb60.i, label %bb68.i, !prof !4

bb60.i:                                           ; preds = %bb58.i
  %tmp61.i = load i32* %tmp47.i, align 4
  %tmp62.i = and i32 %tmp61.i, 8192
  %tmp63.i = icmp eq i32 %tmp62.i, 0
  br i1 %tmp63.i, label %rw_verify_area.exit5.thread.i, label %bb64.i

bb64.i:                                           ; preds = %bb60.i
  %tmp65.i = zext i32 %.count.i to i64
  %tmp66.i = sub i64 0, %tmp57.i
  %tmp67.i = icmp slt i64 %tmp65.i, %tmp66.i
  br i1 %tmp67.i, label %select.unfold10.i, label %rw_verify_area.exit5.thread.i

bb68.i:                                           ; preds = %bb58.i
  %tmp69.i = zext i32 %.count.i to i64
  %tmp70.i = add i64 %tmp57.i, %tmp69.i
  %tmp71.i = icmp slt i64 %tmp70.i, 0
  br i1 %tmp71.i, label %bb72.i, label %select.unfold10.i, !prof !4

bb72.i:                                           ; preds = %bb68.i
  %tmp73.i = load i32* %tmp47.i, align 4
  %tmp74.i = and i32 %tmp73.i, 8192
  %tmp75.i = icmp eq i32 %tmp74.i, 0
  br i1 %tmp75.i, label %rw_verify_area.exit5.thread.i, label %select.unfold10.i

select.unfold10.i:                                ; preds = %bb72.i, %bb68.i, %bb64.i
  %tmp78.i = getelementptr inbounds %struct.inode* %tmp53.i, i32 0, i32 6
  %tmp79.i = load %struct.super_block** %tmp78.i, align 4
  %tmp80.i = getelementptr inbounds %struct.super_block* %tmp79.i, i32 0, i32 4
  %tmp81.i = load i64* %tmp80.i, align 4
  %tmp82.i = getelementptr inbounds %struct.inode* %tmp55.i, i32 0, i32 6
  %tmp83.i = load %struct.super_block** %tmp82.i, align 4
  %tmp84.i = getelementptr inbounds %struct.super_block* %tmp83.i, i32 0, i32 4
  %tmp85.i = load i64* %tmp84.i, align 4
  %tmp86.i = icmp slt i64 %tmp81.i, %tmp85.i
  %tmp87.i = select i1 %tmp86.i, i64 %tmp81.i, i64 %tmp85.i
  %tmp89.i = zext i32 %.count.i to i64
  %tmp90.i = add i64 %tmp15.i, %tmp89.i
  %tmp91.i = icmp sgt i64 %tmp90.i, %tmp87.i
  br i1 %tmp91.i, label %bb92.i, label %bb97.i, !prof !4

bb92.i:                                           ; preds = %select.unfold10.i
  %tmp93.i = icmp sgt i64 %tmp87.i, %tmp15.i
  br i1 %tmp93.i, label %bb94.i, label %rw_verify_area.exit5.thread.i

bb94.i:                                           ; preds = %bb92.i
  %tmp95.i = sub i64 %tmp87.i, %tmp15.i
  %tmp96.i = trunc i64 %tmp95.i to i32
  br label %bb97.i

bb97.i:                                           ; preds = %bb94.i, %select.unfold10.i
  %.0.i2 = phi i32 [ %tmp96.i, %bb94.i ], [ %.count.i, %select.unfold10.i ]
  %tmp98.i = load %struct.inode** %tmp54.i, align 4
  %tmp99.i = getelementptr inbounds %struct.inode* %tmp98.i, i32 0, i32 0
  %tmp100.i = load i16* %tmp99.i, align 2
  %tmp101.i = and i16 %tmp100.i, -4096
  %tmp102.i = icmp eq i16 %tmp101.i, -32768
  br i1 %tmp102.i, label %bb103.i, label %file_start_write.exit.i

bb103.i:                                          ; preds = %bb97.i
  %tmp104.i = getelementptr inbounds %struct.inode* %tmp98.i, i32 0, i32 6
  %tmp105.i = load %struct.super_block** %tmp104.i, align 4
  %tmp106.i = call i32 @__sb_start_write(%struct.super_block* inreg %tmp105.i, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i

file_start_write.exit.i:                          ; preds = %bb103.i, %bb97.i
  %tmp107.i = call i32 @do_splice_direct(%struct.file* inreg %tmp2.i, i64* inreg %pos.i1, %struct.file* inreg %tmp44.i, i64* %out_pos.i, i32 %.0.i2, i32 0) #6
  %tmp108.i = load %struct.inode** %tmp54.i, align 4
  %tmp109.i = getelementptr inbounds %struct.inode* %tmp108.i, i32 0, i32 0
  %tmp110.i = load i16* %tmp109.i, align 2
  %tmp111.i = and i16 %tmp110.i, -4096
  %tmp112.i = icmp eq i16 %tmp111.i, -32768
  br i1 %tmp112.i, label %bb113.i, label %file_end_write.exit.i

bb113.i:                                          ; preds = %file_start_write.exit.i
  %tmp114.i = getelementptr inbounds %struct.inode* %tmp108.i, i32 0, i32 6
  %tmp115.i = load %struct.super_block** %tmp114.i, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp115.i, i32 inreg 1) #6
  br label %file_end_write.exit.i

file_end_write.exit.i:                            ; preds = %bb113.i, %file_start_write.exit.i
  %tmp116.i = icmp sgt i32 %tmp107.i, 0
  br i1 %tmp116.i, label %bb117.i, label %bb125.i

bb117.i:                                          ; preds = %file_end_write.exit.i
  %tmp118.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp119.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp120.i = load i64* %out_pos.i, align 8
  store i64 %tmp120.i, i64* %tmp56.i, align 4
  %tmp121.i = load i64* %pos.i1, align 8
  store i64 %tmp121.i, i64* %pos.i, align 4
  br label %bb125.i

bb125.i:                                          ; preds = %bb117.i, %file_end_write.exit.i
  %tmp126.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp127.i = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp128.i = load i64* %pos.i1, align 8
  %tmp129.i = icmp sgt i64 %tmp128.i, %tmp87.i
  %..i3 = select i1 %tmp129.i, i32 -75, i32 %tmp107.i
  br label %rw_verify_area.exit5.thread.i

rw_verify_area.exit5.thread.i:                    ; preds = %bb125.i, %bb92.i, %bb72.i, %bb64.i, %bb60.i, %bb51.i, %bb46.i
  %retval.0.i = phi i32 [ -75, %bb92.i ], [ -9, %bb46.i ], [ %..i3, %bb125.i ], [ -22, %bb51.i ], [ -22, %bb60.i ], [ -75, %bb64.i ], [ -22, %bb72.i ]
  %tmp130.i = and i32 %tmp42.i, 1
  %tmp131.i = icmp eq i32 %tmp130.i, 0
  br i1 %tmp131.i, label %fdput.exit3.i, label %bb132.i

bb132.i:                                          ; preds = %rw_verify_area.exit5.thread.i
  call void @fput(%struct.file* inreg %tmp44.i) #6
  br label %fdput.exit3.i

fdput.exit3.i:                                    ; preds = %bb132.i, %rw_verify_area.exit5.thread.i, %select.unfold.i, %bb36.i, %bb28.i, %bb24.i, %bb19.i, %bb9.i, %bb4.i
  %retval.1.i = phi i32 [ -9, %select.unfold.i ], [ -29, %bb9.i ], [ -9, %bb4.i ], [ %retval.0.i, %rw_verify_area.exit5.thread.i ], [ %retval.0.i, %bb132.i ], [ -22, %bb19.i ], [ -22, %bb24.i ], [ -75, %bb28.i ], [ -22, %bb36.i ]
  %tmp133.i = and i32 %tmp.i, 1
  %tmp134.i = icmp eq i32 %tmp133.i, 0
  br i1 %tmp134.i, label %do_sendfile.exit, label %bb135.i

bb135.i:                                          ; preds = %fdput.exit3.i
  call void @fput(%struct.file* inreg %tmp2.i) #6
  br label %do_sendfile.exit

do_sendfile.exit:                                 ; preds = %bb135.i, %fdput.exit3.i, %bb10
  %retval.2.i = phi i32 [ -9, %bb10 ], [ %retval.1.i, %fdput.exit3.i ], [ %retval.1.i, %bb135.i ]
  %2 = bitcast i64* %pos.i1 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %2) #4
  %3 = bitcast i64* %out_pos.i to i8*
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  %tmp12 = load i64* %pos.i, align 8
  %tmp13 = call i32 asm sideeffect "call __put_user_8", "={ax},A,{cx},~{ebx},~{dirflag},~{fpsr},~{flags}"(i64 %tmp12, i64* %tmp4) #4, !srcloc !9
  %tmp14 = icmp eq i32 %tmp13, 0
  %..i = select i1 %tmp14, i32 %retval.2.i, i32 -14
  br label %SYSC_sendfile64.exit

bb15:                                             ; preds = %bb
  %4 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %4) #4
  %5 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %5) #4
  %tmp.i6 = call i32 @__fdget(i32 inreg %in_fd) #6
  %tmp1.i7 = and i32 %tmp.i6, -4
  %tmp2.i8 = inttoptr i32 %tmp1.i7 to %struct.file*
  %tmp3.i9 = icmp eq i32 %tmp1.i7, 0
  br i1 %tmp3.i9, label %do_sendfile.exit138, label %bb4.i14

bb4.i14:                                          ; preds = %bb15
  %tmp5.i10 = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 7
  %tmp6.i11 = load i32* %tmp5.i10, align 4
  %tmp7.i12 = and i32 %tmp6.i11, 1
  %tmp8.i13 = icmp eq i32 %tmp7.i12, 0
  br i1 %tmp8.i13, label %fdput.exit3.i135, label %bb9.i15

bb9.i15:                                          ; preds = %bb4.i14
  %tmp12.i = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 9
  %tmp13.i = load i64* %tmp12.i, align 4
  store i64 %tmp13.i, i64* %pos.i4, align 8
  %tmp21.i16 = icmp slt i32 %count, 0
  br i1 %tmp21.i16, label %fdput.exit3.i135, label %bb22.i19, !prof !4

bb22.i19:                                         ; preds = %bb9.i15
  %tmp23.i18 = icmp slt i64 %tmp13.i, 0
  br i1 %tmp23.i18, label %bb24.i23, label %bb32.i31, !prof !4

bb24.i23:                                         ; preds = %bb22.i19
  %tmp25.i20 = load i32* %tmp5.i10, align 4
  %tmp26.i21 = and i32 %tmp25.i20, 8192
  %tmp27.i22 = icmp eq i32 %tmp26.i21, 0
  br i1 %tmp27.i22, label %fdput.exit3.i135, label %bb28.i27

bb28.i27:                                         ; preds = %bb24.i23
  %tmp29.i24 = zext i32 %count to i64
  %tmp30.i25 = sub i64 0, %tmp13.i
  %tmp31.i26 = icmp slt i64 %tmp29.i24, %tmp30.i25
  br i1 %tmp31.i26, label %select.unfold.i43, label %fdput.exit3.i135

bb32.i31:                                         ; preds = %bb22.i19
  %tmp33.i28 = zext i32 %count to i64
  %tmp34.i29 = add i64 %tmp13.i, %tmp33.i28
  %tmp35.i30 = icmp slt i64 %tmp34.i29, 0
  br i1 %tmp35.i30, label %bb36.i35, label %select.unfold.i43, !prof !4

bb36.i35:                                         ; preds = %bb32.i31
  %tmp37.i32 = load i32* %tmp5.i10, align 4
  %tmp38.i33 = and i32 %tmp37.i32, 8192
  %tmp39.i34 = icmp eq i32 %tmp38.i33, 0
  br i1 %tmp39.i34, label %fdput.exit3.i135, label %select.unfold.i43

select.unfold.i43:                                ; preds = %bb36.i35, %bb32.i31, %bb28.i27
  %tmp40.i36 = icmp ugt i32 %count, 2147479552
  %.count.i37 = select i1 %tmp40.i36, i32 2147479552, i32 %count
  %tmp41.i38 = icmp slt i32 %.count.i37, 0
  %tmp42.i39 = call i32 @__fdget(i32 inreg %out_fd) #6
  %tmp43.i40 = and i32 %tmp42.i39, -4
  %tmp44.i41 = inttoptr i32 %tmp43.i40 to %struct.file*
  %tmp45.i42 = icmp eq i32 %tmp43.i40, 0
  br i1 %tmp45.i42, label %fdput.exit3.i135, label %bb46.i48

bb46.i48:                                         ; preds = %select.unfold.i43
  %tmp47.i44 = getelementptr inbounds %struct.file* %tmp44.i41, i32 0, i32 7
  %tmp48.i45 = load i32* %tmp47.i44, align 4
  %tmp49.i46 = and i32 %tmp48.i45, 2
  %tmp50.i47 = icmp eq i32 %tmp49.i46, 0
  br i1 %tmp50.i47, label %rw_verify_area.exit5.thread.i130, label %bb51.i55

bb51.i55:                                         ; preds = %bb46.i48
  %tmp52.i49 = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 2
  %tmp53.i50 = load %struct.inode** %tmp52.i49, align 4
  %tmp54.i51 = getelementptr inbounds %struct.file* %tmp44.i41, i32 0, i32 2
  %tmp55.i52 = load %struct.inode** %tmp54.i51, align 4
  %tmp56.i53 = getelementptr inbounds %struct.file* %tmp44.i41, i32 0, i32 9
  %tmp57.i54 = load i64* %tmp56.i53, align 4
  store i64 %tmp57.i54, i64* %out_pos.i5, align 8
  br i1 %tmp41.i38, label %rw_verify_area.exit5.thread.i130, label %bb58.i57, !prof !4

bb58.i57:                                         ; preds = %bb51.i55
  %tmp59.i56 = icmp slt i64 %tmp57.i54, 0
  br i1 %tmp59.i56, label %bb60.i61, label %bb68.i69, !prof !4

bb60.i61:                                         ; preds = %bb58.i57
  %tmp61.i58 = load i32* %tmp47.i44, align 4
  %tmp62.i59 = and i32 %tmp61.i58, 8192
  %tmp63.i60 = icmp eq i32 %tmp62.i59, 0
  br i1 %tmp63.i60, label %rw_verify_area.exit5.thread.i130, label %bb64.i65

bb64.i65:                                         ; preds = %bb60.i61
  %tmp65.i62 = zext i32 %.count.i37 to i64
  %tmp66.i63 = sub i64 0, %tmp57.i54
  %tmp67.i64 = icmp slt i64 %tmp65.i62, %tmp66.i63
  br i1 %tmp67.i64, label %select.unfold10.i74, label %rw_verify_area.exit5.thread.i130

bb68.i69:                                         ; preds = %bb58.i57
  %tmp69.i66 = zext i32 %.count.i37 to i64
  %tmp70.i67 = add i64 %tmp57.i54, %tmp69.i66
  %tmp71.i68 = icmp slt i64 %tmp70.i67, 0
  br i1 %tmp71.i68, label %bb72.i73, label %select.unfold10.i74, !prof !4

bb72.i73:                                         ; preds = %bb68.i69
  %tmp73.i70 = load i32* %tmp47.i44, align 4
  %tmp74.i71 = and i32 %tmp73.i70, 8192
  %tmp75.i72 = icmp eq i32 %tmp74.i71, 0
  br i1 %tmp75.i72, label %rw_verify_area.exit5.thread.i130, label %select.unfold10.i74

select.unfold10.i74:                              ; preds = %bb72.i73, %bb68.i69, %bb64.i65
  %tmp78.i75 = getelementptr inbounds %struct.inode* %tmp53.i50, i32 0, i32 6
  %tmp79.i76 = load %struct.super_block** %tmp78.i75, align 4
  %tmp80.i77 = getelementptr inbounds %struct.super_block* %tmp79.i76, i32 0, i32 4
  %tmp81.i78 = load i64* %tmp80.i77, align 4
  %tmp82.i79 = getelementptr inbounds %struct.inode* %tmp55.i52, i32 0, i32 6
  %tmp83.i80 = load %struct.super_block** %tmp82.i79, align 4
  %tmp84.i81 = getelementptr inbounds %struct.super_block* %tmp83.i80, i32 0, i32 4
  %tmp85.i82 = load i64* %tmp84.i81, align 4
  %tmp86.i83 = icmp slt i64 %tmp81.i78, %tmp85.i82
  %tmp87.i84 = select i1 %tmp86.i83, i64 %tmp81.i78, i64 %tmp85.i82
  %tmp89.i85 = zext i32 %.count.i37 to i64
  %tmp90.i86 = add i64 %tmp13.i, %tmp89.i85
  %tmp91.i87 = icmp sgt i64 %tmp90.i86, %tmp87.i84
  br i1 %tmp91.i87, label %bb92.i89, label %bb97.i99, !prof !4

bb92.i89:                                         ; preds = %select.unfold10.i74
  %tmp93.i88 = icmp sgt i64 %tmp87.i84, %tmp13.i
  br i1 %tmp93.i88, label %bb94.i92, label %rw_verify_area.exit5.thread.i130

bb94.i92:                                         ; preds = %bb92.i89
  %tmp95.i90 = sub i64 %tmp87.i84, %tmp13.i
  %tmp96.i91 = trunc i64 %tmp95.i90 to i32
  br label %bb97.i99

bb97.i99:                                         ; preds = %bb94.i92, %select.unfold10.i74
  %.0.i93 = phi i32 [ %tmp96.i91, %bb94.i92 ], [ %.count.i37, %select.unfold10.i74 ]
  %tmp98.i94 = load %struct.inode** %tmp54.i51, align 4
  %tmp99.i95 = getelementptr inbounds %struct.inode* %tmp98.i94, i32 0, i32 0
  %tmp100.i96 = load i16* %tmp99.i95, align 2
  %tmp101.i97 = and i16 %tmp100.i96, -4096
  %tmp102.i98 = icmp eq i16 %tmp101.i97, -32768
  br i1 %tmp102.i98, label %bb103.i103, label %file_start_write.exit.i110

bb103.i103:                                       ; preds = %bb97.i99
  %tmp104.i100 = getelementptr inbounds %struct.inode* %tmp98.i94, i32 0, i32 6
  %tmp105.i101 = load %struct.super_block** %tmp104.i100, align 4
  %tmp106.i102 = call i32 @__sb_start_write(%struct.super_block* inreg %tmp105.i101, i32 inreg 1, i1 inreg zeroext true) #6
  br label %file_start_write.exit.i110

file_start_write.exit.i110:                       ; preds = %bb103.i103, %bb97.i99
  %tmp107.i104 = call i32 @do_splice_direct(%struct.file* inreg %tmp2.i8, i64* inreg %pos.i4, %struct.file* inreg %tmp44.i41, i64* %out_pos.i5, i32 %.0.i93, i32 0) #6
  %tmp108.i105 = load %struct.inode** %tmp54.i51, align 4
  %tmp109.i106 = getelementptr inbounds %struct.inode* %tmp108.i105, i32 0, i32 0
  %tmp110.i107 = load i16* %tmp109.i106, align 2
  %tmp111.i108 = and i16 %tmp110.i107, -4096
  %tmp112.i109 = icmp eq i16 %tmp111.i108, -32768
  br i1 %tmp112.i109, label %bb113.i113, label %file_end_write.exit.i115

bb113.i113:                                       ; preds = %file_start_write.exit.i110
  %tmp114.i111 = getelementptr inbounds %struct.inode* %tmp108.i105, i32 0, i32 6
  %tmp115.i112 = load %struct.super_block** %tmp114.i111, align 4
  call void @__sb_end_write(%struct.super_block* inreg %tmp115.i112, i32 inreg 1) #6
  br label %file_end_write.exit.i115

file_end_write.exit.i115:                         ; preds = %bb113.i113, %file_start_write.exit.i110
  %tmp116.i114 = icmp sgt i32 %tmp107.i104, 0
  br i1 %tmp116.i114, label %bb117.i120, label %bb125.i126

bb117.i120:                                       ; preds = %file_end_write.exit.i115
  %tmp118.i116 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp119.i117 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp120.i118 = load i64* %out_pos.i5, align 8
  store i64 %tmp120.i118, i64* %tmp56.i53, align 4
  %tmp121.i119 = load i64* %pos.i4, align 8
  %tmp124.i = getelementptr inbounds %struct.file* %tmp2.i8, i32 0, i32 9
  store i64 %tmp121.i119, i64* %tmp124.i, align 4
  br label %bb125.i126

bb125.i126:                                       ; preds = %bb117.i120, %file_end_write.exit.i115
  %tmp126.i121 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp127.i122 = call %struct.task_struct* asm "movl ${1:P},$0", "=r,im,~{dirflag},~{fpsr},~{flags}"(%struct.task_struct** @current_task) #4, !srcloc !3
  %tmp128.i123 = load i64* %pos.i4, align 8
  %tmp129.i124 = icmp sgt i64 %tmp128.i123, %tmp87.i84
  %..i125 = select i1 %tmp129.i124, i32 -75, i32 %tmp107.i104
  br label %rw_verify_area.exit5.thread.i130

rw_verify_area.exit5.thread.i130:                 ; preds = %bb125.i126, %bb92.i89, %bb72.i73, %bb64.i65, %bb60.i61, %bb51.i55, %bb46.i48
  %retval.0.i127 = phi i32 [ -75, %bb92.i89 ], [ -9, %bb46.i48 ], [ %..i125, %bb125.i126 ], [ -22, %bb51.i55 ], [ -22, %bb60.i61 ], [ -75, %bb64.i65 ], [ -22, %bb72.i73 ]
  %tmp130.i128 = and i32 %tmp42.i39, 1
  %tmp131.i129 = icmp eq i32 %tmp130.i128, 0
  br i1 %tmp131.i129, label %fdput.exit3.i135, label %bb132.i131

bb132.i131:                                       ; preds = %rw_verify_area.exit5.thread.i130
  call void @fput(%struct.file* inreg %tmp44.i41) #6
  br label %fdput.exit3.i135

fdput.exit3.i135:                                 ; preds = %bb132.i131, %rw_verify_area.exit5.thread.i130, %select.unfold.i43, %bb36.i35, %bb28.i27, %bb24.i23, %bb9.i15, %bb4.i14
  %retval.1.i132 = phi i32 [ -9, %select.unfold.i43 ], [ -9, %bb4.i14 ], [ %retval.0.i127, %rw_verify_area.exit5.thread.i130 ], [ %retval.0.i127, %bb132.i131 ], [ -22, %bb9.i15 ], [ -22, %bb24.i23 ], [ -75, %bb28.i27 ], [ -22, %bb36.i35 ]
  %tmp133.i133 = and i32 %tmp.i6, 1
  %tmp134.i134 = icmp eq i32 %tmp133.i133, 0
  br i1 %tmp134.i134, label %do_sendfile.exit138, label %bb135.i136

bb135.i136:                                       ; preds = %fdput.exit3.i135
  call void @fput(%struct.file* inreg %tmp2.i8) #6
  br label %do_sendfile.exit138

do_sendfile.exit138:                              ; preds = %bb135.i136, %fdput.exit3.i135, %bb15
  %retval.2.i137 = phi i32 [ -9, %bb15 ], [ %retval.1.i132, %fdput.exit3.i135 ], [ %retval.1.i132, %bb135.i136 ]
  %6 = bitcast i64* %pos.i4 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %6) #4
  %7 = bitcast i64* %out_pos.i5 to i8*
  call void @llvm.lifetime.end(i64 8, i8* %7) #4
  br label %SYSC_sendfile64.exit

SYSC_sendfile64.exit:                             ; preds = %do_sendfile.exit138, %do_sendfile.exit, %copy_from_user.exit.i
  %.0.i = phi i32 [ %retval.2.i137, %do_sendfile.exit138 ], [ -14, %copy_from_user.exit.i ], [ %..i, %do_sendfile.exit ]
  call void @llvm.lifetime.end(i64 8, i8* %tmp5) #4
  %tmp17 = sub i32 17, 17
  ret i32 %tmp17
}

; Function Attrs: noimplicitfloat
declare i32 @do_splice_direct(%struct.file* inreg, i64* inreg, %struct.file* inreg, i64*, i32, i32) #1

; Function Attrs: noimplicitfloat
declare void @fput(%struct.file* inreg) #1

; Function Attrs: noimplicitfloat
declare i32 @__fdget(i32 inreg) #1

; Function Attrs: noimplicitfloat
declare i32 @__fdget_pos(i32 inreg) #1

; Function Attrs: noimplicitfloat
declare void @kfree(i8* inreg) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.objectsize.i32.p0i8(i8*, i1) #5

; Function Attrs: noimplicitfloat
declare i32 @_copy_from_user(i8* inreg, i8* inreg, i32 inreg) #1

; Function Attrs: noimplicitfloat
declare i8* @__kmalloc(i32 inreg, i32 inreg) #1

; Function Attrs: noimplicitfloat
declare void @__sb_end_write(%struct.super_block* inreg, i32 inreg) #1

; Function Attrs: noimplicitfloat
declare i32 @__sb_start_write(%struct.super_block* inreg, i32 inreg, i1 inreg zeroext) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

; Function Attrs: noimplicitfloat
declare i32 @_copy_to_user(i8* inreg, i8* inreg, i32 inreg) #1

; Function Attrs: nounwind readnone
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #5

attributes #0 = { alwaysinline noimplicitfloat nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noimplicitfloat "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noimplicitfloat nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noimplicitfloat nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }
attributes #6 = { nobuiltin noimplicitfloat nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!1 = metadata !{i32 -2146566201}
!2 = metadata !{i32 -2146564083}
!3 = metadata !{i32 -2146838208}
!4 = metadata !{metadata !"branch_weights", i32 4, i32 64}
!5 = metadata !{i32 -2146620174}
!6 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!7 = metadata !{i32 -2143702645}
!8 = metadata !{i32 -2143700218}
!9 = metadata !{i32 -2143684940}
