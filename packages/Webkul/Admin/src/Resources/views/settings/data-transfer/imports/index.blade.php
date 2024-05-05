<x-admin::layouts>
    <!-- Title of the page -->
    <x-slot:title>
        @lang('admin::app.settings.data-transfer.imports.index.title')
    </x-slot>

    <div class="flex gap-4 justify-between items-center max-sm:flex-wrap">
        <p class="text-xl text-gray-800 dark:text-white font-bold">
            @lang('admin::app.settings.data-transfer.imports.index.title')
        </p>
        <div class="flex gap-x-2.5 items-center">
            <!-- Create New Tax Rate Button -->
            @if (bouncer()->hasPermission('settings.data_transfer.imports.create'))
                <a href="{{ route('admin.settings.data_transfer.imports.create') }}" class="primary-button">
                    @lang('admin::app.settings.data-transfer.imports.index.button-title')
                </a>
            @endif
        </div>
    </div>
    <div class="flex gap-x-2.5 items-center mt-5">
        <form class="flex gap-x-2.5 items-center" action="{{ route('admin.settings.data_transfer.imports.upload_products.images') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-4">
                <label for="images" class="block text-sm font-medium text-gray-700">Select Images</label>
                <input type="file" name="images[]" id="images" multiple accept=".png, .jpeg, .jpg, .webp, .mp4, .webm, .mkv" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                @error('images.*')
                    @foreach ($errors->get('images.*') as $error)
                        <p class="text-red-500 text-sm mt-1">{{ $error[0] }}</p>
                    @endforeach
                @enderror
            </div>
            <div class="mt-4">
                <button type="submit" class="primary-button">Upload Images</button>
            </div>
        </form>
        <form class="flex gap-x-2.5 items-center" action="{{ route('admin.settings.data_transfer.imports.upload_products.videos') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="mb-4">
                <label for="videos" class="block text-sm font-medium text-gray-700">Select Videos</label>
                <input type="file" name="videos[]" id="videos" multiple accept=".png, .jpeg, .jpg, .webp, .mp4, .webm, .mkv"  class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500">
                @error('videos.*')
                    @foreach ($errors->get('videos.*') as $error)
                        <p class="text-red-500 text-sm mt-1">{{ $error[0] }}</p>
                    @endforeach
                @enderror
            </div>
            <div class="mt-4">
                <button type="submit" class="primary-button">Upload Images</button>
            </div>
        </form>
    </div>
    <x-admin::datagrid :src="route('admin.settings.data_transfer.imports.index')"/>
</x-admin::layouts>
