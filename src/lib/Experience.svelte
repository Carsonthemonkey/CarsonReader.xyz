<script>
	import ExperienceCard from './ExperienceCard.svelte';
	import IconGraduationCap from '~icons/lucide/graduation-cap';
	import IconBrain from '~icons/lucide/brain';
	import LucideMove3d from '~icons/lucide/move-3d';
</script>

<h1
	class="top-0 m-10 w-fit rounded-full border-2 border-sky-400 bg-gray-950 p-4 text-4xl text-yellow-200"
>
	Experience
</h1>

<div class="flex flex-col gap-16">
	<ExperienceCard Icon={IconGraduationCap} iconClasses="text-orange-300">
		<h1 class="mb-2 text-3xl">B.A. in Computer Science</h1>
		<h2 class="mb-2 w-fit rounded-full border-1 bg-green-300/10 px-2 text-green-300">
			Lewis & Clark College
		</h2>
		<p class="font-electrolize text-lg text-sky-600">
			This is a placeholder paragraph. It doesn't have anything here yet. We need to make sure
			that all the things are the same size. That will happen later
		</p>
	</ExperienceCard>
	<ExperienceCard Icon={IconBrain} iconClasses="text-red-300">
		<h1 class="mb-2 text-3xl">BCI Programmer</h1>
		<h2 class="mb-2 w-fit rounded-full border-1 bg-green-300/10 px-2 text-green-300">
			Oregon Health & Science University
		</h2>
		<p class="font-electrolize text-lg text-sky-600">
			This is a placeholder paragraph. It doesn't have anything here yet. We need to make sure
			that all the things are the same size. That will happen later
		</p>
	</ExperienceCard>
	<ExperienceCard Icon={LucideMove3d} iconClasses="text-purple-300">
		<h1 class="mb-2 text-3xl">3D Modeler</h1>
		<h2 class="mb-2 w-fit rounded-full border-1 bg-green-300/10 px-2 text-green-300">
			Lewis & Clark College
		</h2>
		<p class="font-electrolize text-lg text-sky-600">
			This is a placeholder paragraph. It doesn't have anything here yet. We need to make sure
			that all the things are the same size. That will happen later
		</p>
	</ExperienceCard>
</div>
