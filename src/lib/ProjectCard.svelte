<script>
	import image from '$lib/assets/path_tracer_placeholder.png';
</script>

<div
	class="isolate flex max-w-1/2 flex-col rounded-3xl border-3 border-sky-800/50 p-4 backdrop-blur-sm overflow-hidden"
    
>
	<div class=" inset-0 -z-10 absolute h-full w-full border-3 rounded-3xl m-0 scale-[101%] blur-md border-sky-800/50"></div>
	<div class="relative aspect-video max-h-fit w-full overflow-clip rounded-2xl bg-slate-900">
		<img src={image} class="block h-full w-full object-cover grayscale" />
		<div class="absolute inset-0 min-h-full min-w-full bg-sky-600 mix-blend-multiply"></div>
	</div>
	<div class=" p-3">
		<h1 class="text-3xl">Project Title</h1>
		<hr class="my-2 border-dotted" />
		<p class="font-electrolize m-0 pt-0 text-lg">
			This is a whole paragraph. It has a lot of very very interesting things about this
			project that I worked on
		</p>
	</div>
</div>
