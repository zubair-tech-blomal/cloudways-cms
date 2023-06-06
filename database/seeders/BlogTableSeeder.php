<?php

namespace Database\Seeders;

use App\Models\Faq;
use Illuminate\Database\Seeder;

class BlogTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $blog = new Faq();
        $blog->title = "This is a simple blog from admin panel";
        $blog->slug = "this-is-a-simple-blog-from-admin-panel";
        $blog->description = "<div>Welcome to our blog <br /></div>";
        $blog->save();

        $blog = new Faq();
        $blog->title = "This is a another blog from admin panel";
        $blog->slug = "this-is-a-another-blog-from-admin-panel";
        $blog->description = "<div>Welcome to our blog <br /></div>";
        $blog->save();
    }
}
