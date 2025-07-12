<script lang="ts">
	import IconTag from './IconTag.svelte';
	import LucideExternalLink from '~icons/lucide/external-link';
	interface Props {
		title: string;
		description: string;
		image: string;
		imageAlt: string;
		classes?: string;
		iconTags: { class: string; name: string }[];
		handleInactiveClick: () => void;
		active?: boolean;
		titleLink?: string;
	}
	let {
		title,
		description,
		image,
		imageAlt,
		classes,
		iconTags,
		handleInactiveClick,
		titleLink,
		active = false
	}: Props = $props();
</script>

<div
	class={'isolate mx-6 my-0 flex max-w-[500px] flex-col overflow-hidden rounded-3xl border-3 border-sky-800/50 p-4 backdrop-blur-sm transition-all will-change-auto ' +
		classes}
	role="presentation"
>
	<button
		aria-hidden="true"
		tabindex="-1"
		class="absolute inset-0 z-10 h-full w-full"
		class:hidden={active}
		onclick={handleInactiveClick}
	></button>
	<div
		class="absolute inset-0 -z-10 m-0 h-full w-full scale-[101%] rounded-3xl border-3 border-sky-800/50 bg-slate-950/30 blur-md"
	></div>
	<!-- TODO: make sure this is still positioned correctly for small images -->
	<!-- Image glow -->
	<img
		src={image}
		class="absolute inset-0 aspect-video w-full scale-80 object-cover opacity-0 blur-3xl transition-opacity delay-200 duration-300"
		class:opacity-100={active}
		alt=""
		role="presentation"
		aria-hidden="true"
	/>
	<div class="relative aspect-video max-h-fit w-full overflow-clip rounded-2xl bg-slate-900">
		<img
			src={image}
			class="block h-full w-full object-cover opacity-100 transition-all duration-300 sm:delay-200"
			alt={imageAlt}
			class:saturate-0={!active}
		/>
		<!-- Image Tint -->
		<div
			class="absolute inset-0 min-h-full min-w-full bg-sky-600 mix-blend-multiply transition-opacity duration-300 sm:delay-200"
			class:opacity-0={active}
		></div>
	</div>
	<div class=" p-3">
		<h1 class="align-center group relative flex w-fit items-center text-3xl text-green-300">
			{#if titleLink}
				<a href={titleLink} class="inline-flex items-center gap-2"
					>{title}
					<LucideExternalLink
						class="text-xl group-hover:-translate-y-1 motion-safe:transition-all motion-safe:group-hover:translate-x-1 motion-safe:group-hover:scale-105"
					/></a
				>
				<span
					class="absolute bottom-0 h-[2px] bg-green-300 not-group-hover:w-0 group-hover:w-full motion-safe:transition-all"
				></span>
			{:else}
				{title}
			{/if}
		</h1>
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
