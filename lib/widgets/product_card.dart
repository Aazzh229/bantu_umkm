import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  final String rating;
  final double width;

  // Detailed parameters for ProductDetailScreen
  final String? originalPrice;
  final String? discount;
  final String category;
  final String stock;
  final String reviewsCount;
  final String description;
  final List<String> images;
  
  // New fields matching the store info
  final String storeName;
  final String storeLocation;
  final List<String> specifications;
  final List<String> similarProducts;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.location,
    required this.rating,
    this.width = 160,
    this.originalPrice,
    this.discount,
    this.category = 'Umum',
    this.stock = 'Tersedia',
    this.reviewsCount = '(0)',
    this.description = 'Tidak ada deskripsi produk.',
    this.images = const [],
    this.storeName = 'UMKM Mitra Official',
    this.storeLocation = 'Indonesia',
    this.specifications = const [],
    this.similarProducts = const [],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              title: title,
              price: price,
              originalPrice: originalPrice,
              discount: discount,
              category: category,
              location: location,
              rating: rating,
              reviewsCount: reviewsCount,
              stock: stock,
              images: images.isNotEmpty
                  ? images
                  : [
                      'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?q=80&w=600&auto=format&fit=crop'
                    ],
              description: description,
              storeName: storeName,
              storeLocation: storeLocation,
              specifications: specifications,
              similarProducts: similarProducts,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Area
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: images.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: images.first,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: const Color(0xFFCBBD93).withOpacity(0.3),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF574A24)),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: const Color(0xFFCBBD93),
                              child: const Center(
                                child: Icon(
                                  Icons.image_outlined,
                                  color: Color(0xFFFFFFFF),
                                  size: 40,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            color: const Color(0xFFCBBD93),
                            child: const Center(
                              child: Icon(
                                Icons.image_outlined,
                                color: Color(0xFFFFFFFF),
                                size: 40,
                              ),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.redAccent,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.orangeAccent,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFF80775C),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF574A24),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

