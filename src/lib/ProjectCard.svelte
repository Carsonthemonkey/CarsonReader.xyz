<script>
	import image from '$lib/assets/path_tracer_placeholder.png';
</script>

<div
	class="isolate flex max-w-1/2 flex-col rounded-3xl border-3 border-sky-800/50 p-4 backdrop-blur-sm"
>
	<div class="aspect-video relative rounded-2xl bg-slate-900 overflow-clip w-full max-h-fit">
        <img src={image} class="object-cover w-full h-full block grayscale">
        <div class="absolute min-w-full min-h-full inset-0 bg-sky-600 mix-blend-multiply"></div>
    </div>
	<div class=" p-3">
		<h1 class="text-3xl">Project Title</h1>
        <hr class="border-dotted my-2" />
		<p class="font-electrolize m-0 pt-0 text-lg">
			This is a whole paragraph. It has a lot of very very interesting things about this
			project that I worked on
		</p>
	</div>
</div>
