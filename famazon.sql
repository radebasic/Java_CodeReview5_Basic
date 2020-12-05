-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2020 at 12:41 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `famazon`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `ID_buyer` int(11) NOT NULL,
  `buyer_name` varchar(100) NOT NULL,
  `buyer_address` varchar(100) NOT NULL,
  `buyer_Email` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `ID_City` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`ID_buyer`, `buyer_name`, `buyer_address`, `buyer_Email`, `user_name`, `ID_City`) VALUES
(1, 'John Down', 'Down street 55', 'john@gmail.com', 'john', 3),
(2, 'Marc Gasol', 'Bul Dreams 44 ', 'marc@gmail.com', 'marc', 4),
(3, 'Sarra Star', 'Sunset street 55', 'sarra@gmail.com', 'sarra', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID_City` int(11) NOT NULL,
  `City_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`ID_City`, `City_Name`) VALUES
(1, 'London'),
(2, 'Basel'),
(3, 'Boston'),
(4, 'Graz');

-- --------------------------------------------------------

--
-- Table structure for table `form_of_payment`
--

CREATE TABLE `form_of_payment` (
  `ID_form_of_payment` int(11) NOT NULL,
  `form_of_payment_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_of_payment`
--

INSERT INTO `form_of_payment` (`ID_form_of_payment`, `form_of_payment_type`) VALUES
(1, 'visa'),
(2, 'cash'),
(3, 'mastercard');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_header`
--

CREATE TABLE `invoice_header` (
  `ID_invoice_header` int(11) NOT NULL,
  `ID_buyer` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `ID_form_of_payment` int(11) NOT NULL,
  `ID_order_header` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_header`
--

INSERT INTO `invoice_header` (`ID_invoice_header`, `ID_buyer`, `invoice_date`, `ID_form_of_payment`, `ID_order_header`) VALUES
(1, 1, '2020-12-04', 2, 1),
(2, 2, '2020-12-04', 3, 2),
(3, 3, '2020-12-04', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE `invoice_item` (
  `ID_invoice_item` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `ID_invoice_header` int(11) NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_item`
--

INSERT INTO `invoice_item` (`ID_invoice_item`, `ID_product`, `ID_invoice_header`, `product_price`, `Quantity`) VALUES
(1, 1, 1, '100', 2),
(2, 2, 1, '50', 1),
(3, 3, 2, '150', 1),
(4, 2, 3, '50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_header`
--

CREATE TABLE `orders_header` (
  `ID_order_header` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `ID_shipping_company` int(11) NOT NULL,
  `ID_order_status` int(11) NOT NULL,
  `ID_buyer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_header`
--

INSERT INTO `orders_header` (`ID_order_header`, `order_date`, `ID_shipping_company`, `ID_order_status`, `ID_buyer`) VALUES
(1, '2020-12-04', 1, 1, 1),
(2, '2020-12-04', 2, 2, 2),
(3, '2020-12-04', 3, 1, 2),
(4, '2020-12-05', 1, 3, 2),
(5, '2020-12-02', 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `ID_order_item` int(11) NOT NULL,
  `ID_order` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `product_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`ID_order_item`, `ID_order`, `ID_product`, `product_price`) VALUES
(1, 1, 2, '50'),
(2, 1, 1, '100'),
(3, 2, 3, '500'),
(4, 3, 2, '50'),
(5, 4, 3, '500'),
(6, 5, 1, '100');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `ID_order_status` int(11) NOT NULL,
  `order_status_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`ID_order_status`, `order_status_type`) VALUES
(1, 'sent'),
(2, 'delivered'),
(3, 'canceled');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID_product` int(11) NOT NULL,
  `ID_product_type` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` varchar(300) NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `product_stock` int(11) NOT NULL,
  `ID_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID_product`, `ID_product_type`, `product_name`, `product_description`, `product_price`, `product_stock`, `ID_supplier`) VALUES
(1, 2, 'car', 'lambourghini small for kids', '100', 10, 1),
(2, 1, 'How to become millioner', 'tutorial', '50', 5, 2),
(3, 3, 'TV', 'Samsung tv', '500', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `ID_product_type` int(11) NOT NULL,
  `product_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`ID_product_type`, `product_type_name`) VALUES
(1, 'books'),
(2, 'toys'),
(3, 'tech product');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_companies`
--

CREATE TABLE `shipping_companies` (
  `ID_shipping_company` int(11) NOT NULL,
  `name_shipping_company` varchar(200) NOT NULL,
  `description` varchar(300) NOT NULL,
  `Email_shipping_company` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping_companies`
--

INSERT INTO `shipping_companies` (`ID_shipping_company`, `name_shipping_company`, `description`, `Email_shipping_company`) VALUES
(1, 'DHL', 'German shipping world wide', 'dhl@gmail.com'),
(2, 'GLS', 'World wide post service', 'gls@gmail.com'),
(3, 'APL', 'American shipping co', 'apl@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_companies_products`
--

CREATE TABLE `shipping_companies_products` (
  `ID_shipping_companies_product` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `ID_shipping_company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `ID_supplier` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(200) NOT NULL,
  `supplier_Email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID_supplier`, `supplier_name`, `supplier_address`, `supplier_Email`) VALUES
(1, 'Black Rock', 'Black Rock Bul 33, 3333NY', 'black@gmail.com'),
(2, 'Delta', 'Bul Dreams 55, 4444 London', 'delta@gmail.com'),
(3, 'Donstar', 'Bul Donstar 55, 4000 NZ', 'donstar@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`ID_buyer`),
  ADD KEY `FK_ID_CITY` (`ID_City`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID_City`);

--
-- Indexes for table `form_of_payment`
--
ALTER TABLE `form_of_payment`
  ADD PRIMARY KEY (`ID_form_of_payment`);

--
-- Indexes for table `invoice_header`
--
ALTER TABLE `invoice_header`
  ADD PRIMARY KEY (`ID_invoice_header`),
  ADD KEY `FK_ID_buyer` (`ID_buyer`),
  ADD KEY `FK_ID_order_header` (`ID_order_header`),
  ADD KEY `FK_ 	ID_form_of_payment` (`ID_form_of_payment`);

--
-- Indexes for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD PRIMARY KEY (`ID_invoice_item`),
  ADD KEY `FK_ID_invoice_header` (`ID_invoice_header`),
  ADD KEY `FK_ID_product` (`ID_product`);

--
-- Indexes for table `orders_header`
--
ALTER TABLE `orders_header`
  ADD PRIMARY KEY (`ID_order_header`),
  ADD KEY `FK_ID_shipping_company` (`ID_shipping_company`),
  ADD KEY `FK_ID_order_status` (`ID_order_status`),
  ADD KEY `FK2_ID_buyer` (`ID_buyer`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`ID_order_item`),
  ADD KEY `FK_ID_order` (`ID_order`),
  ADD KEY `FK2_ID_product` (`ID_product`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`ID_order_status`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID_product`),
  ADD KEY `FK_ID_product_type` (`ID_product_type`),
  ADD KEY `FK_ID_supplier` (`ID_supplier`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`ID_product_type`);

--
-- Indexes for table `shipping_companies`
--
ALTER TABLE `shipping_companies`
  ADD PRIMARY KEY (`ID_shipping_company`);

--
-- Indexes for table `shipping_companies_products`
--
ALTER TABLE `shipping_companies_products`
  ADD PRIMARY KEY (`ID_shipping_companies_product`),
  ADD KEY `FK3_ID_product` (`ID_product`),
  ADD KEY `FK2_ID_shipping_company` (`ID_shipping_company`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`ID_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `ID_buyer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `ID_City` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `form_of_payment`
--
ALTER TABLE `form_of_payment`
  MODIFY `ID_form_of_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_header`
--
ALTER TABLE `invoice_header`
  MODIFY `ID_invoice_header` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_item`
--
ALTER TABLE `invoice_item`
  MODIFY `ID_invoice_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders_header`
--
ALTER TABLE `orders_header`
  MODIFY `ID_order_header` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `ID_order_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `ID_order_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `ID_product_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_companies`
--
ALTER TABLE `shipping_companies`
  MODIFY `ID_shipping_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_companies_products`
--
ALTER TABLE `shipping_companies_products`
  MODIFY `ID_shipping_companies_product` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `ID_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buyers`
--
ALTER TABLE `buyers`
  ADD CONSTRAINT `FK_ID_CITY` FOREIGN KEY (`ID_City`) REFERENCES `city` (`ID_City`);

--
-- Constraints for table `invoice_header`
--
ALTER TABLE `invoice_header`
  ADD CONSTRAINT `FK_ 	ID_form_of_payment` FOREIGN KEY (`ID_form_of_payment`) REFERENCES `form_of_payment` (`ID_form_of_payment`),
  ADD CONSTRAINT `FK_ID_buyer` FOREIGN KEY (`ID_buyer`) REFERENCES `buyers` (`ID_buyer`),
  ADD CONSTRAINT `FK_ID_order_header` FOREIGN KEY (`ID_order_header`) REFERENCES `orders_header` (`ID_order_header`);

--
-- Constraints for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD CONSTRAINT `FK_ID_invoice_header` FOREIGN KEY (`ID_invoice_header`) REFERENCES `invoice_header` (`ID_invoice_header`),
  ADD CONSTRAINT `FK_ID_product` FOREIGN KEY (`ID_product`) REFERENCES `products` (`ID_product`);

--
-- Constraints for table `orders_header`
--
ALTER TABLE `orders_header`
  ADD CONSTRAINT `FK2_ID_buyer` FOREIGN KEY (`ID_buyer`) REFERENCES `buyers` (`ID_buyer`),
  ADD CONSTRAINT `FK_ID_order_status` FOREIGN KEY (`ID_order_status`) REFERENCES `order_status` (`ID_order_status`),
  ADD CONSTRAINT `FK_ID_shipping_company` FOREIGN KEY (`ID_shipping_company`) REFERENCES `shipping_companies` (`ID_shipping_company`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK2_ID_product` FOREIGN KEY (`ID_product`) REFERENCES `products` (`ID_product`),
  ADD CONSTRAINT `FK_ID_order` FOREIGN KEY (`ID_order`) REFERENCES `orders_header` (`ID_order_header`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_ID_product_type` FOREIGN KEY (`ID_product_type`) REFERENCES `product_type` (`ID_product_type`),
  ADD CONSTRAINT `FK_ID_supplier` FOREIGN KEY (`ID_supplier`) REFERENCES `suppliers` (`ID_supplier`);

--
-- Constraints for table `shipping_companies_products`
--
ALTER TABLE `shipping_companies_products`
  ADD CONSTRAINT `FK2_ID_shipping_company` FOREIGN KEY (`ID_shipping_company`) REFERENCES `shipping_companies` (`ID_shipping_company`),
  ADD CONSTRAINT `FK3_ID_product` FOREIGN KEY (`ID_product`) REFERENCES `products` (`ID_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
