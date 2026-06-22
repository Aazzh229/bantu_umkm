import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';

class UmkmScreen extends StatefulWidget {
  const UmkmScreen({Key? key}) : super(key: key);

  @override
  State<UmkmScreen> createState() => _UmkmScreenState();
}

class _UmkmScreenState extends State<UmkmScreen> {
  String _selectedCategory = 'Semua Kategori';
  String _searchQuery = '';
  
  // Filter states
  double _minPrice = 0;
  double _maxPrice = 1000000;
  String _selectedSort = 'Populer'; // 'A-Z', 'Z-A', 'Termurah', 'Termahal', 'Populer'

  final List<Map<String, dynamic>> _allProducts = [
    // --- KULINER ---
    {
      'title': 'Gudeg Kaleng Bu Tjitro',
      'price': 45000,
      'location': 'Yogyakarta',
      'rating': 4.8,
      'category': 'Kuliner',
    },
    {
      'title': 'Bakpia Pathok Premium',
      'price': 35000,
      'location': 'Yogyakarta',
      'rating': 4.9,
      'category': 'Kuliner',
    },
    {
      'title': 'Keripik Tempe Sagu',
      'price': 15000,
      'location': 'Gunungkidul',
      'rating': 4.7,
      'category': 'Kuliner',
    },
    {
      'title': 'Wedang Uwuh Instan',
      'price': 25000,
      'location': 'Bantul',
      'rating': 4.8,
      'category': 'Kuliner',
    },
    {
      'title': 'Yangko Aneka Rasa',
      'price': 20000,
      'location': 'Kotagede',
      'rating': 4.6,
      'category': 'Kuliner',
    },
    {
      'title': 'Sate Klatak Frozen',
      'price': 85000,
      'location': 'Bantul',
      'rating': 4.9,
      'category': 'Kuliner',
    },

    // --- FASHION ---
    {
      'title': 'Kain Batik Tulis Parang',
      'price': 350000,
      'location': 'Yogyakarta',
      'rating': 5.0,
      'category': 'Fashion',
    },
    {
      'title': 'Tas Rajut Tangan',
      'price': 120000,
      'location': 'Sleman',
      'rating': 4.7,
      'category': 'Fashion',
    },
    {
      'title': 'Sepatu Kulit Pria',
      'price': 450000,
      'location': 'Bantul',
      'rating': 4.9,
      'category': 'Fashion',
    },
    {
      'title': 'Kemeja Lurik Modern',
      'price': 150000,
      'location': 'Klaten',
      'rating': 4.8,
      'category': 'Fashion',
    },
    {
      'title': 'Dompet Kulit Pari',
      'price': 250000,
      'location': 'Bantul',
      'rating': 4.9,
      'category': 'Fashion',
    },
    {
      'title': 'Blangkon Mataraman',
      'price': 75000,
      'location': 'Yogyakarta',
      'rating': 4.8,
      'category': 'Fashion',
    },

    // --- SENI ---
    {
      'title': 'Lukisan Abstrak Kanvas',
      'price': 500000,
      'location': 'Yogyakarta',
      'rating': 4.9,
      'category': 'Seni',
    },
    {
      'title': 'Patung Kayu Loro Blonyo',
      'price': 200000,
      'location': 'Bantul',
      'rating': 4.8,
      'category': 'Seni',
    },
    {
      'title': 'Wayang Kulit Prabu Rama',
      'price': 850000,
      'location': 'Bantul',
      'rating': 5.0,
      'category': 'Seni',
    },
    {
      'title': 'Topeng Batik Kayu',
      'price': 125000,
      'location': 'Bantul',
      'rating': 4.7,
      'category': 'Seni',
    },
    {
      'title': 'Kaligrafi Kulit Kambing',
      'price': 95000,
      'location': 'Sleman',
      'rating': 4.8,
      'category': 'Seni',
    },
    {
      'title': 'Miniatur Candi Prambanan',
      'price': 150000,
      'location': 'Sleman',
      'rating': 4.9,
      'category': 'Seni',
    },

    // --- KERAJINAN ---
    {
      'title': 'Guci Hias Kasongan',
      'price': 150000,
      'location': 'Bantul',
      'rating': 4.8,
      'category': 'Kerajinan',
    },
    {
      'title': 'Tudung Saji Anyaman',
      'price': 65000,
      'location': 'Sleman',
      'rating': 4.6,
      'category': 'Kerajinan',
    },
    {
      'title': 'Bros Perak Kotagede',
      'price': 180000,
      'location': 'Kotagede',
      'rating': 4.9,
      'category': 'Kerajinan',
    },
    {
      'title': 'Lampu Gantung Bambu',
      'price': 120000,
      'location': 'Bantul',
      'rating': 4.7,
      'category': 'Kerajinan',
    },
    {
      'title': 'Kotak Tisu Pelepah Pisang',
      'price': 45000,
      'location': 'Sleman',
      'rating': 4.5,
      'category': 'Kerajinan',
    },
    {
      'title': 'Keranjang Anyaman Rotan',
      'price': 85000,
      'location': 'Gunungkidul',
      'rating': 4.8,
      'category': 'Kerajinan',
    },

    // --- JASA ---
    {
      'title': 'Jasa Fotografi Produk',
      'price': 300000,
      'location': 'Yogyakarta',
      'rating': 4.9,
      'category': 'Jasa',
    },
    {
      'title': 'Desain Logo UMKM',
      'price': 200000,
      'location': 'Yogyakarta',
      'rating': 5.0,
      'category': 'Jasa',
    },
    {
      'title': 'Pembuatan Website Toko',
      'price': 850000,
      'location': 'Sleman',
      'rating': 4.9,
      'category': 'Jasa',
    },
    {
      'title': 'Konsultan Pajak UMKM',
      'price': 500000,
      'location': 'Yogyakarta',
      'rating': 4.8,
      'category': 'Jasa',
    },
    {
      'title': 'Admin Sosmed Freelance',
      'price': 1500000,
      'location': 'Bantul',
      'rating': 4.7,
      'category': 'Jasa',
    },
  ];

  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _applyFilters();
  }

  void _applyFilters() {
    List<Map<String, dynamic>> result = _allProducts.where((product) {
      bool matchesCategory = _selectedCategory == 'Semua Kategori' ||
          product['category'] == _selectedCategory;
      bool matchesSearch = product['title']
          .toString()
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      double price = (product['price'] as num).toDouble();
      bool matchesPrice = price >= _minPrice && price <= _maxPrice;

      return matchesCategory && matchesSearch && matchesPrice;
    }).toList();

    // Sorting
    if (_selectedSort == 'A-Z') {
      result.sort((a, b) => a['title'].toString().compareTo(b['title'].toString()));
    } else if (_selectedSort == 'Termahal') {
      result.sort((a, b) => (b['price'] as num).compareTo(a['price'] as num));
    } else if (_selectedSort == 'Termurah') {
      result.sort((a, b) => (a['price'] as num).compareTo(b['price'] as num));
    } else if (_selectedSort == 'Populer' || _selectedSort == 'Favorit') {
      result.sort((a, b) => (b['rating'] as num).compareTo(a['rating'] as num));
    }

    setState(() {
      _filteredProducts = result;
    });
  }

  String _formatPrice(int price) {
    String p = price.toString();
    String res = '';
    int count = 0;
    for (int i = p.length - 1; i >= 0; i--) {
      if (count == 3) {
        res = '.$res';
        count = 0;
      }
      res = p[i] + res;
      count++;
    }
    return 'Rp $res';
  }

  void _showFilterModal() {
    // Local state variables for the modal so they don't apply until "Terapkan" is pressed
    double tempMinPrice = _minPrice;
    double tempMaxPrice = _maxPrice;
    String tempSort = _selectedSort;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 24,
                right: 24,
                top: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter & Urutkan',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Urutkan Berdasarkan',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildSortChip('Populer', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                      _buildSortChip('A-Z', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                      _buildSortChip('Termurah', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                      _buildSortChip('Termahal', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Rentang Harga',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _formatPrice(tempMinPrice.toInt()),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                      Text(
                        _formatPrice(tempMaxPrice.toInt()),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: RangeValues(tempMinPrice, tempMaxPrice),
                    min: 0,
                    max: 1000000,
                    divisions: 100,
                    activeColor: const Color(0xFF8B5CF6),
                    inactiveColor: const Color(0xFFE5E7EB),
                    onChanged: (RangeValues values) {
                      setModalState(() {
                        tempMinPrice = values.start;
                        tempMaxPrice = values.end;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _minPrice = tempMinPrice;
                          _maxPrice = tempMaxPrice;
                          _selectedSort = tempSort;
                          _applyFilters();
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B5CF6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Terapkan Filter',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSortChip(String label, String currentSort, Function(String) onTap) {
    bool isSelected = label == currentSort;
    return GestureDetector(
      onTap: () => onTap(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B5CF6) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF8B5CF6) : const Color(0xFFE5E7EB),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF4B5563),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    bool isSelected = label == _selectedCategory;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
          _applyFilters();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B5CF6) : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF4B5563),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header App Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.storefront, color: Color(0xFF8B5CF6)),
                    const SizedBox(width: 8),
                    Text(
                      'BantuUMKM',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF8B5CF6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Purple Hero Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF7C3AED),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temukan UMKM\nLokal Terbaik',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Dukung ekonomi kreatif dengan produk\nlangsung dari tangan pengrajin dan\npengusaha lokal terverifikasi.',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Search Bar inside Banner
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _applyFilters();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari nama toko atau kategori...',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 13, color: const Color(0xFF9CA3AF)),
                        prefixIcon:
                            const Icon(Icons.search, color: Color(0xFF6B7280)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildCategoryChip('Semua Kategori'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Kuliner'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Fashion'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Seni'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Kerajinan'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Jasa'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Title Directory & Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Produk UMKM (${_filteredProducts.length})',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                GestureDetector(
                  onTap: _showFilterModal,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B5CF6).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.tune, color: Color(0xFF8B5CF6), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Filter',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8B5CF6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Grid View UMKM
            _filteredProducts.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'Tidak ada produk yang cocok dengan filter.',
                        style: GoogleFonts.poppins(
                            color: const Color(0xFF6B7280)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ProductCard(
                        title: product['title'],
                        price: _formatPrice((product['price'] as num).toInt()),
                        location: product['location'],
                        rating: product['rating'].toString(),
                        category: product['category'],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
