<?php
/*------------------------------------------------------------------------------
  $Id$

  AbanteCart, Ideal OpenSource Ecommerce Solution
  http://www.AbanteCart.com

  Copyright © 2011 Belavier Commerce LLC

  This source file is subject to Open Software License (OSL 3.0)
  License details is bundled with this package in the file LICENSE.txt.
  It is also available at this URL:
  <http://www.opensource.org/licenses/OSL-3.0>

 UPGRADE NOTE:
   Do not edit or add to this file if you wish to upgrade AbanteCart to newer
   versions in the future. If you wish to customize AbanteCart for your
   needs please refer to http://www.AbanteCart.com for more information.
------------------------------------------------------------------------------*/
if (! defined ( 'DIR_CORE' ) || !IS_ADMIN) {
	header ( 'Location: static_pages/' );
}
class ControllerApiIndexLogout extends AControllerAPI {

	public function post() {
        $this->extensions->hk_InitData($this,__FUNCTION__);
		$request_data = $this->rest->getRequestParams();
		
		unset($this->session->data['token']);
			
		$this->rest->setResponseData( array( 'status' => 1, 'success' => 'Logged out', ) );	
		$this->rest->sendResponse(200);

        $this->extensions->hk_UpdateData($this,__FUNCTION__);
		return;
	}

	public function get() {
        $this->extensions->hk_InitData($this,__FUNCTION__);
		$request_data = $this->rest->getRequestParams();
		
		unset($this->session->data['token']);
			
		$this->rest->setResponseData( array( 'status' => 1, 'success' => 'Logged out', ) );	
		$this->rest->sendResponse(200);

        $this->extensions->hk_UpdateData($this,__FUNCTION__);
		return;
	}
	
}  
?>