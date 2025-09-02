# AI Build Comparison – Desktop vs Workstation
---

* Build Performance Comparisons:
	- [Overall Performance Gains Summary](#overall-performance-gains-summary)
	- [CPU Comparison](#cpu-comparison)
	- [GPU Comparison](#gpu-comparison)
	- [Storage Comparison](#storage-comparison)

-  ROI Analysis
	-  [TL;DR](#roi-analysis)
	-  [Approximate Performance Uplifts](#approximate-performance-uplifts)
	-  [Normalised “Performance-per-Dollar” Approximation](#normalised-performance-per-dollar-approximation)
	-  [The Reality Check](#the-reality-check)

---
This document compares the **Desktop AI Build** against the **Workstation AI Build**, component by component.

### **📘 Legend**

- 🟩 **Strong Advantage**  
- 🟨 **Moderate Trade-off / Neutral**  
- 🟥 **Drawback / Limitation**

--- 
<br />

## Overall Performance Gains – Summary

| Component | Gain / Trade-off Summary |
| :---- | :---- |
| **CPU** | 🟩 \~2.4× cores, \~20% faster per core, bigger caches → strong for parallel AI workloads. 🟥 Higher power/heat. |
| **GPU** | 🟩 RTX 5090 is a generational leap (\~5–6× faster, 32GB VRAM). 🟨 Secondary 3060 adds flexibility. 🟥 Huge cooling & PSU needs. |
| **Storage** | 🟩 Mirrored drives \= reliability. 🟨 Gen5 NVMe faster. 🟥 Effective usable capacity same as budget build. |
| **Power/Cost** | 🟥 Workstation draws \~2× power, requires advanced cooling, far more expensive. |

--- 
<br />

## CPU Comparison

| Feature | Desktop AI Build – Intel Core i5-14400F | Workstation AI Build – Intel Core Ultra 9 285K |
| :---- | :---- | :---- |
| **Cores** | 10 (6P \+ 4E) | 24 (8P \+ 16E) |
| **Threads** | 16 | 24 |
| **Max Turbo Freq.** | 4.7 GHz | 5.7 GHz |
| **Cache** | L2: 9.5 MB L3: 20 MB | L2: 40 MB L3: 36 MB |
| **TDP (Base/Max)** | 65W / 148W | 125W / 250W |
| **Integrated GPU** | ❌ None | ✅ Intel Xe LPG |
| **NPU (AI Engine)** | ❌ No | ✅ Yes |

### **🔍 Reality Check – CPU Performance Translation**

- 🟩 \~20% faster per core **plus** \~2.4× more cores → real gains for parallel jobs, simulations, AI model training.  
- 🟩 Larger caches reduce memory bottlenecks → workloads scale more smoothly under load.  
- 🟨 Ultra 9 can run **headless AI workloads** while still driving displays (integrated graphics \+ NPU offloading).  
- 🟥 Higher power (250W max) means more heat, noise, and running costs; needs robust cooling.  
- 🟨 A budget i5 build is quieter and cheaper to run, and still solid for development and testing.

--- 
<br />

## GPU Comparison

| Feature | Desktop AI Build – RTX 3060 12GB | Workstation AI Build – RTX 5090 32GB \+ RTX 3060 (secondary) |
| :---- | :---- | :---- |
| **CUDA Cores** | 3584 | 24,576 (5090) \+ 3584 (3060 secondary) |
| **VRAM** | 12GB GDDR6 | 32GB GDDR7 (5090) \+ 12GB GDDR6 (3060) |
| **Bandwidth** | 360 GB/s | 1.5 TB/s (5090) \+ 360 GB/s (3060) |
| **Ports** | 3x DP 1.4a, 1x HDMI 2.1 | 3x DP 2.1a, 1x HDMI (5090) \+ standard 3060 outputs |
| **DLSS / Features** | DLSS 2 | DLSS 4, Ray Tracing Gen 4, SPECTRA, IceStorm cooling |

### **🔍 Reality Check – GPU Performance Translation**

- 🟩 RTX 5090 provides **\>5× raw performance uplift** over RTX 3060 → massive gains for training large AI models.  
- 🟩 VRAM jump from 12GB → 32GB allows much larger batch sizes and models without OOM errors.  
- 🟨 Secondary 3060 acts as a **display driver or light AI card**, freeing the 5090 for uninterrupted heavy workloads.  
- 🟥 Power draw & cooling needs are extreme; workstation-class PSU and thermal design required.  
- 🟨 The desktop 3060 build is still adequate for model prototyping and smaller datasets.

--- 
<br />

## Storage Comparison

| Feature | Desktop AI Build | Workstation AI Build (mirrored) |
| :---- | :---- | :---- |
| **Primary Storage** | 1× 1TB NVMe SSD (Gen4) | 2× 1TB NVMe SSD (Gen5, mirrored) |
| **Secondary Storage** | 1× 1TB NVMe SSD (Gen4) | 2× 2TB HDD (mirrored → 2TB usable) |
| **Effective Capacity** | \~2TB total | \~3TB total (due to mirroring) |
| **Performance** | Fast, but single drive risks | Higher throughput, redundancy |

### **🔍 Reality Check – Storage Performance Translation**

- 🟩 Mirroring → higher reliability, less risk of data loss during long experiments.  
- 🟨 Gen5 NVMe drives in workstation are faster, but AI workloads are often compute/GPU-bound.  
- 🟥 Usable capacity reduced due to mirroring (same effective 3TB).  
- 🟨 Desktop build has more raw capacity (without redundancy), cheaper overall.

***
<br />
<br />
<br />

# ROI Analysis
## TL;DR

On average, the workstation build delivers ~65% the efficiency per dollar compared to the desktop build.

* That means while the workstation is **_vastly more powerful_**, you’re “paying extra” for that performance — the desktop gives you __more raw value per $ spent__, but the <kbd>workstation unlocks capabilities</kbd> (AI inference, GPU memory, future-proofing) that the desktop simply _cannot_ match.

* If you’re <kbd>budget-conscious</kbd> and running small-to-mid scale models (≤30B), the **desktop is far better value**.

* If you _need_ to *enable* larger models, heavy multi-tasking, or a 7–10 year future horizon, the workstation makes sense — but you’re paying a premium for _capability_, not _efficiency_.
---
<br />

## Approximate Performance Uplifts

| Domain | Desktop Build | Workstation Build | Relative Uplift |
| ----- | ----- | ----- | ----- |
| **CPU raw throughput** | Baseline | \~2.5–3× (cores, caches, clocks) | **\+150–200%** |
| **Single-thread tasks** | Baseline | \~1.2× | **\+20%** |
| **AI Inference (VRAM-limited)** | 12GB (tight fit at \~30B) | 44GB (70B+ comfortable) | **\+3–4× capacity** |
| **Simultaneous workloads** | Moderate contention | True isolation (separate GPUs, big caches) | **Qualitative jump** |
| **Future-proofing horizon** | 3–5 yrs | 7–10 yrs | **2× lifespan** |

---
<br />

## Normalised “Performance-per-Dollar” Approximation

We can build a crude index by assigning the desktop a **baseline** of 1.0 in each category, and then scaling the workstation relative to its cost.

* **Cost ratio**: $8600 ÷ $2300 ≈ **3.74×**

Now let’s divide performance uplift by cost multiplier:

| Metric | Performance Gain | Cost Multiplier (3.74×) | Performance per $ |
| ----- | ----- | ----- | ----- |
| **CPU throughput** | 2.5× | 3.74× | **0.67× (less efficient)** |
| **Single-thread** | 1.2× | 3.74× | **0.32× (much less efficient)** |
| **AI Inference (VRAM/Model size)** | 3.5× | 3.74× | **0.94× (almost linear)** |
| **Longevity (years usable)** | 2× | 3.74× | **0.53× (less efficient)** |

---
<br />

## The Reality Check

* On *raw efficiency per dollar*, the **desktop wins** in most categories (better “bang for buck”).

* On **AI workloads specifically**, the workstation justifies its cost (almost linear $ → performance scaling).

* On **practical terms**, the workstation’s advantage is not about *efficiency per dollar*, but about *enabling workloads the desktop simply cannot do*.   
(e.g. if your research requires 70B models, the desktop literally can’t run them, so the performance-per-dollar question becomes moot.)

---
<br />