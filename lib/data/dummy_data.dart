import 'package:daraz_clone/models/category_model.dart';
import 'package:daraz_clone/models/item_model.dart';

const categories = [
  Category(
      categoryTitle: 'Electronic Accessories',
      categoryImage: 'demo_images/earphone.png'),
  Category(categoryTitle: 'Fashion', categoryImage: 'demo_images/fashion.png'),
  Category(
      categoryTitle: 'Groceries', categoryImage: 'demo_images/groceries.png'),
  Category(
      categoryTitle: 'Breakfast', categoryImage: 'demo_images/breakfast.png'),
];

const items = [
  Item(
      title: 'Logitech G PRO X Gaming Headset',
      itemImage: [
        'demo_images/headset_1.png',
        'demo_images/headset_2.png',
        'demo_images/headset_3.png',
      ],
      shopName: 'Logitech',
      details:
          'The PRO headset from Logitech G is designed with and for esports pros. Aluminum forks, steel headband, and memory foam and premium leatherette head and ear pads keep you comfortable through marathon training and competition sessions. Pro-G 50mm drivers deliver incredibly accurate audio with improved bass response.',
      category: 'Electronic Accessories',
      sellCount: 35,
      price: 15699),
  Item(
      title: 'Razer Basilisk Wired Gaming Mouse',
      itemImage: [
        'demo_images/mouse_1.png',
        'demo_images/mouse_2.png',
      ],
      shopName: 'Razer',
      details:
          'Razer Basilisk Essential Wired Gaming Mouse with 8 independently programmable buttons is deigned for professional gamers.',
      category: 'Electronic Accessories',
      sellCount: 83,
      price: 8699),
  Item(
      title: 'COOLMOON Water Cooled Radiator',
      itemImage: [
        'demo_images/cooler_1.png',
        'demo_images/cooler_2.png',
      ],
      shopName: 'COOLMOON',
      details:'''1. 360 Water Cooling Supports Lga 115x, 1200, 1700, 2011 And for Amd Full Series Platforms, With 5v Argb Divine Light Synchronization, The Motherboard Does Not Support 5v Argb Can Also Automatically Change Color, Strong Heat Dissipation, Cool Light Effect
      2. Integrated Argb Water-Cooled Radiator
      3. Outstanding Appearance, Strong Performance, Adhering To Ingenuity, Meticulous Carving, Dedicated Creation, The Pursuit Of Performance Leap
      4. High-Quality Cold Head, Simple And Atmospheric, Support The Second Generation Addressable 5v 3pin Interface, Programmable Custom 16.8 Million Color Acrylic Mirror, So That The Light Effect Is More Clear And Full
      5. Strong Cold Liquid Power System To Ensure Efficient Coolant Circulation, Quiet And Efficient.''',
      category: 'Electronic Accessories',
      sellCount: 45,
      price: 13240),
  Item(
      title: 'OLEVS Mechanical Watch for Men',
      itemImage: [
        'demo_images/watch_1.png',
        'demo_images/watch_2.png',
        'demo_images/watch_3.png',
      ],
      shopName: 'OLEVS',
      details:'OLEVS Mechanical Watch for Men Trend Skeleton Design Waterproof Leather High Quality Steel Case Full Clear Men Watch 6661.',
      category: 'Fashion',
      sellCount: 58,
      price: 5657),
  Item(
      title: 'Nike Air Jordan 1 Mid Black',
      itemImage: [
        'demo_images/air_1.png',
        'demo_images/air_2.png',
      ],
      shopName: 'Nike  ',
      details:'2022 NEW Nike Air Jordan 1 Mid Black Basketball Shoes Men\'s Basketball Sneakers Unisex Women Breathable Air Jordan 1 Mid.',
      category: 'Fashion',
      sellCount: 22,
      price: 5962),
  Item(
      title: 'Kellogg\'s Oats Breakfast Cereal',
      itemImage: [
        'demo_images/cereal_1.png',
        'demo_images/cereal_2.png',
      ],
      shopName: 'Kellogg',
      details:
          'Start your day by taking care of your health with the goodness of Kellogg\'s Oats which are quick to prepare and consume. Oats is a wonder grain that has more soluble fibre than some grains like Wheat and Rice. Kellogg\'s Oats are 100% whole grain and are high in fibre and protein.',
      category: 'Groceries',
      sellCount: 158,
      price: 235),
  Item(
      title: 'Junior Horlicks Health 500g',
      itemImage: [
        'demo_images/horlicks_1.png',
        'demo_images/horlicks_2.png',
      ],
      shopName: 'Horlicks',
      details:
          'The PRO headset from Logitech G is designed with and for esports pros. Aluminum forks, steel headband, and memory foam and premium leatherette head and ear pads keep you comfortable through marathon training and competition sessions. Pro-G 50mm drivers deliver incredibly accurate audio with improved bass response.',
      category: 'Groceries',
      sellCount: 335,
      price: 460),
  Item(
      title: 'Whole Cinnamon / Daruchini - 50gm',
      itemImage: [
        'demo_images/gro_1.png',
        'demo_images/gro_2.png',
      ],
      shopName: 'Organic Hat Bazar',
      details:
          'দারুচিনি হলো এই গ্রহের সবচেয়ে বেশি অ্যান্টি-অক্সিডেন্টসমৃদ্ধ ভেষজ। এর মিষ্টি স্বাদ ও সুন্দর সুবাসের জন্য শতাব্দীর পর শতাব্দীর ধরে প্রায় প্রতিটি সংস্কৃতিতেই আদৃত হয়ে আসছে। দারুচিনিতে রক্তের শর্করা রোধ করাসহ উন্নত অসাধারণ ঔষধি গুণাবলি রয়েছে, যা প্রদাহ কমাতে ও স্নায়বিক স্বাস্থ্য উন্নীত করতে সহায়তা করে। এ ছাড়া সুগন্ধি মসলা হিসেবে দারুচিনি ব্যাপকভাবে পরিচিত। শুধু রান্নায় গন্ধ বৃদ্ধি নয়, শরীর ও ত্বক উভয়ের জন্যই দারুচিনি ব্যবহার করা যায়। এর অনেক উপকারিতা রয়েছে।',
      category: 'Groceries',
      sellCount: 27,
      price: 60),
  Item(
      title: 'Fresh Soyabean Oil 5ltr',
      itemImage: [
        'demo_images/oil.png',
      ],
      shopName: 'Fresh',
      details:
          'Fresh Soyabean Oil is one of the widely consumed cooking oils and its nutritional value is comparable to those of other vegetable oils like maize corn oil, groundnut oil, sunflower oil and safflower oil.It is an excellent source of linoleic acid, which is an essential fatty acid required in the body. Fresh Fortified Soyabean Oil follows 3 steps of refining process-Perfect Degumming & Neutralization.',
      category: 'Groceries',
      sellCount: 78,
      price: 860),
  Item(
      title: 'Corsair Vengeance LPX',
      itemImage: [
        'demo_images/ram.png',
        'demo_images/ram_2.jpg',
      ],
      shopName: 'Corsair',
      details: 'Corsair Vengeance LPX 8GB DDR4 3200MHz Desktop RAM',
      category: 'Electronic Accessories',
      sellCount: 125,
      price: 2699),
];
