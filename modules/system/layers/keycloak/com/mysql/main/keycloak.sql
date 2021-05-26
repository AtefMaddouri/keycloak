-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 07, 2021 at 06:02 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keycloak`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_event_entity`
--

DROP TABLE IF EXISTS `admin_event_entity`;
CREATE TABLE IF NOT EXISTS `admin_event_entity` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text COLLATE utf8_unicode_ci,
  `REPRESENTATION` text COLLATE utf8_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `associated_policy`
--

DROP TABLE IF EXISTS `associated_policy`;
CREATE TABLE IF NOT EXISTS `associated_policy` (
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authentication_execution`
--

DROP TABLE IF EXISTS `authentication_execution`;
CREATE TABLE IF NOT EXISTS `authentication_execution` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authentication_execution`
--

INSERT INTO `authentication_execution` (`ID`, `ALIAS`, `AUTHENTICATOR`, `REALM_ID`, `FLOW_ID`, `REQUIREMENT`, `PRIORITY`, `AUTHENTICATOR_FLOW`, `AUTH_FLOW_ID`, `AUTH_CONFIG`) VALUES
('05705cf1-0d66-4610-a670-fcdeb8c45ffa', NULL, 'no-cookie-redirect', 'E-Health-realm', 'f654260e-9b79-43ed-83c0-6a5162205e43', 0, 10, b'0', NULL, NULL),
('070dccfa-3f27-44eb-9ac9-ad4fda8c1d25', NULL, NULL, 'E-Health-realm', '276cc684-3337-4726-b71f-a14fb04c3fc4', 1, 30, b'1', 'f6798216-df89-425a-930e-5e6ddc9f96e0', NULL),
('08ff5c1f-6807-4bed-a6b4-333be7468025', NULL, NULL, 'master', 'c762e2b5-323e-4078-bdb3-d445c0014904', 1, 20, b'1', 'dc88f02e-3b8b-428f-8b5f-723a53be9c8d', NULL),
('0b055475-a03b-44fe-8191-47a2b04f74e4', NULL, NULL, 'E-Health-realm', '12ca22de-0cbb-4d83-857d-701111066d8f', 1, 20, b'1', 'd2033b29-662a-4a22-8240-0dbb33f5aeea', NULL),
('0c37e558-97d2-41d0-a54f-76482e7aba97', NULL, 'reset-credential-email', 'master', '42c8bb30-0e13-40b2-be87-46cb1574cffd', 0, 20, b'0', NULL, NULL),
('0f7e3f2a-37d7-4811-98b3-328552cdfb53', NULL, 'idp-confirm-link', 'master', 'e574cc14-41f0-4823-a617-52516ba5534b', 0, 10, b'0', NULL, NULL),
('11fb7f00-8f94-424e-a003-ead5b45cd997', NULL, 'reset-credentials-choose-user', 'E-Health-realm', 'ff5695ee-12b8-40b4-9b8a-ecf703ff85a0', 0, 10, b'0', NULL, NULL),
('1442e58e-028e-4914-bdc9-22b25df58864', NULL, 'direct-grant-validate-password', 'E-Health-realm', '276cc684-3337-4726-b71f-a14fb04c3fc4', 0, 20, b'0', NULL, NULL),
('1a36d6a8-a0b4-4aed-ab85-08624e266851', NULL, 'idp-review-profile', 'E-Health-realm', 'e24f57ba-e94c-4d1e-b887-680017e6373b', 0, 10, b'0', NULL, 'af4ef3b3-59d0-4320-b2cc-9a37192c23ce'),
('1a67cec5-e4fb-463a-9b56-09d8d860aa8e', NULL, 'auth-spnego', 'E-Health-realm', 'b6017a56-cc38-4509-a1fc-9a6c0fc8ba84', 3, 30, b'0', NULL, NULL),
('1af4e4f2-e65a-443c-be7e-82039f7336d6', NULL, 'auth-spnego', 'master', '4a1a57c3-a256-4c18-9f25-838be8621dda', 3, 30, b'0', NULL, NULL),
('1d67df2f-0a7b-4067-9dd6-b18496eac79b', NULL, 'auth-spnego', 'master', '34bd7dfe-375b-4917-9470-6fea31f70d36', 3, 20, b'0', NULL, NULL),
('28fd5f2e-20c9-44ef-a1ef-405e724ad652', NULL, 'conditional-user-configured', 'master', '57b24f1a-3dc0-44fc-a862-8e43570174e2', 0, 10, b'0', NULL, NULL),
('2b48e85a-adbc-4d53-b896-9a8f5761d619', NULL, NULL, 'master', '9c7ea46f-dc4b-4a53-a571-7e7b3e6e8ab1', 2, 20, b'1', 'e574cc14-41f0-4823-a617-52516ba5534b', NULL),
('3438ae9b-9f48-49bb-9314-41dd4bc806c2', NULL, NULL, 'master', '5f462015-41d6-46d7-8a7a-77b22d09e1ff', 1, 20, b'1', '57b24f1a-3dc0-44fc-a862-8e43570174e2', NULL),
('397f50b1-2bc9-421e-8fa9-b29840baf5f5', NULL, NULL, 'master', '5c364a64-0d33-4685-a582-72b21d67d8f4', 1, 30, b'1', 'c550f532-fbc4-4425-a00f-c8c6b15c8b29', NULL),
('42e5307d-dc8f-480e-9097-6c612f32090e', NULL, 'auth-otp-form', 'master', 'dc88f02e-3b8b-428f-8b5f-723a53be9c8d', 0, 20, b'0', NULL, NULL),
('47a24d08-20bb-4cad-a571-3ca447d96f42', NULL, 'conditional-user-configured', 'master', '89836c40-7297-46b7-9511-1f0a6b2fcd30', 0, 10, b'0', NULL, NULL),
('48e3e0c3-4d5e-4fdb-bc60-1554c074bb7f', NULL, 'direct-grant-validate-password', 'master', '5c364a64-0d33-4685-a582-72b21d67d8f4', 0, 20, b'0', NULL, NULL),
('4a06d6e4-d862-4bbd-8749-ea066976737d', NULL, 'conditional-user-configured', 'E-Health-realm', 'd2033b29-662a-4a22-8240-0dbb33f5aeea', 0, 10, b'0', NULL, NULL),
('4ba9f4bb-8e8f-41bb-b1d4-3497931ff397', NULL, 'client-jwt', 'master', '553538d2-8081-495d-8b32-29527e2866c5', 2, 20, b'0', NULL, NULL),
('4be33cd7-1279-4db3-b0c2-599868b7f7c2', NULL, 'reset-password', 'master', '42c8bb30-0e13-40b2-be87-46cb1574cffd', 0, 30, b'0', NULL, NULL),
('4cadd074-df85-4ad0-b21b-c87e489b16ef', NULL, 'registration-profile-action', 'master', 'bdc59f7e-e834-4ce6-8ede-a8182deaa9b2', 0, 40, b'0', NULL, NULL),
('4cb04e23-22b4-4e04-9adb-b07aa6fbf7cb', NULL, 'reset-credential-email', 'E-Health-realm', 'ff5695ee-12b8-40b4-9b8a-ecf703ff85a0', 0, 20, b'0', NULL, NULL),
('4ffa086d-4471-44f1-8bc2-ff777a959ab3', NULL, 'auth-otp-form', 'E-Health-realm', 'ecd920d0-5fda-4cdf-ab26-709d63b67d23', 0, 20, b'0', NULL, NULL),
('526af9c4-da5f-4e9e-ac57-e195897a65af', NULL, 'no-cookie-redirect', 'master', '1b409b0e-2889-45d3-acaa-2e7959f82fbd', 0, 10, b'0', NULL, NULL),
('5409fdf4-ce77-4957-b2de-f131bc27500e', NULL, 'idp-email-verification', 'E-Health-realm', 'c50caf66-db12-4224-b776-d9290ccd0496', 2, 10, b'0', NULL, NULL),
('552c5073-931c-4cd1-a681-64b3200acab9', NULL, 'registration-password-action', 'master', 'bdc59f7e-e834-4ce6-8ede-a8182deaa9b2', 0, 50, b'0', NULL, NULL),
('5758e133-74f3-4029-bcf2-c9f86981ba83', NULL, 'client-secret-jwt', 'master', '553538d2-8081-495d-8b32-29527e2866c5', 2, 30, b'0', NULL, NULL),
('5a60d99d-afd8-468d-996a-3427719b9c47', NULL, 'registration-profile-action', 'E-Health-realm', 'bc5db51e-3fcd-4c2b-974d-c9f46982d03d', 0, 40, b'0', NULL, NULL),
('5df344bc-050f-465a-a68d-5fa4280e5594', NULL, 'auth-username-password-form', 'master', '5f462015-41d6-46d7-8a7a-77b22d09e1ff', 0, 10, b'0', NULL, NULL),
('6105bfa7-8279-4d5f-8ab4-152080bffdab', NULL, NULL, 'E-Health-realm', 'f654260e-9b79-43ed-83c0-6a5162205e43', 0, 20, b'1', 'b6017a56-cc38-4509-a1fc-9a6c0fc8ba84', NULL),
('6444f2e4-0c8f-4421-b19f-1ec329971e75', NULL, 'registration-page-form', 'master', 'e7b8b49c-c627-43cb-8f18-282d23a64d55', 0, 10, b'1', 'bdc59f7e-e834-4ce6-8ede-a8182deaa9b2', NULL),
('66cd2da7-fdf0-4522-8864-1b7d2954d35c', NULL, 'idp-create-user-if-unique', 'master', '9c7ea46f-dc4b-4a53-a571-7e7b3e6e8ab1', 2, 10, b'0', NULL, '02f05873-d930-4939-ac80-721cecca74e3'),
('6878f530-37bc-4f8c-974d-a1e3bb4c7fde', NULL, 'identity-provider-redirector', 'master', '34bd7dfe-375b-4917-9470-6fea31f70d36', 2, 25, b'0', NULL, NULL),
('688b4732-1880-472b-b9e2-ddf0f6ac7079', NULL, 'auth-spnego', 'E-Health-realm', '359f1a81-d69c-47f7-a982-fecae16c0e1a', 3, 20, b'0', NULL, NULL),
('68ac11e3-02d2-4a4d-a7a3-1bc6d31dda25', NULL, 'client-x509', 'E-Health-realm', '908284d3-1131-453e-a593-28cb08df87c8', 2, 40, b'0', NULL, NULL),
('6ad64b3a-1680-422d-bd1c-2352288c15a9', NULL, 'registration-password-action', 'E-Health-realm', 'bc5db51e-3fcd-4c2b-974d-c9f46982d03d', 0, 50, b'0', NULL, NULL),
('6bb73a9c-970f-4664-b0e3-f51c1450f1c1', NULL, NULL, 'E-Health-realm', '359f1a81-d69c-47f7-a982-fecae16c0e1a', 2, 30, b'1', 'dd1403fc-f75f-4766-bb28-6f4b11b7e456', NULL),
('6dd7fddb-7c41-4ad6-be4a-710876666363', NULL, 'client-secret', 'E-Health-realm', '908284d3-1131-453e-a593-28cb08df87c8', 2, 10, b'0', NULL, NULL),
('7465d3a9-5108-4541-89a5-e9e57484792e', NULL, 'direct-grant-validate-username', 'master', '5c364a64-0d33-4685-a582-72b21d67d8f4', 0, 10, b'0', NULL, NULL),
('7552651c-b9b5-4200-83e9-5be3fd4286cd', NULL, 'basic-auth', 'E-Health-realm', 'b6017a56-cc38-4509-a1fc-9a6c0fc8ba84', 0, 10, b'0', NULL, NULL),
('76d14cf6-4779-4696-b762-fad362bd26a5', NULL, 'conditional-user-configured', 'E-Health-realm', 'ecd920d0-5fda-4cdf-ab26-709d63b67d23', 0, 10, b'0', NULL, NULL),
('7f04b5f1-74b4-4d23-97fd-9b76a98d072d', NULL, NULL, 'E-Health-realm', 'dd1403fc-f75f-4766-bb28-6f4b11b7e456', 1, 20, b'1', 'ecd920d0-5fda-4cdf-ab26-709d63b67d23', NULL),
('825eae7c-34a7-4820-a40c-f4f64f9e2a6a', NULL, 'conditional-user-configured', 'master', 'dc88f02e-3b8b-428f-8b5f-723a53be9c8d', 0, 10, b'0', NULL, NULL),
('8301cbe6-9554-4237-a44c-965a7c30dfc2', NULL, 'auth-username-password-form', 'E-Health-realm', 'dd1403fc-f75f-4766-bb28-6f4b11b7e456', 0, 10, b'0', NULL, NULL),
('83517d43-c933-4ccc-9342-754950b16073', NULL, 'auth-otp-form', 'master', '57b24f1a-3dc0-44fc-a862-8e43570174e2', 0, 20, b'0', NULL, NULL),
('84b2d0ab-1ad2-44ad-91a1-53e8df4d246c', NULL, 'idp-username-password-form', 'master', 'c762e2b5-323e-4078-bdb3-d445c0014904', 0, 10, b'0', NULL, NULL),
('905e69c8-8e73-4e67-ace6-1ea8f4bfb593', NULL, 'client-x509', 'master', '553538d2-8081-495d-8b32-29527e2866c5', 2, 40, b'0', NULL, NULL),
('9471c07f-b2b4-40fa-91b2-d106c0f1913c', NULL, NULL, 'E-Health-realm', '8649625e-08c8-43f0-8bd7-056cf15c2d51', 0, 20, b'1', 'c50caf66-db12-4224-b776-d9290ccd0496', NULL),
('96912379-f1f9-42ca-b0e5-ee0dcb7a2ba8', NULL, NULL, 'E-Health-realm', 'c50caf66-db12-4224-b776-d9290ccd0496', 2, 20, b'1', '12ca22de-0cbb-4d83-857d-701111066d8f', NULL),
('97e1b240-c833-4733-b10a-6003ba4669e6', NULL, NULL, 'E-Health-realm', 'e24f57ba-e94c-4d1e-b887-680017e6373b', 0, 20, b'1', 'c336b5d6-b622-4799-9083-56c84156ee35', NULL),
('982d5a95-c049-4a8f-bf43-6df56169cbed', NULL, NULL, 'master', 'e574cc14-41f0-4823-a617-52516ba5534b', 0, 20, b'1', '3a8608f2-b444-42ac-b661-8e903339a86e', NULL),
('9ad1f661-c76d-43b1-a86d-1c4999ac03f8', NULL, 'registration-recaptcha-action', 'master', 'bdc59f7e-e834-4ce6-8ede-a8182deaa9b2', 3, 60, b'0', NULL, NULL),
('a022c4a9-3692-40f2-8bfc-ad7773f791c3', NULL, 'idp-email-verification', 'master', '3a8608f2-b444-42ac-b661-8e903339a86e', 2, 10, b'0', NULL, NULL),
('a16c87f8-f89c-4293-ba19-0e172cd4d2f2', NULL, 'reset-password', 'E-Health-realm', 'ff5695ee-12b8-40b4-9b8a-ecf703ff85a0', 0, 30, b'0', NULL, NULL),
('a2166b0d-6093-4c90-826d-d41c3e4eb909', NULL, 'docker-http-basic-authenticator', 'master', '61c10917-74c7-49fc-bab0-1c8dea6e25f7', 0, 10, b'0', NULL, NULL),
('a56a51f6-c458-4e2f-801d-a13a65a5c279', NULL, NULL, 'master', '42c8bb30-0e13-40b2-be87-46cb1574cffd', 1, 40, b'1', '89836c40-7297-46b7-9511-1f0a6b2fcd30', NULL),
('a65f6e63-46fc-4d54-9979-66ecf79f49a1', NULL, 'reset-credentials-choose-user', 'master', '42c8bb30-0e13-40b2-be87-46cb1574cffd', 0, 10, b'0', NULL, NULL),
('a6e3eeb5-036b-4f32-bd4c-19fd355ecccb', NULL, 'basic-auth-otp', 'E-Health-realm', 'b6017a56-cc38-4509-a1fc-9a6c0fc8ba84', 3, 20, b'0', NULL, NULL),
('aac91d5a-2bb1-4d4a-ba55-2cb417e4badb', NULL, 'client-jwt', 'E-Health-realm', '908284d3-1131-453e-a593-28cb08df87c8', 2, 20, b'0', NULL, NULL),
('ac506b02-3f61-47ae-a94a-a4d8c401ef8c', NULL, 'conditional-user-configured', 'master', 'c550f532-fbc4-4425-a00f-c8c6b15c8b29', 0, 10, b'0', NULL, NULL),
('ae679c68-e2e0-4f8a-a00b-949d65d57b97', NULL, 'reset-otp', 'master', '89836c40-7297-46b7-9511-1f0a6b2fcd30', 0, 20, b'0', NULL, NULL),
('aea4f131-57e9-4d27-aa45-dfdc1cea1de4', NULL, 'docker-http-basic-authenticator', 'E-Health-realm', '7b6550b1-36a1-4e75-90c0-f474b2ef4d04', 0, 10, b'0', NULL, NULL),
('aee0d96c-0203-482d-9011-c9467eb0dac0', NULL, 'basic-auth-otp', 'master', '4a1a57c3-a256-4c18-9f25-838be8621dda', 3, 20, b'0', NULL, NULL),
('b3b3044b-ec86-44f9-9273-3b3de2d0c914', NULL, 'registration-page-form', 'E-Health-realm', '8ee8865c-2c85-4592-8493-e60d1d51bb29', 0, 10, b'1', 'bc5db51e-3fcd-4c2b-974d-c9f46982d03d', NULL),
('b5a4ca1a-da86-4058-8004-23d08f8e1d4d', NULL, 'conditional-user-configured', 'E-Health-realm', 'f6798216-df89-425a-930e-5e6ddc9f96e0', 0, 10, b'0', NULL, NULL),
('ba6524bc-8591-48fe-b10e-08a24f01584e', NULL, 'direct-grant-validate-otp', 'E-Health-realm', 'f6798216-df89-425a-930e-5e6ddc9f96e0', 0, 20, b'0', NULL, NULL),
('bee441dd-07a4-4ae1-90f2-c343d94b2ce2', NULL, 'registration-user-creation', 'E-Health-realm', 'bc5db51e-3fcd-4c2b-974d-c9f46982d03d', 0, 20, b'0', NULL, NULL),
('bfe448ef-a7a0-4722-b706-352542769f40', NULL, 'reset-otp', 'E-Health-realm', 'b11629ed-8c82-4eba-9416-665d62caa2f3', 0, 20, b'0', NULL, NULL),
('c04b8021-aab0-4e78-be93-c994ff34449d', NULL, 'registration-recaptcha-action', 'E-Health-realm', 'bc5db51e-3fcd-4c2b-974d-c9f46982d03d', 3, 60, b'0', NULL, NULL),
('c38908db-a654-4690-a4f9-d9b1bcce45f9', NULL, 'auth-cookie', 'E-Health-realm', '359f1a81-d69c-47f7-a982-fecae16c0e1a', 2, 10, b'0', NULL, NULL),
('c6dc95fc-4e57-4a83-8ea6-508ef79ed2f0', NULL, 'direct-grant-validate-otp', 'master', 'c550f532-fbc4-4425-a00f-c8c6b15c8b29', 0, 20, b'0', NULL, NULL),
('c744d1d0-12b1-4af6-bf21-b44cc72ba12b', NULL, 'client-secret', 'master', '553538d2-8081-495d-8b32-29527e2866c5', 2, 10, b'0', NULL, NULL),
('c7aa61cc-41bb-421c-be0e-adae070bf371', NULL, NULL, 'master', '3a8608f2-b444-42ac-b661-8e903339a86e', 2, 20, b'1', 'c762e2b5-323e-4078-bdb3-d445c0014904', NULL),
('c8f085e7-f221-48ae-8955-48b90454a386', NULL, 'auth-cookie', 'master', '34bd7dfe-375b-4917-9470-6fea31f70d36', 2, 10, b'0', NULL, NULL),
('cbaedef1-6115-4f30-9efa-f715ebeacfe9', NULL, NULL, 'master', '9bb1174d-0111-4273-9991-311ffcf5eaac', 0, 20, b'1', '9c7ea46f-dc4b-4a53-a571-7e7b3e6e8ab1', NULL),
('d23d086d-177a-4d9f-8fb9-c32482edf7a9', NULL, 'conditional-user-configured', 'E-Health-realm', 'b11629ed-8c82-4eba-9416-665d62caa2f3', 0, 10, b'0', NULL, NULL),
('d25fa409-d77a-4cb3-8a6e-931d8d9b2568', NULL, 'auth-otp-form', 'E-Health-realm', 'd2033b29-662a-4a22-8240-0dbb33f5aeea', 0, 20, b'0', NULL, NULL),
('da8bcf07-1853-4483-ac49-6c685a22a195', NULL, 'idp-username-password-form', 'E-Health-realm', '12ca22de-0cbb-4d83-857d-701111066d8f', 0, 10, b'0', NULL, NULL),
('de64f939-dd40-483d-bf7c-503db392a627', NULL, NULL, 'master', '1b409b0e-2889-45d3-acaa-2e7959f82fbd', 0, 20, b'1', '4a1a57c3-a256-4c18-9f25-838be8621dda', NULL),
('e61990db-dee7-459a-a2e1-4241d50018e1', NULL, 'idp-create-user-if-unique', 'E-Health-realm', 'c336b5d6-b622-4799-9083-56c84156ee35', 2, 10, b'0', NULL, 'df4b364d-b358-4b84-9510-07d9ada3af8e'),
('e7e38138-1634-4c07-ac0c-0ee0536454e3', NULL, 'direct-grant-validate-username', 'E-Health-realm', '276cc684-3337-4726-b71f-a14fb04c3fc4', 0, 10, b'0', NULL, NULL),
('ebaf5b45-a473-4710-a346-5b5f1b1ffb55', NULL, 'http-basic-authenticator', 'master', '64e4a56b-dd60-4e6b-812b-4a57ae2ebb76', 0, 10, b'0', NULL, NULL),
('efc6f001-24f3-4372-9537-3b0e7976178b', NULL, 'idp-review-profile', 'master', '9bb1174d-0111-4273-9991-311ffcf5eaac', 0, 10, b'0', NULL, '1fa08172-3663-4808-bf87-cb232582b222'),
('eff24e73-b2ff-45c0-9d6d-649c9c9e1418', NULL, 'client-secret-jwt', 'E-Health-realm', '908284d3-1131-453e-a593-28cb08df87c8', 2, 30, b'0', NULL, NULL),
('f6fc9851-b408-4811-81d4-af6e791a64e2', NULL, NULL, 'master', '34bd7dfe-375b-4917-9470-6fea31f70d36', 2, 30, b'1', '5f462015-41d6-46d7-8a7a-77b22d09e1ff', NULL),
('f788d8d7-14b4-42b1-9269-836dbf22afdb', NULL, 'identity-provider-redirector', 'E-Health-realm', '359f1a81-d69c-47f7-a982-fecae16c0e1a', 2, 25, b'0', NULL, NULL),
('fa0effed-82dd-403c-af2d-69cd8c7607a8', NULL, 'basic-auth', 'master', '4a1a57c3-a256-4c18-9f25-838be8621dda', 0, 10, b'0', NULL, NULL),
('fa79486e-882e-4494-8a0b-ff48412f780d', NULL, 'idp-confirm-link', 'E-Health-realm', '8649625e-08c8-43f0-8bd7-056cf15c2d51', 0, 10, b'0', NULL, NULL),
('fb0e34be-0f63-4d0f-be96-434d58e26a7b', NULL, NULL, 'E-Health-realm', 'ff5695ee-12b8-40b4-9b8a-ecf703ff85a0', 1, 40, b'1', 'b11629ed-8c82-4eba-9416-665d62caa2f3', NULL),
('fb8d36c5-63fb-440b-8e5a-1523ea51bb1d', NULL, 'registration-user-creation', 'master', 'bdc59f7e-e834-4ce6-8ede-a8182deaa9b2', 0, 20, b'0', NULL, NULL),
('fd787f48-50ff-4c87-8a6c-524e985525f5', NULL, 'http-basic-authenticator', 'E-Health-realm', 'ac766c71-670e-4d22-b494-9201a61d23bd', 0, 10, b'0', NULL, NULL),
('ff5c5ef9-56a2-47e4-997b-8197b620b872', NULL, NULL, 'E-Health-realm', 'c336b5d6-b622-4799-9083-56c84156ee35', 2, 20, b'1', '8649625e-08c8-43f0-8bd7-056cf15c2d51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authentication_flow`
--

DROP TABLE IF EXISTS `authentication_flow`;
CREATE TABLE IF NOT EXISTS `authentication_flow` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authentication_flow`
--

INSERT INTO `authentication_flow` (`ID`, `ALIAS`, `DESCRIPTION`, `REALM_ID`, `PROVIDER_ID`, `TOP_LEVEL`, `BUILT_IN`) VALUES
('12ca22de-0cbb-4d83-857d-701111066d8f', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('1b409b0e-2889-45d3-acaa-2e7959f82fbd', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', b'1', b'1'),
('276cc684-3337-4726-b71f-a14fb04c3fc4', 'direct grant', 'OpenID Connect Resource Owner Grant', 'E-Health-realm', 'basic-flow', b'1', b'1'),
('34bd7dfe-375b-4917-9470-6fea31f70d36', 'browser', 'browser based authentication', 'master', 'basic-flow', b'1', b'1'),
('359f1a81-d69c-47f7-a982-fecae16c0e1a', 'browser', 'browser based authentication', 'E-Health-realm', 'basic-flow', b'1', b'1'),
('3a8608f2-b444-42ac-b661-8e903339a86e', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', b'0', b'1'),
('42c8bb30-0e13-40b2-be87-46cb1574cffd', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', b'1', b'1'),
('4a1a57c3-a256-4c18-9f25-838be8621dda', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', b'0', b'1'),
('553538d2-8081-495d-8b32-29527e2866c5', 'clients', 'Base authentication for clients', 'master', 'client-flow', b'1', b'1'),
('57b24f1a-3dc0-44fc-a862-8e43570174e2', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('5c364a64-0d33-4685-a582-72b21d67d8f4', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', b'1', b'1'),
('5f462015-41d6-46d7-8a7a-77b22d09e1ff', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', b'0', b'1'),
('61c10917-74c7-49fc-bab0-1c8dea6e25f7', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', b'1', b'1'),
('64e4a56b-dd60-4e6b-812b-4a57ae2ebb76', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', b'1', b'1'),
('7b6550b1-36a1-4e75-90c0-f474b2ef4d04', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'E-Health-realm', 'basic-flow', b'1', b'1'),
('8649625e-08c8-43f0-8bd7-056cf15c2d51', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('89836c40-7297-46b7-9511-1f0a6b2fcd30', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', b'0', b'1'),
('8ee8865c-2c85-4592-8493-e60d1d51bb29', 'registration', 'registration flow', 'E-Health-realm', 'basic-flow', b'1', b'1'),
('908284d3-1131-453e-a593-28cb08df87c8', 'clients', 'Base authentication for clients', 'E-Health-realm', 'client-flow', b'1', b'1'),
('9bb1174d-0111-4273-9991-311ffcf5eaac', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', b'1', b'1'),
('9c7ea46f-dc4b-4a53-a571-7e7b3e6e8ab1', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', b'0', b'1'),
('ac766c71-670e-4d22-b494-9201a61d23bd', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'E-Health-realm', 'basic-flow', b'1', b'1'),
('b11629ed-8c82-4eba-9416-665d62caa2f3', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('b6017a56-cc38-4509-a1fc-9a6c0fc8ba84', 'Authentication Options', 'Authentication options.', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('bc5db51e-3fcd-4c2b-974d-c9f46982d03d', 'registration form', 'registration form', 'E-Health-realm', 'form-flow', b'0', b'1'),
('bdc59f7e-e834-4ce6-8ede-a8182deaa9b2', 'registration form', 'registration form', 'master', 'form-flow', b'0', b'1'),
('c336b5d6-b622-4799-9083-56c84156ee35', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('c50caf66-db12-4224-b776-d9290ccd0496', 'Account verification options', 'Method with which to verity the existing account', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('c550f532-fbc4-4425-a00f-c8c6b15c8b29', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('c762e2b5-323e-4078-bdb3-d445c0014904', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', b'0', b'1'),
('d2033b29-662a-4a22-8240-0dbb33f5aeea', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('dc88f02e-3b8b-428f-8b5f-723a53be9c8d', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('dd1403fc-f75f-4766-bb28-6f4b11b7e456', 'forms', 'Username, password, otp and other auth forms.', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('e24f57ba-e94c-4d1e-b887-680017e6373b', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'E-Health-realm', 'basic-flow', b'1', b'1'),
('e574cc14-41f0-4823-a617-52516ba5534b', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', b'0', b'1'),
('e7b8b49c-c627-43cb-8f18-282d23a64d55', 'registration', 'registration flow', 'master', 'basic-flow', b'1', b'1'),
('ecd920d0-5fda-4cdf-ab26-709d63b67d23', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('f654260e-9b79-43ed-83c0-6a5162205e43', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'E-Health-realm', 'basic-flow', b'1', b'1'),
('f6798216-df89-425a-930e-5e6ddc9f96e0', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'E-Health-realm', 'basic-flow', b'0', b'1'),
('ff5695ee-12b8-40b4-9b8a-ecf703ff85a0', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'E-Health-realm', 'basic-flow', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `authenticator_config`
--

DROP TABLE IF EXISTS `authenticator_config`;
CREATE TABLE IF NOT EXISTS `authenticator_config` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authenticator_config`
--

INSERT INTO `authenticator_config` (`ID`, `ALIAS`, `REALM_ID`) VALUES
('02f05873-d930-4939-ac80-721cecca74e3', 'create unique user config', 'master'),
('1fa08172-3663-4808-bf87-cb232582b222', 'review profile config', 'master'),
('af4ef3b3-59d0-4320-b2cc-9a37192c23ce', 'review profile config', 'E-Health-realm'),
('df4b364d-b358-4b84-9510-07d9ada3af8e', 'create unique user config', 'E-Health-realm');

-- --------------------------------------------------------

--
-- Table structure for table `authenticator_config_entry`
--

DROP TABLE IF EXISTS `authenticator_config_entry`;
CREATE TABLE IF NOT EXISTS `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authenticator_config_entry`
--

INSERT INTO `authenticator_config_entry` (`AUTHENTICATOR_ID`, `VALUE`, `NAME`) VALUES
('02f05873-d930-4939-ac80-721cecca74e3', 'false', 'require.password.update.after.registration'),
('1fa08172-3663-4808-bf87-cb232582b222', 'missing', 'update.profile.on.first.login'),
('af4ef3b3-59d0-4320-b2cc-9a37192c23ce', 'missing', 'update.profile.on.first.login'),
('df4b364d-b358-4b84-9510-07d9ada3af8e', 'false', 'require.password.update.after.registration');

-- --------------------------------------------------------

--
-- Table structure for table `broker_link`
--

DROP TABLE IF EXISTS `broker_link`;
CREATE TABLE IF NOT EXISTS `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8_unicode_ci,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ID`, `ENABLED`, `FULL_SCOPE_ALLOWED`, `CLIENT_ID`, `NOT_BEFORE`, `PUBLIC_CLIENT`, `SECRET`, `BASE_URL`, `BEARER_ONLY`, `MANAGEMENT_URL`, `SURROGATE_AUTH_REQUIRED`, `REALM_ID`, `PROTOCOL`, `NODE_REREG_TIMEOUT`, `FRONTCHANNEL_LOGOUT`, `CONSENT_REQUIRED`, `NAME`, `CLIENT_AUTHENTICATOR_TYPE`, `ROOT_URL`, `DESCRIPTION`, `REGISTRATION_TOKEN`, `STANDARD_FLOW_ENABLED`, `IMPLICIT_FLOW_ENABLED`, `DIRECT_ACCESS_GRANTS_ENABLED`, `ALWAYS_DISPLAY_IN_CONSOLE`, `SERVICE_ACCOUNTS_ENABLED`) VALUES
('1f47e498-886f-4ccc-9711-86fe79065a95', b'1', b'1', 'supervise-service', 0, b'1', '8891fc8e-439c-46e3-9165-d67d414bdf4d', NULL, b'0', 'http://localhost:8081', b'0', 'E-Health-realm', 'openid-connect', -1, b'0', b'0', NULL, 'client-secret', 'http://localhost:8081', NULL, NULL, b'1', b'0', b'1', b'0', b'0'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', b'1', b'0', 'admin-cli', 0, b'1', '153c2349-c7dd-4ea4-b4e8-8de4d8c4e0b9', NULL, b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0', b'0'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', b'1', 'master-realm', 0, b'0', '3bbce1bb-115c-40a7-96a8-6b37c1eef171', NULL, b'1', NULL, b'0', 'master', NULL, 0, b'0', b'0', 'master Realm', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('5baaa54c-378e-408e-9105-05a1d5d13091', b'1', b'0', 'security-admin-console', 0, b'1', '43be5194-6ea4-4589-9f12-ecf7062aa5ec', '/admin/E-Health-realm/console/', b'0', NULL, b'0', 'E-Health-realm', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('5c40faab-788e-412a-b465-bc6605675cd3', b'1', b'0', 'realm-management', 0, b'0', '9ed14b6e-f287-4d9d-ae03-7d7125bf98cf', NULL, b'1', NULL, b'0', 'E-Health-realm', 'openid-connect', 0, b'0', b'0', '${client_realm-management}', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', b'0', 'account', 0, b'0', '59839b06-1ef5-43d2-9425-f07f287b7f64', '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account}', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('70e4b505-94be-4d45-9d14-8049da830dbb', b'1', b'0', 'account-console', 0, b'1', '1169092f-6af7-4644-a39e-f4bab2042c14', '/realms/E-Health-realm/account/', b'0', NULL, b'0', 'E-Health-realm', 'openid-connect', 0, b'0', b'0', '${client_account-console}', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', b'1', b'0', 'admin-cli', 0, b'1', '394de3b2-b7ef-4685-870b-5a96341438b6', NULL, b'0', NULL, b'0', 'E-Health-realm', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0', b'0'),
('7dc25038-b359-4ebe-8740-0c4565089568', b'1', b'0', 'broker', 0, b'0', '7a47a9c1-4206-48f5-b31a-04093f38f867', NULL, b'0', NULL, b'0', 'E-Health-realm', 'openid-connect', 0, b'0', b'0', '${client_broker}', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', b'1', b'0', 'account-console', 0, b'1', 'cadc6717-61c2-436e-b9c7-ada9688a38cc', '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account-console}', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', b'1', 'E-Health-realm-realm', 0, b'0', '7d85aa2f-ca9d-480c-ac28-c07d16642266', NULL, b'1', NULL, b'0', 'master', NULL, 0, b'0', b'0', 'E-Health-realm Realm', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', b'1', b'0', 'security-admin-console', 0, b'1', '2108b438-98ce-4aa3-a882-cb5d29bc345c', '/admin/master/console/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', b'1', b'0', 'broker', 0, b'0', '9a1289a5-24b4-4249-93ab-c2587797e7a0', NULL, b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_broker}', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0', b'0'),
('f64a7574-9589-44a2-9a91-9b72f806919c', b'1', b'0', 'account', 0, b'0', '61a7697c-88fa-4de3-9fc7-e157dfaad329', '/realms/E-Health-realm/account/', b'0', NULL, b'0', 'E-Health-realm', 'openid-connect', 0, b'0', b'0', '${client_account}', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `client_attributes`
--

DROP TABLE IF EXISTS `client_attributes`;
CREATE TABLE IF NOT EXISTS `client_attributes` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_attributes`
--

INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES
('1f47e498-886f-4ccc-9711-86fe79065a95', 'false', 'backchannel.logout.revoke.offline.tokens'),
('1f47e498-886f-4ccc-9711-86fe79065a95', 'true', 'backchannel.logout.session.required'),
('5baaa54c-378e-408e-9105-05a1d5d13091', 'S256', 'pkce.code.challenge.method'),
('70e4b505-94be-4d45-9d14-8049da830dbb', 'S256', 'pkce.code.challenge.method'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', 'S256', 'pkce.code.challenge.method'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', 'S256', 'pkce.code.challenge.method');

-- --------------------------------------------------------

--
-- Table structure for table `client_auth_flow_bindings`
--

DROP TABLE IF EXISTS `client_auth_flow_bindings`;
CREATE TABLE IF NOT EXISTS `client_auth_flow_bindings` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_default_roles`
--

DROP TABLE IF EXISTS `client_default_roles`;
CREATE TABLE IF NOT EXISTS `client_default_roles` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_default_roles`
--

INSERT INTO `client_default_roles` (`CLIENT_ID`, `ROLE_ID`) VALUES
('6527d515-cf97-43d0-bacb-9cd808ab0963', '20e7f755-e9e5-4a87-9464-e8696e7e163d'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '8918d826-56f6-4b91-bede-8966a28faa63'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '8e5779b1-cf82-455f-9a54-86379515568f'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', 'b9ab7391-e649-410d-99ca-eae1c43424c7');

-- --------------------------------------------------------

--
-- Table structure for table `client_initial_access`
--

DROP TABLE IF EXISTS `client_initial_access`;
CREATE TABLE IF NOT EXISTS `client_initial_access` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_node_registrations`
--

DROP TABLE IF EXISTS `client_node_registrations`;
CREATE TABLE IF NOT EXISTS `client_node_registrations` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_scope`
--

DROP TABLE IF EXISTS `client_scope`;
CREATE TABLE IF NOT EXISTS `client_scope` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_scope`
--

INSERT INTO `client_scope` (`ID`, `NAME`, `REALM_ID`, `DESCRIPTION`, `PROTOCOL`) VALUES
('0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect'),
('0fcfd626-ae91-4e36-acf9-6264f20eeb17', 'address', 'E-Health-realm', 'OpenID Connect built-in scope: address', 'openid-connect'),
('1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', 'offline_access', 'E-Health-realm', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('29ec2cba-3e13-4d40-8f61-9b839d1ac99d', 'web-origins', 'E-Health-realm', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect'),
('38f26ec1-3504-435b-87d8-9ad674d4acb5', 'role_list', 'E-Health-realm', 'SAML role list', 'saml'),
('5352a79f-77d0-478b-8336-bd6408981799', 'profile', 'E-Health-realm', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('57db355a-ab46-4136-b4da-ac6e5bfe0fbf', 'microprofile-jwt', 'E-Health-realm', 'Microprofile - JWT built-in scope', 'openid-connect'),
('8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', 'role_list', 'master', 'SAML role list', 'saml'),
('962c7bf7-2b91-442b-bb2b-29a6ac993eca', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect'),
('970747fd-5184-4545-a91c-b274f5cec131', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect'),
('aa1b2839-0f4c-43bd-b657-28d2acf68bcf', 'roles', 'E-Health-realm', 'OpenID Connect scope for add user roles to the access token', 'openid-connect'),
('ce44b640-e405-4ea5-9ac1-df7ff8611eb0', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('df22b85e-e368-4894-b2bb-390e25230f94', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect'),
('f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', 'email', 'E-Health-realm', 'OpenID Connect built-in scope: email', 'openid-connect'),
('fa640268-dca9-460e-ae2a-ffd57017009c', 'phone', 'E-Health-realm', 'OpenID Connect built-in scope: phone', 'openid-connect');

-- --------------------------------------------------------

--
-- Table structure for table `client_scope_attributes`
--

DROP TABLE IF EXISTS `client_scope_attributes`;
CREATE TABLE IF NOT EXISTS `client_scope_attributes` (
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_scope_attributes`
--

INSERT INTO `client_scope_attributes` (`SCOPE_ID`, `VALUE`, `NAME`) VALUES
('0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', '${rolesScopeConsentText}', 'consent.screen.text'),
('0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', 'true', 'display.on.consent.screen'),
('0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', 'false', 'include.in.token.scope'),
('0fcfd626-ae91-4e36-acf9-6264f20eeb17', '${addressScopeConsentText}', 'consent.screen.text'),
('0fcfd626-ae91-4e36-acf9-6264f20eeb17', 'true', 'display.on.consent.screen'),
('0fcfd626-ae91-4e36-acf9-6264f20eeb17', 'true', 'include.in.token.scope'),
('1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', 'true', 'display.on.consent.screen'),
('29ec2cba-3e13-4d40-8f61-9b839d1ac99d', '', 'consent.screen.text'),
('29ec2cba-3e13-4d40-8f61-9b839d1ac99d', 'false', 'display.on.consent.screen'),
('29ec2cba-3e13-4d40-8f61-9b839d1ac99d', 'false', 'include.in.token.scope'),
('349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', '${emailScopeConsentText}', 'consent.screen.text'),
('349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', 'true', 'display.on.consent.screen'),
('349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', 'true', 'include.in.token.scope'),
('38f26ec1-3504-435b-87d8-9ad674d4acb5', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('38f26ec1-3504-435b-87d8-9ad674d4acb5', 'true', 'display.on.consent.screen'),
('5352a79f-77d0-478b-8336-bd6408981799', '${profileScopeConsentText}', 'consent.screen.text'),
('5352a79f-77d0-478b-8336-bd6408981799', 'true', 'display.on.consent.screen'),
('5352a79f-77d0-478b-8336-bd6408981799', 'true', 'include.in.token.scope'),
('57db355a-ab46-4136-b4da-ac6e5bfe0fbf', 'false', 'display.on.consent.screen'),
('57db355a-ab46-4136-b4da-ac6e5bfe0fbf', 'true', 'include.in.token.scope'),
('8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', 'true', 'display.on.consent.screen'),
('91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', 'true', 'display.on.consent.screen'),
('962c7bf7-2b91-442b-bb2b-29a6ac993eca', 'false', 'display.on.consent.screen'),
('962c7bf7-2b91-442b-bb2b-29a6ac993eca', 'true', 'include.in.token.scope'),
('970747fd-5184-4545-a91c-b274f5cec131', '${addressScopeConsentText}', 'consent.screen.text'),
('970747fd-5184-4545-a91c-b274f5cec131', 'true', 'display.on.consent.screen'),
('970747fd-5184-4545-a91c-b274f5cec131', 'true', 'include.in.token.scope'),
('aa1b2839-0f4c-43bd-b657-28d2acf68bcf', '${rolesScopeConsentText}', 'consent.screen.text'),
('aa1b2839-0f4c-43bd-b657-28d2acf68bcf', 'true', 'display.on.consent.screen'),
('aa1b2839-0f4c-43bd-b657-28d2acf68bcf', 'false', 'include.in.token.scope'),
('ce44b640-e405-4ea5-9ac1-df7ff8611eb0', '', 'consent.screen.text'),
('ce44b640-e405-4ea5-9ac1-df7ff8611eb0', 'false', 'display.on.consent.screen'),
('ce44b640-e405-4ea5-9ac1-df7ff8611eb0', 'false', 'include.in.token.scope'),
('df22b85e-e368-4894-b2bb-390e25230f94', '${profileScopeConsentText}', 'consent.screen.text'),
('df22b85e-e368-4894-b2bb-390e25230f94', 'true', 'display.on.consent.screen'),
('df22b85e-e368-4894-b2bb-390e25230f94', 'true', 'include.in.token.scope'),
('ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', '${phoneScopeConsentText}', 'consent.screen.text'),
('ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', 'true', 'display.on.consent.screen'),
('ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', 'true', 'include.in.token.scope'),
('f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', '${emailScopeConsentText}', 'consent.screen.text'),
('f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', 'true', 'display.on.consent.screen'),
('f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', 'true', 'include.in.token.scope'),
('fa640268-dca9-460e-ae2a-ffd57017009c', '${phoneScopeConsentText}', 'consent.screen.text'),
('fa640268-dca9-460e-ae2a-ffd57017009c', 'true', 'display.on.consent.screen'),
('fa640268-dca9-460e-ae2a-ffd57017009c', 'true', 'include.in.token.scope');

-- --------------------------------------------------------

--
-- Table structure for table `client_scope_client`
--

DROP TABLE IF EXISTS `client_scope_client`;
CREATE TABLE IF NOT EXISTS `client_scope_client` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_scope_client`
--

INSERT INTO `client_scope_client` (`CLIENT_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('1f47e498-886f-4ccc-9711-86fe79065a95', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('1f47e498-886f-4ccc-9711-86fe79065a95', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('1f47e498-886f-4ccc-9711-86fe79065a95', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('1f47e498-886f-4ccc-9711-86fe79065a95', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('1f47e498-886f-4ccc-9711-86fe79065a95', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('1f47e498-886f-4ccc-9711-86fe79065a95', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('1f47e498-886f-4ccc-9711-86fe79065a95', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('1f47e498-886f-4ccc-9711-86fe79065a95', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('1f47e498-886f-4ccc-9711-86fe79065a95', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('4590a7ff-516c-4307-8082-e9681e2a7c76', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('4d225d56-d277-4007-93f6-b9e77a5e1cfa', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('5baaa54c-378e-408e-9105-05a1d5d13091', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('5baaa54c-378e-408e-9105-05a1d5d13091', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('5baaa54c-378e-408e-9105-05a1d5d13091', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0'),
('5c40faab-788e-412a-b465-bc6605675cd3', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('5c40faab-788e-412a-b465-bc6605675cd3', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('5c40faab-788e-412a-b465-bc6605675cd3', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('5c40faab-788e-412a-b465-bc6605675cd3', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('5c40faab-788e-412a-b465-bc6605675cd3', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('5c40faab-788e-412a-b465-bc6605675cd3', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('5c40faab-788e-412a-b465-bc6605675cd3', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('5c40faab-788e-412a-b465-bc6605675cd3', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('5c40faab-788e-412a-b465-bc6605675cd3', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0'),
('70e4b505-94be-4d45-9d14-8049da830dbb', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('70e4b505-94be-4d45-9d14-8049da830dbb', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('70e4b505-94be-4d45-9d14-8049da830dbb', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('70e4b505-94be-4d45-9d14-8049da830dbb', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('70e4b505-94be-4d45-9d14-8049da830dbb', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('70e4b505-94be-4d45-9d14-8049da830dbb', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('70e4b505-94be-4d45-9d14-8049da830dbb', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('70e4b505-94be-4d45-9d14-8049da830dbb', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('70e4b505-94be-4d45-9d14-8049da830dbb', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('7bca06f5-8e96-45cc-a78f-034243bf5db9', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0'),
('7dc25038-b359-4ebe-8740-0c4565089568', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('7dc25038-b359-4ebe-8740-0c4565089568', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('7dc25038-b359-4ebe-8740-0c4565089568', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('7dc25038-b359-4ebe-8740-0c4565089568', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('7dc25038-b359-4ebe-8740-0c4565089568', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('7dc25038-b359-4ebe-8740-0c4565089568', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('7dc25038-b359-4ebe-8740-0c4565089568', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('7dc25038-b359-4ebe-8740-0c4565089568', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('7dc25038-b359-4ebe-8740-0c4565089568', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('c98aeea2-42f9-439b-aba3-4a123ade5ec8', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('f64a7574-9589-44a2-9a91-9b72f806919c', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('f64a7574-9589-44a2-9a91-9b72f806919c', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('f64a7574-9589-44a2-9a91-9b72f806919c', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `client_scope_role_mapping`
--

DROP TABLE IF EXISTS `client_scope_role_mapping`;
CREATE TABLE IF NOT EXISTS `client_scope_role_mapping` (
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_scope_role_mapping`
--

INSERT INTO `client_scope_role_mapping` (`SCOPE_ID`, `ROLE_ID`) VALUES
('1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', '376b3cd2-8dc7-4a48-988f-e9a2c5773b77'),
('8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', 'ac759ea2-2a4b-4918-885f-588de1d11750');

-- --------------------------------------------------------

--
-- Table structure for table `client_session`
--

DROP TABLE IF EXISTS `client_session`;
CREATE TABLE IF NOT EXISTS `client_session` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_session_auth_status`
--

DROP TABLE IF EXISTS `client_session_auth_status`;
CREATE TABLE IF NOT EXISTS `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_session_note`
--

DROP TABLE IF EXISTS `client_session_note`;
CREATE TABLE IF NOT EXISTS `client_session_note` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_session_prot_mapper`
--

DROP TABLE IF EXISTS `client_session_prot_mapper`;
CREATE TABLE IF NOT EXISTS `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_session_role`
--

DROP TABLE IF EXISTS `client_session_role`;
CREATE TABLE IF NOT EXISTS `client_session_role` (
  `ROLE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_user_session_note`
--

DROP TABLE IF EXISTS `client_user_session_note`;
CREATE TABLE IF NOT EXISTS `client_user_session_note` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `CLIENT_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
CREATE TABLE IF NOT EXISTS `component` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`ID`, `NAME`, `PARENT_ID`, `PROVIDER_ID`, `PROVIDER_TYPE`, `REALM_ID`, `SUB_TYPE`) VALUES
('198bf268-5fb0-41e9-a377-bf19e1522b10', 'Allowed Client Scopes', 'E-Health-realm', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'anonymous'),
('1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'Allowed Protocol Mapper Types', 'E-Health-realm', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'authenticated'),
('21c24f4d-01c2-4e25-883c-3dab14d955f5', 'rsa-generated', 'E-Health-realm', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'E-Health-realm', NULL),
('274f6c60-d7ca-433a-b72a-cf877c5a0c71', 'Allowed Client Scopes', 'E-Health-realm', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'authenticated'),
('5084e778-5556-4423-b6e3-be73cc787024', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('514aafa2-c2cc-440b-a4c8-5722bcd64b85', 'Consent Required', 'E-Health-realm', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'anonymous'),
('577792d4-a5c4-46db-8f0c-f9221e24dc3c', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('7531a7f2-0698-406d-9244-03f80b82b111', 'Allowed Protocol Mapper Types', 'E-Health-realm', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'anonymous'),
('80c6cd02-b5f3-478a-b378-145255a820f8', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('814c0a11-73cf-41cc-80f2-11d39dcfb632', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('85db5b80-a791-4041-8084-ca92d2189cca', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('8ac929e1-8455-4a30-a246-a29d3e9f0842', 'Max Clients Limit', 'E-Health-realm', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'anonymous'),
('b4db2fc7-4462-47fd-b88e-ab57a4317545', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('b5b91c8b-25d3-4168-ab22-0136e94239c2', 'Trusted Hosts', 'E-Health-realm', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'anonymous'),
('c944e763-ea12-4c03-b979-fd0997e3dbf9', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('d9acf304-da99-48ce-a4d7-68944ed423ee', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('dee3db56-8b57-4b3f-a1d9-5685c9336e2d', 'fallback-RS256', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('e7ef2842-cd55-40a7-b267-94cb0a0182d6', 'hmac-generated', 'E-Health-realm', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'E-Health-realm', NULL),
('ec52f420-75d1-43fe-b527-2321225c036c', 'aes-generated', 'E-Health-realm', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'E-Health-realm', NULL),
('edd4bceb-81e2-4cda-ad4f-18c08df3fc87', 'fallback-HS256', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('ff3b77d8-98a8-4036-8d19-331bf9bcda27', 'Full Scope Disabled', 'E-Health-realm', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'E-Health-realm', 'anonymous');

-- --------------------------------------------------------

--
-- Table structure for table `component_config`
--

DROP TABLE IF EXISTS `component_config`;
CREATE TABLE IF NOT EXISTS `component_config` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `component_config`
--

INSERT INTO `component_config` (`ID`, `COMPONENT_ID`, `NAME`, `VALUE`) VALUES
('0719d6ec-7fb5-45b6-bd2f-851b576d55da', 'dee3db56-8b57-4b3f-a1d9-5685c9336e2d', 'algorithm', 'RS256'),
('07a6b9b4-38fa-4aac-9abd-0893f441ab14', 'dee3db56-8b57-4b3f-a1d9-5685c9336e2d', 'certificate', 'MIICmzCCAYMCBgF4qRluKDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNDA2MjEzMDE5WhcNMzEwNDA2MjEzMTU5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCQTEGpzEdhKrFtf1lIyxCkkJ+QyJeX4lucsPvPb8uNZfHH1RlOmQRuCnWNXeY+Kb2XMf8XJCPjHOK/ivqgPyNZ/gxeC4SeYFoLnKF/ALm/8nf6+byYZA7SFoVM79fE6xQJ1QP+h9Ce/Msp4eCMZ2p7tfAqyWFGPgGq/Ra1f+0C54+jgFf23gVoxwhB70tq9SS63dtnnG38//4by7WAWITxwt6oEN4g3lC2pW4lZ12hsFutcIMgZgjgmsC3KLdAJmws16jkus+a4mYCeCXMYZQZ9KbRs+poeVGauf4p2jsPumrZIRhhZ3DfTiwXnN4Ab+zI1kjhKTnRrhrkpghz1xB/AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFGimSPgE33SiajG9+k44RMbXOjWQfOEagcZlQ4puUSlvoOz3dKHKiLg4BAfCMiJOYs2IS1MFhT+s6Qcg/C235djqaE+2x4FtIwy4wqGve4TkYrtewbdVv4PRw8t3xFKRBAo4/R62fhGxCpcAUfvUai3LuD10RP1xo0y37nfxm9JMTjFzVlwxWgbm4OvUGZi0u6y3nkOgQsypOV2b7+r57or5BJQxArxyWxo2v5IzfOGkZPYcNsuM5tMQ4TXGXFp4RM2PfyO2KFg0fDHxnbXusBXCBTO+3FcqkGNiALeYCr5vXNv7svpcUjvWKYqFf7Ph5I20OQCmzC0bBmc8OOoBQg='),
('0c5bfee2-6fc5-4fe4-bbb3-a307dc83bc98', '21c24f4d-01c2-4e25-883c-3dab14d955f5', 'certificate', 'MIICqzCCAZMCBgF4q+DGdDANBgkqhkiG9w0BAQsFADAZMRcwFQYDVQQDDA5FLUhlYWx0aC1yZWFsbTAeFw0yMTA0MDcxMDI3MThaFw0zMTA0MDcxMDI4NThaMBkxFzAVBgNVBAMMDkUtSGVhbHRoLXJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqX2aMK4VtRqB6Zm9jHRbpT7J26LUhgSaxCDCOcZuogkLq2mypBGKlvx+wbiapAXItrRjIyr5wsfU909xVijR0DcVvaWO5iIbaI35JPyOnZou4F3abyR2nt2GA1vibddqLENVAvdF4MVqD9rm1GlnTy5VajsGXoHjHEnhZP5EZ5zGDDYzF5Hta+EjF8i6yiFCgeeA2xpRnvC6tqlvj95cY00zyvtecm48yUWTWtFG9x7ti2LU0ONlG829uhC8juW8PJJIDnTsX0DNUFggvzul1xw7/QWRVTyao+//gNys4R28oXuAniZsEbbuhvd8oRxr3I7H76oWapfTFBFpERCEsQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBdW0HHHPe/YntCS+pvkWhIrB6Ye9Fyb1SUiWfmM4L2U0RjdAcKEvKrVI8JBAdqlNswFLtysHyY1WaqQ9WyPrZ+BpVvoMXusOytN4GMWzGCe3aZyNzc291LBQpoGNd+JjbjSCksYGoC6jiW5bJEipAPnhJR3EwFwbeoGsVqmrLgYb4KhlvJHWr4Jj/vQVzDfoEeQg0suMdr3L3rxheaM02DEuwJTTGmc9rTL8c/wHFgu8wlgqUEBh9wa8tuXQflF2JKzKXVRGI6HQa8GIV+Bpu/hIQ27y1KOan8G7eXj0UfbQC2P3Qr6J28HXZDD0l0XSm+85QL+jIZTXFkqh+Fxz0i'),
('0e7cdaa0-7a06-4aa2-ac8e-fe6d16fb29c1', 'dee3db56-8b57-4b3f-a1d9-5685c9336e2d', 'privateKey', 'MIIEpQIBAAKCAQEAkExBqcxHYSqxbX9ZSMsQpJCfkMiXl+JbnLD7z2/LjWXxx9UZTpkEbgp1jV3mPim9lzH/FyQj4xziv4r6oD8jWf4MXguEnmBaC5yhfwC5v/J3+vm8mGQO0haFTO/XxOsUCdUD/ofQnvzLKeHgjGdqe7XwKslhRj4Bqv0WtX/tAuePo4BX9t4FaMcIQe9LavUkut3bZ5xt/P/+G8u1gFiE8cLeqBDeIN5QtqVuJWddobBbrXCDIGYI4JrAtyi3QCZsLNeo5LrPmuJmAnglzGGUGfSm0bPqaHlRmrn+Kdo7D7pq2SEYYWdw304sF5zeAG/syNZI4Sk50a4a5KYIc9cQfwIDAQABAoIBADijdfKsGChvlY0hO25zJmkxyzANTFN1qffrECvv+bnalfiWEITlUvPOby25+bHUuHIsUbBHoz52DBqa9p0Hq1ybd0dCxh9UOoPsSweKxV4uUiHU/M3kGF0mMdRtIAhPLWJell7F+IEvQJ+D5Zu2y/kbBNYGjYQAuq7fAJblS6ajnpwUe54xf+JVZEaekUKpNpv+i3xCRPn4ZqprAQVOGKQ0MBC6XAOO6lGdWV6oYjpvGRSBFCkZw+XVasVNSCHc9LKrzjUpJGWtRRkw+rC3ykjdThSEuInvQl9wHDnFBZbwbWX0zp97sT/0sFsn3xyqIbEsJSmLOr8evCVlYS8Ri8ECgYEAyKj7URDtUeBX3a2QCCvlfRUA2zEoMmhRAZe62IbDiUXdjV3tYVQkQON4M9H5BftHp37PnpEaSE+6aQiES6NtjpZHHmmj0367e/SeGpz/6rtWrB22obmJdsen14rIkeSVR5nCYIZED/nIYmyCiHm5t8Lqwg5HCz5kn6SuzNPt6NcCgYEAuBf8aWT0LwQ4zbWVM95YSlPtuZtO12xsvawOM6HQ35/TcQG+umbzU19XUGs34Jk4OTjCAXpWkeBHUVNnV4SgwboRTvWfbabdC1klcI6diqHGogjKZlpjc6hA40notKImApT5Kg9XmSXKuw+IvJTpGNi4eHnzS89rw0J/i/2rWJkCgYEAsM5Ec0+o7KXyhf9yk+Cp2ybwlDKiKphEGFUra7KDBKes6e1DRqkvMIW92ls/QwgAQRO5uQw9zk2CAR5iA4vC8wpzK9cFZUubw0LtNKH11UywuAOOcr3a4/BUcdV1mSeCaY6P+SEVQ8ZhzGe0NLCc9dAnrkmKS9v0Kb6fzxdF4A0CgYEAiJXDQK8WPIv1WSqQOJuPBhafGkaQiGR5iYBOSSCVyFTcm8ufps0bW5AxSAlEu+7yOAJUbqRF9pVgVIZ89gIBA7r5fIvgbYqQFgteK9SkLmc46J99C9OkVftPqVL8xIhJi0DcXMhlRcs0TvWHjeMtzrF8rGZOjMCoQ4bi+wqKRoECgYEAid4zJWnMFVIomH6vnttvroTZYauhdC1/aZpMz2WAL+nbOEM1RjfSLWxm2IGn0kSWmbTfVvbrX/1xCLn/G9oxsZI7Af1djsCErdxCim+LhP6kgZgoECGYXCJt1u9TASfCpQuuV9nf7hwAJ4VX8b6BlN6xCyp6tRTquWfdqiK7Eyk='),
('19f3103d-ccfd-4260-b643-e408c6bdd07b', 'e7ef2842-cd55-40a7-b267-94cb0a0182d6', 'algorithm', 'HS256'),
('1bbd723b-399c-45cd-b055-6351c6525481', 'ec52f420-75d1-43fe-b527-2321225c036c', 'secret', 'bNM3a7y85KrAuL6qIniKIw'),
('23db41ae-13ef-4eda-8345-a944d7dfb50c', '21c24f4d-01c2-4e25-883c-3dab14d955f5', 'privateKey', 'MIIEpAIBAAKCAQEAqX2aMK4VtRqB6Zm9jHRbpT7J26LUhgSaxCDCOcZuogkLq2mypBGKlvx+wbiapAXItrRjIyr5wsfU909xVijR0DcVvaWO5iIbaI35JPyOnZou4F3abyR2nt2GA1vibddqLENVAvdF4MVqD9rm1GlnTy5VajsGXoHjHEnhZP5EZ5zGDDYzF5Hta+EjF8i6yiFCgeeA2xpRnvC6tqlvj95cY00zyvtecm48yUWTWtFG9x7ti2LU0ONlG829uhC8juW8PJJIDnTsX0DNUFggvzul1xw7/QWRVTyao+//gNys4R28oXuAniZsEbbuhvd8oRxr3I7H76oWapfTFBFpERCEsQIDAQABAoIBAQCIyyTNMVO3zWMYxMqlN6xX3CtTJ0JbwA+hR8c6lhrokGBownA51yaB4dv0QigdRcXPIBv7YE4glOQfjnCs11kvsaXMYHjK6LAyXJO+9E+uh6hZ0aXgmg9a/POSdnBzsq6wds+AC07MsMh/b29p9IA6+exaRrVHRZGlXUObHVTcQeuLRhKcIcu/BEK4bpiDARNI9KtbAl0HHX63rYsMrY3rrWk+Xw5nIQUxJU2wgo18eR8inkdfaIJBupgcOU/GXlWx7RXeuMlEVmXtnUoH3g80jdhwkLs50B03SseZau3JKNvQlmn8A/DWMIA07OW4fm1yPHwldCacC1m1CG+cUXohAoGBAOjRmTFfru0+fo565LCOX3hJV2QC+mNS3yLjBFW9SYArsOGBUciMDAAQdKzkxob18wR5I1Uac/uBzbRYgcdRQJtLJbeIEPetee1YFSUWdjPtn+We6t0aGKCSF2TeNvC+q0ts/k4KNOGEwDdALXl5VaxxxPlUTYSdP3kJBpG+8zAlAoGBALpdz4kWo8N4wttAkZpO/hzWXLsq5cPflduZPHMgc7k9BlvGYmgdJ4wiOdgKCMj5BKuxfgK6uVGkn9cXRO1m2eSC3jcftGKD6ndLBHuSRm6USgvcVQQJriZs1e2Zcvfx+jwJc6uBOShPc8Q7FLoiZ0Rf8oSna84dmZqiWHqppKadAoGAY5GgLpl5OkVL4qt0On3pHoxfL4qGgwviGg10wSZe1M3aq9aen2Ilj7F59KcysG1nLTaRgcf6akmtK7/eYNvDAac1zjQG7aXnSzYsdNwSWUr64zz/vOd4ONPB5YWTgYpJv8wxRjbfPsODYR21VQorNcDCOM9xB5Ionx7ZDGPZpXECgYBYT4G7VUYOp1e2a3dTZqEVayKP8njkAzvQzmENsNAFc/xiWrRg34fQ6Jr+W2rkSNPExBuREYglPtwbIUShNj6EANtpxZVFpXriQmMCZ0MGvTAFRMfoXOnv/Vy19SO8iCZqcpQkLdy21EdoMhLVTN4gUVLrNyZnijEyTEGfBmomJQKBgQDK9KkmwNwcjQXxLkkQg/37VRsOM+Cua6wfo8ThCK15ABk0Ak9wabsRCLQKG3upLeAgrb8rGnT8235h7/7nvxHT1VcslQnWtNYbFNurvy5YMDBPChpneHneqak8JZ35T3E27aOi0b3UIIKJuVjInQ8ksqFt+WMbZYI/UUP6EOp4Nw=='),
('29647222-e949-42ee-ac23-5ece14d9434f', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('2ae83c20-2a1b-4fa3-bd35-1a889e8ef63f', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('2c8ca169-b0b6-4636-99d5-25f80065664b', 'edd4bceb-81e2-4cda-ad4f-18c08df3fc87', 'secret', 'eq4en295jMqyQtQqBcKW4YP2jFJwjIPjJyGMfTIxbuy5ujpZcCxYE30CHUUL4fS5Nft9HZ2vtLnics18SDGsaQ'),
('2c8f61d1-aa29-4c65-a6fa-d4779bce1c12', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('2c91d0e3-70a9-4d49-ac25-aa0cf779da4a', 'c944e763-ea12-4c03-b979-fd0997e3dbf9', 'allow-default-scopes', 'true'),
('3083912b-f93b-48db-9b81-bd6846ff2680', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('35070795-ba7a-4e47-bbe6-557813197499', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('3830ccdb-5753-41c1-b52e-b15577d7da1a', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('3905ff13-c494-4fbf-a106-ab972b790351', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('3a2645c9-4baa-4769-9610-829664353e32', '85db5b80-a791-4041-8084-ca92d2189cca', 'client-uris-must-match', 'true'),
('3a8a96f3-09ad-45a1-ac79-6ca9bdb809ee', 'dee3db56-8b57-4b3f-a1d9-5685c9336e2d', 'priority', '-100'),
('3bc82cdd-24d0-440a-a081-829a03c846c7', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('3e0bc4c0-c18a-49d6-81ad-e91ac4b295c8', 'e7ef2842-cd55-40a7-b267-94cb0a0182d6', 'priority', '100'),
('434b0d99-962d-485d-b7c7-391d6644e3b4', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('43bdc5b4-2510-4fca-bcb1-d6ffb848e528', 'ec52f420-75d1-43fe-b527-2321225c036c', 'priority', '100'),
('4afcb4d5-35b4-4386-9e00-8a89f44dc711', 'b4db2fc7-4462-47fd-b88e-ab57a4317545', 'allow-default-scopes', 'true'),
('4ecf829a-ae03-433e-a569-9202ac3384fc', '8ac929e1-8455-4a30-a246-a29d3e9f0842', 'max-clients', '200'),
('555aa0ac-3133-4b8f-88b5-d2460f09cd08', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('60729f64-cb2c-42c0-a717-f6b89c4c1d40', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('687a8255-4480-479d-9748-53cfe81b6afd', 'edd4bceb-81e2-4cda-ad4f-18c08df3fc87', 'priority', '-100'),
('6aa2f897-c8be-4b8c-afe4-7616fad67e83', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('6b906699-68eb-422a-87fe-63294d781ba1', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('6e0261c1-485a-4996-8294-93023e72f4dd', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('72401fa6-f343-4264-be02-a5cc99c4fc4f', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('72d5823d-1cc9-49ad-b100-14147154cddd', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('75fbb012-1d6e-4b53-9a2c-27ee77555f8f', '577792d4-a5c4-46db-8f0c-f9221e24dc3c', 'max-clients', '200'),
('78aa9de6-89ba-48e1-83c6-321f08ebf03f', '85db5b80-a791-4041-8084-ca92d2189cca', 'host-sending-registration-request-must-match', 'true'),
('80697570-0dc9-4b1a-b42d-7e18adf8a395', 'e7ef2842-cd55-40a7-b267-94cb0a0182d6', 'secret', 'VX4qn4cE1Ufrphc8GSiBu1qLprdJUKBOsALcDGjNaYLzaxpDEwU4dtxRAWJ91IH-HaAG3gEWgNMlCQ54HbCLCA'),
('813aa21a-5c19-4564-affe-129eb0be48b4', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('93a0b96f-48e8-4f23-ad32-32d6fde1ad2c', 'edd4bceb-81e2-4cda-ad4f-18c08df3fc87', 'kid', 'cbfa81a7-71a7-427d-9f45-03dc8aaaf45d'),
('956060b0-a322-4179-98e6-e9a7acc24457', 'b5b91c8b-25d3-4168-ab22-0136e94239c2', 'host-sending-registration-request-must-match', 'true'),
('9ac44076-9b82-454b-94bd-bd9f02b07413', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('9ae12893-5397-471f-9ac3-506b14daaee1', 'ec52f420-75d1-43fe-b527-2321225c036c', 'kid', '3bcd3077-12dc-4afc-b026-94cb0ddca1f1'),
('9c28e100-d1c6-48c3-93b0-6ad11b4b216b', 'e7ef2842-cd55-40a7-b267-94cb0a0182d6', 'kid', '0fef3774-5d87-4cd9-a49e-564901eb7acc'),
('a8ba6c06-2898-4829-9561-44ecf3abbccf', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('a8f27167-15b7-48e2-b26c-5ee2c363a6f6', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('aa1b547b-8e0c-4fa3-bcd8-766867645543', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('ae6db650-9b8c-4582-a1ab-268a44178b16', '21c24f4d-01c2-4e25-883c-3dab14d955f5', 'priority', '100'),
('b4a4fced-6a64-4a40-bf0c-e25b0f62b832', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('b600413b-a817-4f68-9a3e-b10fde165c8c', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('ba54b775-7219-4f3c-b05e-6a12a82dac16', '7531a7f2-0698-406d-9244-03f80b82b111', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('bc6df0e6-3014-4621-bfa8-d80c1a4f52c9', 'b5b91c8b-25d3-4168-ab22-0136e94239c2', 'client-uris-must-match', 'true'),
('c7c164e1-1c0e-43bf-867e-eb891d137480', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('c9e78368-5165-4c45-8bcc-fec3468d1586', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('cb33ad25-7155-4cc8-81ab-0ced05275a7a', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('d24effbc-2d1a-4a04-94a5-3393c79c22f7', '198bf268-5fb0-41e9-a377-bf19e1522b10', 'allow-default-scopes', 'true'),
('de276de5-1c07-4099-ac58-c489c422a71c', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('de70f2f1-3087-402b-b2c4-f42ad6101ecc', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('e1c9cd69-7bf2-4d23-839e-b284c83ef30c', '814c0a11-73cf-41cc-80f2-11d39dcfb632', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('e3f422c1-0922-417b-8af4-2bbe2494b128', '80c6cd02-b5f3-478a-b378-145255a820f8', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('edc47f5e-18da-4c6c-b02e-c6f67c006a9c', '274f6c60-d7ca-433a-b72a-cf877c5a0c71', 'allow-default-scopes', 'true'),
('f3aa383d-eba6-445d-a455-6e6ca4e12f71', '1b1ebcfd-de5e-4a60-8189-6cfccdc9a6e4', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('fd58a4ac-acb8-48c5-9179-08c56947f999', 'edd4bceb-81e2-4cda-ad4f-18c08df3fc87', 'algorithm', 'HS256');

-- --------------------------------------------------------

--
-- Table structure for table `composite_role`
--

DROP TABLE IF EXISTS `composite_role`;
CREATE TABLE IF NOT EXISTS `composite_role` (
  `COMPOSITE` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `composite_role`
--

INSERT INTO `composite_role` (`COMPOSITE`, `CHILD_ROLE`) VALUES
('01e8ec14-6d48-4cca-b807-d0c8c870336d', '012673ff-fe2f-4fd0-a143-baa960cbcb80'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '039abf0d-b3b3-4adb-9d9b-c6e17b67a555'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '04aa1be7-4866-426d-b0cc-411fdeed6856'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '145270d8-05f0-40cc-9028-2224cdf539d6'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '18c75ee1-dd5e-4771-b834-4f87fe4a3ec0'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '25ef810d-63a6-4d94-8624-192b5ded2cdd'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '2a7ce190-8136-42f7-9308-273bcdb36361'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '376ff3cc-3dba-4f16-956c-84470eef52e8'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '3a36958e-651d-47e2-a4ce-719e69c50db7'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '3c2dc323-5bf0-4435-8c1f-eebb5e2b9ca1'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '445e3a81-35b3-4a56-b012-a29f47cc0d56'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '504dbacc-c609-4775-a19c-79ddb2fad1b9'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '504ed2e3-a81c-4827-9c3d-0219e0668b26'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '5209e06b-cd54-46c0-b3c5-9c1b4e4346b2'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '5fc72957-db8d-47bb-b4f0-f94663a37192'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '65f823ab-495f-47f6-8406-c2abd554f666'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '666a2f3e-b31d-455b-89bf-b75c520aee85'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '76b1772f-382a-44c7-98a5-44112b8492bf'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '7e68f12a-0966-463e-be9e-4f11cf9705ee'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '845e943b-a99d-4b6a-b6f7-b43b16cd223e'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '8dd1bfd7-6a0e-4fd6-8491-502a2569baab'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '8e4cfdba-d102-4622-a95a-6bc228d6f3d7'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '97e1e2c2-8d08-4154-bfa9-f7f34c89d46b'),
('076e5c21-46b8-4d35-9171-54448c563fc0', '97f8c72a-f4af-4575-83f2-f28bea54707d'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'a5060d08-fbbc-4411-84f8-d3a7f1486dfb'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'a64cafda-59a4-49a2-97cc-dc33a2293715'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'a8fff8f2-374c-4a5d-9e58-4eca91b22d13'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'af9e7b68-e3ec-4c36-8a41-ff499e8d19d9'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'b1309e41-4b16-49c6-a2aa-2aaa62dcaf5c'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'b414d725-ed97-4709-a76a-c041d4798dea'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'c58947ba-ff0a-42e7-8364-53fe3f7fabea'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'cab06a8e-6e30-4e07-8ab1-3a5843e0b870'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'd84e933d-a49b-4eb8-9bb7-93e91af3c2a1'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'db0b0ec2-28f0-48a6-99b4-fa84fed61c84'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'de739798-58c6-4702-b7aa-4e2e0f547333'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'e4009fd2-3c58-4cd2-86a1-b7a41733539e'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'ec6bcbe8-e4ab-48c4-ace6-4c2f65559bf8'),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'f7635b59-0bb2-45c7-80b3-d751ff64738e'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '1bfcfa88-6b9c-4810-9922-f6eecd51f51f'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '24fd5f0f-ecaa-492d-a3c5-ce3bf7f85ee7'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '2fade3ca-cebc-4742-93b5-a4eac9cc9bcb'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '312eb254-a174-4a9c-b1aa-f7fd34b2981a'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '633bc812-72af-492c-8e21-4b45a896f43b'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '75678c51-5c41-46ce-ac59-06fb9994ffce'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '9eb60690-36d1-493c-ae11-a48a2d217726'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'aa35dddc-fa2e-4544-87f7-b7fd37815eea'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'b1a1e2f2-3c4c-4f9f-b260-9bd687c89aec'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'b31bca24-2d50-4727-8dd2-e7f68933141c'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'c9bbe47a-b260-4971-b77f-028e69c4ad9a'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'd447b5d2-124e-49e5-ae25-0094ed851c14'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'd9d70e05-cc62-49ae-86c0-4a5598b669ab'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'e74e0d0f-2331-4998-bba5-2b57d0261f5f'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'eaa03722-1b54-4738-8dbf-3b2fc21cc64b'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'f6f8b72a-566d-4993-afff-ba235fd1d130'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'f78700e1-8366-4cdd-85fb-300cf8fbaeeb'),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', 'f97319a9-e402-4671-87d7-471bb18bb7ce'),
('25ef810d-63a6-4d94-8624-192b5ded2cdd', 'db0b0ec2-28f0-48a6-99b4-fa84fed61c84'),
('3a36958e-651d-47e2-a4ce-719e69c50db7', '376ff3cc-3dba-4f16-956c-84470eef52e8'),
('3a36958e-651d-47e2-a4ce-719e69c50db7', 'b1309e41-4b16-49c6-a2aa-2aaa62dcaf5c'),
('504dbacc-c609-4775-a19c-79ddb2fad1b9', '18c75ee1-dd5e-4771-b834-4f87fe4a3ec0'),
('666a2f3e-b31d-455b-89bf-b75c520aee85', '7e68f12a-0966-463e-be9e-4f11cf9705ee'),
('666a2f3e-b31d-455b-89bf-b75c520aee85', 'a8fff8f2-374c-4a5d-9e58-4eca91b22d13'),
('8e5779b1-cf82-455f-9a54-86379515568f', 'e8febd7e-03fc-4635-b39d-73600484f5cc'),
('b47d9b3b-afbd-4edf-962e-71d7aeaa005a', '09502579-f484-4f5d-83c1-15fa723ec92e'),
('b9ab7391-e649-410d-99ca-eae1c43424c7', '0a9baf87-d23e-40ef-8f3c-e92453f88569'),
('c9bbe47a-b260-4971-b77f-028e69c4ad9a', 'b1a1e2f2-3c4c-4f9f-b260-9bd687c89aec'),
('c9bbe47a-b260-4971-b77f-028e69c4ad9a', 'f97319a9-e402-4671-87d7-471bb18bb7ce'),
('eaa03722-1b54-4738-8dbf-3b2fc21cc64b', 'e74e0d0f-2331-4998-bba5-2b57d0261f5f');

-- --------------------------------------------------------

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
CREATE TABLE IF NOT EXISTS `credential` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credential`
--

INSERT INTO `credential` (`ID`, `SALT`, `TYPE`, `USER_ID`, `CREATED_DATE`, `USER_LABEL`, `SECRET_DATA`, `CREDENTIAL_DATA`, `PRIORITY`) VALUES
('2bafc9c5-a239-4566-b5bc-b574a029ddf1', NULL, 'password', 'f7f97471-4c96-45c2-8f81-464cdcb02129', 1617791483577, NULL, '{\"value\":\"CV2rchutEhQ5ZWCL3UCS7wsF727xmlxEVm/CgUiGDl1aCMpgX2je4AIUnstf700jJyKYVJqUdMPGcWuGMOf4sw==\",\"salt\":\"WQ1vXZDsM9K8W0I3medtcA==\",\"additionalParameters\":{}}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}', 10),
('63cc610c-9b04-476c-abf7-a81dfdeb880c', NULL, 'password', '6a093b68-2300-4301-b8ae-9237727f9940', 1617744641662, NULL, '{\"value\":\"DfPVL9lQmOwT1S+DF9o4cgwGWV/BRTdXvDWSb+hZqMpr2q+1djHdUO6GKvSPsNTBZpvBTsX9NxXHHs426jLuLg==\",\"salt\":\"OnWP53cts4+s2KCJ9hnygg==\",\"additionalParameters\":{}}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}', 10);

-- --------------------------------------------------------

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE IF NOT EXISTS `databasechangelog` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `databasechangelog`
--

INSERT INTO `databasechangelog` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2021-04-06 19:13:57', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2021-04-06 19:14:08', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2021-04-06 19:16:03', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2021-04-06 19:16:24', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2021-04-06 19:22:44', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2021-04-06 19:22:59', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2021-04-06 19:26:38', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2021-04-06 19:26:38', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2021-04-06 19:27:04', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2021-04-06 19:35:50', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2021-04-06 19:46:59', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2021-04-06 19:47:48', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2021-04-06 20:25:38', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-04-06 20:26:21', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-04-06 20:26:21', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-04-06 20:26:21', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-04-06 20:26:21', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2021-04-06 20:27:52', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2021-04-06 20:28:44', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2021-04-06 20:28:44', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-04-06 20:28:44', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-04-06 20:28:44', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2021-04-06 20:29:24', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2021-04-06 20:29:24', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2021-04-06 20:29:24', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2021-04-06 20:29:29', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2021-04-06 20:29:58', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2021-04-06 20:30:39', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2021-04-06 20:30:53', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2021-04-06 20:31:20', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2021-04-06 20:31:53', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2021-04-06 20:31:53', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-04-06 20:31:53', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-04-06 20:31:53', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-04-06 20:31:59', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2021-04-06 20:32:41', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-04-06 20:32:42', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2021-04-06 20:32:42', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2021-04-06 20:32:43', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-04-06 20:32:43', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-04-06 20:32:43', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2021-04-06 20:32:43', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-04-06 20:33:48', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2021-04-06 20:33:48', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-04-06 20:33:50', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-04-06 20:33:50', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-04-06 20:33:50', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-04-06 20:34:10', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-04-06 20:34:40', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2021-04-06 20:35:10', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2021-04-06 20:35:42', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2021-04-06 20:35:55', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2021-04-06 20:36:09', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-04-06 20:36:18', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-04-06 20:36:29', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-04-06 20:36:50', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-04-06 20:38:30', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2021-04-06 20:38:45', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2021-04-06 20:38:55', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-04-06 20:39:14', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-04-06 20:39:19', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2021-04-06 20:39:27', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2021-04-06 20:39:34', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-04-06 20:40:23', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2021-04-06 20:41:05', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-04-06 20:41:22', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2021-04-06 20:41:22', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2021-04-06 20:41:24', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2021-04-06 20:41:25', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2021-04-06 20:41:40', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-04-06 20:41:40', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-04-06 20:41:40', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-04-06 20:42:21', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-04-06 20:42:30', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-04-06 20:42:38', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-04-06 20:42:39', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-04-06 20:42:39', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-04-06 20:42:58', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-04-06 20:43:07', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-04-06 20:43:07', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-04-06 20:43:07', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-04-06 20:43:08', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-04-06 20:43:08', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-04-06 20:43:09', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2021-04-06 20:43:09', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-04-06 20:43:10', 87, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-04-06 20:43:10', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '7725914350'),
('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2021-04-06 21:27:10', 89, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '7738262120');

-- --------------------------------------------------------

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE IF NOT EXISTS `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `databasechangeloglock`
--

INSERT INTO `databasechangeloglock` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, b'0', NULL, NULL),
(1000, b'0', NULL, NULL),
(1001, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_client_scope`
--

DROP TABLE IF EXISTS `default_client_scope`;
CREATE TABLE IF NOT EXISTS `default_client_scope` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_client_scope`
--

INSERT INTO `default_client_scope` (`REALM_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('E-Health-realm', '0fcfd626-ae91-4e36-acf9-6264f20eeb17', b'0'),
('E-Health-realm', '1b9c7bd4-415d-4cb0-86d1-b6dbd21285ba', b'0'),
('E-Health-realm', '29ec2cba-3e13-4d40-8f61-9b839d1ac99d', b'1'),
('E-Health-realm', '38f26ec1-3504-435b-87d8-9ad674d4acb5', b'1'),
('E-Health-realm', '5352a79f-77d0-478b-8336-bd6408981799', b'1'),
('E-Health-realm', '57db355a-ab46-4136-b4da-ac6e5bfe0fbf', b'0'),
('E-Health-realm', 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf', b'1'),
('E-Health-realm', 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1', b'1'),
('E-Health-realm', 'fa640268-dca9-460e-ae2a-ffd57017009c', b'0'),
('master', '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5', b'1'),
('master', '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b', b'1'),
('master', '8ab8ce98-91ff-48a8-aaa1-a2ff52940c3f', b'0'),
('master', '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24', b'1'),
('master', '962c7bf7-2b91-442b-bb2b-29a6ac993eca', b'0'),
('master', '970747fd-5184-4545-a91c-b274f5cec131', b'0'),
('master', 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0', b'1'),
('master', 'df22b85e-e368-4894-b2bb-390e25230f94', b'1'),
('master', 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `event_entity`
--

DROP TABLE IF EXISTS `event_entity`;
CREATE TABLE IF NOT EXISTS `event_entity` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text COLLATE utf8_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `federated_identity`
--

DROP TABLE IF EXISTS `federated_identity`;
CREATE TABLE IF NOT EXISTS `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8_unicode_ci,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `federated_user`
--

DROP TABLE IF EXISTS `federated_user`;
CREATE TABLE IF NOT EXISTS `federated_user` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fed_user_attribute`
--

DROP TABLE IF EXISTS `fed_user_attribute`;
CREATE TABLE IF NOT EXISTS `fed_user_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fed_user_consent`
--

DROP TABLE IF EXISTS `fed_user_consent`;
CREATE TABLE IF NOT EXISTS `fed_user_consent` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fed_user_consent_cl_scope`
--

DROP TABLE IF EXISTS `fed_user_consent_cl_scope`;
CREATE TABLE IF NOT EXISTS `fed_user_consent_cl_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fed_user_credential`
--

DROP TABLE IF EXISTS `fed_user_credential`;
CREATE TABLE IF NOT EXISTS `fed_user_credential` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fed_user_group_membership`
--

DROP TABLE IF EXISTS `fed_user_group_membership`;
CREATE TABLE IF NOT EXISTS `fed_user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fed_user_required_action`
--

DROP TABLE IF EXISTS `fed_user_required_action`;
CREATE TABLE IF NOT EXISTS `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fed_user_role_mapping`
--

DROP TABLE IF EXISTS `fed_user_role_mapping`;
CREATE TABLE IF NOT EXISTS `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_attribute`
--

DROP TABLE IF EXISTS `group_attribute`;
CREATE TABLE IF NOT EXISTS `group_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_role_mapping`
--

DROP TABLE IF EXISTS `group_role_mapping`;
CREATE TABLE IF NOT EXISTS `group_role_mapping` (
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identity_provider`
--

DROP TABLE IF EXISTS `identity_provider`;
CREATE TABLE IF NOT EXISTS `identity_provider` (
  `INTERNAL_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identity_provider_config`
--

DROP TABLE IF EXISTS `identity_provider_config`;
CREATE TABLE IF NOT EXISTS `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `identity_provider_mapper`
--

DROP TABLE IF EXISTS `identity_provider_mapper`;
CREATE TABLE IF NOT EXISTS `identity_provider_mapper` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `idp_mapper_config`
--

DROP TABLE IF EXISTS `idp_mapper_config`;
CREATE TABLE IF NOT EXISTS `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keycloak_group`
--

DROP TABLE IF EXISTS `keycloak_group`;
CREATE TABLE IF NOT EXISTS `keycloak_group` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keycloak_role`
--

DROP TABLE IF EXISTS `keycloak_role`;
CREATE TABLE IF NOT EXISTS `keycloak_role` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `keycloak_role`
--

INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('012673ff-fe2f-4fd0-a143-baa960cbcb80', 'f64a7574-9589-44a2-9a91-9b72f806919c', b'1', '${role_view-consent}', 'view-consent', 'E-Health-realm', 'f64a7574-9589-44a2-9a91-9b72f806919c', NULL),
('01e8ec14-6d48-4cca-b807-d0c8c870336d', 'f64a7574-9589-44a2-9a91-9b72f806919c', b'1', '${role_manage-consent}', 'manage-consent', 'E-Health-realm', 'f64a7574-9589-44a2-9a91-9b72f806919c', NULL),
('039abf0d-b3b3-4adb-9d9b-c6e17b67a555', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_manage-events}', 'manage-events', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('04aa1be7-4866-426d-b0cc-411fdeed6856', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_manage-realm}', 'manage-realm', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('076e5c21-46b8-4d35-9171-54448c563fc0', 'master', b'0', '${role_admin}', 'admin', 'master', NULL, 'master'),
('09502579-f484-4f5d-83c1-15fa723ec92e', '6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', '${role_view-consent}', 'view-consent', 'master', '6527d515-cf97-43d0-bacb-9cd808ab0963', NULL),
('0a9baf87-d23e-40ef-8f3c-e92453f88569', '6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', '${role_manage-account-links}', 'manage-account-links', 'master', '6527d515-cf97-43d0-bacb-9cd808ab0963', NULL),
('0e39ff23-9e50-4265-85d9-bde91aeaa916', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_realm-admin}', 'realm-admin', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('145270d8-05f0-40cc-9028-2224cdf539d6', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('18c75ee1-dd5e-4771-b834-4f87fe4a3ec0', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_query-clients}', 'query-clients', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('1bfcfa88-6b9c-4810-9922-f6eecd51f51f', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_create-client}', 'create-client', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('20e7f755-e9e5-4a87-9464-e8696e7e163d', '6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', '${role_view-profile}', 'view-profile', 'master', '6527d515-cf97-43d0-bacb-9cd808ab0963', NULL),
('24fd5f0f-ecaa-492d-a3c5-ce3bf7f85ee7', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_manage-users}', 'manage-users', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('25ef810d-63a6-4d94-8624-192b5ded2cdd', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_view-clients}', 'view-clients', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('2a7ce190-8136-42f7-9308-273bcdb36361', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_view-realm}', 'view-realm', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('2af09840-b4e0-4083-803c-8dd732f3d88b', '6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', '${role_delete-account}', 'delete-account', 'master', '6527d515-cf97-43d0-bacb-9cd808ab0963', NULL),
('2fade3ca-cebc-4742-93b5-a4eac9cc9bcb', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_impersonation}', 'impersonation', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('312eb254-a174-4a9c-b1aa-f7fd34b2981a', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_view-events}', 'view-events', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('376b3cd2-8dc7-4a48-988f-e9a2c5773b77', 'E-Health-realm', b'0', '${role_offline-access}', 'offline_access', 'E-Health-realm', NULL, 'E-Health-realm'),
('376ff3cc-3dba-4f16-956c-84470eef52e8', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_query-users}', 'query-users', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('3a36958e-651d-47e2-a4ce-719e69c50db7', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_view-users}', 'view-users', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('3c2dc323-5bf0-4435-8c1f-eebb5e2b9ca1', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_manage-clients}', 'manage-clients', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('445e3a81-35b3-4a56-b012-a29f47cc0d56', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('504dbacc-c609-4775-a19c-79ddb2fad1b9', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_view-clients}', 'view-clients', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('504ed2e3-a81c-4827-9c3d-0219e0668b26', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_view-authorization}', 'view-authorization', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('5209e06b-cd54-46c0-b3c5-9c1b4e4346b2', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('5fc72957-db8d-47bb-b4f0-f94663a37192', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_create-client}', 'create-client', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('633bc812-72af-492c-8e21-4b45a896f43b', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_manage-events}', 'manage-events', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('65f823ab-495f-47f6-8406-c2abd554f666', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_view-authorization}', 'view-authorization', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('666a2f3e-b31d-455b-89bf-b75c520aee85', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_view-users}', 'view-users', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('6d29a9ab-8d2b-4fa8-88f1-b66293889c1b', 'master', b'0', '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master'),
('75678c51-5c41-46ce-ac59-06fb9994ffce', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('76b1772f-382a-44c7-98a5-44112b8492bf', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_manage-clients}', 'manage-clients', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('7e68f12a-0966-463e-be9e-4f11cf9705ee', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_query-groups}', 'query-groups', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('845e943b-a99d-4b6a-b6f7-b43b16cd223e', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_view-events}', 'view-events', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('8918d826-56f6-4b91-bede-8966a28faa63', 'f64a7574-9589-44a2-9a91-9b72f806919c', b'1', '${role_view-profile}', 'view-profile', 'E-Health-realm', 'f64a7574-9589-44a2-9a91-9b72f806919c', NULL),
('8dd1bfd7-6a0e-4fd6-8491-502a2569baab', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_view-events}', 'view-events', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('8e4cfdba-d102-4622-a95a-6bc228d6f3d7', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('8e5779b1-cf82-455f-9a54-86379515568f', 'f64a7574-9589-44a2-9a91-9b72f806919c', b'1', '${role_manage-account}', 'manage-account', 'E-Health-realm', 'f64a7574-9589-44a2-9a91-9b72f806919c', NULL),
('9718ba60-923b-4fb6-a676-ecffb6a95f0e', 'f64a7574-9589-44a2-9a91-9b72f806919c', b'1', '${role_delete-account}', 'delete-account', 'E-Health-realm', 'f64a7574-9589-44a2-9a91-9b72f806919c', NULL),
('97e1e2c2-8d08-4154-bfa9-f7f34c89d46b', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_create-client}', 'create-client', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('97f8c72a-f4af-4575-83f2-f28bea54707d', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('9cc2c4af-8caa-48de-b060-4829e69cb05c', '7dc25038-b359-4ebe-8740-0c4565089568', b'1', '${role_read-token}', 'read-token', 'E-Health-realm', '7dc25038-b359-4ebe-8740-0c4565089568', NULL),
('9eb60690-36d1-493c-ae11-a48a2d217726', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_manage-authorization}', 'manage-authorization', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('a5060d08-fbbc-4411-84f8-d3a7f1486dfb', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('a64cafda-59a4-49a2-97cc-dc33a2293715', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_impersonation}', 'impersonation', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('a8fff8f2-374c-4a5d-9e58-4eca91b22d13', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_query-users}', 'query-users', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('a97930d6-b8d5-483b-ae7b-2581222e8233', 'E-Health-realm', b'0', '${role_admin}', 'admin', 'E-Health-realm', NULL, 'E-Health-realm'),
('aa35dddc-fa2e-4544-87f7-b7fd37815eea', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_manage-realm}', 'manage-realm', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('ac759ea2-2a4b-4918-885f-588de1d11750', 'master', b'0', '${role_offline-access}', 'offline_access', 'master', NULL, 'master'),
('af9e7b68-e3ec-4c36-8a41-ff499e8d19d9', 'master', b'0', '${role_create-realm}', 'create-realm', 'master', NULL, 'master'),
('b1309e41-4b16-49c6-a2aa-2aaa62dcaf5c', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_query-groups}', 'query-groups', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('b1a1e2f2-3c4c-4f9f-b260-9bd687c89aec', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_query-groups}', 'query-groups', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('b31bca24-2d50-4727-8dd2-e7f68933141c', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_manage-clients}', 'manage-clients', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('b414d725-ed97-4709-a76a-c041d4798dea', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_view-realm}', 'view-realm', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('b47d9b3b-afbd-4edf-962e-71d7aeaa005a', '6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', '${role_manage-consent}', 'manage-consent', 'master', '6527d515-cf97-43d0-bacb-9cd808ab0963', NULL),
('b9ab7391-e649-410d-99ca-eae1c43424c7', '6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', '${role_manage-account}', 'manage-account', 'master', '6527d515-cf97-43d0-bacb-9cd808ab0963', NULL),
('c1d6fd65-fc45-432b-aadc-b371b255fc16', 'f64a7574-9589-44a2-9a91-9b72f806919c', b'1', '${role_view-applications}', 'view-applications', 'E-Health-realm', 'f64a7574-9589-44a2-9a91-9b72f806919c', NULL),
('c58947ba-ff0a-42e7-8364-53fe3f7fabea', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_query-realms}', 'query-realms', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('c9bbe47a-b260-4971-b77f-028e69c4ad9a', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_view-users}', 'view-users', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('cab06a8e-6e30-4e07-8ab1-3a5843e0b870', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_query-realms}', 'query-realms', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('d447b5d2-124e-49e5-ae25-0094ed851c14', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('d84e933d-a49b-4eb8-9bb7-93e91af3c2a1', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_manage-users}', 'manage-users', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('d9d70e05-cc62-49ae-86c0-4a5598b669ab', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_query-realms}', 'query-realms', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('db0b0ec2-28f0-48a6-99b4-fa84fed61c84', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_query-clients}', 'query-clients', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('dc00cad7-9369-4978-8bb5-194b2b0cc909', 'c98aeea2-42f9-439b-aba3-4a123ade5ec8', b'1', '${role_read-token}', 'read-token', 'master', 'c98aeea2-42f9-439b-aba3-4a123ade5ec8', NULL),
('de739798-58c6-4702-b7aa-4e2e0f547333', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', b'1', '${role_manage-realm}', 'manage-realm', 'master', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', NULL),
('e4009fd2-3c58-4cd2-86a1-b7a41733539e', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_manage-users}', 'manage-users', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('e74e0d0f-2331-4998-bba5-2b57d0261f5f', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_query-clients}', 'query-clients', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('e8febd7e-03fc-4635-b39d-73600484f5cc', 'f64a7574-9589-44a2-9a91-9b72f806919c', b'1', '${role_manage-account-links}', 'manage-account-links', 'E-Health-realm', 'f64a7574-9589-44a2-9a91-9b72f806919c', NULL),
('eaa03722-1b54-4738-8dbf-3b2fc21cc64b', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_view-clients}', 'view-clients', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('ec6bcbe8-e4ab-48c4-ace6-4c2f65559bf8', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_manage-events}', 'manage-events', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('f0c42669-6e52-44f4-9c26-0c2df34f59ad', '6527d515-cf97-43d0-bacb-9cd808ab0963', b'1', '${role_view-applications}', 'view-applications', 'master', '6527d515-cf97-43d0-bacb-9cd808ab0963', NULL),
('f6f8b72a-566d-4993-afff-ba235fd1d130', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_view-authorization}', 'view-authorization', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('f7635b59-0bb2-45c7-80b3-d751ff64738e', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', b'1', '${role_impersonation}', 'impersonation', 'master', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', NULL),
('f78700e1-8366-4cdd-85fb-300cf8fbaeeb', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_view-realm}', 'view-realm', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('f97319a9-e402-4671-87d7-471bb18bb7ce', '5c40faab-788e-412a-b465-bc6605675cd3', b'1', '${role_query-users}', 'query-users', 'E-Health-realm', '5c40faab-788e-412a-b465-bc6605675cd3', NULL),
('fd4bbf17-5540-4456-8135-5a1e57e1e54e', 'E-Health-realm', b'0', '${role_uma_authorization}', 'uma_authorization', 'E-Health-realm', NULL, 'E-Health-realm');

-- --------------------------------------------------------

--
-- Table structure for table `migration_model`
--

DROP TABLE IF EXISTS `migration_model`;
CREATE TABLE IF NOT EXISTS `migration_model` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VERSION` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_model`
--

INSERT INTO `migration_model` (`ID`, `VERSION`, `UPDATE_TIME`) VALUES
('j32jc', '12.0.4', 1617740854);

-- --------------------------------------------------------

--
-- Table structure for table `offline_client_session`
--

DROP TABLE IF EXISTS `offline_client_session`;
CREATE TABLE IF NOT EXISTS `offline_client_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext COLLATE utf8_unicode_ci,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_user_session`
--

DROP TABLE IF EXISTS `offline_user_session`;
CREATE TABLE IF NOT EXISTS `offline_user_session` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` longtext COLLATE utf8_unicode_ci,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policy_config`
--

DROP TABLE IF EXISTS `policy_config`;
CREATE TABLE IF NOT EXISTS `policy_config` (
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`POLICY_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `protocol_mapper`
--

DROP TABLE IF EXISTS `protocol_mapper`;
CREATE TABLE IF NOT EXISTS `protocol_mapper` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `protocol_mapper`
--

INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CLIENT_ID`, `CLIENT_SCOPE_ID`) VALUES
('007dee08-1584-4599-affe-345117dbc67f', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '5baaa54c-378e-408e-9105-05a1d5d13091', NULL),
('02e36389-e511-479b-a20a-7f76225a5254', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('0572d40e-6539-413d-855b-077324948b5f', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('09cf7b91-3c18-4945-950b-66745c263f3a', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '0fcfd626-ae91-4e36-acf9-6264f20eeb17'),
('17848a55-703c-4ead-b114-392a03cc406c', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('1bdc5cc9-77d9-4e3a-86e8-33827d904cb5', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '970747fd-5184-4545-a91c-b274f5cec131'),
('26eb8dfe-71d3-4674-b3e7-051162402c4f', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', NULL),
('3a31195a-3cbe-4263-9b41-91b29e98e0c4', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('3a31cb71-c26f-4891-88c0-dd84a902cf59', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b'),
('3e9a458f-a34d-4e0b-8ef2-0126500c2f2b', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('4bbed269-723e-48c5-aff9-0d3f90e0ead4', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '57db355a-ab46-4136-b4da-ac6e5bfe0fbf'),
('4c83bed1-2c55-42fa-9982-b937c2b7286d', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'fa640268-dca9-460e-ae2a-ffd57017009c'),
('4cc99f9e-cb56-44b5-ac01-3182084d7006', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a'),
('4cf20704-a684-4f31-ab69-e8360e552ff3', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('4dcf308e-91d6-4dae-bf71-7c22fa384ede', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'ce44b640-e405-4ea5-9ac1-df7ff8611eb0'),
('518ea99a-2cf9-4b67-ab01-c503fca9738b', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'ea8fd87f-0785-4c70-b988-7a5c3aa52d5a'),
('5232c12e-0d10-4460-b69a-f1d7668e48dd', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('55f510e2-e2bc-4507-8c43-e6b27d240ce0', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'fa640268-dca9-460e-ae2a-ffd57017009c'),
('5639d09a-f57e-4a9d-86b1-172040114b48', 'role list', 'saml', 'saml-role-list-mapper', NULL, '91b611c8-c9a3-4a78-9b1d-b47d1e4d2e24'),
('5a2d4e6f-a01d-4d7a-9cc3-a867dbf98e1b', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf'),
('5a95aa6c-1e3d-49e3-9ee5-b6e95145e50f', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('5ed0e519-1b85-406c-bb9b-766d64c67599', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5'),
('5ed3b3fb-f99e-4e42-8c37-c2d5d6854d76', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '349a9d02-89a8-44e6-a0f7-bbabe4b84e9b'),
('640b7b3b-d7b2-45bf-94dd-d9b599d384eb', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('7af52a87-55f8-424a-b5a6-f636791dc929', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('7c0e83fd-5b46-4c3e-8443-9b61782a5251', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('8877725e-b0e8-4f96-b4e0-8d5b380f8aed', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('89ada7eb-bafa-4d74-b34f-6c15819fa1ba', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5'),
('8f2ebaa4-75ad-4b38-94ff-9fc3d5876940', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('91047c6f-5e0d-4e60-81c6-463b903393bf', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1'),
('967af9f1-9f60-4590-b2ec-6ffbc9b89a80', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '29ec2cba-3e13-4d40-8f61-9b839d1ac99d'),
('99a7788d-bd71-4030-8db2-254c3a6f40cc', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf'),
('9d19f25c-0581-449f-afd0-fdeab809146c', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('b27f1b20-aeb1-467e-81ee-b629e54eaf1e', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '962c7bf7-2b91-442b-bb2b-29a6ac993eca'),
('b7cdc809-c5e0-4190-9acb-76e48b1eb2ba', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '70e4b505-94be-4d45-9d14-8049da830dbb', NULL),
('c862393a-73f0-4968-9580-44f70eb65b35', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('c9b40fb8-cfe3-4c6c-ab9b-8106bc3d42a8', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('ca41906c-935a-4d9f-8496-4b098d6ae811', 'role list', 'saml', 'saml-role-list-mapper', NULL, '38f26ec1-3504-435b-87d8-9ad674d4acb5'),
('cdd75e34-0dfd-4804-9f73-6fbb9e796498', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('ce0a85fd-fb08-4b84-abaf-0391b99de52c', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '0b619b66-ed58-4b07-8a49-b9ea8f6df5b5'),
('d332ce44-4ff9-463c-a574-13ab82e700d3', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'aa1b2839-0f4c-43bd-b657-28d2acf68bcf'),
('d805529e-e2cc-4618-b4e7-29aa88575b06', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f68d3cd6-5d4a-484d-b284-fa0106fa8dc1'),
('d87fecc1-ca7b-4161-82a7-88af24c02d23', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '962c7bf7-2b91-442b-bb2b-29a6ac993eca'),
('dd084825-3e43-48f3-a0ff-73ab07634771', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('dfffaa73-f574-4508-8daa-6825dffd3c93', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('e3d5bad6-acd8-463f-862a-5dab0af0e555', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('e985c0ef-b709-475f-bf2f-1ef8ec3be1df', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('eb55a4fc-238f-4506-bc5c-12c396255d75', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('eb5fa231-7205-424b-bca5-b85b850c4a1d', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'b8e2c989-db8c-4c46-bc42-0c95c3871604', NULL),
('ef76185e-6727-4a03-b0e5-4b416670aed0', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('ef784a4c-6df2-4869-8d21-a64bbb991133', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799'),
('f033459f-8280-4e38-bc73-0897e162179d', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '57db355a-ab46-4136-b4da-ac6e5bfe0fbf'),
('f2543aee-e687-405d-97f8-7205c197bb40', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'df22b85e-e368-4894-b2bb-390e25230f94'),
('f802211c-b50e-475c-a7ec-580fab89efab', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '5352a79f-77d0-478b-8336-bd6408981799');

-- --------------------------------------------------------

--
-- Table structure for table `protocol_mapper_config`
--

DROP TABLE IF EXISTS `protocol_mapper_config`;
CREATE TABLE IF NOT EXISTS `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `protocol_mapper_config`
--

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES
('007dee08-1584-4599-affe-345117dbc67f', 'true', 'access.token.claim'),
('007dee08-1584-4599-affe-345117dbc67f', 'locale', 'claim.name'),
('007dee08-1584-4599-affe-345117dbc67f', 'true', 'id.token.claim'),
('007dee08-1584-4599-affe-345117dbc67f', 'String', 'jsonType.label'),
('007dee08-1584-4599-affe-345117dbc67f', 'locale', 'user.attribute'),
('007dee08-1584-4599-affe-345117dbc67f', 'true', 'userinfo.token.claim'),
('02e36389-e511-479b-a20a-7f76225a5254', 'true', 'access.token.claim'),
('02e36389-e511-479b-a20a-7f76225a5254', 'nickname', 'claim.name'),
('02e36389-e511-479b-a20a-7f76225a5254', 'true', 'id.token.claim'),
('02e36389-e511-479b-a20a-7f76225a5254', 'String', 'jsonType.label'),
('02e36389-e511-479b-a20a-7f76225a5254', 'nickname', 'user.attribute'),
('02e36389-e511-479b-a20a-7f76225a5254', 'true', 'userinfo.token.claim'),
('0572d40e-6539-413d-855b-077324948b5f', 'true', 'access.token.claim'),
('0572d40e-6539-413d-855b-077324948b5f', 'picture', 'claim.name'),
('0572d40e-6539-413d-855b-077324948b5f', 'true', 'id.token.claim'),
('0572d40e-6539-413d-855b-077324948b5f', 'String', 'jsonType.label'),
('0572d40e-6539-413d-855b-077324948b5f', 'picture', 'user.attribute'),
('0572d40e-6539-413d-855b-077324948b5f', 'true', 'userinfo.token.claim'),
('09cf7b91-3c18-4945-950b-66745c263f3a', 'true', 'access.token.claim'),
('09cf7b91-3c18-4945-950b-66745c263f3a', 'given_name', 'claim.name'),
('09cf7b91-3c18-4945-950b-66745c263f3a', 'true', 'id.token.claim'),
('09cf7b91-3c18-4945-950b-66745c263f3a', 'String', 'jsonType.label'),
('09cf7b91-3c18-4945-950b-66745c263f3a', 'firstName', 'user.attribute'),
('09cf7b91-3c18-4945-950b-66745c263f3a', 'true', 'userinfo.token.claim'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'true', 'access.token.claim'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'true', 'id.token.claim'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'country', 'user.attribute.country'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'formatted', 'user.attribute.formatted'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'locality', 'user.attribute.locality'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'postal_code', 'user.attribute.postal_code'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'region', 'user.attribute.region'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'street', 'user.attribute.street'),
('0c61af9d-244e-43ec-bab8-44fbfc2871e7', 'true', 'userinfo.token.claim'),
('17848a55-703c-4ead-b114-392a03cc406c', 'true', 'access.token.claim'),
('17848a55-703c-4ead-b114-392a03cc406c', 'website', 'claim.name'),
('17848a55-703c-4ead-b114-392a03cc406c', 'true', 'id.token.claim'),
('17848a55-703c-4ead-b114-392a03cc406c', 'String', 'jsonType.label'),
('17848a55-703c-4ead-b114-392a03cc406c', 'website', 'user.attribute'),
('17848a55-703c-4ead-b114-392a03cc406c', 'true', 'userinfo.token.claim'),
('1bdc5cc9-77d9-4e3a-86e8-33827d904cb5', 'true', 'access.token.claim'),
('1bdc5cc9-77d9-4e3a-86e8-33827d904cb5', 'profile', 'claim.name'),
('1bdc5cc9-77d9-4e3a-86e8-33827d904cb5', 'true', 'id.token.claim'),
('1bdc5cc9-77d9-4e3a-86e8-33827d904cb5', 'String', 'jsonType.label'),
('1bdc5cc9-77d9-4e3a-86e8-33827d904cb5', 'profile', 'user.attribute'),
('1bdc5cc9-77d9-4e3a-86e8-33827d904cb5', 'true', 'userinfo.token.claim'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'true', 'access.token.claim'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'true', 'id.token.claim'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'country', 'user.attribute.country'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'formatted', 'user.attribute.formatted'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'locality', 'user.attribute.locality'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'postal_code', 'user.attribute.postal_code'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'region', 'user.attribute.region'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'street', 'user.attribute.street'),
('202c8566-d512-47a9-ad98-8f9e41edb3ec', 'true', 'userinfo.token.claim'),
('3a31195a-3cbe-4263-9b41-91b29e98e0c4', 'true', 'access.token.claim'),
('3a31195a-3cbe-4263-9b41-91b29e98e0c4', 'gender', 'claim.name'),
('3a31195a-3cbe-4263-9b41-91b29e98e0c4', 'true', 'id.token.claim'),
('3a31195a-3cbe-4263-9b41-91b29e98e0c4', 'String', 'jsonType.label'),
('3a31195a-3cbe-4263-9b41-91b29e98e0c4', 'gender', 'user.attribute'),
('3a31195a-3cbe-4263-9b41-91b29e98e0c4', 'true', 'userinfo.token.claim'),
('3a31cb71-c26f-4891-88c0-dd84a902cf59', 'true', 'access.token.claim'),
('3a31cb71-c26f-4891-88c0-dd84a902cf59', 'email', 'claim.name'),
('3a31cb71-c26f-4891-88c0-dd84a902cf59', 'true', 'id.token.claim'),
('3a31cb71-c26f-4891-88c0-dd84a902cf59', 'String', 'jsonType.label'),
('3a31cb71-c26f-4891-88c0-dd84a902cf59', 'email', 'user.attribute'),
('3a31cb71-c26f-4891-88c0-dd84a902cf59', 'true', 'userinfo.token.claim'),
('3e9a458f-a34d-4e0b-8ef2-0126500c2f2b', 'true', 'access.token.claim'),
('3e9a458f-a34d-4e0b-8ef2-0126500c2f2b', 'family_name', 'claim.name'),
('3e9a458f-a34d-4e0b-8ef2-0126500c2f2b', 'true', 'id.token.claim'),
('3e9a458f-a34d-4e0b-8ef2-0126500c2f2b', 'String', 'jsonType.label'),
('3e9a458f-a34d-4e0b-8ef2-0126500c2f2b', 'lastName', 'user.attribute'),
('3e9a458f-a34d-4e0b-8ef2-0126500c2f2b', 'true', 'userinfo.token.claim'),
('4bbed269-723e-48c5-aff9-0d3f90e0ead4', 'true', 'access.token.claim'),
('4bbed269-723e-48c5-aff9-0d3f90e0ead4', 'groups', 'claim.name'),
('4bbed269-723e-48c5-aff9-0d3f90e0ead4', 'true', 'id.token.claim'),
('4bbed269-723e-48c5-aff9-0d3f90e0ead4', 'String', 'jsonType.label'),
('4bbed269-723e-48c5-aff9-0d3f90e0ead4', 'true', 'multivalued'),
('4bbed269-723e-48c5-aff9-0d3f90e0ead4', 'foo', 'user.attribute'),
('4c83bed1-2c55-42fa-9982-b937c2b7286d', 'true', 'access.token.claim'),
('4c83bed1-2c55-42fa-9982-b937c2b7286d', 'phone_number', 'claim.name'),
('4c83bed1-2c55-42fa-9982-b937c2b7286d', 'true', 'id.token.claim'),
('4c83bed1-2c55-42fa-9982-b937c2b7286d', 'String', 'jsonType.label'),
('4c83bed1-2c55-42fa-9982-b937c2b7286d', 'phoneNumber', 'user.attribute'),
('4c83bed1-2c55-42fa-9982-b937c2b7286d', 'true', 'userinfo.token.claim'),
('4cc99f9e-cb56-44b5-ac01-3182084d7006', 'true', 'access.token.claim'),
('4cc99f9e-cb56-44b5-ac01-3182084d7006', 'phone_number', 'claim.name'),
('4cc99f9e-cb56-44b5-ac01-3182084d7006', 'true', 'id.token.claim'),
('4cc99f9e-cb56-44b5-ac01-3182084d7006', 'String', 'jsonType.label'),
('4cc99f9e-cb56-44b5-ac01-3182084d7006', 'phoneNumber', 'user.attribute'),
('4cc99f9e-cb56-44b5-ac01-3182084d7006', 'true', 'userinfo.token.claim'),
('4cf20704-a684-4f31-ab69-e8360e552ff3', 'true', 'access.token.claim'),
('4cf20704-a684-4f31-ab69-e8360e552ff3', 'locale', 'claim.name'),
('4cf20704-a684-4f31-ab69-e8360e552ff3', 'true', 'id.token.claim'),
('4cf20704-a684-4f31-ab69-e8360e552ff3', 'String', 'jsonType.label'),
('4cf20704-a684-4f31-ab69-e8360e552ff3', 'locale', 'user.attribute'),
('4cf20704-a684-4f31-ab69-e8360e552ff3', 'true', 'userinfo.token.claim'),
('518ea99a-2cf9-4b67-ab01-c503fca9738b', 'true', 'access.token.claim'),
('518ea99a-2cf9-4b67-ab01-c503fca9738b', 'phone_number_verified', 'claim.name'),
('518ea99a-2cf9-4b67-ab01-c503fca9738b', 'true', 'id.token.claim'),
('518ea99a-2cf9-4b67-ab01-c503fca9738b', 'boolean', 'jsonType.label'),
('518ea99a-2cf9-4b67-ab01-c503fca9738b', 'phoneNumberVerified', 'user.attribute'),
('518ea99a-2cf9-4b67-ab01-c503fca9738b', 'true', 'userinfo.token.claim'),
('5232c12e-0d10-4460-b69a-f1d7668e48dd', 'true', 'access.token.claim'),
('5232c12e-0d10-4460-b69a-f1d7668e48dd', 'updated_at', 'claim.name'),
('5232c12e-0d10-4460-b69a-f1d7668e48dd', 'true', 'id.token.claim'),
('5232c12e-0d10-4460-b69a-f1d7668e48dd', 'String', 'jsonType.label'),
('5232c12e-0d10-4460-b69a-f1d7668e48dd', 'updatedAt', 'user.attribute'),
('5232c12e-0d10-4460-b69a-f1d7668e48dd', 'true', 'userinfo.token.claim'),
('55f510e2-e2bc-4507-8c43-e6b27d240ce0', 'true', 'access.token.claim'),
('55f510e2-e2bc-4507-8c43-e6b27d240ce0', 'phone_number_verified', 'claim.name'),
('55f510e2-e2bc-4507-8c43-e6b27d240ce0', 'true', 'id.token.claim'),
('55f510e2-e2bc-4507-8c43-e6b27d240ce0', 'boolean', 'jsonType.label'),
('55f510e2-e2bc-4507-8c43-e6b27d240ce0', 'phoneNumberVerified', 'user.attribute'),
('55f510e2-e2bc-4507-8c43-e6b27d240ce0', 'true', 'userinfo.token.claim'),
('5639d09a-f57e-4a9d-86b1-172040114b48', 'Role', 'attribute.name'),
('5639d09a-f57e-4a9d-86b1-172040114b48', 'Basic', 'attribute.nameformat'),
('5639d09a-f57e-4a9d-86b1-172040114b48', 'false', 'single'),
('5a2d4e6f-a01d-4d7a-9cc3-a867dbf98e1b', 'true', 'access.token.claim'),
('5a2d4e6f-a01d-4d7a-9cc3-a867dbf98e1b', 'realm_access.roles', 'claim.name'),
('5a2d4e6f-a01d-4d7a-9cc3-a867dbf98e1b', 'String', 'jsonType.label'),
('5a2d4e6f-a01d-4d7a-9cc3-a867dbf98e1b', 'true', 'multivalued'),
('5a2d4e6f-a01d-4d7a-9cc3-a867dbf98e1b', 'foo', 'user.attribute'),
('5a95aa6c-1e3d-49e3-9ee5-b6e95145e50f', 'true', 'access.token.claim'),
('5a95aa6c-1e3d-49e3-9ee5-b6e95145e50f', 'website', 'claim.name'),
('5a95aa6c-1e3d-49e3-9ee5-b6e95145e50f', 'true', 'id.token.claim'),
('5a95aa6c-1e3d-49e3-9ee5-b6e95145e50f', 'String', 'jsonType.label'),
('5a95aa6c-1e3d-49e3-9ee5-b6e95145e50f', 'website', 'user.attribute'),
('5a95aa6c-1e3d-49e3-9ee5-b6e95145e50f', 'true', 'userinfo.token.claim'),
('5ed0e519-1b85-406c-bb9b-766d64c67599', 'true', 'access.token.claim'),
('5ed0e519-1b85-406c-bb9b-766d64c67599', 'resource_access.${client_id}.roles', 'claim.name'),
('5ed0e519-1b85-406c-bb9b-766d64c67599', 'String', 'jsonType.label'),
('5ed0e519-1b85-406c-bb9b-766d64c67599', 'true', 'multivalued'),
('5ed0e519-1b85-406c-bb9b-766d64c67599', 'foo', 'user.attribute'),
('5ed3b3fb-f99e-4e42-8c37-c2d5d6854d76', 'true', 'access.token.claim'),
('5ed3b3fb-f99e-4e42-8c37-c2d5d6854d76', 'email_verified', 'claim.name'),
('5ed3b3fb-f99e-4e42-8c37-c2d5d6854d76', 'true', 'id.token.claim'),
('5ed3b3fb-f99e-4e42-8c37-c2d5d6854d76', 'boolean', 'jsonType.label'),
('5ed3b3fb-f99e-4e42-8c37-c2d5d6854d76', 'emailVerified', 'user.attribute'),
('5ed3b3fb-f99e-4e42-8c37-c2d5d6854d76', 'true', 'userinfo.token.claim'),
('640b7b3b-d7b2-45bf-94dd-d9b599d384eb', 'true', 'access.token.claim'),
('640b7b3b-d7b2-45bf-94dd-d9b599d384eb', 'family_name', 'claim.name'),
('640b7b3b-d7b2-45bf-94dd-d9b599d384eb', 'true', 'id.token.claim'),
('640b7b3b-d7b2-45bf-94dd-d9b599d384eb', 'String', 'jsonType.label'),
('640b7b3b-d7b2-45bf-94dd-d9b599d384eb', 'lastName', 'user.attribute'),
('640b7b3b-d7b2-45bf-94dd-d9b599d384eb', 'true', 'userinfo.token.claim'),
('7af52a87-55f8-424a-b5a6-f636791dc929', 'true', 'access.token.claim'),
('7af52a87-55f8-424a-b5a6-f636791dc929', 'true', 'id.token.claim'),
('7af52a87-55f8-424a-b5a6-f636791dc929', 'true', 'userinfo.token.claim'),
('7c0e83fd-5b46-4c3e-8443-9b61782a5251', 'true', 'access.token.claim'),
('7c0e83fd-5b46-4c3e-8443-9b61782a5251', 'true', 'id.token.claim'),
('7c0e83fd-5b46-4c3e-8443-9b61782a5251', 'true', 'userinfo.token.claim'),
('8877725e-b0e8-4f96-b4e0-8d5b380f8aed', 'true', 'access.token.claim'),
('8877725e-b0e8-4f96-b4e0-8d5b380f8aed', 'zoneinfo', 'claim.name'),
('8877725e-b0e8-4f96-b4e0-8d5b380f8aed', 'true', 'id.token.claim'),
('8877725e-b0e8-4f96-b4e0-8d5b380f8aed', 'String', 'jsonType.label'),
('8877725e-b0e8-4f96-b4e0-8d5b380f8aed', 'zoneinfo', 'user.attribute'),
('8877725e-b0e8-4f96-b4e0-8d5b380f8aed', 'true', 'userinfo.token.claim'),
('8f2ebaa4-75ad-4b38-94ff-9fc3d5876940', 'true', 'access.token.claim'),
('8f2ebaa4-75ad-4b38-94ff-9fc3d5876940', 'middle_name', 'claim.name'),
('8f2ebaa4-75ad-4b38-94ff-9fc3d5876940', 'true', 'id.token.claim'),
('8f2ebaa4-75ad-4b38-94ff-9fc3d5876940', 'String', 'jsonType.label'),
('8f2ebaa4-75ad-4b38-94ff-9fc3d5876940', 'middleName', 'user.attribute'),
('8f2ebaa4-75ad-4b38-94ff-9fc3d5876940', 'true', 'userinfo.token.claim'),
('91047c6f-5e0d-4e60-81c6-463b903393bf', 'true', 'access.token.claim'),
('91047c6f-5e0d-4e60-81c6-463b903393bf', 'email', 'claim.name'),
('91047c6f-5e0d-4e60-81c6-463b903393bf', 'true', 'id.token.claim'),
('91047c6f-5e0d-4e60-81c6-463b903393bf', 'String', 'jsonType.label'),
('91047c6f-5e0d-4e60-81c6-463b903393bf', 'email', 'user.attribute'),
('91047c6f-5e0d-4e60-81c6-463b903393bf', 'true', 'userinfo.token.claim'),
('99a7788d-bd71-4030-8db2-254c3a6f40cc', 'true', 'access.token.claim'),
('99a7788d-bd71-4030-8db2-254c3a6f40cc', 'resource_access.${client_id}.roles', 'claim.name'),
('99a7788d-bd71-4030-8db2-254c3a6f40cc', 'String', 'jsonType.label'),
('99a7788d-bd71-4030-8db2-254c3a6f40cc', 'true', 'multivalued'),
('99a7788d-bd71-4030-8db2-254c3a6f40cc', 'foo', 'user.attribute'),
('9d19f25c-0581-449f-afd0-fdeab809146c', 'true', 'access.token.claim'),
('9d19f25c-0581-449f-afd0-fdeab809146c', 'preferred_username', 'claim.name'),
('9d19f25c-0581-449f-afd0-fdeab809146c', 'true', 'id.token.claim'),
('9d19f25c-0581-449f-afd0-fdeab809146c', 'String', 'jsonType.label'),
('9d19f25c-0581-449f-afd0-fdeab809146c', 'username', 'user.attribute'),
('9d19f25c-0581-449f-afd0-fdeab809146c', 'true', 'userinfo.token.claim'),
('b27f1b20-aeb1-467e-81ee-b629e54eaf1e', 'true', 'access.token.claim'),
('b27f1b20-aeb1-467e-81ee-b629e54eaf1e', 'groups', 'claim.name'),
('b27f1b20-aeb1-467e-81ee-b629e54eaf1e', 'true', 'id.token.claim'),
('b27f1b20-aeb1-467e-81ee-b629e54eaf1e', 'String', 'jsonType.label'),
('b27f1b20-aeb1-467e-81ee-b629e54eaf1e', 'true', 'multivalued'),
('b27f1b20-aeb1-467e-81ee-b629e54eaf1e', 'foo', 'user.attribute'),
('c862393a-73f0-4968-9580-44f70eb65b35', 'true', 'access.token.claim'),
('c862393a-73f0-4968-9580-44f70eb65b35', 'gender', 'claim.name'),
('c862393a-73f0-4968-9580-44f70eb65b35', 'true', 'id.token.claim'),
('c862393a-73f0-4968-9580-44f70eb65b35', 'String', 'jsonType.label'),
('c862393a-73f0-4968-9580-44f70eb65b35', 'gender', 'user.attribute'),
('c862393a-73f0-4968-9580-44f70eb65b35', 'true', 'userinfo.token.claim'),
('c9b40fb8-cfe3-4c6c-ab9b-8106bc3d42a8', 'true', 'access.token.claim'),
('c9b40fb8-cfe3-4c6c-ab9b-8106bc3d42a8', 'nickname', 'claim.name'),
('c9b40fb8-cfe3-4c6c-ab9b-8106bc3d42a8', 'true', 'id.token.claim'),
('c9b40fb8-cfe3-4c6c-ab9b-8106bc3d42a8', 'String', 'jsonType.label'),
('c9b40fb8-cfe3-4c6c-ab9b-8106bc3d42a8', 'nickname', 'user.attribute'),
('c9b40fb8-cfe3-4c6c-ab9b-8106bc3d42a8', 'true', 'userinfo.token.claim'),
('ca41906c-935a-4d9f-8496-4b098d6ae811', 'Role', 'attribute.name'),
('ca41906c-935a-4d9f-8496-4b098d6ae811', 'Basic', 'attribute.nameformat'),
('ca41906c-935a-4d9f-8496-4b098d6ae811', 'false', 'single'),
('cdd75e34-0dfd-4804-9f73-6fbb9e796498', 'true', 'access.token.claim'),
('cdd75e34-0dfd-4804-9f73-6fbb9e796498', 'birthdate', 'claim.name'),
('cdd75e34-0dfd-4804-9f73-6fbb9e796498', 'true', 'id.token.claim'),
('cdd75e34-0dfd-4804-9f73-6fbb9e796498', 'String', 'jsonType.label'),
('cdd75e34-0dfd-4804-9f73-6fbb9e796498', 'birthdate', 'user.attribute'),
('cdd75e34-0dfd-4804-9f73-6fbb9e796498', 'true', 'userinfo.token.claim'),
('ce0a85fd-fb08-4b84-abaf-0391b99de52c', 'true', 'access.token.claim'),
('ce0a85fd-fb08-4b84-abaf-0391b99de52c', 'realm_access.roles', 'claim.name'),
('ce0a85fd-fb08-4b84-abaf-0391b99de52c', 'String', 'jsonType.label'),
('ce0a85fd-fb08-4b84-abaf-0391b99de52c', 'true', 'multivalued'),
('ce0a85fd-fb08-4b84-abaf-0391b99de52c', 'foo', 'user.attribute'),
('d805529e-e2cc-4618-b4e7-29aa88575b06', 'true', 'access.token.claim'),
('d805529e-e2cc-4618-b4e7-29aa88575b06', 'email_verified', 'claim.name'),
('d805529e-e2cc-4618-b4e7-29aa88575b06', 'true', 'id.token.claim'),
('d805529e-e2cc-4618-b4e7-29aa88575b06', 'boolean', 'jsonType.label'),
('d805529e-e2cc-4618-b4e7-29aa88575b06', 'emailVerified', 'user.attribute'),
('d805529e-e2cc-4618-b4e7-29aa88575b06', 'true', 'userinfo.token.claim'),
('d87fecc1-ca7b-4161-82a7-88af24c02d23', 'true', 'access.token.claim'),
('d87fecc1-ca7b-4161-82a7-88af24c02d23', 'upn', 'claim.name'),
('d87fecc1-ca7b-4161-82a7-88af24c02d23', 'true', 'id.token.claim'),
('d87fecc1-ca7b-4161-82a7-88af24c02d23', 'String', 'jsonType.label'),
('d87fecc1-ca7b-4161-82a7-88af24c02d23', 'username', 'user.attribute'),
('d87fecc1-ca7b-4161-82a7-88af24c02d23', 'true', 'userinfo.token.claim'),
('dd084825-3e43-48f3-a0ff-73ab07634771', 'true', 'access.token.claim'),
('dd084825-3e43-48f3-a0ff-73ab07634771', 'middle_name', 'claim.name'),
('dd084825-3e43-48f3-a0ff-73ab07634771', 'true', 'id.token.claim'),
('dd084825-3e43-48f3-a0ff-73ab07634771', 'String', 'jsonType.label'),
('dd084825-3e43-48f3-a0ff-73ab07634771', 'middleName', 'user.attribute'),
('dd084825-3e43-48f3-a0ff-73ab07634771', 'true', 'userinfo.token.claim'),
('dfffaa73-f574-4508-8daa-6825dffd3c93', 'true', 'access.token.claim'),
('dfffaa73-f574-4508-8daa-6825dffd3c93', 'updated_at', 'claim.name'),
('dfffaa73-f574-4508-8daa-6825dffd3c93', 'true', 'id.token.claim'),
('dfffaa73-f574-4508-8daa-6825dffd3c93', 'String', 'jsonType.label'),
('dfffaa73-f574-4508-8daa-6825dffd3c93', 'updatedAt', 'user.attribute'),
('dfffaa73-f574-4508-8daa-6825dffd3c93', 'true', 'userinfo.token.claim'),
('e3d5bad6-acd8-463f-862a-5dab0af0e555', 'true', 'access.token.claim'),
('e3d5bad6-acd8-463f-862a-5dab0af0e555', 'given_name', 'claim.name'),
('e3d5bad6-acd8-463f-862a-5dab0af0e555', 'true', 'id.token.claim'),
('e3d5bad6-acd8-463f-862a-5dab0af0e555', 'String', 'jsonType.label'),
('e3d5bad6-acd8-463f-862a-5dab0af0e555', 'firstName', 'user.attribute'),
('e3d5bad6-acd8-463f-862a-5dab0af0e555', 'true', 'userinfo.token.claim'),
('e985c0ef-b709-475f-bf2f-1ef8ec3be1df', 'true', 'access.token.claim'),
('e985c0ef-b709-475f-bf2f-1ef8ec3be1df', 'locale', 'claim.name'),
('e985c0ef-b709-475f-bf2f-1ef8ec3be1df', 'true', 'id.token.claim'),
('e985c0ef-b709-475f-bf2f-1ef8ec3be1df', 'String', 'jsonType.label'),
('e985c0ef-b709-475f-bf2f-1ef8ec3be1df', 'locale', 'user.attribute'),
('e985c0ef-b709-475f-bf2f-1ef8ec3be1df', 'true', 'userinfo.token.claim'),
('eb55a4fc-238f-4506-bc5c-12c396255d75', 'true', 'access.token.claim'),
('eb55a4fc-238f-4506-bc5c-12c396255d75', 'picture', 'claim.name'),
('eb55a4fc-238f-4506-bc5c-12c396255d75', 'true', 'id.token.claim'),
('eb55a4fc-238f-4506-bc5c-12c396255d75', 'String', 'jsonType.label'),
('eb55a4fc-238f-4506-bc5c-12c396255d75', 'picture', 'user.attribute'),
('eb55a4fc-238f-4506-bc5c-12c396255d75', 'true', 'userinfo.token.claim'),
('eb5fa231-7205-424b-bca5-b85b850c4a1d', 'true', 'access.token.claim'),
('eb5fa231-7205-424b-bca5-b85b850c4a1d', 'locale', 'claim.name'),
('eb5fa231-7205-424b-bca5-b85b850c4a1d', 'true', 'id.token.claim'),
('eb5fa231-7205-424b-bca5-b85b850c4a1d', 'String', 'jsonType.label'),
('eb5fa231-7205-424b-bca5-b85b850c4a1d', 'locale', 'user.attribute'),
('eb5fa231-7205-424b-bca5-b85b850c4a1d', 'true', 'userinfo.token.claim'),
('ef76185e-6727-4a03-b0e5-4b416670aed0', 'true', 'access.token.claim'),
('ef76185e-6727-4a03-b0e5-4b416670aed0', 'birthdate', 'claim.name'),
('ef76185e-6727-4a03-b0e5-4b416670aed0', 'true', 'id.token.claim'),
('ef76185e-6727-4a03-b0e5-4b416670aed0', 'String', 'jsonType.label'),
('ef76185e-6727-4a03-b0e5-4b416670aed0', 'birthdate', 'user.attribute'),
('ef76185e-6727-4a03-b0e5-4b416670aed0', 'true', 'userinfo.token.claim'),
('ef784a4c-6df2-4869-8d21-a64bbb991133', 'true', 'access.token.claim'),
('ef784a4c-6df2-4869-8d21-a64bbb991133', 'profile', 'claim.name'),
('ef784a4c-6df2-4869-8d21-a64bbb991133', 'true', 'id.token.claim'),
('ef784a4c-6df2-4869-8d21-a64bbb991133', 'String', 'jsonType.label'),
('ef784a4c-6df2-4869-8d21-a64bbb991133', 'profile', 'user.attribute'),
('ef784a4c-6df2-4869-8d21-a64bbb991133', 'true', 'userinfo.token.claim'),
('f033459f-8280-4e38-bc73-0897e162179d', 'true', 'access.token.claim'),
('f033459f-8280-4e38-bc73-0897e162179d', 'upn', 'claim.name'),
('f033459f-8280-4e38-bc73-0897e162179d', 'true', 'id.token.claim'),
('f033459f-8280-4e38-bc73-0897e162179d', 'String', 'jsonType.label'),
('f033459f-8280-4e38-bc73-0897e162179d', 'username', 'user.attribute'),
('f033459f-8280-4e38-bc73-0897e162179d', 'true', 'userinfo.token.claim'),
('f2543aee-e687-405d-97f8-7205c197bb40', 'true', 'access.token.claim'),
('f2543aee-e687-405d-97f8-7205c197bb40', 'zoneinfo', 'claim.name'),
('f2543aee-e687-405d-97f8-7205c197bb40', 'true', 'id.token.claim'),
('f2543aee-e687-405d-97f8-7205c197bb40', 'String', 'jsonType.label'),
('f2543aee-e687-405d-97f8-7205c197bb40', 'zoneinfo', 'user.attribute'),
('f2543aee-e687-405d-97f8-7205c197bb40', 'true', 'userinfo.token.claim'),
('f802211c-b50e-475c-a7ec-580fab89efab', 'true', 'access.token.claim'),
('f802211c-b50e-475c-a7ec-580fab89efab', 'preferred_username', 'claim.name'),
('f802211c-b50e-475c-a7ec-580fab89efab', 'true', 'id.token.claim'),
('f802211c-b50e-475c-a7ec-580fab89efab', 'String', 'jsonType.label'),
('f802211c-b50e-475c-a7ec-580fab89efab', 'username', 'user.attribute'),
('f802211c-b50e-475c-a7ec-580fab89efab', 'true', 'userinfo.token.claim');

-- --------------------------------------------------------

--
-- Table structure for table `realm`
--

DROP TABLE IF EXISTS `realm`;
CREATE TABLE IF NOT EXISTS `realm` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text COLLATE utf8_unicode_ci,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) COLLATE utf8_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) COLLATE utf8_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `realm`
--

INSERT INTO `realm` (`ID`, `ACCESS_CODE_LIFESPAN`, `USER_ACTION_LIFESPAN`, `ACCESS_TOKEN_LIFESPAN`, `ACCOUNT_THEME`, `ADMIN_THEME`, `EMAIL_THEME`, `ENABLED`, `EVENTS_ENABLED`, `EVENTS_EXPIRATION`, `LOGIN_THEME`, `NAME`, `NOT_BEFORE`, `PASSWORD_POLICY`, `REGISTRATION_ALLOWED`, `REMEMBER_ME`, `RESET_PASSWORD_ALLOWED`, `SOCIAL`, `SSL_REQUIRED`, `SSO_IDLE_TIMEOUT`, `SSO_MAX_LIFESPAN`, `UPDATE_PROFILE_ON_SOC_LOGIN`, `VERIFY_EMAIL`, `MASTER_ADMIN_CLIENT`, `LOGIN_LIFESPAN`, `INTERNATIONALIZATION_ENABLED`, `DEFAULT_LOCALE`, `REG_EMAIL_AS_USERNAME`, `ADMIN_EVENTS_ENABLED`, `ADMIN_EVENTS_DETAILS_ENABLED`, `EDIT_USERNAME_ALLOWED`, `OTP_POLICY_COUNTER`, `OTP_POLICY_WINDOW`, `OTP_POLICY_PERIOD`, `OTP_POLICY_DIGITS`, `OTP_POLICY_ALG`, `OTP_POLICY_TYPE`, `BROWSER_FLOW`, `REGISTRATION_FLOW`, `DIRECT_GRANT_FLOW`, `RESET_CREDENTIALS_FLOW`, `CLIENT_AUTH_FLOW`, `OFFLINE_SESSION_IDLE_TIMEOUT`, `REVOKE_REFRESH_TOKEN`, `ACCESS_TOKEN_LIFE_IMPLICIT`, `LOGIN_WITH_EMAIL_ALLOWED`, `DUPLICATE_EMAILS_ALLOWED`, `DOCKER_AUTH_FLOW`, `REFRESH_TOKEN_MAX_REUSE`, `ALLOW_USER_MANAGED_ACCESS`, `SSO_MAX_LIFESPAN_REMEMBER_ME`, `SSO_IDLE_TIMEOUT_REMEMBER_ME`) VALUES
('E-Health-realm', 60, 300, 300, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'E-Health-realm', 0, NULL, b'0', b'0', b'0', b'0', 'EXTERNAL', 1800, 36000, b'0', b'0', 'a4841cd2-c628-4f23-bdb7-9ea5ddd7b918', 1800, b'0', NULL, b'0', b'0', b'0', b'0', 0, 1, 30, 6, 'HmacSHA1', 'totp', '359f1a81-d69c-47f7-a982-fecae16c0e1a', '8ee8865c-2c85-4592-8493-e60d1d51bb29', '276cc684-3337-4726-b71f-a14fb04c3fc4', 'ff5695ee-12b8-40b4-9b8a-ecf703ff85a0', '908284d3-1131-453e-a593-28cb08df87c8', 2592000, b'0', 900, b'1', b'0', '7b6550b1-36a1-4e75-90c0-f474b2ef4d04', 0, b'0', 0, 0),
('master', 60, 300, 60, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'master', 0, NULL, b'0', b'0', b'0', b'0', 'EXTERNAL', 1800, 36000, b'0', b'0', '4d225d56-d277-4007-93f6-b9e77a5e1cfa', 1800, b'0', NULL, b'0', b'0', b'0', b'0', 0, 1, 30, 6, 'HmacSHA1', 'totp', '34bd7dfe-375b-4917-9470-6fea31f70d36', 'e7b8b49c-c627-43cb-8f18-282d23a64d55', '5c364a64-0d33-4685-a582-72b21d67d8f4', '42c8bb30-0e13-40b2-be87-46cb1574cffd', '553538d2-8081-495d-8b32-29527e2866c5', 2592000, b'0', 900, b'1', b'0', '61c10917-74c7-49fc-bab0-1c8dea6e25f7', 0, b'0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `realm_attribute`
--

DROP TABLE IF EXISTS `realm_attribute`;
CREATE TABLE IF NOT EXISTS `realm_attribute` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `realm_attribute`
--

INSERT INTO `realm_attribute` (`NAME`, `VALUE`, `REALM_ID`) VALUES
('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'E-Health-realm'),
('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'master'),
('_browser_header.contentSecurityPolicyReportOnly', '', 'E-Health-realm'),
('_browser_header.contentSecurityPolicyReportOnly', '', 'master'),
('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'E-Health-realm'),
('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master'),
('_browser_header.xContentTypeOptions', 'nosniff', 'E-Health-realm'),
('_browser_header.xContentTypeOptions', 'nosniff', 'master'),
('_browser_header.xFrameOptions', 'SAMEORIGIN', 'E-Health-realm'),
('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master'),
('_browser_header.xRobotsTag', 'none', 'E-Health-realm'),
('_browser_header.xRobotsTag', 'none', 'master'),
('_browser_header.xXSSProtection', '1; mode=block', 'E-Health-realm'),
('_browser_header.xXSSProtection', '1; mode=block', 'master'),
('actionTokenGeneratedByAdminLifespan', '43200', 'E-Health-realm'),
('actionTokenGeneratedByUserLifespan', '300', 'E-Health-realm'),
('bruteForceProtected', 'false', 'E-Health-realm'),
('bruteForceProtected', 'false', 'master'),
('displayName', 'Keycloak', 'master'),
('displayNameHtml', '<div class=\"kc-logo-text\"><span>Keycloak</span></div>', 'master'),
('failureFactor', '30', 'E-Health-realm'),
('failureFactor', '30', 'master'),
('maxDeltaTimeSeconds', '43200', 'E-Health-realm'),
('maxDeltaTimeSeconds', '43200', 'master'),
('maxFailureWaitSeconds', '900', 'E-Health-realm'),
('maxFailureWaitSeconds', '900', 'master'),
('minimumQuickLoginWaitSeconds', '60', 'E-Health-realm'),
('minimumQuickLoginWaitSeconds', '60', 'master'),
('offlineSessionMaxLifespan', '5184000', 'E-Health-realm'),
('offlineSessionMaxLifespan', '5184000', 'master'),
('offlineSessionMaxLifespanEnabled', 'false', 'E-Health-realm'),
('offlineSessionMaxLifespanEnabled', 'false', 'master'),
('permanentLockout', 'false', 'E-Health-realm'),
('permanentLockout', 'false', 'master'),
('quickLoginCheckMilliSeconds', '1000', 'E-Health-realm'),
('quickLoginCheckMilliSeconds', '1000', 'master'),
('waitIncrementSeconds', '60', 'E-Health-realm'),
('waitIncrementSeconds', '60', 'master'),
('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'E-Health-realm'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'E-Health-realm'),
('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'E-Health-realm'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'E-Health-realm'),
('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'E-Health-realm'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'E-Health-realm'),
('webAuthnPolicyCreateTimeout', '0', 'E-Health-realm'),
('webAuthnPolicyCreateTimeoutPasswordless', '0', 'E-Health-realm'),
('webAuthnPolicyRequireResidentKey', 'not specified', 'E-Health-realm'),
('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'E-Health-realm'),
('webAuthnPolicyRpEntityName', 'keycloak', 'E-Health-realm'),
('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'E-Health-realm'),
('webAuthnPolicyRpId', '', 'E-Health-realm'),
('webAuthnPolicyRpIdPasswordless', '', 'E-Health-realm'),
('webAuthnPolicySignatureAlgorithms', 'ES256', 'E-Health-realm'),
('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'E-Health-realm'),
('webAuthnPolicyUserVerificationRequirement', 'not specified', 'E-Health-realm'),
('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'E-Health-realm');

-- --------------------------------------------------------

--
-- Table structure for table `realm_default_groups`
--

DROP TABLE IF EXISTS `realm_default_groups`;
CREATE TABLE IF NOT EXISTS `realm_default_groups` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `realm_default_roles`
--

DROP TABLE IF EXISTS `realm_default_roles`;
CREATE TABLE IF NOT EXISTS `realm_default_roles` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `realm_default_roles`
--

INSERT INTO `realm_default_roles` (`REALM_ID`, `ROLE_ID`) VALUES
('E-Health-realm', '376b3cd2-8dc7-4a48-988f-e9a2c5773b77'),
('master', '6d29a9ab-8d2b-4fa8-88f1-b66293889c1b'),
('master', 'ac759ea2-2a4b-4918-885f-588de1d11750'),
('E-Health-realm', 'fd4bbf17-5540-4456-8135-5a1e57e1e54e');

-- --------------------------------------------------------

--
-- Table structure for table `realm_enabled_event_types`
--

DROP TABLE IF EXISTS `realm_enabled_event_types`;
CREATE TABLE IF NOT EXISTS `realm_enabled_event_types` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `realm_events_listeners`
--

DROP TABLE IF EXISTS `realm_events_listeners`;
CREATE TABLE IF NOT EXISTS `realm_events_listeners` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `realm_events_listeners`
--

INSERT INTO `realm_events_listeners` (`REALM_ID`, `VALUE`) VALUES
('E-Health-realm', 'jboss-logging'),
('master', 'jboss-logging');

-- --------------------------------------------------------

--
-- Table structure for table `realm_localizations`
--

DROP TABLE IF EXISTS `realm_localizations`;
CREATE TABLE IF NOT EXISTS `realm_localizations` (
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LOCALE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEXTS` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `realm_required_credential`
--

DROP TABLE IF EXISTS `realm_required_credential`;
CREATE TABLE IF NOT EXISTS `realm_required_credential` (
  `TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `realm_required_credential`
--

INSERT INTO `realm_required_credential` (`TYPE`, `FORM_LABEL`, `INPUT`, `SECRET`, `REALM_ID`) VALUES
('password', 'password', b'1', b'1', 'E-Health-realm'),
('password', 'password', b'1', b'1', 'master');

-- --------------------------------------------------------

--
-- Table structure for table `realm_smtp_config`
--

DROP TABLE IF EXISTS `realm_smtp_config`;
CREATE TABLE IF NOT EXISTS `realm_smtp_config` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `realm_supported_locales`
--

DROP TABLE IF EXISTS `realm_supported_locales`;
CREATE TABLE IF NOT EXISTS `realm_supported_locales` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `redirect_uris`
--

DROP TABLE IF EXISTS `redirect_uris`;
CREATE TABLE IF NOT EXISTS `redirect_uris` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `redirect_uris`
--

INSERT INTO `redirect_uris` (`CLIENT_ID`, `VALUE`) VALUES
('1f47e498-886f-4ccc-9711-86fe79065a95', 'http://localhost:8081/*'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '/admin/E-Health-realm/console/*'),
('6527d515-cf97-43d0-bacb-9cd808ab0963', '/realms/master/account/*'),
('70e4b505-94be-4d45-9d14-8049da830dbb', '/realms/E-Health-realm/account/*'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', '/realms/master/account/*'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '/admin/master/console/*'),
('f64a7574-9589-44a2-9a91-9b72f806919c', '/realms/E-Health-realm/account/*');

-- --------------------------------------------------------

--
-- Table structure for table `required_action_config`
--

DROP TABLE IF EXISTS `required_action_config`;
CREATE TABLE IF NOT EXISTS `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `required_action_provider`
--

DROP TABLE IF EXISTS `required_action_provider`;
CREATE TABLE IF NOT EXISTS `required_action_provider` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `required_action_provider`
--

INSERT INTO `required_action_provider` (`ID`, `ALIAS`, `NAME`, `REALM_ID`, `ENABLED`, `DEFAULT_ACTION`, `PROVIDER_ID`, `PRIORITY`) VALUES
('103e5389-18ab-4710-8f0a-023147db2b95', 'CONFIGURE_TOTP', 'Configure OTP', 'master', b'1', b'0', 'CONFIGURE_TOTP', 10),
('1c07111b-d0e4-4076-87bc-c90d4d8cf26e', 'update_user_locale', 'Update User Locale', 'master', b'1', b'0', 'update_user_locale', 1000),
('302d099f-5e99-451c-9814-0d21c7b62d3a', 'terms_and_conditions', 'Terms and Conditions', 'E-Health-realm', b'0', b'0', 'terms_and_conditions', 20),
('4855c801-26ef-45f1-8eaa-bf8341e9e8cf', 'UPDATE_PASSWORD', 'Update Password', 'E-Health-realm', b'1', b'0', 'UPDATE_PASSWORD', 30),
('4c510400-3d68-4294-8e0b-70c4bc8594c1', 'terms_and_conditions', 'Terms and Conditions', 'master', b'0', b'0', 'terms_and_conditions', 20),
('4e833071-5b82-405e-bf2c-d8e6296ae7b3', 'UPDATE_PROFILE', 'Update Profile', 'E-Health-realm', b'1', b'0', 'UPDATE_PROFILE', 40),
('53836ddb-03cc-488f-912b-85f3e2fba990', 'delete_account', 'Delete Account', 'master', b'0', b'0', 'delete_account', 60),
('5a55dcb5-1710-4d36-866a-da1f2a546205', 'CONFIGURE_TOTP', 'Configure OTP', 'E-Health-realm', b'1', b'0', 'CONFIGURE_TOTP', 10),
('62cfb049-4dcc-4166-88fd-75bc99749d16', 'update_user_locale', 'Update User Locale', 'E-Health-realm', b'1', b'0', 'update_user_locale', 1000),
('70990a7e-1a8e-4b32-afa1-a0d30a310374', 'UPDATE_PASSWORD', 'Update Password', 'master', b'1', b'0', 'UPDATE_PASSWORD', 30),
('70e86e2e-6287-42be-b16a-53085c2f7338', 'VERIFY_EMAIL', 'Verify Email', 'master', b'1', b'0', 'VERIFY_EMAIL', 50),
('83ec480d-1f25-4249-823d-41de64c50d7f', 'delete_account', 'Delete Account', 'E-Health-realm', b'0', b'0', 'delete_account', 60),
('c7b323f0-117b-42e8-841e-788bd7d3bd94', 'VERIFY_EMAIL', 'Verify Email', 'E-Health-realm', b'1', b'0', 'VERIFY_EMAIL', 50),
('ff800f93-1276-47b5-a4a1-9c45ea801a9a', 'UPDATE_PROFILE', 'Update Profile', 'master', b'1', b'0', 'UPDATE_PROFILE', 40);

-- --------------------------------------------------------

--
-- Table structure for table `resource_attribute`
--

DROP TABLE IF EXISTS `resource_attribute`;
CREATE TABLE IF NOT EXISTS `resource_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_policy`
--

DROP TABLE IF EXISTS `resource_policy`;
CREATE TABLE IF NOT EXISTS `resource_policy` (
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_scope`
--

DROP TABLE IF EXISTS `resource_scope`;
CREATE TABLE IF NOT EXISTS `resource_scope` (
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_server`
--

DROP TABLE IF EXISTS `resource_server`;
CREATE TABLE IF NOT EXISTS `resource_server` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_server_perm_ticket`
--

DROP TABLE IF EXISTS `resource_server_perm_ticket`;
CREATE TABLE IF NOT EXISTS `resource_server_perm_ticket` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_server_policy`
--

DROP TABLE IF EXISTS `resource_server_policy`;
CREATE TABLE IF NOT EXISTS `resource_server_policy` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DECISION_STRATEGY` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIC` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_server_resource`
--

DROP TABLE IF EXISTS `resource_server_resource`;
CREATE TABLE IF NOT EXISTS `resource_server_resource` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_server_scope`
--

DROP TABLE IF EXISTS `resource_server_scope`;
CREATE TABLE IF NOT EXISTS `resource_server_scope` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_uris`
--

DROP TABLE IF EXISTS `resource_uris`;
CREATE TABLE IF NOT EXISTS `resource_uris` (
  `RESOURCE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_attribute`
--

DROP TABLE IF EXISTS `role_attribute`;
CREATE TABLE IF NOT EXISTS `role_attribute` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scope_mapping`
--

DROP TABLE IF EXISTS `scope_mapping`;
CREATE TABLE IF NOT EXISTS `scope_mapping` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `scope_mapping`
--

INSERT INTO `scope_mapping` (`CLIENT_ID`, `ROLE_ID`) VALUES
('70e4b505-94be-4d45-9d14-8049da830dbb', '8e5779b1-cf82-455f-9a54-86379515568f'),
('a28f7a27-b2bf-4e60-9e18-12a06fe1edcb', 'b9ab7391-e649-410d-99ca-eae1c43424c7');

-- --------------------------------------------------------

--
-- Table structure for table `scope_policy`
--

DROP TABLE IF EXISTS `scope_policy`;
CREATE TABLE IF NOT EXISTS `scope_policy` (
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `username_login_failure`
--

DROP TABLE IF EXISTS `username_login_failure`;
CREATE TABLE IF NOT EXISTS `username_login_failure` (
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_attribute`
--

DROP TABLE IF EXISTS `user_attribute`;
CREATE TABLE IF NOT EXISTS `user_attribute` (
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_consent`
--

DROP TABLE IF EXISTS `user_consent`;
CREATE TABLE IF NOT EXISTS `user_consent` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_consent_client_scope`
--

DROP TABLE IF EXISTS `user_consent_client_scope`;
CREATE TABLE IF NOT EXISTS `user_consent_client_scope` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
CREATE TABLE IF NOT EXISTS `user_entity` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_entity`
--

INSERT INTO `user_entity` (`ID`, `EMAIL`, `EMAIL_CONSTRAINT`, `EMAIL_VERIFIED`, `ENABLED`, `FEDERATION_LINK`, `FIRST_NAME`, `LAST_NAME`, `REALM_ID`, `USERNAME`, `CREATED_TIMESTAMP`, `SERVICE_ACCOUNT_CLIENT_LINK`, `NOT_BEFORE`) VALUES
('6a093b68-2300-4301-b8ae-9237727f9940', NULL, '4c7bb387-1cd4-493d-baa7-cc925adf79ff', b'0', b'1', NULL, NULL, NULL, 'master', 'admin', 1617744639822, NULL, 0),
('f7f97471-4c96-45c2-8f81-464cdcb02129', 'maddouriatef@gmail.com', 'maddouriatef@gmail.com', b'0', b'1', NULL, 'Atef', 'MADDOURI', 'E-Health-realm', 'atef.maddouri', 1617791439833, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_federation_config`
--

DROP TABLE IF EXISTS `user_federation_config`;
CREATE TABLE IF NOT EXISTS `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_federation_mapper`
--

DROP TABLE IF EXISTS `user_federation_mapper`;
CREATE TABLE IF NOT EXISTS `user_federation_mapper` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_federation_mapper_config`
--

DROP TABLE IF EXISTS `user_federation_mapper_config`;
CREATE TABLE IF NOT EXISTS `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_federation_provider`
--

DROP TABLE IF EXISTS `user_federation_provider`;
CREATE TABLE IF NOT EXISTS `user_federation_provider` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
CREATE TABLE IF NOT EXISTS `user_group_membership` (
  `GROUP_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_required_action`
--

DROP TABLE IF EXISTS `user_required_action`;
CREATE TABLE IF NOT EXISTS `user_required_action` (
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role_mapping`
--

DROP TABLE IF EXISTS `user_role_mapping`;
CREATE TABLE IF NOT EXISTS `user_role_mapping` (
  `ROLE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES
('076e5c21-46b8-4d35-9171-54448c563fc0', '6a093b68-2300-4301-b8ae-9237727f9940'),
('20e7f755-e9e5-4a87-9464-e8696e7e163d', '6a093b68-2300-4301-b8ae-9237727f9940'),
('6d29a9ab-8d2b-4fa8-88f1-b66293889c1b', '6a093b68-2300-4301-b8ae-9237727f9940'),
('ac759ea2-2a4b-4918-885f-588de1d11750', '6a093b68-2300-4301-b8ae-9237727f9940'),
('b9ab7391-e649-410d-99ca-eae1c43424c7', '6a093b68-2300-4301-b8ae-9237727f9940'),
('376b3cd2-8dc7-4a48-988f-e9a2c5773b77', 'f7f97471-4c96-45c2-8f81-464cdcb02129'),
('8918d826-56f6-4b91-bede-8966a28faa63', 'f7f97471-4c96-45c2-8f81-464cdcb02129'),
('8e5779b1-cf82-455f-9a54-86379515568f', 'f7f97471-4c96-45c2-8f81-464cdcb02129'),
('fd4bbf17-5540-4456-8135-5a1e57e1e54e', 'f7f97471-4c96-45c2-8f81-464cdcb02129');

-- --------------------------------------------------------

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
CREATE TABLE IF NOT EXISTS `user_session` (
  `ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_session_note`
--

DROP TABLE IF EXISTS `user_session_note`;
CREATE TABLE IF NOT EXISTS `user_session_note` (
  `USER_SESSION` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`USER_SESSION`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_origins`
--

DROP TABLE IF EXISTS `web_origins`;
CREATE TABLE IF NOT EXISTS `web_origins` (
  `CLIENT_ID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `web_origins`
--

INSERT INTO `web_origins` (`CLIENT_ID`, `VALUE`) VALUES
('1f47e498-886f-4ccc-9711-86fe79065a95', 'http://localhost:8081'),
('5baaa54c-378e-408e-9105-05a1d5d13091', '+'),
('b8e2c989-db8c-4c46-bc42-0c95c3871604', '+');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `associated_policy`
--
ALTER TABLE `associated_policy`
  ADD CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  ADD CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Constraints for table `authentication_execution`
--
ALTER TABLE `authentication_execution`
  ADD CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  ADD CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `authentication_flow`
--
ALTER TABLE `authentication_flow`
  ADD CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `authenticator_config`
--
ALTER TABLE `authenticator_config`
  ADD CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `client_attributes`
--
ALTER TABLE `client_attributes`
  ADD CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Constraints for table `client_default_roles`
--
ALTER TABLE `client_default_roles`
  ADD CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Constraints for table `client_initial_access`
--
ALTER TABLE `client_initial_access`
  ADD CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `client_node_registrations`
--
ALTER TABLE `client_node_registrations`
  ADD CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Constraints for table `client_scope`
--
ALTER TABLE `client_scope`
  ADD CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `client_scope_attributes`
--
ALTER TABLE `client_scope_attributes`
  ADD CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Constraints for table `client_scope_client`
--
ALTER TABLE `client_scope_client`
  ADD CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Constraints for table `client_scope_role_mapping`
--
ALTER TABLE `client_scope_role_mapping`
  ADD CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Constraints for table `client_session`
--
ALTER TABLE `client_session`
  ADD CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`);

--
-- Constraints for table `client_session_auth_status`
--
ALTER TABLE `client_session_auth_status`
  ADD CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Constraints for table `client_session_note`
--
ALTER TABLE `client_session_note`
  ADD CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Constraints for table `client_session_prot_mapper`
--
ALTER TABLE `client_session_prot_mapper`
  ADD CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Constraints for table `client_session_role`
--
ALTER TABLE `client_session_role`
  ADD CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Constraints for table `client_user_session_note`
--
ALTER TABLE `client_user_session_note`
  ADD CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Constraints for table `component`
--
ALTER TABLE `component`
  ADD CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `component_config`
--
ALTER TABLE `component_config`
  ADD CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`);

--
-- Constraints for table `composite_role`
--
ALTER TABLE `composite_role`
  ADD CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  ADD CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`);

--
-- Constraints for table `credential`
--
ALTER TABLE `credential`
  ADD CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Constraints for table `default_client_scope`
--
ALTER TABLE `default_client_scope`
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`),
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Constraints for table `federated_identity`
--
ALTER TABLE `federated_identity`
  ADD CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Constraints for table `group_attribute`
--
ALTER TABLE `group_attribute`
  ADD CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`);

--
-- Constraints for table `group_role_mapping`
--
ALTER TABLE `group_role_mapping`
  ADD CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`);

--
-- Constraints for table `identity_provider`
--
ALTER TABLE `identity_provider`
  ADD CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `identity_provider_config`
--
ALTER TABLE `identity_provider_config`
  ADD CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`);

--
-- Constraints for table `identity_provider_mapper`
--
ALTER TABLE `identity_provider_mapper`
  ADD CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `idp_mapper_config`
--
ALTER TABLE `idp_mapper_config`
  ADD CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`);

--
-- Constraints for table `keycloak_group`
--
ALTER TABLE `keycloak_group`
  ADD CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `keycloak_role`
--
ALTER TABLE `keycloak_role`
  ADD CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `policy_config`
--
ALTER TABLE `policy_config`
  ADD CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Constraints for table `protocol_mapper`
--
ALTER TABLE `protocol_mapper`
  ADD CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `client_scope` (`ID`),
  ADD CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Constraints for table `protocol_mapper_config`
--
ALTER TABLE `protocol_mapper_config`
  ADD CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`);

--
-- Constraints for table `realm_attribute`
--
ALTER TABLE `realm_attribute`
  ADD CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `realm_default_groups`
--
ALTER TABLE `realm_default_groups`
  ADD CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `realm_default_roles`
--
ALTER TABLE `realm_default_roles`
  ADD CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `realm_enabled_event_types`
--
ALTER TABLE `realm_enabled_event_types`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `realm_events_listeners`
--
ALTER TABLE `realm_events_listeners`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `realm_required_credential`
--
ALTER TABLE `realm_required_credential`
  ADD CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `realm_smtp_config`
--
ALTER TABLE `realm_smtp_config`
  ADD CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `realm_supported_locales`
--
ALTER TABLE `realm_supported_locales`
  ADD CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `redirect_uris`
--
ALTER TABLE `redirect_uris`
  ADD CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Constraints for table `required_action_provider`
--
ALTER TABLE `required_action_provider`
  ADD CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `resource_attribute`
--
ALTER TABLE `resource_attribute`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`);

--
-- Constraints for table `resource_policy`
--
ALTER TABLE `resource_policy`
  ADD CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Constraints for table `resource_scope`
--
ALTER TABLE `resource_scope`
  ADD CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`);

--
-- Constraints for table `resource_server_perm_ticket`
--
ALTER TABLE `resource_server_perm_ticket`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`),
  ADD CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Constraints for table `resource_server_policy`
--
ALTER TABLE `resource_server_policy`
  ADD CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Constraints for table `resource_server_resource`
--
ALTER TABLE `resource_server_resource`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Constraints for table `resource_server_scope`
--
ALTER TABLE `resource_server_scope`
  ADD CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Constraints for table `resource_uris`
--
ALTER TABLE `resource_uris`
  ADD CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`);

--
-- Constraints for table `role_attribute`
--
ALTER TABLE `role_attribute`
  ADD CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`);

--
-- Constraints for table `scope_mapping`
--
ALTER TABLE `scope_mapping`
  ADD CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Constraints for table `scope_policy`
--
ALTER TABLE `scope_policy`
  ADD CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  ADD CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`);

--
-- Constraints for table `user_attribute`
--
ALTER TABLE `user_attribute`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Constraints for table `user_consent`
--
ALTER TABLE `user_consent`
  ADD CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Constraints for table `user_consent_client_scope`
--
ALTER TABLE `user_consent_client_scope`
  ADD CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`);

--
-- Constraints for table `user_federation_config`
--
ALTER TABLE `user_federation_config`
  ADD CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`);

--
-- Constraints for table `user_federation_mapper`
--
ALTER TABLE `user_federation_mapper`
  ADD CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  ADD CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `user_federation_mapper_config`
--
ALTER TABLE `user_federation_mapper_config`
  ADD CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`);

--
-- Constraints for table `user_federation_provider`
--
ALTER TABLE `user_federation_provider`
  ADD CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Constraints for table `user_group_membership`
--
ALTER TABLE `user_group_membership`
  ADD CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Constraints for table `user_required_action`
--
ALTER TABLE `user_required_action`
  ADD CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Constraints for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Constraints for table `user_session_note`
--
ALTER TABLE `user_session_note`
  ADD CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`);

--
-- Constraints for table `web_origins`
--
ALTER TABLE `web_origins`
  ADD CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
