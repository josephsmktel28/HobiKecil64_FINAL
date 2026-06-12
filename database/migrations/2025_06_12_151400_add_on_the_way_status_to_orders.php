<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        DB::statement("ALTER TABLE orders MODIFY COLUMN status ENUM('ordered','on_the_way','delivered','canceled','received') DEFAULT 'ordered'");
    }

    public function down(): void
    {
        DB::statement("ALTER TABLE orders MODIFY COLUMN status ENUM('ordered','delivered','canceled','received') DEFAULT 'ordered'");
    }
};
