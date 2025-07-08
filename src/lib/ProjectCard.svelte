<script lang="ts">
	import IconTag from './IconTag.svelte';

	interface Props {
		title: string;
		description: string;
		image: string;
		imageAlt: string;
		classes?: string;
		active?: boolean;
		iconTags: {class: string, name: string}[]
	}
	let { title, description, image, imageAlt, classes, iconTags, active = false }: Props = $props();
</script>

<div
	class={'isolate my-0 mx-6 flex max-w-[500px] flex-col overflow-hidden rounded-3xl border-3 border-sky-800/50 p-4 backdrop-blur-sm transition-all will-change-auto ' +
		classes}
	role="presentation"
	class:pointer-events-none={!active}
>
	<div
		class="absolute inset-0 -z-10 m-0 h-full w-full scale-[101%] rounded-3xl border-3 border-sky-800/50 blur-md bg-slate-950/30"
	></div>
	<!-- TODO: make sure this is still positioned correctly for small images -->
	<!-- Image glow -->
	<img
		src={image}
		class="absolute inset-0 aspect-video w-full scale-80 object-cover opacity-0 blur-3xl transition-opacity duration-300 delay-200"
		class:opacity-100={active}
		alt=""
		role="presentation"
		aria-hidden="true"
	/>
	<div class="relative aspect-video max-h-fit w-full overflow-clip rounded-2xl bg-slate-900">
		<img
			src={image}
			class="block h-full w-full object-cover opacity-100 transition-all sm:delay-200 duration-300"
			alt={imageAlt}
			class:saturate-0={!active}
		/>
		<!-- Image Tint -->
		<div
			class="absolute inset-0 min-h-full min-w-full bg-sky-600 mix-blend-multiply transition-opacity sm:delay-200 duration-300"
			class:opacity-0={active}
		></div>
	</div>
	<div class=" p-3">
		<h1 class="w-fit text-3xl text-green-300">{title}</h1>
		<div class="mt-1 flex flex-row text-sky-800">
			{#each iconTags as tag}
				<IconTag iconClass={tag.class}>{tag.name}</IconTag>
			{/each}
		</div>
		<hr class="my-2 border-dotted" />
		<p class="font-electrolize m-0 pt-0 text-lg">
			{description}
		</p>
	</div>
</div>
