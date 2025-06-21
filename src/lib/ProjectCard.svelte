<script lang="ts">
	interface Props {
		title: string;
		description: string;
		image: string;
		imageAlt: string;
		active?: boolean;
	}
	let { title, description, image, imageAlt, active = false }: Props = $props();
	// active = true;
</script>

<div
	class="isolate mx-6 flex max-w-[500px] flex-col overflow-hidden rounded-3xl border-3 border-sky-800/50 p-4 backdrop-blur-sm transition-transform"
	role="presentation"
	onmouseenter={() => {
		active = true;
	}}
	onmouseleave={() => {
		active = false;
	}}
	class:scale-105={active}
>
	<div
		class="absolute inset-0 -z-10 m-0 h-full w-full scale-[101%] rounded-3xl border-3 border-sky-800/50 blur-md"
	></div>
	<!-- TODO: make sure this is still positioned correctly for small images -->
	<!-- Image glow -->
	<img
		src={image}
		class="absolute inset-0 aspect-video w-full scale-80 object-cover opacity-0 blur-3xl transition-opacity"
		class:opacity-100={active}
		alt=""
		role="presentation"
		aria-hidden="true"
	/>
	<div class="relative aspect-video max-h-fit w-full overflow-clip rounded-2xl bg-slate-900">
		<img
			src={image}
			class="block h-full w-full object-cover opacity-100"
			alt={imageAlt}
			class:grayscale={!active}
		/>
		<!-- Image Glow -->
		<div
			class="absolute inset-0 min-h-full min-w-full bg-sky-600 mix-blend-multiply transition-opacity"
			class:opacity-0={active}
		></div>
	</div>
	<div class=" p-3">
		<h1 class="w-fit text-3xl text-green-300">{title}</h1>
		<div class="mt-1 flex flex-row gap-3 text-sky-800">
			<div
				class="group flex items-center rounded-full border-1 border-green-300/0 px-1 transition-all hover:border-green-300 hover:bg-green-300/10 hover:text-green-300"
			>
				<i class="devicon-tailwindcss-original"></i>
				<span
					class="group-hover:mx-1 max-w-0 overflow-hidden whitespace-nowrap opacity-0 transition-all group-hover:max-w-[200px] group-hover:opacity-100"
					>Tailwind</span
				>
			</div>

			<i class="devicon-svelte-plain"></i>

			<i class="devicon-python-plain"></i>

			<i class="devicon-fastapi-plain"></i>

			<i class="devicon-typescript-plain"></i>
		</div>
		<hr class="my-2 border-dotted" />
		<p class="font-electrolize m-0 pt-0 text-lg">
			{description}
		</p>
	</div>
</div>
