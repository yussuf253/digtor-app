import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // État de l'utilisateur actuel
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Inscription avec email et mot de passe
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Créer l'utilisateur
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Mettre à jour le profil avec le nom
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(name);
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.code} - ${e.message}');
      switch (e.code) {
        case 'weak-password':
          throw 'Le mot de passe est trop faible';
        case 'email-already-in-use':
          throw 'Un compte existe déjà avec cet email';
        case 'invalid-email':
          throw 'L\'email n\'est pas valide';
        case 'operation-not-allowed':
          throw 'L\'authentification par email/mot de passe n\'est pas activée';
        default:
          throw 'Une erreur s\'est produite: ${e.message}';
      }
    } catch (e) {
      print('Other Error: $e');
      throw 'Une erreur inattendue s\'est produite';
    }
  }

  // Connexion avec email et mot de passe
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.code} - ${e.message}');
      switch (e.code) {
        case 'user-not-found':
          throw 'Aucun utilisateur trouvé avec cet email';
        case 'wrong-password':
          throw 'Mot de passe incorrect';
        case 'invalid-email':
          throw 'L\'email n\'est pas valide';
        case 'user-disabled':
          throw 'Ce compte a été désactivé';
        default:
          throw 'Une erreur s\'est produite: ${e.message}';
      }
    } catch (e) {
      print('Other Error: $e');
      throw 'Une erreur inattendue s\'est produite';
    }
  }

  // Déconnexion
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Obtenir l'utilisateur actuel
  User? get currentUser => _auth.currentUser;
}
