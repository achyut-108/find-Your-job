package com.fyj.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fyj.domain.envlinks.EnironmentSetupLinks;

/**
 * @author saurabh.shyam
 * @since Feb 24, 2021 5:05 PM
 */
@Service
public interface EnvDetailService {

	public List<EnironmentSetupLinks> getEnvLinkDetails();

}
