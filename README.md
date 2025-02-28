## Implementasi

**1. Double Jump**  
- Menambahkan atribut can_double_jump
- Buat input jump lagi ketika tidak is_on_floor() dan can_double_jump
- Input ini akan berfungsi seperti jump biasa dan membuat flag can_double_jump menjadi false

**2. Crouch**
- Menambahkan collision shape baru untuk crouch
- Menambahkan input ketika is_action_pressed("ui_down") didalam else
- Ketika crouch, collision shape default akan disabled

**3. Slide**  
- Menambahkan input baru ketika is_action_pressed("ui_down") didalam move right dan move left
- Ketika slide, collision shape default akan disabled tetapi tidak merubah collision.x

**4. Sprite Animation**
- Mengganti child Sprite dengan AnimatedSprite
- Menambahkan animations di dalam sprite frames untuk setiap aksinya
- Memainkan animasi untuk setiap aksi pada script, seperti walk, crouch, slide
- Merubah flip_h menjadi true jika terdapat input ke kiri
