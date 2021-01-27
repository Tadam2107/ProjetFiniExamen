<?php

namespace App\Controller\User;

use App\Entity\Menu;
use App\Form\RecetteFormType;
use App\Repository\MenuRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class MenuUserController extends AbstractController
{
    /**
     * @Route("/user/recettes_perso", name="recettes_user")
     */
    public function index(MenuRepository $repo): Response
    {
        $user=$this->getUser();
        $user_id=$user->getId();
        //dd($user_id);
        $menus = $repo->findBy(["user"=>$user]);
        return $this->render('menu_user/affichagerecettesuser.html.twig', compact('menus'));
    }
     /**
     *@Route("/user/recettes/{id}", name="user_recette_edit", methods="GET|POST")
     *@Route("/user/recette/ajout", name="user_recette_ajout")
     */
    public function ajouterRecette(Menu $menu = null, Request $request, EntityManagerInterface $em): Response
    {
 
        $user = $this->getUser();
        // $role= $user->getRoles();
         $isAdmin = $this->isGranted('ROLE_ADMIN');
         
        if (!$menu) {
            $menu = new Menu();
           
            $menu->setUser($user);
            $menu->setCreatedAt(new \Datetime('now'));
            
          
        }

        //variable pour savoir si on est en création ou modif;
        $modif = $menu->getId() !== null;

        $form = $this->createForm(RecetteFormType::class, $menu);
       if(!$isAdmin){
        $menu->setActif(0);
        $form->remove('actif');
       }
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

          //  dd($menu);
            $em->persist($menu);
            $em->flush();

            $this->addFlash('message', $modif ? 'Recette modifiée avec succès' : 'Recette ajoutée avec succès');

            return $this->redirectToRoute('recettes_user');
        }

        return $this->render('menu_user/ajouterrecette.html.twig', ['formulaireRecette' => $form->createView()]);
}

    /**
     * @Route("/user/delete_menu/{id}", name="user_recette_delete", methods="SUP")
     */
    public function deleteRecette(Menu $menu = null, Request $request, EntityManagerInterface $em)
    {
        
        if ($this->isCsrfTokenValid('SUP'.$menu->getId(), $request->get('_token'))) {
            $em->remove($menu);
            $em->flush();
            $this->addFlash('message', 'Recette supprimée avec succès');

            return $this->redirectToRoute('recettes_user');
        }
    }
}
    

