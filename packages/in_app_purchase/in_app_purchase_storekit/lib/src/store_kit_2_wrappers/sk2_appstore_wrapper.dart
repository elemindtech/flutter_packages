// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../in_app_purchase_apis.dart';

/// Wrapper for StoreKit2's AppStore
/// (https://developer.apple.com/documentation/storekit/appstore)
final class AppStore {
  /// Dart wrapper for StoreKit2's canMakePayments()
  /// Returns a bool that indicates whether the person can make purchases.
  /// https://developer.apple.com/documentation/storekit/appstore/3822277-canmakepayments
  Future<bool> canMakePayments() {
    return hostApi2.canMakePayments();
  }

  /// Dart wrapper for StoreKit2's sync()
  /// Synchronizes your app’s transaction information and subscription status with information from the App Store.
  /// Will initiate an authentication pop up.
  /// https://developer.apple.com/documentation/storekit/appstore/sync()
  Future<void> sync() {
    return hostApi2.sync();
  }

  /// Dart wrapper for StoreKit2's `AppTransaction.jwsRepresentation`.
  ///
  /// Returns the **signed JWS** attesting to the user's Apple ID install
  /// of this app, suitable for forwarding to a backend that verifies the
  /// signature with Apple's `app-store-server-library`
  /// `SignedDataVerifier.verifyAndDecodeAppTransaction` and extracts
  /// authenticated fields (like `appTransactionId`) from the trusted
  /// payload.
  ///
  /// Returns the JWS regardless of the local `VerificationResult` — the
  /// backend is the authoritative trust boundary.
  ///
  /// Returns `null` when running on iOS < 16.0 / macOS < 13.0
  /// (`AppTransaction` unavailable).
  ///
  /// https://developer.apple.com/documentation/storekit/apptransaction
  Future<String?> appTransactionJws() {
    return hostApi2.appTransactionJws();
  }
}
