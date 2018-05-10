# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create ([
    {
        title: "Makeup"
    },
    {
        title: "Face treatment"
    },
    {
        title: "Hair treatment"
    },
    {
        title: "Body treatment"
    }
]) { |c| puts "#{c.title} created" }

User.create ([
    {
        email: 'user1@gmail.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user2@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user3@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user4@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user5@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    }
    
]) { |u| puts "#{u.email} created" }


Service.create ([
    {
        title: 'Night Makeup', 
        description: 'Prepare yourself to shine. This makeup is ideal for special nights!', 
        price_per_hour: 20,
        min_duration: 60,
        max_duration: 120,
        image_data: '' ,
        user_id: 1,
        category_id: 1
    },
    {
        title: 'Hair Revival', 
        description: 'Give your hair the chance to revive. Treat them with the best natural ingredients. Restore your hair and you will feel the difference.', 
        price_per_hour: 20,
        min_duration: 30,
        max_duration: 60,
        image_data: '',
        user_id: 1,
        category_id: 3
    },
    {
        title: 'Day Makeup', 
        description: 'If you want a quick makeup that will give you the best possible outcome then look no further. Let me show you the way to do it in 5 mins.', 
        price_per_hour: 15,
        min_duration: 30,
        max_duration: 60,
        image_data: '',
        user_id: 2,
        category_id: 1
    },
    {
        title: 'Bridal Makeup', 
        description: 'This is your day and your face deserves to look fantastic. If you want the best bridal makeup that you will remember for ever, you can trust me!', 
        price_per_hour: 50,
        min_duration: 90,
        max_duration: 120,
        image_data: '',
        user_id: 3,
        category_id: 1
    },
    {
        title: 'Bridal Hair', 
        description: 'This is your day and your hair deserves to look fantastic. If you want the best bridal hair that you will remember for ever, you can trust me!', 
        price_per_hour: 50,
        min_duration: 90,
        max_duration: 120,
        image_data: '',
        user_id: 4,
        category_id: 3
    },
    {
        title: 'Ultimate Relaxation', 
        description: 'Relax and unwind. Give you face the chance to restore in a natural way. This treatment has been tested and can change your life. Start your first session and never look back.', 
        price_per_hour: 50,
        min_duration: 90,
        max_duration: 120,
        image_data: '',
        user_id: 5,
        category_id: 4
    }
]) { |s| puts "#{s.title} created" }



Profile.create ([
    {
        first_name: 'Belinda',
        last_name: 'Daniels',
        street_address: '620 Murray Road',
        city: 'Preston',
        state: 'VIC',
        zip: '3072',
        country_code: 'AUS',
        image_data: '',
        user_id: 1
    },
    {
        first_name: 'Ann',
        last_name: 'Frank',
        street_address: '640 Murray Road',
        city: 'Preston',
        state: 'VIC',
        zip: '3072',
        country_code: 'AUS',
        image_data: '',
        user_id: 2
    },
    {
        first_name: 'Christina',
        last_name: 'Smith',
        street_address: '635 Murray Road',
        city: 'Preston',
        state: 'VIC',
        zip: '3072',
        country_code: 'AUS',
        image_data: '',
        user_id: 3
    },
    {
        first_name: 'Dolores',
        last_name: 'Marquez',
        street_address: '637 Murray Road',
        city: 'Preston',
        state: 'VIC',
        zip: '3072',
        country_code: 'AUS',
        image_data: '',
        user_id: 4
    },
    {
        first_name: 'John',
        last_name: 'Travis',
        street_address: '630 Murray Road',
        city: 'Preston',
        state: 'VIC',
        zip: '3072',
        country_code: 'AUS',
        image_data: '',
        user_id: 5
    }
    
]) { |p| puts "#{p.first_name} created" }

User.create ([
    {
        email: 'user6@gmail.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user7@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user8@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user9@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    },
    {
        email: 'user10@domain.com', 
        password: '123456789', 
        password_confirmation: '123456789' 
    }
    
]) { |u| puts "#{u.email} created" }